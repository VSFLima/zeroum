<?php

namespace App\Filament\Admin\Resources\AccountWithdrawResource\Pages;

use App\Filament\Admin\Resources\AccountWithdrawResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListAccountWithdraws extends ListRecords
{
    protected static string $resource = AccountWithdrawResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
