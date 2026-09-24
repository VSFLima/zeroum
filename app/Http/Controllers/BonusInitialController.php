<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Setting;
use App\Models\Deposit;
use Illuminate\Http\JsonResponse;

class BonusInitialController extends Controller
{
    public function checkDeposit(): JsonResponse
    {
        // Obtém o usuário autenticado
        $user = auth('api')->user();
        if (!$user) {
            return response()->json(['message' => 'Usuário não autenticado.'], 401);
        }

        // Obtém a configuração da tabela settings
        $setting = Setting::first();
        if (!$setting) {
            return response()->json(['message' => 'Configuração não encontrada.'], 404);
        }

        // Log para depuração
        \Log::info('Configuração: ', ['disable_deposit_min' => $setting->disable_deposit_min, 'deposit_min_saque' => $setting->deposit_min_saque]);

        // Verifica o valor da coluna disable_deposit_min
        if ($setting->disable_deposit_min == 0) {
            // Permite prosseguir sem interrupções
            return response()->json(['message' => 'Você pode prosseguir.']);
        }

        // Se disable_deposit_min é 1, faz a verificação dos depósitos
        $totalAmount = Deposit::where('user_id', $user->id)
            ->where('status', 1)
            ->sum('amount');

        // Log para depuração
        \Log::info('Depósitos totais: ', ['total_amount' => $totalAmount]);

        // Compara com o valor deposit_min_saque
        if ($totalAmount >= $setting->deposit_min_saque) {
            return response()->json(['message' => 'Você está autorizado a prosseguir.']);
        } else {
            // Calcula o valor faltante para atingir o mínimo necessário
            $amountNeeded = $setting->deposit_min_saque - $totalAmount;
            return response()->json([
                'messages' => 'Você precisa depositar mais.',
                'amount_needed' => $amountNeeded
            ]);
        }
    }
}
