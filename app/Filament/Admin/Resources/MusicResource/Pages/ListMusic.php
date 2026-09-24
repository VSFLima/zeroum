<?php

namespace App\Filament\Admin\Resources\MusicResource\Pages;

use App\Filament\Admin\Resources\MusicResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListMusic extends ListRecords
{
    protected static string $resource = MusicResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
