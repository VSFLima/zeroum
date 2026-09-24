<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\AccountWithdraw;

class AccountWithdrawController extends Controller
{
    public function store(Request $request)
    {
        // Validar os dados recebidos
        $validatedData = $request->validate([
            'user_id' => 'required|integer|exists:users,id',
            'name' => 'required|string|max:255',
            'pix_type' => 'required|string|in:document,email,phoneNumber',
            'pix_key' => 'required|string|max:255',
            'document' => 'nullable|string|max:14', // Document é opcional
        ]);

        // Contar o número de contas existentes para o usuário
        $accountCount = AccountWithdraw::where('user_id', $validatedData['user_id'])->count();

        // Verificar se o usuário já possui 8 contas
        if ($accountCount >= 8) {
            return response()->json(['message' => 'O usuário já possui o número máximo de contas (8).'], 400);
        }

        // Criar uma nova instância de AccountWithdraw e preencher os dados
        $withdraw = new AccountWithdraw();
        $withdraw->user_id = $validatedData['user_id'];
        $withdraw->name = $validatedData['name'];
        $withdraw->pix_type = $validatedData['pix_type'];

        // Salvar pix_key exatamente como recebido
        $withdraw->pix_key = $validatedData['pix_key'];

        // Verificar se o Document está presente antes de atribuí-lo
        if (isset($validatedData['document'])) {
            $withdraw->document = $validatedData['document'];
        }

        // Salvar os dados no banco de dados
        $withdraw->save();

        return response()->json(['message' => 'Dados salvos com sucesso!'], 200);
    }
}
