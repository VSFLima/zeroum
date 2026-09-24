<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Resources\BannerResource\Pages;
use App\Filament\Resources\BannerResource\RelationManagers;
use App\Models\Banner;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Notifications\Notification;
use App\Models\AproveSaveSetting;
use Illuminate\Support\Facades\Hash;
use Filament\Forms\Components\TextInput;

class BannerResource extends Resource
{
    protected static ?string $model = Banner::class;

    protected static ?string $navigationIcon = 'heroicon-o-computer-desktop';

    /**
     * @dev @anonymous
     * @return bool
     */
    public static function canAccess(): bool
    {
        return auth()->user()->hasRole('admin');
    }

    /**
     * @param Form $form
     * @return Form
     */
    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make()
                    ->description('')
                    ->schema([
                        Forms\Components\Group::make()->schema([
                            Forms\Components\Group::make()
                                ->schema([
                                    Forms\Components\TextInput::make('link')
                                        ->label('Link')
                                        ->placeholder('Digite o link do banner')
                                        ->maxLength(191),
                                    Forms\Components\Select::make('type')
                                        ->label('Selecione o tipo')
                                        ->options([
                                            'carousel' => 'Banner na Carousel',
                                            'home' => 'Banner na Home',
                                        ])
                                        ->required(),
                                ])->columns(2)->columnSpanFull(),

                            Forms\Components\Textarea::make('description')
                                ->placeholder('Digite uma descrição')
                                ->maxLength(65535)
                                ->columnSpanFull(),
                        ])->columns(2),
                        Forms\Components\FileUpload::make('image')
                            ->image()
                            ->required(),
                        //   Forms\Components\FileUpload::make('mobile_image')
                        //  ->image()
                        //  ->required()
                    ]),
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

    /**
     * @param Table $table
     * @return Table
     */
    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                //Tables\Columns\ImageColumn::make('mobile_image')
                //   ->label('Mobile_image'),
                Tables\Columns\ImageColumn::make('image')
                    ->label('Imagem'),
                Tables\Columns\TextColumn::make('link')
                    ->label('Link')
                    ->searchable(),
                Tables\Columns\TextColumn::make('type')
                    ->label('Tipo')
                    ->searchable(),
                Tables\Columns\TextColumn::make('created_at')
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

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => \App\Filament\Admin\Resources\BannerResource\Pages\ListBanners::route('/'),
            'create' => \App\Filament\Admin\Resources\BannerResource\Pages\CreateBanner::route('/create'),
            'edit' => \App\Filament\Admin\Resources\BannerResource\Pages\EditBanner::route('/{record}/edit'),
        ];
    }
}
