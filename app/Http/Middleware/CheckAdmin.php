<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CheckAdmin
{
    public function handle(Request $request, Closure $next)
    {
        if ($request->user() && $request->user()->hasRole('admin')) {
            return $next($request);
        }

        Auth::logout();
        return redirect()->to(url('/'))->with(['error' => 'Você não tem autorização']);
    }
}
