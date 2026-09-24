<?php

namespace App\Filament\Admin\Resources\GGRGamesDrakonResource\Pages;

use App\Filament\Admin\Resources\GGRGamesDrakonResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditGGRGamesDrakon extends EditRecord
{
    protected static string $resource = GGRGamesDrakonResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
