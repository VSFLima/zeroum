<?php

namespace App\Filament\Admin\Resources\GgrGamesWorldSlotResource\Pages;

use App\Filament\Admin\Resources\GgrGamesWorldSlotResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditGgrGamesWorldSlot extends EditRecord
{
    protected static string $resource = GgrGamesWorldSlotResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
