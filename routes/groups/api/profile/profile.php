<?php


use App\Http\Controllers\Api\Profile\ProfileController;
use Illuminate\Support\Facades\Route;

Route::prefix('profile')
    ->group(function () {
        Route::get('/', [ProfileController::class, 'index']);
        Route::post('/upload-avatar', [ProfileController::class, 'uploadAvatar']);
        Route::post('/updateName', [ProfileController::class, 'updateName']);
        Route::post('/update-facebook-id', [ProfileController::class, 'updateFacebookId']);
        Route::post('/update-whatsapp-id', [ProfileController::class, 'updateWhatsappId']);
        Route::post('/update-telegram-id', [ProfileController::class, 'updateTelegramId']);
        Route::post('/update-aniversario', [ProfileController::class, 'updateAniversario']);
    });

