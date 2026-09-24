<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\AffiliateHistory;

class DepositanteController extends Controller
{
    public function getDepositantesCount()
    {
        $userId = Auth::id();
        $depositantesCount = AffiliateHistory::where('user_id', $userId)
            ->where('id', 2)
            ->sum('deposited');

        return response()->json(['count' => $depositantesCount]);
    }
}
