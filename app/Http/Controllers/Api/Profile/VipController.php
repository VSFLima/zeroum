<?php

namespace App\Http\Controllers\Api\Profile;

use App\Http\Controllers\Controller;
use App\Models\Vip;
use App\Models\VipUser;
use App\Models\Wallet;
use App\Models\Order;
use Illuminate\Http\Request;

class VipController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $userId = auth('api')->id();

        // Buscar todos os níveis de VIP
        $nivelToday = Vip::whereNull('bet_period')->get();
        $nivelWeekly = Vip::where('bet_period', 'weekly')->get();
        $nivelMonthly = Vip::where('bet_period', 'monthly')->get();
        $nivelYearly = Vip::where('bet_period', 'yearly')->get();

        // Buscar o saldo da carteira do usuário
        $wallet = Wallet::whereUserId($userId)->first();

        // Buscar o nível VIP atual do usuário
        $currentVipLevel = Vip::where('bet_level', $wallet->vip_level)->first();
        $currentLevelImage = $currentVipLevel ? $currentVipLevel->bet_symbol : '001.png';

        // Buscar as apostas totais do usuário (no nível atual e anteriores)
        $totalAmount = Order::where('user_id', $userId)->sum('amount');

        // Obter o bet_required do nível VIP atual
        $totalBetRequired = $currentVipLevel ? $currentVipLevel->bet_required : 0;

        // Calcular a diferença entre o totalAmount e o bet_required do nível atual
        $differenceTotal = $totalAmount - $totalBetRequired;

        // Verificar se o usuário já atingiu o requisito para subir de nível
        $nextVipLevel = Vip::where('bet_level', '>', $wallet->vip_level)
            ->orderBy('bet_level')
            ->first();

        while ($nextVipLevel && $differenceTotal >= $nextVipLevel->bet_required) {
            // Verificar se o usuário já subiu para esse nível
            $checkVip = VipUser::where('user_id', $wallet->user_id)
                ->where('vip_id', $nextVipLevel->id)
                ->where('status', 1)
                ->first();

            if (empty($checkVip)) {
                // Registrar o novo nível na tabela vip_users
                VipUser::create([
                    'user_id' => $wallet->user_id,
                    'vip_id' => $nextVipLevel->id,
                    'level' => $nextVipLevel->bet_level,
                    'points' => $wallet->vip_points,
                    'status' => 1,
                    'created_at' => now(),
                    'updated_at' => now()
                ]);

                // Atualizar o nível VIP na carteira do usuário
                $wallet->vip_level = $nextVipLevel->bet_level;
                $wallet->save();

                // Conceder o bônus ao usuário
                $wallet->vip_wallet += $currentVipLevel->bet_bonus;
                $wallet->save();
            }

            // Ajustar o totalBetRequired para o novo nível
            $totalBetRequired += $nextVipLevel->bet_required;
            $differenceTotal -= $nextVipLevel->bet_required;

            // Buscar o próximo nível de VIP
            $nextVipLevel = Vip::where('bet_level', '>', $wallet->vip_level)
                ->orderBy('bet_level')
                ->first();
        }

        return response()->json([
            'nivelToday' => $nivelToday,
            'nivelWeekly' => $nivelWeekly,
            'nivelMonthly' => $nivelMonthly,
            'nivelYearly' => $nivelYearly,
            'nextLevel' => $nextVipLevel,
            'vipPoints' => $wallet->vip_points,
            'currentLevelImage' => $currentLevelImage,
            'totalAmount' => $totalAmount,
            'totalBetRequired' => $totalBetRequired,
            'difference' => $differenceTotal,
            'vipWallet' => $wallet->vip_wallet, // Adiciona o saldo de vip_wallet na resposta
        ]);
    }
    public function collect()
    {
        $userId = auth('api')->id();

        $wallet = Wallet::whereUserId($userId)->first();

        if ($wallet->vip_wallet > 0) {
            $wallet->balance_withdrawal += $wallet->vip_wallet;
            $wallet->vip_wallet = 0;
            $wallet->save();

            return response()->json([
                'success' => true,
                'message' => 'Valor coletado com sucesso!',
                'balance_withdrawal' => $wallet->balance_withdrawal,
                'vip_wallet' => $wallet->vip_wallet,
            ]);
        }

        return response()->json([
            'success' => false,
            'message' => 'Não há saldo suficiente na vip_wallet para coletar.',
            'balance_withdrawal' => $wallet->balance_withdrawal,
            'vip_wallet' => $wallet->vip_wallet,
        ]);
    }

}
