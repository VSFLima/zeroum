<?php

namespace App\Filament\Affiliate\Widgets;

use App\Models\Bau; // Importar o modelo Bau
use Filament\Widgets\Widget;
use Illuminate\Contracts\View\View;

class TotalBausValue extends Widget
{
    protected static string $view = 'widgets.total_baus_value'; // Caminho para a view

    /**
     * @return View
     */
    public function render(): View
    {
        // Busca todos os baús do usuário atual com valor mostrar
        $baus = Bau::where('user_id', auth()->id())
            ->where('value_mostrar', 'LIKE', 'R$%') // Procura por valores iniciados com "R$"
            ->get();

        // Calcula o total apenas se houver baús encontrados
        if ($baus->isNotEmpty()) {
            // Inicializa variável para soma dos valores numéricos
            $totalValue = 0;

            // Itera sobre os baús para extrair e somar os valores numéricos
            foreach ($baus as $bau) {
                // Remove o prefixo "R$" e converte para float
                $numericValue = (float) str_replace('R$', '', $bau->value_mostrar);
                $totalValue += $numericValue;
            }

            // Formata o valor total para exibição
            $formattedTotal = "R$ " . number_format($totalValue, 2, ',', '.');

            // Passa o valor como uma variável para a view e retorna a View
            return view(static::$view, [
                'total_value' => $formattedTotal,
            ])->layout('filament.widgets.text'); // Aplica o layout de texto para melhorar a aparência
        }

        // Se não houver baús encontrados, retorna uma mensagem indicando isso
        return view(static::$view, [
            'total_value' => 'Nenhum baú encontrado',
        ])->layout('filament.widgets.text'); // Aplica o layout de texto mesmo para mensagem de aviso
    }

    /**
     * @return bool
     */
    public static function canView(): bool
    {
        return auth()->user()->hasRole('afiliado');
    }
}
