<?php

namespace App\Filament\Admin\Resources\AproveSaveSettingResource\Pages;

use App\Filament\Admin\Resources\AproveSaveSettingResource;
use App\Models\AproveSaveSetting;
use Filament\Pages\Actions;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Validation\ValidationException;

class EditAproveSaveSetting extends EditRecord
{
    protected static string $resource = AproveSaveSettingResource::class;

    protected function mutateFormDataBeforeSave(array $data): array
    {
        $record = $this->record;

        // Verifica se a senha atual está correta usando password_verify
        if (!password_verify($data['current_password'], $record->approval_password_save)) {
            throw ValidationException::withMessages([
                'current_password' => 'The current password is incorrect.',
            ]);
        }

        // Criptografa a nova senha usando bcrypt se ela estiver definida
        if (!empty($data['new_password'])) {
            $data['approval_password_save'] = bcrypt($data['new_password']);
        }

        return $data;
    }
}
