<?php

namespace App\Http\Controllers\Api\Profile;

use App\Http\Controllers\Controller;
use App\Models\AffiliateHistory;
use App\Models\AffiliateWithdraw;
use App\Models\Order;
use App\Models\Bau;
use App\Models\Deposit;
use App\Models\User;
use App\Models\Setting;
use App\Models\Wallet;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;


class AffiliateController extends Controller
{
    public function index()
    {
        $user = auth('api')->user();
        $indications = User::where('inviter', $user->id)->count();
        $walletDefault = Wallet::where('user_id', $user->id)->first();
        $affiliateBauValue = $user->affiliate_bau_value;

        // Verificando baús ao carregar a página
        $validIndications = $this->verificarTodosBaus($user);

        // Obtendo os caminhos das imagens dos baús
        $chestImages = [];
        for ($i = 1; $i <= 40; $i++) {
            $bau = Bau::where('user_id', $user->id)->where('bau_id', $i)->first();
            if ($bau) {
                $chestImages[$i] = $bau->caminho;
            } else {
                $chestImages[$i] = '/assets/images/baulock.png'; // Caminho padrão
            }
        }

        // Obtendo valores para mostrar baseado nos critérios especificados
        $valuesToShow = [];
        for ($i = 1; $i <= 40; $i++) {
            $bau = Bau::where('user_id', $user->id)->where('bau_id', $i)->first();
            if ($bau && $bau->status == 3) {
                $valuesToShow[$i] = $bau->value_mostrar;
            } else {
                $valuesToShow[$i] = null; // Ou algum valor padrão se necessário
            }
        }

        // Calculando a soma dos valores dos baús
        $totalBauValue = $this->calcularSomaBaus($user->id);

        return response()->json([
            'status' => true,
            'code' => $user->inviter_code,
            'url' => config('app.url') . '/home/game/register?code=' . $user->inviter_code,
            'indications' => $indications,
            'wallet' => $walletDefault,
            'bau_value' => $affiliateBauValue,
            'validIndications' => $validIndications,
            'chest_images' => $chestImages,
            'values_to_show' => $valuesToShow, // Valores a serem mostrados separadamente
            'total_bau_value' => $totalBauValue // Soma total dos valores dos baús

        ]);
    }

    private function calcularSomaBaus($userId)
    {
        return Bau::where('user_id', $userId)
            ->whereNotNull('value_mostrar')
            ->sum('value_mostrar');
    }


    public function generateCode()
    {
        $code = $this->gencode();
        $setting = \Helper::getSetting();

        if (!empty($code)) {
            $user = auth('api')->user();
            \DB::table('model_has_roles')->updateOrInsert(
                [
                    'role_id' => 2,
                    'model_type' => 'App\Models\User',
                    'model_id' => $user->id,
                ],
            );

            if ($user->update(['inviter_code' => $code, 'affiliate_revenue_share' => $setting->revshare_percentage])) {
                return response()->json(['status' => true, 'message' => trans('Successfully generated code')]);
            }

            return response()->json(['error' => ''], 400);
        }

        return response()->json(['error' => ''], 400);
    }

    private function gencode()
    {
        $code = \Helper::generateCode(10);

        $checkCode = User::where('inviter_code', $code)->first();
        if (empty($checkCode)) {
            return $code;
        }

        return $this->gencode();
    }

    public function makeRequest(Request $request)
    {
        $settings = Setting::where('id', 1)->first();
    
        if ($settings) {
            $withdrawalLimit = $settings->withdrawal_limit;
            $withdrawalPeriod = $settings->withdrawal_period;
        } else {
            $withdrawalLimit = null;
            $withdrawalPeriod = null;
        }
    
        // Verificar limite de saques
        if ($withdrawalLimit !== null && $withdrawalPeriod !== null) {
            $startDate = now()->startOfDay();
            $endDate = now()->endOfDay();
    
            switch ($withdrawalPeriod) {
                case 'daily':
                    break;
                case 'weekly':
                    $startDate = now()->startOfWeek();
                    $endDate = now()->endOfWeek();
                    break;
                case 'monthly':
                    $startDate = now()->startOfMonth();
                    $endDate = now()->endOfMonth();
                    break;
                case 'yearly':
                    $startDate = now()->startOfYear();
                    $endDate = now()->endOfYear();
                    break;
            }
    
            $withdrawalCount = AffiliateWithdraw::where('user_id', auth('api')->user()->id)
                ->whereBetween('created_at', [$startDate, $endDate])
                ->count();
    
            if ($withdrawalCount >= $withdrawalLimit) {
                return response()->json(['message' => 'Você atingiu o limite de saques para este período'], 400);
            }
        }
    
        // Verificar chave Pix cadastrada
        // $accountWithdraw = \DB::table('account_withdraws')
        //     ->where('user_id', auth('api')->user()->id)
        //     ->first();
    
        // if (!$accountWithdraw || empty($accountWithdraw->pix_key)) {
        //     return response()->json(['message' => 'Você precisa cadastrar uma chave Pix antes de solicitar um saque'], 400);
        // }
    
        // // Atualizar CPF na tabela account_withdraws
        // if (empty($accountWithdraw->document)) {
        //     \DB::table('account_withdraws')
        //         ->where('user_id', auth('api')->user()->id)
        //         ->update([
        //             'document' => $accountWithdraw->pix_key,
        //         ]);
    
        //     // Atualizar localmente o CPF
        //     $accountWithdraw->document = $accountWithdraw->pix_key;
        // }
    
        // Regras de validação
        $rules = [
            'amount' => ['required', 'numeric', 'min:' . $settings->min_withdrawal, 'max:' . $settings->max_withdrawal],
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
    
        $validator = Validator::make($request->all(), $rules);
    
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }
    
        $comission = auth('api')->user()->wallet->refer_rewards;
    
        // Verificar saldo de comissão
        if (floatval($comission) >= floatval($request->amount) && floatval($request->amount) > 0) {
            AffiliateWithdraw::create([
                'user_id' => auth('api')->id(),
                'amount' => $request->amount,
                'pix_key' => $request->pix_key,
                'pix_type' => $request->pix_type,
                'cpf' => $request->pix_key,
                'currency' => 'BRL',
                'symbol' => 'R$',
            ]);
    
            auth('api')->user()->wallet->decrement('refer_rewards', $request->amount);
    
            return response()->json(['message' => trans('Commission withdrawal successfully carried out')], 200);
        }
    
        return response()->json(['message' => trans('Commission withdrawal error')], 400);
    }
    

    private function verificarTodosBaus($user)
    {
        $affiliateBaseline = $user->affiliate_bau_baseline;
        $affiliateBauAposta = $user->affiliate_bau_aposta;
      
        // Log para verificar usuários indicados
        $indicatedUsers = User::where('inviter', $user->id)->get();
    
        // Verificar depósitos
        $validDeposits = [];
        foreach ($indicatedUsers as $indicatedUser) {
            $deposits = $indicatedUser->deposits()->where('amount', '>=', $affiliateBaseline)->where('status', 1)->get();

            if ($deposits->isNotEmpty()) {
                $validDeposits[$indicatedUser->id] = $deposits;
            }
        }
    
        // Verificar apostas
        $validBets = [];
        foreach ($validDeposits as $userId => $deposits) {
            $totalBets = Order::where('user_id', $userId)
                ->where('type', 'bet')
                ->sum('amount');

            if ($totalBets >= $affiliateBauAposta) {
                $validBets[$userId] = $totalBets;
            }
        }
    
        // Log do número de indicações válidas
        $validIndicationsCount = count($validBets);
    
        // Processar baús
        for ($i = 1; $i <= 40; $i++) {
            $bau = Bau::where('user_id', $user->id)->where('bau_id', $i)->first();
            $neededIndications = $this->getNeededIndications($i);
   
            if ($bau) {
                if ($bau->status == 1 && $validIndicationsCount >= $neededIndications) {
                    $bau->status = 2;
                    $bau->caminho = '/assets/images/bauliberado.png';
                    $bau->save();
                }
            } else {
                if ($validIndicationsCount >= $neededIndications) {
                    Bau::create([
                        'status' => 2,
                        'user_id' => $user->id,
                        'bau_id' => $i,
                        'caminho' => '/assets/images/bauliberado.png',
                        'value_mostrar' => null, // Explicitamente definir como null
                    ]);
                }
            }
        }
    
        // Retornar o total de indicações válidas
        return $validIndicationsCount;
    }
    

    private function getNeededIndications($bauId)
    {
        switch ($bauId) {
            case 11:
                return 15;
            case 12:
                return 20;
            case 13:
                return 25;
            case 14:
                return 30;
            case 15:
                return 35;
            case 16:
                return 40;
            case 17:
                return 45;
            case 18:
                return 50;
            case 19:
                return 55;
            case 20:
                return 60;
            case 21:
                return 70;
            case 22:
                return 80;
            case 23:
                return 90;
            case 24:
                return 100;
            case 25:
                return 110;
            case 26:
                return 120;
            case 27:
                return 130;
            case 28:
                return 140;
            case 29:
                return 150;
            case 30:
                return 160;
            case 31:
                return 180;
            case 32:
                return 200;
            case 33:
                return 220;
            case 34:
                return 240;
            case 35:
                return 260;
            case 36:
                return 280;
            case 37:
                return 300;
            case 38:
                return 320;
            case 39:
                return 340;
            case 40:
                return 360;
            default:
                return $bauId; // Para os primeiros 10 baús, 1 afiliação por baú
        }
    }


    private function getCaminhoImagem($bau)
    {
        if ($bau) {
            switch ($bau->status) {
                case 2:
                    return '/assets/images/bauliberado.png';
                case 3:
                    return '/assets/images/bauaberto.png';
                default:
                    return '/assets/images/baulock.png';
            }
        } else {
            return '/assets/images/baulock.png';
        }
    }

    public function verificarBau(Request $request, $bauId)
    {
        $user = auth('api')->user();
        $affiliateBaseline = $user->affiliate_bau_baseline;
        $affiliateBauAposta = $user->affiliate_bau_aposta;

        // Obter as indicações válidas que atendem aos requisitos de depósito e aposta
        $indications = User::where('inviter', $user->id)
            ->whereHas('deposits', function ($query) use ($affiliateBaseline) {
                $query->where('amount', '>=', $affiliateBaseline)
                    ->where('status', 1); // Verifica se o depósito foi pago
            })
            ->whereHas('orders', function ($query) use ($affiliateBauAposta) {
                $query->where('type', 'bet')
                    ->havingRaw('SUM(amount) >= ?', [$affiliateBauAposta]);
            })
            ->count();

        // Obtém a quantidade de indicações necessárias para liberar o baú atual
        $neededIndications = $this->getNeededIndications($bauId);
        $bau = Bau::where('user_id', $user->id)->where('bau_id', $bauId)->first();

        if ($bau) {
            if ($bau->status == 3) {
                return response()->json(['status' => false, 'error' => 'Baú já foi aberto.']);
            } elseif ($bau->status == 2) {
                return response()->json(['status' => true]);
            } else {
                if ($indications >= $neededIndications) {
                    // Atualiza o status do baú para liberado e define a imagem correta
                    $bau->status = 2;
                    $bau->caminho = '/assets/images/bauliberado.png';
                    $bau->save();
                    return response()->json(['status' => true]);
                } else {
                    return response()->json(['status' => false, 'error' => 'Baú ainda não liberado.']);
                }
            }
        } else {
            if ($indications >= $neededIndications) {
                // Cria um novo registro para o baú liberado
                Bau::create([
                    'status' => 2,
                    'user_id' => $user->id,
                    'bau_id' => $bauId,
                    'caminho' => '/assets/images/bauliberado.png',
                ]);
                return response()->json(['status' => true]);
            } else {
                return response()->json(['status' => false, 'error' => 'Baú ainda não liberado.']);
            }
        }
    }

    public function abrirBau(Request $request, $bauId)
    {
        $user = auth('api')->user();
        $bau = Bau::where('user_id', $user->id)->where('bau_id', $bauId)->first();

        if ($bau && $bau->status == 2) {
            $bau->status = 3;
            $bau->caminho = '/assets/images/bauaberto.png';
            $bau->aberto_em = now();

            // Calcula o valor a ser adicionado ao saldo
            $bonusMultiplier = $this->getBonusMultiplier($bauId);
            $bonusAmount = $user->affiliate_bau_value * $bonusMultiplier;

            // Salva o valor do bônus no objeto $bau
            $bau->value_mostrar = 'R$ ' . $bonusAmount;

            $bau->save();

            // Adiciona o valor do baú à carteira do usuário
            $user->wallet->increment('balance_withdrawal', $bonusAmount);

            return response()->json(['message' => 'Baú aberto com sucesso.']);
        }

        return response()->json(['error' => 'Baú não pode ser aberto.'], 400);
    }

    private function getBonusMultiplier($bauId)
    {
        if ($bauId >= 11 && $bauId <= 20) {
            return 5;
        } elseif ($bauId >= 21 && $bauId <= 30) {
            return 10;
        } elseif ($bauId >= 31 && $bauId <= 40) {
            return 20;
        }
        return 1; // Para os primeiros 10 baús, o multiplicador é 1x
    }

}