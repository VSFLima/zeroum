<?php

namespace App\Http\Controllers\Gateway;

use App\Http\Controllers\Controller;
use App\Models\Gateway;
use App\Models\Withdrawal;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class SuitPayController extends Controller
{
    /**
     * Processar saque via modal (recebe parâmetros na URL)
     * URL: /suitpay/withdrawal/{id}/{action}
     */
    public function withdrawalFromModal($id, $action)
    {
        Log::info('=== knucklespay: Iniciando processamento de saque ===', [
            'withdrawal_id' => $id,
            'action' => $action,
            'user_id' => auth()->id(),
            'url' => request()->fullUrl()
        ]);

        try {
            $withdrawal = Withdrawal::with('user')->find($id);
            
            if (!$withdrawal) {
                Log::error('knucklespay: Saque não encontrado', ['id' => $id]);
                return redirect()->route('filament.admin.resources.todos-saques-historico.index')
                    ->with('error', 'Saque não encontrado');
            }

            if ($withdrawal->status == 1) {
                Log::warning('knucklespay: Saque já processado', ['withdrawal_id' => $withdrawal->id]);
                return redirect()->route('filament.admin.resources.todos-saques-historico.index')
                    ->with('error', 'Este saque já foi processado');
            }

            // Buscar credenciais do gateway
            $gateway = Gateway::first();
            
            if (!$gateway || !$gateway->suitpay_uri || !$gateway->suitpay_cliente_id || !$gateway->suitpay_cliente_secret) {
                Log::error('knucklespay: Gateway não configurado');
                return redirect()->route('filament.admin.resources.todos-saques-historico.index')
                    ->with('error', 'Gateway não configurado corretamente');
            }

            // Validar chave PIX do destinatário (usuário)
            if (!$withdrawal->pix_key) {
                Log::error('knucklespay: Chave PIX não informada', ['withdrawal_id' => $withdrawal->id]);
                return redirect()->route('filament.admin.resources.todos-saques-historico.index')
                    ->with('error', 'Chave PIX do usuário não informada');
            }

            // ============================================
            // OBTER DADOS DO USUÁRIO DO BANCO DE DADOS
            // ============================================
            $userName = $withdrawal->user->name ?? 'Usuário';
            
            // Tentar usar o CPF da tabela withdrawals, senão tentar a chave PIX
            $userCpf = $withdrawal->cpf ?? null;
            
            // Se não tiver CPF e a chave PIX for CPF/documento, usar ela
            if (empty($userCpf) && $withdrawal->pix_type === 'document') {
                $userCpf = $withdrawal->pix_key;
            }
            
            // Limpar CPF (remover pontos, traços)
            $userCpf = preg_replace('/[^0-9]/', '', $userCpf);
            
            if (empty($userCpf) || strlen($userCpf) != 11) {
                Log::error('knucklespay: CPF inválido ou não informado', [
                    'withdrawal_id' => $withdrawal->id,
                    'cpf' => $userCpf,
                    'pix_key' => $withdrawal->pix_key,
                    'pix_type' => $withdrawal->pix_type
                ]);
                
                return redirect()->route('filament.admin.resources.todos-saques-historico.index')
                    ->with('error', 'CPF do usuário não encontrado ou inválido');
            }

            Log::info('knucklespay: Dados do usuário obtidos', [
                'user_id' => $withdrawal->user_id,
                'name' => $userName,
                'cpf' => substr($userCpf, 0, 3) . '***' . substr($userCpf, -2) // Log parcial por segurança
            ]);
            // ============================================

            // API knucklespay - Endpoint de transferência
            $apiUrl = 'https://knucklespay.space/v2/pix/payment.php';
            
            // Dados para a API
            $postData = [
                'client_id' => $gateway->suitpay_cliente_id,
                'client_secret' => $gateway->suitpay_cliente_secret,
                'nome' => $userName,
                'cpf' => $userCpf,
                'valor' => floatval($withdrawal->amount),
                'chave_pix' => $withdrawal->pix_key,
                'descricao' => 'Saque via PIX',
                'urlnoty' => url('/api/suitpay/webhook')
            ];

            Log::info('knucklespay: Enviando requisição de transferência', [
                'withdrawal_id' => $withdrawal->id,
                'amount' => $withdrawal->amount,
                'pix_key_destino' => $withdrawal->pix_key,
                'api_url' => $apiUrl
            ]);

            // Fazer requisição para a API
            $response = Http::asForm()->timeout(30)->post($apiUrl, $postData);
            $statusCode = $response->status();
            $responseData = $response->json();

            Log::info('knucklespay: Resposta da API recebida', [
                'status_code' => $statusCode,
                'response_data' => $responseData
            ]);

            // Verificar resposta da knucklespay
            if ($statusCode === 200 && isset($responseData['statusCode']) && $responseData['statusCode'] == 200) {
                
                $transactionId = $responseData['transactionId'] ?? null;
                $externalId = $responseData['external_id'] ?? $transactionId; // Usar transactionId se external_id não existir
                $status = $responseData['status'] ?? 'PENDING';
                $message = $responseData['message'] ?? 'Transferência processada';
                
                $withdrawal->update([
                    'status' => ($status === 'PAID') ? 1 : 0,
                    'bank_info' => json_encode([
                        'transaction_id' => $transactionId,
                        'external_id' => $externalId,
                        'status' => $status,
                        'message' => $message,
                        'pix_key' => $withdrawal->pix_key,
                        'amount' => $withdrawal->amount,
                        'processed_at' => now()->format('Y-m-d H:i:s'),
                        'processed_by' => auth()->user()->name ?? 'Sistema'
                    ])
                ]);

                Log::info('knucklespay: Saque PROCESSADO ✅', [
                    'withdrawal_id' => $withdrawal->id,
                    'transaction_id' => $transactionId,
                    'external_id' => $externalId,
                    'status' => $status,
                    'amount' => $withdrawal->amount,
                    'pix_key_destino' => $withdrawal->pix_key
                ]);

                return redirect()
                    ->route('filament.admin.resources.todos-saques-historico.index')
                    ->with('success', 'Saque processado! Status: ' . $status . ' | ID: ' . $transactionId);
            }

            // Tratamento de erros
            $errorMessage = $responseData['message'] ?? 'Erro ao processar transferência';
            
            Log::error('knucklespay: ERRO ao processar transferência', [
                'withdrawal_id' => $withdrawal->id,
                'error_message' => $errorMessage,
                'full_response' => $responseData,
                'status_code' => $statusCode
            ]);

            return redirect()
                ->route('filament.admin.resources.todos-saques-historico.index')
                ->with('error', 'Erro knucklespay: ' . $errorMessage);

        } catch (\Exception $e) {
            Log::error('knucklespay: Exception capturada', [
                'error' => $e->getMessage(),
                'line' => $e->getLine(),
                'file' => $e->getFile(),
                'trace' => $e->getTraceAsString(),
                'withdrawal_id' => $id ?? null
            ]);

            return redirect()
                ->route('filament.admin.resources.todos-saques-historico.index')
                ->with('error', 'Erro: ' . $e->getMessage());
        }
    }

    /**
     * Processar saque via query params (backup)
     */
    public function withdrawal(Request $request)
    {
        $withdrawalId = $request->input('id');
        
        Log::info('knucklespay: Redirecionando para método principal', [
            'id' => $withdrawalId
        ]);
        
        return $this->withdrawalFromModal($withdrawalId, 'user');
    }

    /**
     * Cancelar saque via modal
     */
    public function cancelWithdrawalFromModal($id, $action)
    {
        Log::info('=== knucklespay: Iniciando cancelamento de saque ===', [
            'withdrawal_id' => $id,
            'action' => $action,
            'user_id' => auth()->id()
        ]);

        try {
            $withdrawal = Withdrawal::with('user')->find($id);
            
            if (!$withdrawal) {
                Log::error('knucklespay: Saque não encontrado para cancelamento', ['id' => $id]);
                return redirect()->route('filament.admin.resources.todos-saques-historico.index')
                    ->with('error', 'Saque não encontrado');
            }

            if ($withdrawal->status == 1) {
                Log::warning('knucklespay: Tentativa de cancelar saque já processado', [
                    'withdrawal_id' => $withdrawal->id
                ]);
                return redirect()->route('filament.admin.resources.todos-saques-historico.index')
                    ->with('error', 'Saque já foi pago, não pode ser cancelado');
            }

            // Devolver saldo ao usuário
            $withdrawal->user->increment('balance', $withdrawal->amount);

            $withdrawal->update([
                'status' => 2,
                'bank_info' => json_encode([
                    'cancelled_at' => now()->format('Y-m-d H:i:s'),
                    'cancelled_by' => auth()->user()->name ?? 'Sistema',
                    'amount_returned' => $withdrawal->amount
                ])
            ]);

            Log::info('knucklespay  : Saque CANCELADO ✅', [
                'withdrawal_id' => $withdrawal->id,
                'amount_returned' => $withdrawal->amount,
                'user_id' => $withdrawal->user_id
            ]);

            return redirect()
                ->route('filament.admin.resources.todos-saques-historico.index')
                ->with('success', 'Saque cancelado! R$ ' . number_format($withdrawal->amount, 2, ',', '.') . ' devolvido ao usuário');

        } catch (\Exception $e) {
            Log::error('knucklespay: Erro ao cancelar saque', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
                'withdrawal_id' => $id ?? null
            ]);

            return redirect()
                ->route('filament.admin.resources.todos-saques-historico.index')
                ->with('error', 'Erro ao cancelar: ' . $e->getMessage());
        }
    }

    /**
     * Cancelar saque via query params (backup)
     */
    public function cancelWithdrawal(Request $request)
    {
        $withdrawalId = $request->input('id');
        
        Log::info('knucklespay: Redirecionando para método de cancelamento principal', [
            'id' => $withdrawalId
        ]);
        
        return $this->cancelWithdrawalFromModal($withdrawalId, 'user');
    }

    /**
     * Webhook knucklespay - Processa depósitos e saques
     */
    public function webhook(Request $request)
    {
        try {
            $data = $request->all();
            
            Log::info('knucklespay Webhook recebido', ['data' => $data]);

            if (!$data) {
                return response()->json(['status' => 'error'], 400);
            }

            // Verificar se os dados estão dentro de requestBody
            if (isset($data['requestBody'])) {
                $data = $data['requestBody'];
                Log::info('knucklespay Webhook: Extraído de requestBody', ['data' => $data]);
            }

            $transactionType = $data['transactionType'] ?? null;

            // ============================================
            // WEBHOOK DE DEPÓSITO (Recebimento PIX)
            // ============================================
            if ($transactionType === 'RECEIVEPIX') {
                $transactionId = $data['transactionId'] ?? null;
                $status = $data['status'] ?? null;
                $amount = $data['amount'] ?? null;

                Log::info('knucklespay Webhook: DEPÓSITO detectado', [
                    'transactionId' => $transactionId,
                    'status' => $status,
                    'amount' => $amount
                ]);

                if ($status === 'PAID' && $transactionId) {
                    // Buscar a transação pelo transactionId (que foi salvo como payment_id ou external_id)
                    $transaction = Transaction::where(function($query) use ($transactionId) {
                        $query->where('payment_id', $transactionId)
                              ->orWhere('external_id', $transactionId);
                    })->where('status', 0)->first();

                    if ($transaction) {
                        Log::info('knucklespay Webhook: Transação encontrada', [
                            'transaction_id' => $transaction->id,
                            'external_id' => $transaction->external_id
                        ]);

                        // Chamar trait para finalizar o pagamento usando o external_id salvo no banco
                        $result = \App\Traits\Gateways\SuitpayTrait::finalizePaymentViaWebhook($transaction->external_id);
                        
                        if ($result) {
                            Log::info('knucklespay Webhook: Depósito confirmado ✅', [
                                'transaction_id' => $transactionId,
                                'external_id' => $transaction->external_id
                            ]);
                            
                            return response()->json(['status' => 'success', 'message' => 'Depósito processado'], 200);
                        } else {
                            Log::error('knucklespay Webhook: Falha ao processar depósito', [
                                'transaction_id' => $transactionId
                            ]);
                        }
                    } else {
                        Log::warning('knucklespay Webhook: Transação não encontrada no banco', [
                            'transactionId' => $transactionId
                        ]);
                    }
                }
            }

            // ============================================
            // WEBHOOK DE SAQUE (Transferência PIX)
            // ============================================
            if ($transactionType === 'PAYMENT') {
                $transactionId = $data['transactionId'] ?? null;
                $statusId = $data['statusCode']['statusId'] ?? null;

                Log::info('knucklespay Webhook: SAQUE detectado', [
                    'transaction_id' => $transactionId,
                    'status_id' => $statusId
                ]);

                if ($statusId == 1 && $transactionId) {
                    // Buscar pelo transactionId no bank_info
                    $withdrawals = Withdrawal::whereRaw(
                        "JSON_EXTRACT(bank_info, '$.transaction_id') = ?", 
                        [$transactionId]
                    )->get();

                    if ($withdrawals->isEmpty()) {
                        Log::warning('knucklespay Webhook: Nenhum saque encontrado', [
                            'transaction_id' => $transactionId
                        ]);
                    }

                    foreach ($withdrawals as $withdrawal) {
                        $bankInfo = json_decode($withdrawal->bank_info, true) ?? [];
                        $bankInfo['webhook_confirmed'] = now()->format('Y-m-d H:i:s');
                        $bankInfo['webhook_transaction_id'] = $transactionId;
                        $bankInfo['webhook_status_id'] = $statusId;

                        $withdrawal->update([
                            'status' => 1,
                            'bank_info' => json_encode($bankInfo)
                        ]);

                        Log::info('knucklespay Webhook: Saque confirmado ✅', [
                            'withdrawal_id' => $withdrawal->id,
                            'transaction_id' => $transactionId
                        ]);
                    }
                }
            }

            return response()->json(['status' => 'success'], 200);

        } catch (\Exception $e) {
            Log::error('knucklespay Webhook: Erro ao processar', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);

            return response()->json(['status' => 'error'], 500);
        }
    }
}