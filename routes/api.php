<?php

use App\Http\Controllers\Api\Profile\ProfileController;
use App\Http\Controllers\BauController;
use App\Http\Controllers\SliderTextController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Broadcast;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DepositanteController;
use App\Http\Controllers\Api\Auth\AuthController;
use App\Http\Controllers\Api\Missions\MissionController;
use App\Http\Controllers\Api\Profile\AffiliateController;
use App\Http\Controllers\AccountWithdrawController;
use App\Http\Controllers\SenSaqueController;
use App\Http\Controllers\EventController;
use App\Http\Controllers\Api\Profile\VipController;
use App\Http\Controllers\MissionDepositController;
use App\Http\Controllers\Gateway\SuitPayController;
use App\Http\Controllers\PostNotificationsController;
use App\Http\Controllers\BonusInitialController;
use App\Http\Controllers\Api\Profile\WalletController;
use App\Http\Controllers\Gateway\BsPayController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
Route::get('/check-deposit-min', [BonusInitialController::class, 'checkDeposit']);

Route::middleware('auth:api')->group(function () {
    // Verificar e atualizar bônus se necessário
    Route::get('profile/wallet/update-bonus-if-needed', [WalletController::class, 'updateBonusIfNeeded']);

    // Transferir saldo para saque se necessário
    Route::get('profile/wallet/transfer-balance-to-withdrawal-if-needed', [WalletController::class, 'transferBalanceToWithdrawalIfNeeded']);

    // Transferir bônus para saque se necessário
    Route::get('profile/wallet/transfer-bonus-to-withdrawal-if-needed', [WalletController::class, 'transferBonusToWithdrawalIfNeeded']);

    // Verificar e atualizar bônus, saldo e transferências
    Route::get('profile/wallet/check-and-update-bonus', [WalletController::class, 'checkAndUpdateBonus']);
});
Route::middleware('auth:api')->get('/transaction/status/by-token', [SuitPayController::class, 'checkTransactionStatusByToken']);

// ═══════════════════════════════════════════════════════════════
// NOVA ROTA: Verificar Pagamento PIX (Botão "Já Paguei")
// ═══════════════════════════════════════════════════════════════
Route::middleware('auth:api')->post('/suitpay/check-payment', [SuitPayController::class, 'checkPayment']);

Route::get('/mission-deposits', [MissionDepositController::class, 'index']);
Route::get('/user-deposits', [MissionDepositController::class, 'userDeposits']);

Route::get('/events', [EventController::class, 'index']);

Route::post('/verify-pin', [SenSaqueController::class, 'verifyPin']);

Route::post('/sen-saque', [SenSaqueController::class, 'store']);

Route::get('/verify-senha-saque', [SenSaqueController::class, 'checkUserHasPin']);

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware('auth:api')->group(function () {
    Route::get('/user-deposits', [MissionDepositController::class, 'userDeposits']);
    Route::get('/missions/check-status', [MissionDepositController::class, 'checkMissionStatus']);
    Route::post('/missions/collect/{id}', [MissionDepositController::class, 'collectMission']);
});
Route::post('/profile/collect', [VipController::class, 'collect']);



Route::post('/account_withdraw', [AccountWithdrawController::class, 'store']);


/*
 * Auth Route with JWT
 */
Route::group(['prefix' => 'auth', 'as' => 'auth.'], function () {
    include_once(__DIR__ . '/groups/api/auth/auth.php');
});

Route::group(['middleware' => ['auth.jwt']], function () {
    Route::prefix('profile')
        ->group(function () {
            include_once(__DIR__ . '/groups/api/profile/profile.php');
            include_once(__DIR__ . '/groups/api/profile/affiliates.php');
            include_once(__DIR__ . '/groups/api/profile/wallet.php');
            include_once(__DIR__ . '/groups/api/profile/likes.php');
            include_once(__DIR__ . '/groups/api/profile/favorites.php');
            include_once(__DIR__ . '/groups/api/profile/recents.php');
            include_once(__DIR__ . '/groups/api/profile/vip.php');
            include_once(__DIR__ . '/groups/api/profile/chest.php');
            include_once(__DIR__ . '/groups/api/profile/infos.php');
        });

    Route::prefix('wallet')
        ->group(function () {
            include_once(__DIR__ . '/groups/api/wallet/deposit.php');
            include_once(__DIR__ . '/groups/api/wallet/withdraw.php');
        });

    include_once(__DIR__ . '/groups/api/missions/mission.php');
    ;
    include_once(__DIR__ . '/groups/api/missions/missionuser.php');
    ;
});


Route::prefix('categories')
    ->group(function () {
        include_once(__DIR__ . '/groups/api/categories/index.php');
        ;
    });

include_once(__DIR__ . '/groups/api/games/index.php');
include_once(__DIR__ . '/groups/api/gateways/suitpay.php');
include_once(__DIR__ . '/groups/api/gateways/bspay.php');

Route::prefix('search')
    ->group(function () {
        include_once(__DIR__ . '/groups/api/search/search.php');
    });

Route::prefix('profile')
    ->group(function () {
        Route::post('/getLanguage', [ProfileController::class, 'getLanguage']);
        Route::put('/updateLanguage', [ProfileController::class, 'updateLanguage']);
        Route::post('/upload-avatar', [ProfileController::class, 'uploadAvatar']);
        Route::post('/update-facebook-id', [ProfileController::class, 'updateFacebookId']);
        Route::post('/update-whatsapp-id', [ProfileController::class, 'updateWhatsappId']);
        Route::post('/update-telegram-id', [ProfileController::class, 'updateTelegramId']);
        Route::post('/update-aniversario', [ProfileController::class, 'updateAniversario']);
    });

Route::prefix('providers')
    ->group(function () {

    });
// Em routes/api.php
Route::get('/post-notifications', [PostNotificationsController::class, 'index']);
Route::get('/slider-text', [SliderTextController::class, 'index']);

Route::prefix('settings')
    ->group(function () {
        include_once(__DIR__ . '/groups/api/settings/settings.php');
        include_once(__DIR__ . '/groups/api/settings/banners.php');
        include_once(__DIR__ . '/groups/api/settings/currency.php');
        include_once(__DIR__ . '/groups/api/settings/bonus.php');
    });

// LANDING SPIN
Route::prefix('spin')
    ->group(function () {
        include_once(__DIR__ . '/groups/api/spin/index.php');
    })
    ->name('landing.spin.');


Route::middleware('auth:api')->get('/user/cpf', function () {
    $cpf = auth()->user()->cpf;

    return response()->json([
        'cpf' => $cpf
    ]);
});