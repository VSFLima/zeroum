<?php

namespace App\Filament\Affiliate\Widgets;

use App\Models\Bau; // Importar o modelo Bau
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget as BaseWidget;

class LatestBau extends BaseWidget
{
    protected static ?string $heading = 'Meus baús - os valores são adicionados diretamente na sua carteira de saque no aplicativo';

    protected static ?int $navigationSort = -1;

    protected int|string|array $columnSpan = 'full';

    /**
     * @param Table $table
     * @return Table
     */
    public function table(Table $table): Table
    {
        return $table
            ->query(Bau::query()->where('user_id', auth()->id()))
            ->columns([
                Tables\Columns\TextColumn::make('status')
                    ->label('Status')
                    ->badge()
                    ->formatStateUsing(fn($record) => $record->status === 3 ? 'Você já abriu & os valores foram creditados diretamente na sua conta de saque!' : $record->status),
                Tables\Columns\TextColumn::make('bau_id')
                    ->label('Número do BÁU')
                    ->formatStateUsing(function ($record) {
                        $depositantesNecessarios = $this->calcularDepositantes($record->bau_id);
                        return "{$record->bau_id} - Número de depositantes necessários {$depositantesNecessarios}";
                    }),
                Tables\Columns\TextColumn::make('value_mostrar')
                    ->money('BRL')
                    ->badge()
                    ->label('Valor de cada BÁU'),
            ])
            ->filters([
                // Adicionar filtros se necessário
            ]);
    }

    /**
     * Calcula o número de depositantes necessários com base no número do baú.
     * 
     * @param int $bauId
     * @return int
     */
    private function calcularDepositantes(int $bauId): int
    {
        if ($bauId >= 1 && $bauId <= 10) {
            return $bauId;
        } elseif ($bauId >= 11 && $bauId <= 20) {
            return ($bauId - 10) * 5 + 10;
        } elseif ($bauId >= 21 && $bauId <= 30) {
            return ($bauId - 20) * 10 + 20;
        } elseif ($bauId >= 31 && $bauId <= 40) {
            return ($bauId - 30) * 20 + 30;
        }

        // Se precisar de mais intervalos, adicione aqui
        return $bauId; // Default case, sem multiplicação
    }

    /**
     * Calcula a soma dos valores dos baús para o usuário autenticado.
     * 
     * @return float
     */
    public function calcularSomaValores(): float
    {
        $total = Bau::where('user_id', auth()->id())->sum('value_mostrar');
        return $total;
    }

    /**
     * @return bool
     */
    public static function canView(): bool
    {
        return auth()->user()->hasRole('afiliado');
    }
}


