<?php

namespace App\Filament\Admin\Resources\SenhaSaqueResource\Pages;

use App\Filament\Admin\Resources\SenhaSaqueResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditSenhaSaque extends EditRecord
{
    protected static string $resource = SenhaSaqueResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
