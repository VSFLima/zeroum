<?php

namespace App\Filament\Admin\Resources\MusicResource\Pages;

use App\Filament\Admin\Resources\MusicResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;
use Filament\Notifications\Notification;
use App\Models\AproveSaveSetting;
use Illuminate\Support\Facades\Hash;
use Filament\Forms\Components\TextInput; // Aqui está o namespace correto para TextInput

class EditMusic extends EditRecord
{
    protected static string $resource = MusicResource::class;

    /**
     * @return array|Actions\Action[]|Actions\ActionGroup[]
     */
    protected function getHeaderActions(): array
    {
        return env('APP_DEMO') ? [] : [
            Actions\DeleteAction::make()
                ->modalHeading('Confirme a exclusão')
                ->modalSubheading('Por favor, insira sua senha para confirmar a exclusão.')
                ->modalButton('Excluir')
                ->form([
                    TextInput::make('approval_password_delete') // Usando o TextInput correto
                        ->password()
                        ->required()
                        ->label('Senha de Aprovação')
                        ->helperText('Digite a senha de aprovação para confirmar a exclusão.')
                ])
                ->action(function (array $data) {
                    // Verificação da senha
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

                    // Executa a exclusão se a senha estiver correta
                    $this->record->delete();

                    Notification::make()
                        ->title('Registro Excluído')
                        ->body('O registro foi excluído com sucesso.')
                        ->success()
                        ->send();

                    // Redireciona após a exclusão
        
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

