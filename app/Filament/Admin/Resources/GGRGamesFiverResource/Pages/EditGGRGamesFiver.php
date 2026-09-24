<?php

namespace App\Filament\Admin\Resources\GGRGamesFiverResource\Pages;

use App\Filament\Admin\Resources\GGRGamesFiverResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditGGRGamesFiver extends EditRecord
{
    protected static string $resource = GGRGamesFiverResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
