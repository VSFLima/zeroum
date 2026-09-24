<?php
use App\Models\Game;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Gateway\SuitPayController;
use App\Http\Controllers\BauController;
use App\Http\Controllers\MusicController;
use App\Http\Controllers\AccountWithdrawController;
// ❌ REMOVER: use App\Http\Controllers\Api\Profile\WalletController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
*/

/*
|--------------------------------------------------------------------------
| Account & API Routes
|--------------------------------------------------------------------------
*/
Route::post('/account_withdraw', [AccountWithdrawController::class, 'store']);
Route::get('/api/musics', [MusicController::class, 'index']);
Route::put('/api/bau/{id}/abrir', [BauController::class, 'abrirBau']);

/*
|--------------------------------------------------------------------------
| ❌ REMOVER ESTA ROTA - Não é mais necessária
|--------------------------------------------------------------------------
*/
// Route::get('/withdrawal/{id}', [WalletController::class, 'withdrawalFromModal'])
//     ->name('withdrawal');

/*
|--------------------------------------------------------------------------
| Rotas SuitPay (Divpag Integration)
|--------------------------------------------------------------------------
*/
// Rota pública para consulta
Route::post('/suitpay/consult-status-transaction', [SuitPayController::class, 'consultStatusTransactionPix']);

// Webhook público da Divpag (não requer auth)
Route::post('/api/suitpay/webhook', [SuitPayController::class, 'webhook'])
    ->name('suitpay.webhook');

// Rotas protegidas (requerem autenticação)
Route::middleware(['auth'])->group(function () {
    // ===== ROTAS COM PARÂMETROS NA URL (usadas pelo Filament) =====
    Route::get('/suitpay/withdrawal/{id}/{action}', [SuitPayController::class, 'withdrawalFromModal'])
        ->name('suitpay.withdrawal');
    
    Route::get('/suitpay/cancelwithdrawal/{id}/{action}', [SuitPayController::class, 'cancelWithdrawalFromModal'])
        ->name('suitpay.cancelwithdrawal');
    
    // ===== ROTAS COM QUERY PARAMS (backup/alternativas) =====
    Route::get('/suitpay/withdrawal-query', [SuitPayController::class, 'withdrawal'])
        ->name('suitpay.withdrawal.query');
    
    Route::get('/suitpay/cancelwithdrawal-query', [SuitPayController::class, 'cancelWithdrawal'])
        ->name('suitpay.cancelwithdrawal.query');
});

/*
|--------------------------------------------------------------------------
| Clear Cache Route
|--------------------------------------------------------------------------
*/
Route::get('clear', function() {
    Artisan::command('clear', function () {
        Artisan::call('optimize:clear');
        return back();
    });
    return back();
});

/*
|--------------------------------------------------------------------------
| Incluir Grupos de Rotas
|--------------------------------------------------------------------------
*/

// GAMES PROVIDER
include_once(__DIR__ . '/groups/provider/games.php');
include_once(__DIR__ . '/groups/provider/playFiver.php');
include_once(__DIR__ . '/groups/provider/drakon.php');
include_once(__DIR__ . '/groups/provider/pgOnePlayiGaming.php');

// GATEWAYS
include_once(__DIR__ . '/groups/gateways/suitpay.php');
include_once(__DIR__ . '/groups/gateways/bspay.php');
include_once(__DIR__ . '/groups/gateways/ezzepay.php');
include_once(__DIR__ . '/groups/gateways/digitopay.php');

// SOCIAL
include_once(__DIR__ . '/groups/auth/social.php');

// APP
include_once(__DIR__ . '/groups/layouts/app.php');