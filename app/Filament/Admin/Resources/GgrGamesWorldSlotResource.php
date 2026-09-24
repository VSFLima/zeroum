<?php

namespace App\Filament\Admin\Resources;

use App\Models\GgrGamesWorldSlot;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;

class GgrGamesWorldSlotResource extends Resource
{
    protected static ?string $model = GgrGamesWorldSlot::class;

    protected static ?string $navigationIcon = 'heroicon-o-clipboard-document-list';
          protected static ?string $navigationLabel = 'Histórico WordSlots';

    protected static ?string $modelLabel = 'Histórico WordSlots';
    protected static ?string $slug = 'historico-de-partidas-world';

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
            'index' => \App\Filament\Admin\Resources\GgrGamesWorldSlotResource\Pages\ListGgrGamesWorldSlots::route('/'),
            'create' => \App\Filament\Admin\Resources\GgrGamesWorldSlotResource\Pages\CreateGgrGamesWorldSlot::route('/create'),
            'edit' => \App\Filament\Admin\Resources\GgrGamesWorldSlotResource\Pages\EditGgrGamesWorldSlot::route('/{record}/edit'),
        ];
    }
}
