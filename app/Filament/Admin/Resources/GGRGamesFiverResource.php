<?php

namespace App\Filament\Admin\Resources;

use App\Models\GGRGamesFiver;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;

class GGRGamesFiverResource extends Resource
{
    protected static ?string $model = GGRGamesFiver::class;

    protected static ?string $navigationIcon = 'heroicon-o-clipboard-document-list';

          protected static ?string $navigationLabel = 'Histórico Fivers';

    protected static ?string $modelLabel = 'Histórico Fivers';
    protected static ?string $slug = 'historico-de-partidas-fivers';

    public static function form(Form $form): Form
    {
        return $form->schema([
            Forms\Components\TextInput::make('user_id')->required(),
            Forms\Components\TextInput::make('provider')->required(),
            Forms\Components\TextInput::make('game')->required(),
            Forms\Components\TextInput::make('balance_bet')->required(),
            Forms\Components\TextInput::make('balance_win')->required(), // substitua pelos campos corretos
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
            'index' => \App\Filament\Admin\Resources\GGRGamesFiverResource\Pages\ListGGRGamesFivers::route('/'),
            'create' => \App\Filament\Admin\Resources\GGRGamesFiverResource\Pages\CreateGGRGamesFiver::route('/create'),
            'edit' => \App\Filament\Admin\Resources\GGRGamesFiverResource\Pages\EditGGRGamesFiver::route('/{record}/edit'),
        ];
    }
}
