<?php

namespace App\Filament\Admin\Resources\PostNotificationResource\Pages;

use App\Filament\Admin\Resources\PostNotificationResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListPostNotifications extends ListRecords
{
    protected static string $resource = PostNotificationResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
