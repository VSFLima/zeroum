<?php

namespace App\Filament\Admin\Resources\AccountWithdrawResource\Pages;

use App\Filament\Admin\Resources\AccountWithdrawResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;
use Filament\Notifications\Notification;
use App\Models\AproveSaveSetting;
use Illuminate\Support\Facades\Hash;
use Filament\Forms\Components\TextInput;

class EditAccountWithdraw extends EditRecord
{
    protected static string $resource = AccountWithdrawResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make()
                ->modalHeading('Confirme a exclusão')
                ->modalSubheading('Por favor, insira sua senha para confirmar a exclusão.')
                ->modalButton('Excluir')
                ->form([
                    TextInput::make('approval_password_delete')
                        ->password()
                        ->required()
                        ->label('Senha de Aprovação')
                        ->helperText('Digite a senha de aprovação para confirmar a exclusão.')
                ])
                ->action(function (array $data) {
                    $approvalSettings = AproveSaveSetting::first();
                    $inputPassword = $data['approval_password_delete'] ?? '';

                    if (!Hash::check($inputPassword, $approvalSettings->approval_password_save)) {
                        Notification::make()
                            ->title('Erro de Autenticação')
                            ->body('Senha incorreta. Por favor, tente novamente.')
                            ->danger()
                            ->send();
                        return;
                    }

                    $this->record->delete();

                    Notification::make()
                        ->title('Registro Excluído')
                        ->body('O registro foi excluído com sucesso.')
                        ->success()
                        ->send();
                }),
        ];
    }

    

    protected function beforeSave(): void
    {
        // Verificação de senha antes de salvar
        $approvalSettings = AproveSaveSetting::first();
        $inputPassword = $this->data['approval_password_save'] ?? ''; // Captura o campo de senha

        if (!Hash::check($inputPassword, $approvalSettings->approval_password_save)) {
            Notification::make()
                ->title('Erro de Autenticação')
                ->body('Senha incorreta. Por favor, tente novamente.')
                ->danger()
                ->send();

            // Interrompe o processo de salvamento
            $this->halt();
        }
    }
}
