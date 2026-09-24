<?php
namespace App\Livewire;

use App\Models\AffiliateHistory;
use App\Models\Deposit;
use App\Models\Withdrawal;
use Carbon\Carbon;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Filament\Widgets\Concerns\InteractsWithPageFilters;
use App\Models\Bau;

class WalletOverview extends BaseWidget
{
    protected static ?int $sort = -2;
    use InteractsWithPageFilters;

    /**
     * @return array|Stat[]
     */
    protected function getStats(): array
    {
        $startDate = $this->filters['startDate'] ?? null;
        $endDate = $this->filters['endDate'] ?? null;

        $depositQuery = Deposit::query();
        $withdrawalQuery = Withdrawal::query();
        $affiliateQuery = AffiliateHistory::query();
        $bauQuery = Bau::query();

        // Aplicar filtros de data
        if (empty($startDate) || empty($endDate)) {
            $currentMonth = Carbon::now()->month;
            $depositQuery->whereMonth('created_at', $currentMonth);
            $withdrawalQuery->whereMonth('created_at', $currentMonth);
            $affiliateQuery->whereMonth('created_at', $currentMonth);
            $bauQuery->whereMonth('created_at', $currentMonth);
        } else {
            $depositQuery->whereBetween('created_at', [$startDate, $endDate]);
            $withdrawalQuery->whereBetween('created_at', [$startDate, $endDate]);
            $affiliateQuery->whereBetween('created_at', [$startDate, $endDate]);
            $bauQuery->whereBetween('created_at', [$startDate, $endDate]);
        }

        // Total e contagem de Depósitos
        $totalDepositsGenerated = $depositQuery->count();
        $countDepositsPaid = $depositQuery->clone()->where('status', 1)->count();
        $countDepositsUnpaid = $depositQuery->clone()->where('status', 0)->count();

        $totalDepositsGenerateds = $depositQuery->sum('amount');
        $totalDepositsPaids = $depositQuery->clone()->where('status', 1)->sum('amount');
        $totalDepositsUnpaids = $depositQuery->clone()->where('status', 0)->sum('amount');

        // Total e contagem de Saques
        $totalWithdrawalsGenerated = $withdrawalQuery->count();
        $countWithdrawalsPaid = $withdrawalQuery->clone()->where('status', 1)->count();
        $countWithdrawalsUnpaid = $withdrawalQuery->clone()->where('status', 0)->count();

        $totalWithdrawalsGenerateds = $withdrawalQuery->sum('amount');
        $totalWithdrawalsPaids = $withdrawalQuery->clone()->where('status', 1)->sum('amount');
        $totalWithdrawalsUnpaids = $withdrawalQuery->clone()->where('status', 0)->sum('amount');

        // Ganhos da plataforma

        $ganhosbrutos = $totalDepositsPaids - $totalWithdrawalsPaids;

        // Total de comissões Revshare e CPA
        $revshareCommission = $affiliateQuery->where('commission_type', 'revshare')->sum('commission_paid');
        $cpaCommission = $affiliateQuery->where('commission_type', 'cpa')->sum('commission_paid');

        // Total Pago em BAÚS
        $bausValue = $bauQuery->where('status', 3)->sum('value_mostrar');
        return [
            Stat::make('Ganhos bruto da plataforma', \Helper::amountFormatDecimal($ganhosbrutos))
                ->description('Total de ganhos bruto gerados')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->color('info'),
            Stat::make('Total Depósitos Gerados', \Helper::amountFormatDecimal($totalDepositsGenerateds))
                ->description('Total de depósitos gerados')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->color('info'),

            Stat::make('Número Depósitos Gerados', $totalDepositsGenerated)
                ->description('Número total de depósitos gerados')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->color('info'),

            Stat::make('Total Depósitos Pagos', \Helper::amountFormatDecimal($totalDepositsPaids))
                ->description('Total de depósitos pagos')
                ->descriptionIcon('heroicon-m-check-circle')
                ->color('success'),

            Stat::make('Número Depósitos Pagos', $countDepositsPaid)
                ->description('Número total de depósitos pagos')
                ->descriptionIcon('heroicon-m-check-circle')
                ->color('success'),

            Stat::make('Total Depósitos Não Pagos', \Helper::amountFormatDecimal($totalDepositsUnpaids))
                ->description('Total de depósitos não pagos')
                ->descriptionIcon('heroicon-m-x-circle')
                ->color('danger'),

            Stat::make('Número Depósitos Não Pagos', $countDepositsUnpaid)
                ->description('Número total de depósitos não pagos')
                ->descriptionIcon('heroicon-m-x-circle')
                ->color('danger'),

            Stat::make('Total Saques Gerados', \Helper::amountFormatDecimal($totalWithdrawalsGenerateds))
                ->description('Total de saques gerados')
                ->descriptionIcon('heroicon-m-arrow-trending-down')
                ->color('info'),

            Stat::make('Número Saques Gerados', $totalWithdrawalsGenerated)
                ->description('Número total de saques gerados')
                ->descriptionIcon('heroicon-m-arrow-trending-down')
                ->color('info'),

            Stat::make('Total Saques Pagos', \Helper::amountFormatDecimal($totalWithdrawalsPaids))
                ->description('Total de saques pagos')
                ->descriptionIcon('heroicon-m-check-circle')
                ->color('success'),

            Stat::make('Número Saques Pagos', $countWithdrawalsPaid)
                ->description('Número total de saques pagos')
                ->descriptionIcon('heroicon-m-check-circle')
                ->color('success'),

            Stat::make('Total Saques Não Pagos', \Helper::amountFormatDecimal($totalWithdrawalsUnpaids))
                ->description('Total de saques não pagos')
                ->descriptionIcon('heroicon-m-x-circle')
                ->color('danger'),

            Stat::make('Número Saques Não Pagos', $countWithdrawalsUnpaid)
                ->description('Número total de saques não pagos')
                ->descriptionIcon('heroicon-m-x-circle')
                ->color('danger'),

            Stat::make('Revshare Commission Total', \Helper::amountFormatDecimal($revshareCommission))
                ->description('Total de comissão Revshare')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->color('success'),

            Stat::make('CPA Commission Total', \Helper::amountFormatDecimal($cpaCommission))
                ->description('Total de comissão CPA')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->color('success'),
            Stat::make('BAÚ Commission Total', \Helper::amountFormatDecimal($bausValue))
                ->description('Total de comissão BAÚ')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->color('success'),
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
