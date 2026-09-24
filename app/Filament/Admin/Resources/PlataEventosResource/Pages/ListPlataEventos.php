<?php

namespace App\Filament\Admin\Resources\PlataEventosResource\Pages;

use App\Filament\Admin\Resources\PlataEventosResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListPlataEventos extends ListRecords
{
    protected static string $resource = PlataEventosResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
