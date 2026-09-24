<?php

namespace App\Filament\Admin\Resources\GgrGamesWorldSlotResource\Pages;

use App\Filament\Admin\Resources\GgrGamesWorldSlotResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListGgrGamesWorldSlots extends ListRecords
{
    protected static string $resource = GgrGamesWorldSlotResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
