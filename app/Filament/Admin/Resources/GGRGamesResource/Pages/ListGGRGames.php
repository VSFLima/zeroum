<?php

namespace App\Filament\Admin\Resources\GGRGamesResource\Pages;

use App\Filament\Admin\Resources\GGRGamesResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListGGRGames extends ListRecords
{
    protected static string $resource = GGRGamesResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
