<?php

namespace App\Http\Controllers;

use App\Models\MissionDeposit;
use App\Models\MissionDepositUser;
use App\Models\Deposit;
use App\Models\Wallet;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class MissionDepositController extends Controller
{
    /**
     * Display a listing of the mission deposits.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        try {
            $missionDeposits = MissionDeposit::select('id', 'bonus_amount', 'description', 'name_mission', 'deposit_acumulated_necessario')->get();
            return response()->json($missionDeposits);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Erro ao buscar depósitos de missão: ' . $e->getMessage()], 500);
        }
    }

    /**
     * Display all deposits with status 1 for the authenticated user.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function userDeposits()
    {
        $user = auth('api')->user();

        try {
            $deposits = Deposit::where('user_id', $user->id)
                ->where('status', 1)
                ->sum('amount');

            return response()->json(['recargasCumulativas' => $deposits]);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Erro ao buscar depósitos: ' . $e->getMessage()], 500);
        }
    }

    /**
     * Check the status of all missions for the authenticated user.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function checkMissionStatus()
    {
        $user = auth('api')->user();

        try {
            // Recupera todas as missões
            $missions = MissionDeposit::all();

            // Recupera as missões do usuário
            $userMissions = MissionDepositUser::where('user_id', $user->id)->get()->keyBy('mission_deposit_id');

            // Calcula o total acumulado de depósitos do usuário
            $totalDeposits = Deposit::where('user_id', $user->id)
                ->where('status', 1)
                ->sum('amount');

            // Adiciona ou atualiza status nas missões do usuário
            foreach ($missions as $mission) {
                if (isset($userMissions[$mission->id])) {
                    $missionDepositUser = $userMissions[$mission->id];

                    // Verifica se o status é 2 (missão coletada)
                    if ($missionDepositUser->status != 2) {
                        // Atualiza o status baseado no total de depósitos
                        $newStatus = ($totalDeposits >= $mission->deposit_acumulated_necessario) ? 1 : 0;
                        $missionDepositUser->status = $newStatus;
                        $missionDepositUser->save();
                    }
                } else {
                    // Se a missão não existir no banco do usuário, cria um novo registro com status 0
                    MissionDepositUser::create([
                        'user_id' => $user->id,
                        'mission_deposit_id' => $mission->id,
                        'status' => 0,
                    ]);
                }
            }

            // Inclui o status atualizado das missões na resposta
            $missions = $missions->map(function ($mission) use ($userMissions) {
                $mission->status = isset($userMissions[$mission->id]) ? $userMissions[$mission->id]->status : 0;
                return $mission;
            });

            return response()->json($missions);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Erro ao verificar status da missão: ' . $e->getMessage()], 500);
        }
    }

    /**
     * Collect the bonus for a completed mission.
     *
     * @param Request $request
     * @param int $missionId
     * @return \Illuminate\Http\JsonResponse
     */
    public function collectMission(Request $request, $missionId)
    {
        $user = auth('api')->user();

        DB::beginTransaction();
        try {
            $mission = MissionDeposit::findOrFail($missionId);
            $missionDepositUser = MissionDepositUser::where('user_id', $user->id)
                ->where('mission_deposit_id', $missionId)
                ->first();

            if (!$missionDepositUser || $missionDepositUser->status != 1) {
                return response()->json(['error' => 'Missão não completada ou já coletada.'], 400);
            }

            $wallet = Wallet::where('user_id', $user->id)->first();
            if ($wallet) {
                $wallet->balance_withdrawal += $missionDepositUser->wallet_bonus; // Corrigido o nome do campo
                $wallet->save();
            } else {
                DB::rollBack();
                return response()->json(['error' => 'Carteira do usuário não encontrada.'], 404);
            }

            // Atualiza o status da missão para coletado
            $missionDepositUser->status = 2;
            $missionDepositUser->save();

            DB::commit();

            return response()->json(['message' => 'Bônus coletado com sucesso!']);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['error' => 'Erro ao coletar o bônus: ' . $e->getMessage()], 500);
        }
    }
}
