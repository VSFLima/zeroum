<?php

use App\Http\Controllers\Api\Games\GameController;
use Illuminate\Support\Facades\Route;

Route::post('/gold_api/{data}', [GameController::class, 'webhookPgOnePlayiGaming']);

/*
* @dev Thigas Dev contato @link https://t.me/thigasdev
* IMPORTANTE: ESSE ENDPOINT É O QUE VOCÊ VAI COLOCAR APÓS O https://SEUDOMINIO.COM/apipragmatic40/webhook
* NO PAINEL DA API EM Configurações da API no API EndPoint
*/