<?php
use App\Http\Controllers\Gateway\BsPayController;
use Illuminate\Support\Facades\Route;

Route::prefix('bspay')
    ->group(function ()
    {
        Route::post('qrcode-pix', [BsPayController::class, 'getQRCodePix']);
        Route::post('consult-status-transaction', [BsPayController::class, 'consultStatusTransactionPix']);
    });



