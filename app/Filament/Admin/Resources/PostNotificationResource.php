<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Admin\Resources\PostNotificationResource\Pages;
use App\Models\PostNotification;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Notifications\Notification;
use App\Models\AproveSaveSetting;
use Illuminate\Support\Facades\Hash;
use Filament\Forms\Components\TextInput;


class PostNotificationResource extends Resource
{
    protected static ?string $model = PostNotification::class;

    protected static ?string $navigationIcon = 'heroicon-o-bell';
    protected static ?string $navigationLabel = 'Notificações';
    protected static ?string $modelLabel = 'Notificação';

    public static function canAccess(): bool
    {
        return auth()->user()->hasRole('admin');
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make()
                    ->description('Detalhes da Notificação')
                    ->schema([
                        Forms\Components\TextInput::make('titulo')
                            ->label('Titulo da mensagem')
                            ->required()
                            ->maxLength(255),
                        Forms\Components\Textarea::make('message')  // Alterado para Textarea
                            ->label('Mensagem')
                            ->required()
                            ->maxLength(255),
                        Forms\Components\FileUpload::make('imagem')
                            ->label('Imagem')
                            ->placeholder('Carregue uma imagem')
                            ->image()
                            ->acceptedFileTypes(['image/png', 'image/jpeg', 'image/jpg', 'image/gif'])  // Aceitar tipos de imagem
                            ->maxSize(5 * 1024) // Máximo de 5 MB, ajuste conforme necessário
                        ,
                        Forms\Components\DateTimePicker::make('created_at')
                            ->label('Data de Criação')
                            ->required(),
                    ])->columns(2),
                // Seção separada para a senha de aprovação
                Forms\Components\Section::make('Senha de confirmação de Alterações')
                    ->description('Digite sua senha de aprovação para confirmar as mudanças.')
                    ->schema([
                        Forms\Components\TextInput::make('approval_password_save')
                            ->label('Senha de Aprovação')
                            ->password()
                            ->required()
                            ->helperText('Digite a senha para salvar as alterações.')
                            ->maxLength(191),
                    ])->columns(2),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('titulo')
                    ->label('Titulo da mensagem'),
                Tables\Columns\TextColumn::make('message')
                    ->label('Mensagem'),
                Tables\Columns\ImageColumn::make('imagem')
                    ->label('Imagem')
                    ->limit(50)
                    ->sortable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Criado em')
                    ->dateTime(),
            ])
            ->filters([
                // Adicione filtros aqui se necessário
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make()
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
                    ->action(function ($record, array $data) {
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
                        $record->delete();

                        Notification::make()
                            ->title('Registro Excluído')
                            ->body('O registro foi excluído com sucesso.')
                            ->success()
                            ->send();
                    }),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
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
                ]),
            ])

            ->emptyStateActions([
                Tables\Actions\CreateAction::make(),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListPostNotifications::route('/'),
            'create' => Pages\CreatePostNotification::route('/create'),
            'edit' => Pages\EditPostNotification::route('/{record}/edit'),
        ];
    }
}
