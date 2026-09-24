<?php

// app/Http/Controllers/EventController.php

namespace App\Http\Controllers;

use App\Models\EventosPlata;
use Illuminate\Http\Request;

class EventController extends Controller
{
    public function index()
    {
        $events = EventosPlata::all(); // Certifique-se de que a tabela é Events e não eventos_plataforma
        return response()->json($events);
    }
}