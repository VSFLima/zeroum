<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Gateway\BsPayController;

Route::prefix('bspay')
    ->group(function () {
        Route::post('qrcode-pix', [BsPayController::class, 'getQRCodePix']);
        Route::any('callback', [BsPayController::class, 'callbackMethod']);
        Route::post('payment', [BsPayController::class, 'callbackMethodPayment']);
        Route::post('consult-status-transaction', [BsPayController::class, 'consultStatusTransactionPix']);

        Route::post('test-callback', [BsPayController::class, 'testCallback']);

        Route::middleware(['admin.filament', 'admin'])
            ->group(function () {
                Route::get('withdrawal/{id}/{action}', [BsPayController::class, 'withdrawalFromModal'])->name('bspay.withdrawal');
                Route::get('cancelwithdrawal/{id}/{action}', [BsPayController::class, 'cancelWithdrawalFromModal'])->name('bspay.cancelwithdrawal');
            });
    });
