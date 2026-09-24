<?php

namespace App\Filament\Admin\Resources\AffiliateInfoResource\Pages;

use App\Filament\Admin\Resources\AffiliateInfoResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditAffiliateInfo extends EditRecord
{
    protected static string $resource = AffiliateInfoResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
