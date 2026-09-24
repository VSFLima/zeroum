<?php

namespace App\Filament\Admin\Resources\AproveWithdrawalResource\Pages;

use App\Filament\Admin\Resources\AproveWithdrawalResource;
use App\Models\AproveWithdrawal;
use Filament\Pages\Actions;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;

class EditAproveWithdrawal extends EditRecord
{
    protected static string $resource = AproveWithdrawalResource::class;

    protected function mutateFormDataBeforeSave(array $data): array
    {
        $record = $this->record;

        if (!Hash::check($data['current_password'], $record->approval_password)) {
            throw ValidationException::withMessages([
                'current_password' => 'The current password is incorrect.',
            ]);
        }

        // Hash the new password if it's set
        if (!empty($data['new_password'])) {
            $data['approval_password'] = $data['new_password'];
        }

        return $data;
    }
}
