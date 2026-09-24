<?php

use App\Http\Controllers\Api\Profile\InfosController;
use Illuminate\Support\Facades\Route;
Route::prefix('infos')->group(function () {
    Route::get('/total-gains', [InfosController::class, 'getTotalGains']);
    Route::get('/affiliate-commissions', [InfosController::class, 'getAffiliateCommissions']);
    Route::get('/referred-users-deposits', [InfosController::class, 'getReferredUsersDeposits']);
    Route::get('/referred-bets-wins', [InfosController::class, 'getReferredUsersBetsAndWins']);
    Route::get('/bets-wins', [InfosController::class, 'getAuthenticatedUserBetsAndWins']);
    Route::get('/referred-withdrawals', [InfosController::class, 'getReferredUsersWithdrawals']);
    Route::get('/individual-guest-deposits-withdrawals', [InfosController::class, 'getIndividualGuestDepositsAndWithdrawals']);
    Route::get('/account-withdraws', [InfosController::class, 'getAccountWithdrawsDetails']);
    Route::get('/cumulative-deposits', [InfosController::class, 'getCumulativeDeposits']);
    Route::get('/equipes-infos', [InfosController::class, 'getEquipeInfosCompletas']);
    Route::get('/user-bets', [InfosController::class, 'getAuthenticatedUserBets']);
});
