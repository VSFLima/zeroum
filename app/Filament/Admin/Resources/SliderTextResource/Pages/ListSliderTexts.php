<?php

namespace App\Filament\Admin\Resources\SliderTextResource\Pages;

use App\Filament\Admin\Resources\SliderTextResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListSliderTexts extends ListRecords
{
    protected static string $resource = SliderTextResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
