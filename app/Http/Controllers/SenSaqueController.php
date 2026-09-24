<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SenSaque;
use Illuminate\Support\Facades\Hash;

class SenSaqueController extends Controller
{
    public function store(Request $request)
    {
        // Validar os dados recebidos
        $validatedData = $request->validate([
            'user_id' => 'required|integer|exists:users,id',
            'pin' => 'required|string|size:6',
        ]);

        // Criptografar o PIN usando bcrypt
        $hashedPin = Hash::make($validatedData['pin']);

        // Criar e salvar o PIN na tabela sen_saque
        $senSaque = new SenSaque();
        $senSaque->user_id = $validatedData['user_id']; // Captura o user_id do request
        $senSaque->valid_saque = $hashedPin;
        $senSaque->save();

        return response()->json(['message' => 'Senha de saque criada com sucesso!'], 201);
    }

    public function verifyPin(Request $request)
    {
        // Validar os dados recebidos
        $validatedData = $request->validate([
            'user_id' => 'required|integer|exists:users,id',
            'pin' => 'required|string|size:6',
        ]);

        // Recuperar o PIN criptografado do banco de dados
        $senSaque = SenSaque::where('user_id', $validatedData['user_id'])->first();

        if (!$senSaque) {
            return response()->json(['message' => 'PIN não encontrado para este usuário.'], 404);
        }

        // Verificar o PIN fornecido com o PIN criptografado
        $isPinValid = Hash::check($validatedData['pin'], $senSaque->valid_saque);

        if ($isPinValid) {
            return response()->json(['message' => 'PIN verificado com sucesso!'], 200);
        } else {
            return response()->json(['message' => 'PIN inválido.'], 400);
        }
    }

    public function checkUserHasPin(Request $request)
    {
        $validatedData = $request->validate([
            'user_id' => 'required|integer|exists:users,id',
        ]);

        // Verifica se existe um registro para o usuário na tabela de senha de saque
        $senSaque = SenSaque::where('user_id', $validatedData['user_id'])->first();

        if ($senSaque) {
            return response()->json(['hasPins' => true], 200);
        } else {
            return response()->json(['hasPin' => false], 200);
        }
    }

}
