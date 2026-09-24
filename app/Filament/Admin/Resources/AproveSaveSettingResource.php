<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Admin\Resources\AproveSaveSettingResource\Pages;
use App\Filament\Admin\Resources\AproveSaveSettingResource\RelationManagers;
use App\Models\AproveSaveSetting;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class AproveSaveSettingResource extends Resource
{
    protected static ?string $model = AproveSaveSetting::class;

    protected static ?string $navigationIcon = 'heroicon-o-lock-closed';

    protected static ?string $navigationLabel = 'Senha de confirmação para salvar';

    protected static ?string $modelLabel = 'Senha de confirmação para salvar';

    protected static ?string $slug = 'password-save-settings';

    public static function canAccess(): bool
    {
        return auth()->user()->hasRole('admin');
    }


    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('current_password')
                    ->password()
                    ->required()
                    ->label('Current Password'),
                Forms\Components\TextInput::make('new_password')
                    ->password()
                    ->required()
                    ->label('New Password')
                    ->rules(['confirmed', 'min:8']),
                Forms\Components\TextInput::make('new_password_confirmation')
                    ->password()
                    ->required()
                    ->label('Confirm New Password'),
            ]);
    }


    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('id')
                    ->label('ID')
                    ->sortable()
                    ->searchable(),

                Tables\Columns\TextColumn::make('approval_password_save')
                    ->label('Approval Save Settings')
                    ->formatStateUsing(fn($state) => 'Sua senha de confirmação de novas configurações!')
                    ->sortable()
                    ->searchable()
                    ->description('Este campo exibe uma mensagem padrão em vez do valor real.')
            ])
            ->filters([
                // Filtros podem ser adicionados aqui, se necessário
            ])
            ->actions([
                Tables\Actions\EditAction::make(), // Ativa a ação de edição
            ])
            ->bulkActions([
                // Ações em massa podem ser adicionadas aqui, se necessário
                Tables\Actions\BulkActionGroup::make([
                    // Tables\Actions\DeleteBulkAction::make(),
                ]),
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
            'index' => Pages\ListAproveSaveSetting::route('/'),
            //'create' => Pages\CreateAproveSaveSetting::route('/create'),
            'edit' => Pages\EditAproveSaveSetting::route('/{record}/edit'),
        ];
    }
}
