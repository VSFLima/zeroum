<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Admin\Resources\PlataEventosResource\Pages;
use App\Models\EventosPlata;
use Filament\Forms;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Forms\Components\RichEditor;
use Filament\Forms\Components\Textarea;
use Filament\Notifications\Notification;
use App\Models\AproveSaveSetting;
use Illuminate\Support\Facades\Hash;
use Filament\Forms\Components\TextInput;

class PlataEventosResource extends Resource
{
    protected static ?string $model = EventosPlata::class;

    protected static ?string $navigationIcon = 'heroicon-o-calendar-days';
    protected static ?string $navigationLabel = 'Eventos';
    protected static ?string $modelLabel = 'Eventos';
    protected static ?string $slug = 'eventos-informativos';

    public static function canAccess(): bool
    {
        return auth()->user()->hasRole('admin');
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Evento')
                    ->description('Cadastre seus eventos')
                    ->schema([
                        FileUpload::make('image')
                            ->label('Imagem')
                            ->placeholder('Carregue uma imagem')
                            ->image(),
                        Textarea::make('caminho')
                            ->label('Caminho')
                            ->placeholder('Digite a página do evento'),
                        RichEditor::make('descricao')
                            ->label('Descrição')
                            ->columnSpanFull()
                            ->placeholder('Adicione aqui a descrição do evento!')
                            ->extraAttributes([
                                'data-tinymce-config' => json_encode([
                                    'plugins' => 'lists code', // Inclua apenas os plugins necessários
                                    'toolbar' => 'bold italic underline strikethrough blockquote code numlist bullist', // Exclua os botões de link e imagem
                                ]),
                            ]),
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
                Tables\Columns\ImageColumn::make('image')
                    ->label('Imagem'),
                Tables\Columns\TextColumn::make('descricao')
                    ->label('Descrição')
                    ->limit(50)
                    ->sortable()
                    ->tooltip(fn($record) => $record->descricao), // Exibe a descrição completa como um tooltip
                Tables\Columns\TextColumn::make('caminho')
                    ->label('Caminho')
                    ->limit(50)
                    ->sortable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Criado em')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->label('Atualizado em')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\ViewAction::make(),
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


            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListPlataEventos::route('/'),
            'create' => Pages\CreatePlataEventos::route('/create'),
            'edit' => Pages\EditPlataEventos::route('/{record}/edit'),
        ];
    }
}
