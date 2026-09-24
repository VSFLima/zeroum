<?php

use App\Http\Controllers\Api\Games\GameController;
use Illuminate\Support\Facades\Route;

// Fivers
Route::post('gold_api', [GameController::class, 'webhookGoldApiMethod']);

// Ever
Route::post('ever', [GameController::class, 'webhookEvergameMethod']);

// Worldslot
//Route::post('gold_api/user_balance', [GameController::class, 'webhookUserBalanceMethod']);
//Route::post('gold_api/game_callback', [GameController::class, 'webhookGameCallbackMethod']);
//Route::post('gold_api/money_callback', [GameController::class, 'webhookMoneyCallbackMethod']);
Route::post('gold_api/game_callback', [GameController::class, 'webhookGameCallbackMethodClone']);
Route::post('gold_api/money_callback', [GameController::class, 'webhookMoneyCallbackMethodClone']);
Route::post('gold_api/user_balance', [GameController::class, 'webhookUserBalanceMethodClone']);

//Adicionar nova rota

// PlayConnect
Route::post('cron/playconnect', [GameController::class, 'webhookPlayConnectMethod']);

// PlayGaming
Route::post('playigaming_api', [GameController::class, 'webhookPlayIGamingMethod']);
Route::post('playgaming', [GameController::class, 'webhookPlayGamingMethod']);
