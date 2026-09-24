<?php

namespace App\Filament\Admin\Resources;

use App\Models\GGRGamesDrakon;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;

class GGRGamesDrakonResource extends Resource
{
    protected static ?string $model = GGRGamesDrakon::class;

    protected static ?string $navigationIcon = 'heroicon-o-clipboard-document-list';

        protected static ?string $navigationLabel = 'Histórico Drakon';

    protected static ?string $modelLabel = 'Histórico Drakon';
    protected static ?string $slug = 'historico-de-partidas-drakon';

    public static function form(Form $form): Form
    {
        return $form->schema([
            Forms\Components\TextInput::make('user_id')->required(),
            Forms\Components\TextInput::make('provider')->required(),
            Forms\Components\TextInput::make('game')->required(),
            Forms\Components\TextInput::make('balance_bet')->required(),
            Forms\Components\TextInput::make('balance_win')->required(),// substitua pelos campos corretos
        ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('user_id')->label('User ID'),
                Tables\Columns\TextColumn::make('provider')->label('Provider'),
                Tables\Columns\TextColumn::make('game')->label('Game'),
                Tables\Columns\TextColumn::make('balance_bet')->label('Balance Bet'),
                Tables\Columns\TextColumn::make('balance_win')->label('Balance Win'),
                Tables\Columns\TextColumn::make('created_at')->label('Created At'),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => \App\Filament\Admin\Resources\GGRGamesDrakonResource\Pages\ListGGRGamesDrakons::route('/'),
            'create' => \App\Filament\Admin\Resources\GGRGamesDrakonResource\Pages\CreateGGRGamesDrakon::route('/create'),
            'edit' => \App\Filament\Admin\Resources\GGRGamesDrakonResource\Pages\EditGGRGamesDrakon::route('/{record}/edit'),
        ];
    }
}
