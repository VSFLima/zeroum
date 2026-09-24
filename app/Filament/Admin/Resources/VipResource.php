<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Resources\VipResource\Pages;
use App\Filament\Resources\VipResource\RelationManagers;
use App\Models\Vip;
use Filament\Forms;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Notifications\Notification;
use App\Models\AproveSaveSetting;
use Illuminate\Support\Facades\Hash;
use Filament\Forms\Components\TextInput;

class VipResource extends Resource
{
    protected static ?string $model = Vip::class;

    protected static ?string $navigationIcon = 'heroicon-o-trophy';

    protected static ?string $navigationLabel = 'Vip';

    protected static ?string $modelLabel = 'Vip';

    protected static ?string $slug = 'vip';

    /**
     * @dev @anonymous
     * @return bool
     */
    public static function canAccess(): bool
    {
        return auth()->user()->hasRole('admin');
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Vip')
                    ->description('Cadastre sua lista vip de bonus')
                    ->schema([
                        FileUpload::make('bet_symbol')
                            ->label('Símbolo')
                            ->placeholder('Carregue um Símbolo')
                            ->image()
                            ->columnSpanFull(),
                        Forms\Components\TextInput::make('bet_level')
                            ->label('Level')
                            ->required()
                            //->readOnly(fn (string $context): bool => $context === 'create')
                            ->placeholder('Mantenha a lista numérica na ordem')
                        //                            ->default(function() {
//                                $ultimoRegistro = Vip::latest()->first();
//                                return $ultimoRegistro ? $ultimoRegistro->id + 1 : 1;
//                            })
                        ,
                        Forms\Components\TextInput::make('bet_required')
                            ->label('Aposta necessária')
                            ->required()
                            ->placeholder('Digite aposta necessária para ganhar o prêmio')
                            ->numeric(),
                        Forms\Components\Select::make('bet_period')
                            ->label('Período')
                            ->options([
                                'weekly' => 'Semanal',
                                'monthly' => 'Mensal',
                                'yearly' => 'Anual',
                            ]),
                        Forms\Components\TextInput::make('bet_bonus')
                            ->label('Bônus')
                            ->placeholder('Digite o total de bônus')
                            ->required()
                            ->numeric(),
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
                Tables\Columns\ImageColumn::make('bet_symbol')
                    ->label('Imagem'),
                Tables\Columns\TextColumn::make('bet_level')
                    ->label('Level')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('bet_required')
                    ->label('Aposta necessária')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('bet_period')
                    ->label('Período')
                    ->searchable(),
                Tables\Columns\TextColumn::make('bet_bonus')
                    ->label('Bônus')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Data')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
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

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => \App\Filament\Admin\Resources\VipResource\Pages\ListVips::route('/'),
            'create' => \App\Filament\Admin\Resources\VipResource\Pages\CreateVip::route('/create'),
            'edit' => \App\Filament\Admin\Resources\VipResource\Pages\EditVip::route('/{record}/edit'),
        ];
    }
}
