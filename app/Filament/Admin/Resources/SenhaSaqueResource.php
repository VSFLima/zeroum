<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Admin\Resources\SenhaSaqueResource\Pages;
use App\Models\SenSaque;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Notifications\Notification;
use App\Models\AproveSaveSetting;
use Illuminate\Support\Facades\Hash;
use Filament\Forms\Components\TextInput;

class SenhaSaqueResource extends Resource
{
    protected static ?string $model = SenSaque::class;

    protected static ?string $navigationIcon = 'heroicon-o-key'; // Ícone para o recurso na navegação
    protected static ?string $navigationLabel = 'Senhas de Saques Usuarios'; // Rótulo na navegação
    protected static ?string $modelLabel = 'Senha de Saque Usuarios'; // Rótulo para o modelo
    protected static ?string $slug = 'senha-saques'; // Slug para a URL

    public static function canAccess(): bool
    {
        // Permissão para acesso (ajuste conforme necessário)
        return auth()->user()->hasRole('admin');
    }

    public static function form(Form $form): Form
    {
        // A página de visualização não permite edição, apenas exibição dos detalhes
        return $form
            ->schema([
                Forms\Components\TextInput::make('user_id')
                    ->label('User ID')
                    ->disabled(),
                //Forms\Components\TextInput::make('valid_saque')
                //  ->label('Senha')
                //  ->disabled(),
                Forms\Components\DateTimePicker::make('created_at')
                    ->label('Criado em')
                    ->disabled(),
                Forms\Components\DateTimePicker::make('updated_at')
                    ->label('Atualizado em')
                    ->disabled(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('user_id')
                    ->label('User ID'),
                //Tables\Columns\TextColumn::make('valid_saque')
                //   ->label('Senha'),
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Criado em')
                    ->dateTime(),
                Tables\Columns\TextColumn::make('updated_at')
                    ->label('Atualizado em')
                    ->dateTime(),
            ])
            ->filters([])
            ->actions([
                //Tables\Actions\EditAction::make(), // Se preferir, pode remover isso se não quiser editar
                Tables\Actions\ViewAction::make(), // Para visualização
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make()
                    ->modalHeading('Confirme a exclusão em massa')
                    ->modalSubheading('Por favor, insira sua senha para confirmar a exclusão em massa.')
                    ->modalButton('Excluir Selecionados')
                    ->form([
                        TextInput::make('approval_password_bulk_delete')
                            ->password()
                            ->required()
                            ->label('Senha de Aprovação')
                            ->helperText('Digite a senha de aprovação para confirmar a exclusão em massa.')
                    ])
                    ->action(function ($records, array $data) {
                        // Verificação da senha
                        $approvalSettings = AproveSaveSetting::first();
                        $inputPassword = $data['approval_password_bulk_delete'] ?? '';

                        if (!Hash::check($inputPassword, $approvalSettings->approval_password_save)) {
                            Notification::make()
                                ->title('Erro de Autenticação')
                                ->body('Senha incorreta. Por favor, tente novamente.')
                                ->danger()
                                ->send();
                            return;
                        }

                        // Exclui os registros selecionados se a senha estiver correta
                        foreach ($records as $record) {
                            $record->delete();
                        }

                        Notification::make()
                            ->title('Registros Excluídos')
                            ->body('Os registros selecionados foram excluídos com sucesso.')
                            ->success()
                            ->send();
                    }),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListSenhaSaques::route('/'),

            //'create' => Pages\CreateSenhaSaque::route('/create'),
            //'edit' => Pages\EditSenhaSaque::route('/{record}/edit'),

        ];
    }
}
