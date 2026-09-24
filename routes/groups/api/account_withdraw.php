<?php

use App\Http\Controllers\AccountWithdrawController;
use Illuminate\Support\Facades\Route;


Route::middleware('auth:sanctum')->post('/account-withdraw', [AccountWithdrawController::class, 'store']);

