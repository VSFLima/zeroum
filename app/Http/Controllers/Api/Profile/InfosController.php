<?php

namespace App\Http\Controllers\Api\Profile;

use App\Http\Controllers\Controller;
use App\Models\Bau;
use App\Models\AffiliateHistory;
use App\Models\User;
use App\Models\Deposit;
use App\Models\Withdrawal;
use App\Models\Order;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Validator;
use App\Models\AccountWithdraw;
use App\Models\GGRGames;
use App\Models\GGRGamesFiver;
use Illuminate\Support\Facades\DB;

class InfosController extends Controller
{
    /**
     * Retorna o total de ganhos do usuário autenticado.
     *
     * @return JsonResponse
     */
    public function getTotalGains(): JsonResponse
    {
        $user = auth('api')->user();

        if (!$user) {
            return response()->json(['error' => 'Usuário não autenticado'], 401);
        }

        $values = Bau::where('user_id', $user->id)->pluck('value_mostrar');

        $totalGains = $values->map(function ($value) {
            $value = str_replace('R$ ', '', $value);
            $value = str_replace('.', '', $value);
            $value = str_replace(',', '.', $value);

            return (float) $value;
        })->sum();

        return response()->json(['totalGains' => $totalGains ?? 0]);
    }

    /**
     * Retorna a soma de CPA e RevShare do usuário autenticado.
     *
     * @return JsonResponse
     */
    public function getAffiliateCommissions(): JsonResponse
    {
        $user = auth('api')->user();

        if (!$user) {
            return response()->json(['error' => 'Usuário não autenticado'], 401);
        }

        $affiliateHistories = AffiliateHistory::where('inviter', $user->id)->get();

        $cpaTotal = $affiliateHistories->where('commission_type', 'cpa')->sum('commission_paid');
        $revShareTotal = $affiliateHistories->where('commission_type', 'revshare')->sum('commission_paid');

        $totalCommissions = $cpaTotal + $revShareTotal;

        return response()->json([
            'cpaTotal' => $cpaTotal ?? 0,
            'revShareTotal' => $revShareTotal ?? 0,
            'totalCommissions' => $totalCommissions ?? 0
        ]);
    }

    /**
     * Retorna a soma dos depósitos, a quantidade de depósitos efetuados pelos usuários referidos pelo usuário autenticado,
     * o maior depósito e o menor depósito.
     *
     * @return JsonResponse
     */
    public function getReferredUsersDeposits(): JsonResponse
{
    $user = auth('api')->user();

    if (!$user) {
        return response()->json(['error' => 'Usuário não autenticado'], 401);
    }

    // Captura os IDs dos referidos de nível 1
    $level1 = User::where('inviter', $user->id)->pluck('id');

    // Captura os IDs dos referidos de nível 2 (referidos pelos referidos de nível 1)
    $level2 = User::whereIn('inviter', $level1)->pluck('id');

    // Captura os IDs dos referidos de nível 3 (referidos pelos referidos de nível 2)
    $level3 = User::whereIn('inviter', $level2)->pluck('id');

    // Combina os IDs de todos os níveis (nível 1, 2 e 3)
    $allReferredUserIds = $level1->merge($level2)->merge($level3);

    if ($allReferredUserIds->isEmpty()) {
        return response()->json([
            'totalDepositsAmount' => 0,
            'totalDepositsCount' => 0,
            'status1DepositsCount' => 0,
            'highestDeposit' => 0,
            'lowestDeposit' => 0,
            'firstDepositCount' => 0,
            'totalDepositsAmountLevel2And3' => 0,
        ]);
    }

    // Captura a quantidade total de depósitos
    $totalDepositsCount = Deposit::whereIn('user_id', $allReferredUserIds)->count();

    // Captura a quantidade de depósitos com status 1
    $status1DepositsCount = Deposit::whereIn('user_id', $allReferredUserIds)
        ->where('status', 1)
        ->count();

    // Captura a soma dos valores de depósitos com status 1 para todos os níveis
    $totalDepositsAmount = Deposit::whereIn('user_id', $allReferredUserIds)
        ->where('status', 1)
        ->sum('amount');

    // Captura o maior depósito
    $highestDeposit = Deposit::whereIn('user_id', $allReferredUserIds)
        ->max('amount');

    // Captura o menor depósito
    $lowestDeposit = Deposit::whereIn('user_id', $allReferredUserIds)
        ->min('amount');

    $totalDepositsAmountLevel1 = Deposit::whereIn('user_id', $level1)
    ->where('status', 1)
    ->sum('amount');

    // Captura o primeiro depósito de cada usuário e conta quantos primeiros depósitos existem
    $firstDepositCount = Deposit::whereIn('user_id', $allReferredUserIds)
        ->whereIn('id', function ($query) {
            $query->select(DB::raw('MIN(id)'))
                ->from('deposits')
                ->groupBy('user_id');
        })
        ->count();

    // Soma dos depósitos para o nível 2 e nível 3 juntos
    $totalDepositsAmountLevel2And3 = Deposit::whereIn('user_id', $level2->merge($level3))
        ->where('status', 1)
        ->sum('amount');

    return response()->json([
        'totalDepositsAmount' => $totalDepositsAmount ?? 0,
        'totalDepositsCount' => $totalDepositsCount ?? 0,
        'status1DepositsCount' => $status1DepositsCount ?? 0,
        'highestDeposit' => $highestDeposit ?? 0,
        'lowestDeposit' => $lowestDeposit ?? 0,
        'firstDepositCount' => $firstDepositCount ?? 0,
         'totalDepositsAmountLevel1' => $totalDepositsAmountLevel1 ?? 0, // Novo
        'totalDepositsAmountLevel2And3' => $totalDepositsAmountLevel2And3 ?? 0, // Soma de depósitos nível 2 e 3
    ]);
}





    /**
     * Retorna a soma dos valores de bet e win dos usuários referidos pelo usuário autenticado.
     *
     * @return JsonResponse
     */
    public function getReferredUsersBetsAndWins(): JsonResponse
    {
        $user = auth('api')->user();

        if (!$user) {
            return response()->json(['error' => 'Usuário não autenticado'], 401);
        }

        // Filtra os usuários referidos pelo usuário autenticado
        $referredUserIds = User::where('inviter', $user->id)->pluck('id');

        if ($referredUserIds->isEmpty()) {
            return response()->json([
                'totalBetsaff' => 0,
                'totalWinsaff' => 0,
                'totalBetsCount' => 0,
                'betsMinusWins' => 0,
            ]);
        }

        // Inicializa as variáveis para somas de apostas e ganhos
        $totalBetsaff = 0;
        $totalWinsaff = 0;

        // Obtém as apostas e ganhos dos usuários referidos
        $games = GGRGames::whereIn('user_id', $referredUserIds)->get();

        foreach ($games as $game) {
            $balanceBet = $game->balance_bet;
            $balanceWin = $game->balance_win;

            // Soma o valor da aposta
            $totalBetsaff += $balanceBet;

            // Se o usuário ganhou, soma a diferença entre win e bet
            if ($balanceWin > 0) {
                $totalWinsaff += ($balanceWin - $balanceBet);
            }
        }

        // Contagem total de apostas (quantidade de registros)
        $totalBetsCount = $games->count();

        // Calcula a diferença entre apostas e ganhos
        $betsMinusWins = $totalWinsaff - $totalBetsaff;

        // Formata a diferença entre apostas e ganhos
        $formattedBetsMinusWins = ($betsMinusWins >= 0 ? '+' : '') . $betsMinusWins;

        // Retorna os resultados como JSON
        return response()->json([
            'totalBetsaff' => $totalBetsaff ?? 0,
            'totalWinsaff' => $totalWinsaff ?? 0,
            'totalBetsCount' => $totalBetsCount ?? 0,
            'betsMinusWins' => $formattedBetsMinusWins ?? 0,
        ]);
    }


    public function getAuthenticatedUserBetsAndWins(): JsonResponse
    {
        $user = auth('api')->user();

        if (!$user) {
            return response()->json(['error' => 'Usuário não autenticado'], 401);
        }

        // Inicializa as variáveis para somas de apostas e ganhos
        $totalBetsAmount = 0;
        $totalWinsAmount = 0;

        // Obtém as apostas e ganhos do usuário autenticado
        $games = GGRGames::where('user_id', $user->id)->get();

        foreach ($games as $game) {
            $balanceBet = $game->balance_bet;
            $balanceWin = $game->balance_win;

            // Soma o valor da aposta
            $totalBetsAmount += $balanceBet;

            // Se o usuário ganhou, soma a diferença entre win e bet
            if ($balanceWin > 0) {
                $totalWinsAmount += ($balanceWin - $balanceBet);
            }
        }

        // Contagem total de apostas (quantidade de registros)
        $totalBetssCount = $games->count();

        // Calcula a diferença entre apostas e ganhos
        $betssMinusWins = $totalWinsAmount - $totalBetsAmount;

        // Calcula a soma de apostas e ganhos
        $betssMinusWinsAlls = $totalWinsAmount + $totalBetsAmount;

        // Formata a diferença com sinal positivo ou negativo
        $formattedBetssMinusWins = ($betssMinusWins >= 0 ? '+' : '') . $betssMinusWins;

        return response()->json([
            'totalBetsAmount' => $totalBetsAmount ?? 0,
            'totalWinsAmount' => $totalWinsAmount ?? 0,
            'totalBetssCount' => $totalBetssCount ?? 0,
            'betssMinusWins' => $formattedBetssMinusWins ?? '0',
            'betssMinusWinsAlls' => $betssMinusWinsAlls ?? 0,
        ]);
    }
public function getAuthenticatedUserBets(): JsonResponse
{
    $user = auth('api')->user();

    if (!$user) {
        return response()->json(['error' => 'Usuário não autenticado'], 401);
    }

    try {
        // Obtenha as apostas do usuário
        $bets = GGRGames::where('user_id', $user->id)
            ->get(['game', 'provider', 'balance_bet', 'balance_win', 'type']);

        // Formate os dados para exibir conforme solicitado
        $formattedBets = $bets->map(function ($bet) {
            return [
                'game' => $bet->game,
                'provider' => $bet->provider,
                'amount' => $bet->type === 'win' ? $bet->balance_win : $bet->balance_bet,
                'result' => $bet->type === 'win' ? 'Ganho' : 'Perda'
            ];
        });

        return response()->json($formattedBets);
    } catch (\Exception $e) {
        return response()->json(['error' => 'Erro ao buscar apostas: ' . $e->getMessage()], 500);
    }
}




    public function getReferredUsersWithdrawals(): JsonResponse
    {
        $user = auth('api')->user();

        if (!$user) {
            return response()->json(['error' => 'Usuário não autenticado'], 401);
        }

        $referredUserIds = User::where('inviter', $user->id)->pluck('id');

        // Soma total dos valores de saques
        $totalWithdrawals = Withdrawal::whereIn('user_id', $referredUserIds)
            ->sum('amount');

        // Quantidade total de saques
        $totalWithdrawalsCount = Withdrawal::whereIn('user_id', $referredUserIds)
            ->count();

        // Quantidade de saques com status 1
        $statusOneWithdrawalsCount = Withdrawal::whereIn('user_id', $referredUserIds)
            ->where('status', 1)
            ->count();

        // Maior e menor valor de saque
        $maxWithdrawal = Withdrawal::whereIn('user_id', $referredUserIds)
            ->max('amount');

        $minWithdrawal = Withdrawal::whereIn('user_id', $referredUserIds)
            ->min('amount');

        return response()->json([
            'totalWithdrawals' => $totalWithdrawals ?? 0,
            'totalWithdrawalsCount' => $totalWithdrawalsCount ?? 0,
            'statusOneWithdrawalsCount' => $statusOneWithdrawalsCount ?? 0,
            'maxWithdrawal' => $maxWithdrawal ?? 0,
            'minWithdrawal' => $minWithdrawal ?? 0,
        ]);
    }

    /**
     * Retorna o nome de cada convidado, os valores de depósitos e saques separados por status,
     * e as ordens de apostas e ganhos, além da diferença entre ganhos e perdas.
     *
     * @return JsonResponse
     */
  public function getIndividualGuestDepositsAndWithdrawals(): JsonResponse
{
    $user = auth('api')->user();

    if (!$user) {
        return response()->json(['error' => 'Usuário não autenticado'], 401);
    }

    $level1 = User::where('inviter', $user->id)->get(['id', 'name']);
    $level2 = User::whereIn('inviter', $level1->pluck('id'))->get(['id', 'name']);
    $level3 = User::whereIn('inviter', $level2->pluck('id'))->get(['id', 'name']);

    $guestsData = collect();

    foreach ($level1 as $referredUser) {
        $guestsData->push($this->getUserDepositWithdrawalData($referredUser, 'level1'));
    }

    foreach ($level2 as $referredUser) {
        $guestsData->push($this->getUserDepositWithdrawalData($referredUser, 'level2'));
    }

    foreach ($level3 as $referredUser) {
        $guestsData->push($this->getUserDepositWithdrawalData($referredUser, 'level3'));
    }

    return response()->json(['guests' => $guestsData]);
}

/**
 * Obtém dados de depósitos e saques de um usuário.
 *
 * @param User $referredUser
 * @param string $level
 * @return array
 */
private function getUserDepositWithdrawalData(User $referredUser, string $level): array
{
    $depositsStatus1 = Deposit::where('user_id', $referredUser->id)
        ->where('status', 1)
        ->sum('amount');

    $depositsStatus1Count = Deposit::where('user_id', $referredUser->id)
        ->where('status', 1)
        ->count();

    $withdrawalsStatus1 = Withdrawal::where('user_id', $referredUser->id)
        ->where('status', 1)
        ->sum('amount');

    $totalBets = Order::where('user_id', $referredUser->id)
        ->where('type', 'bet')
        ->sum('amount');

    $totalBetsCount = Order::where('user_id', $referredUser->id)
        ->where('type', 'bet')
        ->count();

    $totalWinsCount = Order::where('user_id', $referredUser->id)
        ->where('type', 'win')
        ->count();

    $totalWins = Order::where('user_id', $referredUser->id)
        ->where('type', 'win')
        ->sum('amount');

    $betsMinuusWins = $totalWins - $totalBets;
    $betsAlls = $totalBets;
    $numberBetsandWins = $totalWinsCount + $totalBetsCount;

    return [
        'id' => $referredUser->id,
        'name' => $referredUser->name,
        'level' => $level,  // Adiciona o nível
        'deposits' => [
            'status1' => $depositsStatus1,
            'status1Count' => $depositsStatus1Count
        ],
        'withdrawals' => [
            'status1' => $withdrawalsStatus1,
        ],
        'orders' => [
            'totalBets' => $totalBets,
            'totalWins' => $totalWins,
            'totalBetsCount' => $totalBetsCount,
            'totalWinsCount' => $totalWinsCount,
            'numberBetsandWins' => $numberBetsandWins,
            'betsMinuusWins' => $betsMinuusWins,
            'betsAlls' => $betsAlls
        ]
    ];
}



    public function getAccountWithdrawsDetails(): JsonResponse
    {
        $user = auth('api')->user();

        if (!$user) {
            return response()->json(['error' => 'Usuário não autenticado'], 401);
        }

        // Filtra os registros de account_withdraws pelo user_id do usuário autenticado
        $accountWithdraws = AccountWithdraw::where('user_id', $user->id)->get();

        // Conta o total de registros encontrados
        $totalAccounts = $accountWithdraws->count();

        // Mapeia os dados dos registros
        $accountsDetails = $accountWithdraws->map(function ($accountWithdraw) {
            return [
                'pix_type' => $accountWithdraw->pix_type,
                'pix_key' => $accountWithdraw->pix_key,
                'name' => $accountWithdraw->name,
            ];
        });

        return response()->json([
            'totalAccounts' => $totalAccounts,
            'accountsDetails' => $accountsDetails
        ]);
    }
    public function getCumulativeDeposits(): JsonResponse
    {
        $user = auth('api')->user();

        if (!$user) {
            return response()->json(['error' => 'Usuário não autenticado'], 401);
        }

        // Soma dos depósitos com status 1 para o usuário autenticado
        $cumulativeDeposits = Deposit::where('user_id', $user->id)
            ->where('status', 1)
            ->sum('amount');

        return response()->json([
            'recargasCumulativas' => $cumulativeDeposits ?? 0
        ]);
    }

    // NOVAS FEATURES
  public function getEquipeInfosCompletas(): JsonResponse
{
    $user = auth('api')->user();

    if (!$user) {
        return response()->json(['error' => 'Usuário não autenticado'], 401);
    }

    try {
        // Conta o número de usuários referidos diretamente pelo usuário autenticado (Nível 1)
        $level1 = User::where('inviter', $user->id)->count();

        // Conta o número de usuários referidos pelos usuários do nível 1 (Nível 2)
        $level2 = User::whereIn('inviter', function ($query) use ($user) {
            $query->select('id')->from('users')->where('inviter', $user->id);
        })->count();

        // Conta o número de usuários referidos pelos usuários do nível 2 (Nível 3)
        $level3 = User::whereIn('inviter', function ($query) use ($user) {
            $query->select('id')->from('users')
                ->whereIn('inviter', function ($query) use ($user) {
                    $query->select('id')->from('users')->where('inviter', $user->id);
                });
        })->count();

        // Calcula o tamanho total da equipe (todos os níveis)
        $totalUsers = $level1 + $level2 + $level3;

        // Conta o número de membros diretos do usuário
        $totalMembrosDiretos = User::where('inviter', $user->id)->count();

        // Conta o número de membros indiretos (referenciados pelos membros diretos)
        $totalOutrosMembros = User::whereIn('inviter', function ($query) use ($user) {
            $query->select('id')->from('users')->where('inviter', $user->id);
        })->count();

        return response()->json([
            'tamanhoEquipe' => $totalUsers ?? 0,
            'totalMembrosDiretos' => $totalMembrosDiretos ?? 0,
            'totalOutrosMembros' => $totalOutrosMembros ?? 0,
        ]);
    } catch (\Exception $e) {
        return response()->json(['error' => 'Erro ao processar a solicitação: ' . $e->getMessage()], 500);
    }
}




}
