<?php

namespace App\Http\Controllers\Api\Wallet;

use App\Http\Controllers\Controller;
use App\Models\Withdrawal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;

class WithdrawController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $userId = auth('api')->id();

        $query = Withdrawal::whereUserId($userId);

        if ($request->has('filter')) {
            $filter = $request->input('filter');

            switch ($filter) {
                case 'today':
                    $startOfDay = Carbon::today();
                    $endOfDay = Carbon::tomorrow()->subSecond();
                    $query->whereBetween('created_at', [$startOfDay, $endOfDay]);
                    break;

                case 'week':
                    $startOfWeek = Carbon::now()->startOfWeek();
                    $endOfWeek = Carbon::now()->endOfWeek();
                    $query->whereBetween('created_at', [$startOfWeek, $endOfWeek]);
                    break;

                case 'month':
                    $startOfMonth = Carbon::now()->startOfMonth();
                    $endOfMonth = Carbon::now()->endOfMonth();
                    $query->whereBetween('created_at', [$startOfMonth, $endOfMonth]);
                    break;

                case 'year':
                    $startOfYear = Carbon::now()->startOfYear();
                    $endOfYear = Carbon::now()->endOfYear();
                    $query->whereBetween('created_at', [$startOfYear, $endOfYear]);
                    break;
            }
        }

        $withdraws = $query->paginate();

        return response()->json(['withdraws' => $withdraws], 200);
    }


    public function verifyPassword(Request $request)
    {
        $request->validate([
            'password' => 'required|string|min:6|max:6',
        ]);

        $user = auth('api')->user();

        // Verifica se a senha fornecida corresponde à senha armazenada no banco de dados
        if (Hash::check($request->password, $user->withdrawal_password)) {
            return response()->json(['valid' => true], 200);
        } else {
            return response()->json(['valid' => false], 401);
        }
    }

}
