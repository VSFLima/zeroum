<?php

namespace App\Http\Controllers;

use App\Models\Bau;
use Illuminate\Http\Request;

class BauController extends Controller
{
    public function atualizarEstado(Request $request)
    {
        $user_id = $request->input('user_id');
        $bau_id = $request->input('bau_id');

        try {
            // Encontre ou crie o registro do baú para o usuário
            $bau = Bau::firstOrNew(['user_id' => $user_id]);
            $bau->{"bau_$bau_id"} = 1; // Marca o baú como aberto
            $bau->save();

            return response()->json(['message' => 'Estado do baú atualizado com sucesso.']);
        } catch (\Exception $e) {
            // Log do erro para investigação
            \Log::error('Erro ao atualizar estado do baú: ' . $e->getMessage());

            return response()->json(['error' => 'Erro interno ao processar a requisição.'], 500);
        }
    }


}
