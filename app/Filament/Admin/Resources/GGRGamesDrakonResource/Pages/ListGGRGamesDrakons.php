<?php

namespace App\Filament\Admin\Resources\GGRGamesDrakonResource\Pages;

use App\Filament\Admin\Resources\GGRGamesDrakonResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListGGRGamesDrakons extends ListRecords
{
    protected static string $resource = GGRGamesDrakonResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
