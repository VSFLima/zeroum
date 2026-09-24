<?php

namespace App\Http\Controllers\Api\Profile;

use App\Http\Controllers\Controller;
use App\Helpers\Core;
use App\Models\Setting;
use App\Models\User;
use App\Models\Wallet;
use App\Models\Withdrawal;
use App\Models\AffiliateWithdraw;
use App\Models\SuitPayPayment;
use App\Notifications\NewWithdrawalNotification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Filament\Notifications\Notification;
use App\Traits\Gateways\DigitoPayTrait;
use App\Traits\Gateways\BsPayTrait;
use App\Traits\Gateways\EzzepayTrait;

class WalletController extends Controller
{
    use BsPayTrait, EzzepayTrait, DigitoPayTrait;
    
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $wallet = Wallet::whereUserId(auth('api')->id())->where('active', 1)->first();
        return response()->json(['wallet' => $wallet], 200);
    }

    /**
     * @return \Illuminate\Http\JsonResponse
     */
    public function myWallet()
    {
        $wallets = Wallet::whereUserId(auth('api')->id())->get();
        return response()->json(['wallets' => $wallets], 200);
    }

    /**
     * @param $id
     * @return \Illuminate\Http\JsonResponse|void
     */
    public function setWalletActive($id)
    {
        $checkWallet = Wallet::whereUserId(auth('api')->id())->where('active', 1)->first();
        if (!empty($checkWallet)) {
            $checkWallet->update(['active' => 0]);
        }

        $wallet = Wallet::find($id);
        if (!empty($wallet)) {
            $wallet->update(['active' => 1]);
            return response()->json(['wallet' => $wallet], 200);
        }
    }

    /**
     * Processar saque - Redireciona para o gateway apropriado
     */
    public function withdrawalFromModal($id, Request $request = null)
    {
        $setting = Core::getSetting();
        $tipo = $request ? $request->input("action") : 'user';
        
        // Para SuitPay (Divpag), redirecionar para o SuitPayController
        if ($setting->default_gateway === 'suitpay') {
            return redirect()->route('suitpay.withdrawal', [
                'id' => $id,
                'action' => $tipo
            ]);
        }

        // Para outros gateways, manter o fluxo antigo
        $resultado = null;
        
        switch ($setting->default_gateway) {
            case 'digitopay':
                $resultado = self::pixCashOutDigito($id, $tipo);
                break;
            case 'bspay':
                $resultado = self::pixCashOutBsPay($id, $tipo);
                break;
            case 'ezzepay':
                $resultado = self::pixCashOutEzze($id, $tipo);
                break;
            default:
                Notification::make()
                    ->title('Gateway não configurado')
                    ->body('Gateway de pagamento não está configurado corretamente')
                    ->danger()
                    ->send();
                return back();
        }

        if ($resultado == true) {
            Notification::make()
                ->title('Saque solicitado')
                ->body('Saque solicitado com sucesso')
                ->success()
                ->send();

            return back();
        } else {
            Notification::make()
                ->title('Erro no saque')
                ->body('Erro ao solicitar o saque')
                ->danger()
                ->send();

            return back();
        }
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function requestWithdrawal(Request $request)
    {
        $setting = Setting::first();

        // Verificar se o usuário está autenticado
        if (auth('api')->check()) {
            // Obter o usuário autenticado
            $user = auth('api')->user();

            // Verificar se o usuário utilizou o bônus de cadastro
            if ($user->utilizou_bonus_cadastro == 1) {
                // Verificar se o campo disable_deposit_min está ativo
                if ($setting->disable_deposit_min == 1) {
                    // Somar todos os depósitos do usuário com status 1
                    $depositSum = \DB::table('deposits')
                        ->where('user_id', $user->id)
                        ->where('status', 1)
                        ->sum('amount');

                    // Verificar se a soma dos depósitos é menor que deposit_min_saque
                    if ($depositSum < $setting->deposit_min_saque) {
                        $remainingAmount = $setting->deposit_min_saque - $depositSum;
                        return response()->json(['error' => 'Você precisa depositar mais ' . number_format($remainingAmount, 2, ',', '.') . ' para poder sacar.'], 400);
                    }
                }
            }

            // Verificações de saque de acordo com o tipo de solicitação
            if ($request->type === 'pix') {
                $rules = [
                    'amount' => ['required', 'numeric', 'min:' . $setting->min_withdrawal, 'max:' . $setting->max_withdrawal],
                    'pix_type' => 'required',
                ];

                switch ($request->pix_type) {
                    case 'document':
                        $rules['pix_key'] = 'required|cpf_ou_cnpj';
                        break;
                    case 'email':
                        $rules['pix_key'] = 'required|email';
                        break;
                    default:
                        $rules['pix_key'] = 'required';
                        break;
                }
            }

            if ($request->type === 'bank') {
                $rules = [
                    'amount' => ['required', 'numeric', 'min:' . $setting->min_withdrawal, 'max:' . $setting->max_withdrawal],
                    'bank_info' => 'required',
                ];
            }

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return response()->json($validator->errors(), 400);
            }

            if ($request->amount < 0) {
                return response()->json(['error' => 'Você tem que solicitar um valor'], 400);
            }

            if ($request->amount > $setting->max_withdrawal) {
                return response()->json(['error' => 'Você excedeu o limite máximo permitido de: ' . $setting->max_withdrawal], 400);
            }

            if ($request->accept_terms == true) {
                if (floatval($request->amount) > floatval(auth('api')->user()->wallet->balance_withdrawal)) {
                    return response()->json(['error' => 'Você não tem saldo suficiente'], 400);
                }
            
                // Consultar a tabela account_withdraws para obter o CPF
                $accountWithdraw = \DB::table('account_withdraws')
                    ->where('user_id', auth('api')->user()->id)
                    ->first();
            
                if ($accountWithdraw) {
                    // Verificar se o CPF está ausente na coluna 'document'
                    if (empty($accountWithdraw->document)) {
                        // Atualizar 'document' com o valor de 'pix_key'
                        \DB::table('account_withdraws')
                            ->where('user_id', auth('api')->user()->id)
                            ->update([
                                'document' => $accountWithdraw->pix_key,
                            ]);
            
                        // Atualizar o valor em $accountWithdraw para reutilizar
                        $accountWithdraw->document = $accountWithdraw->pix_key;
                    }
                }
            
                $data = [];
                if ($request->type === 'pix') {
                    $data = [
                        'user_id' => auth('api')->user()->id,
                        'amount' => \Helper::amountPrepare($request->amount),
                        'type' => $request->type,
                        'cpf' => $accountWithdraw->document ?? $request->cpf,
                        'pix_key' => $request->pix_key,
                        'pix_type' => $request->pix_type,
                        'currency' => $request->currency,
                        'symbol' => $request->symbol,
                        'status' => 0,
                    ];
                }
            
                if ($request->type === 'bank') {
                    $data = [
                        'user_id' => auth('api')->user()->id,
                        'amount' => \Helper::amountPrepare($request->amount),
                        'type' => $request->type,
                        'bank_info' => $request->bank_info,
                        'currency' => $request->currency,
                        'symbol' => $request->symbol,
                        'status' => 0,
                    ];
                }
            
                $withdrawal = Withdrawal::create($data);
            
                if ($withdrawal) {
                    $wallet = Wallet::where('user_id', $user->id)->first();
                    $wallet->decrement('balance_withdrawal', floatval($request->amount));
            
                    // Se o saque for bem-sucedido, definir utilizou_bonus_cadastro como 0
                    $user->update(['utilizou_bonus_cadastro' => 0]);
            
                    $admins = User::where('role_id', 0)->get();
                    foreach ($admins as $admin) {
                        $admin->notify(new NewWithdrawalNotification($user->name, $request->amount));
                    }
            
                    return response()->json([
                        'status' => true,
                        'message' => 'Saque realizado com sucesso',
                    ], 200);
                }
            }        
            return response()->json(['error' => 'Você precisa aceitar os termos'], 400);
        }

        return response()->json(['error' => 'Erro ao realizar o saque'], 400);
    }

    public function updateBonusIfNeeded()
    {
        $userId = auth('api')->id();
        $wallet = Wallet::where('user_id', $userId)->first();

        if (!$wallet) {
            return response()->json(['error' => 'Carteira não encontrada'], 404);
        }

        $messages = [];

        // Verificar e atualizar bônus
        if ($wallet->balance_bonus == 0) {
            $wallet->balance_bonus_rollover = 0;
            $wallet->save();
            $messages[] = 'Bônus zerado e rollover atualizado.';
        }

        return response()->json(['messages' => $messages], 200);
    }

    /**
     * Transfere saldo para saque se necessário.
     */
    public function transferBalanceToWithdrawalIfNeeded()
    {
        $userId = auth('api')->id();
        $wallet = Wallet::where('user_id', $userId)->first();

        if (!$wallet) {
            return response()->json(['error' => 'Carteira não encontrada'], 404);
        }

        $messages = [];

        // Verificar e transferir saldo para saque
        if ($wallet->balance_deposit_rollover == 0) {
            $wallet->balance_withdrawal += $wallet->balance;
            $wallet->balance = 0;
            $wallet->save();
            $messages[] = 'Saldo transferido para saque com sucesso!';
        }

        return response()->json(['messages' => $messages], 200);
    }

    /**
     * Transfere bônus para saque se necessário.
     */
    public function transferBonusToWithdrawalIfNeeded()
    {
        $userId = auth('api')->id();
        $wallet = Wallet::where('user_id', $userId)->first();

        if (!$wallet) {
            return response()->json(['error' => 'Carteira não encontrada'], 404);
        }

        $messages = [];

        // Verificar e transferir bônus para saque
        if ($wallet->balance_bonus_rollover == 0) {
            $wallet->balance_withdrawal += $wallet->balance_bonus;
            $wallet->balance_bonus = 0;
            $wallet->save();
            $messages[] = 'Saldo do bônus transferido para saque com sucesso!';
        }

        return response()->json(['messages' => $messages], 200);
    }

    /**
     * Verifica e atualiza bônus, saldo e transferências.
     */
    public function checkAndUpdateBonus()
    {
        $userId = auth('api')->id();
        $wallet = Wallet::where('user_id', $userId)->first();

        if (!$wallet) {
            return response()->json(['error' => 'Carteira não encontrada'], 404);
        }

        $messages = [];

        // Verificar e atualizar bônus
        if ($wallet->balance_bonus == 0) {
            $wallet->balance_bonus_rollover = 0;
            $wallet->save();
            $messages[] = 'Bônus zerado e rollover atualizado.';
        }

        // Verificar e transferir saldo para saque
        if ($wallet->balance_deposit_rollover == 0) {
            $wallet->balance_withdrawal += $wallet->balance;
            $wallet->balance = 0;
            $wallet->save();
            $messages[] = 'Saldo transferido para saque com sucesso!';
        }

        // Verificar e transferir bônus para saque
        if ($wallet->balance_bonus_rollover == 0) {
            $wallet->balance_withdrawal += $wallet->balance_bonus;
            $wallet->balance_bonus = 0;
            $wallet->save();
            $messages[] = 'Saldo do bônus transferido para saque com sucesso!';
        }

        if (empty($messages)) {
            return response()->json(['message' => 'Nenhuma atualização necessária'], 200);
        }

        return response()->json(['messages' => $messages], 200);
    }
}