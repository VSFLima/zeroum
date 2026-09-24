<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PostNotification; // Certifique-se de que o modelo está correto

class PostNotificationsController extends Controller
{
    public function index()
    {
        try {
            $notifications = PostNotification::all(['imagem', 'titulo', 'message', 'created_at']);
            return response()->json($notifications);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Something went wrong'], 500);
        }
    }
}
