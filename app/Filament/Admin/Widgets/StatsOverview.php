<?php

namespace App\Filament\Admin\Widgets;

use App\Models\User;
use App\Models\GGRGames;
use App\Models\GGRGamesDrakon;
use App\Models\GGRGamesFiver;
use App\Models\GgrGamesWorldSlot;
use Carbon\Carbon;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class StatsOverview extends BaseWidget
{
    protected static ?int $sort = 2;

    protected static ?string $pollingInterval = '15s';

    protected static bool $isLazy = true;

    /**
     * @return array|Stat[]
     */
    protected function getStats(): array
    {
        // Calcular o total de apostas de todas as tabelas
        $totalApostas = GGRGames::sum('balance_bet') +
                        GGRGamesDrakon::sum('balance_bet') +
                        GGRGamesFiver::sum('balance_bet') +
                        GgrGamesWorldSlot::sum('balance_bet');
        
        // Calcular o total de ganhos de todas as tabelas
        $totalGanhos = GGRGames::sum('balance_win') +
                       GGRGamesDrakon::sum('balance_win') +
                       GGRGamesFiver::sum('balance_win') +
                       GgrGamesWorldSlot::sum('balance_win');
        
        // Calcular o total de perdas
        $totalPerdas = $totalApostas - $totalGanhos;

        return [
            Stat::make('Total Usuários', User::count())
                ->description('Novos usuários')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->color('info')
                ->chart([7, 3, 4, 5, 6, 3, 5, 3]),
            Stat::make('Total Apostado', \Helper::amountFormatDecimal($totalApostas))
                ->description('Aposta dos usuários')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->color('success')
                ->chart([7, 3, 4, 5, 6, 3, 5, 3]),
            Stat::make('Total Ganhos', \Helper::amountFormatDecimal($totalGanhos))
                ->description('Ganhos dos usuários')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->color('success')
                ->chart([7, 3, 4, 5, 6, 3, 5, 3]),
            Stat::make('Total Perdas', \Helper::amountFormatDecimal($totalPerdas))
                ->description('Perdas dos usuários')
                ->descriptionIcon('heroicon-m-arrow-trending-down')
                ->color('danger')
                ->chart([7, 3, 4, 5, 6, 3, 5, 3])
        ];
    }

    /**
     * @return bool
     */
    public static function canView(): bool
    {
        return auth()->user()->hasRole('admin');
    }
}
