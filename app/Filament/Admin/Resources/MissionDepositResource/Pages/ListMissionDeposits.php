<?php

namespace App\Filament\Admin\Resources\MissionDepositResource\Pages;

use App\Filament\Admin\Resources\MissionDepositResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListMissionDeposits extends ListRecords
{
    protected static string $resource = MissionDepositResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
