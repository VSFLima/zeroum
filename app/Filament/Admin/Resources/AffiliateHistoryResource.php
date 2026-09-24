<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Admin\Resources\AffiliateHistoryResource\Pages;
use App\Models\AffiliateHistory;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Forms\Form;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Filters\Filter;
use Carbon\Carbon;
use Filament\Tables\Columns\BadgeColumn;

class AffiliateHistoryResource extends Resource
{
    protected static ?string $model = AffiliateHistory::class;

    protected static ?string $navigationIcon = 'heroicon-o-arrow-trending-up';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                // Campos de formulário, se necessário
            ]);
    }
    public static function canAccess(): bool
    {
        // Permissão para acesso (ajuste conforme necessário)
        return auth()->user()->hasRole('admin');
    }

    public static function table(Tables\Table $table): Tables\Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('user.name')->label('Nome do usuario'),
                Tables\Columns\TextColumn::make('inviterUser.name')->label('Nome do Referenciador'),
                //Tables\Columns\TextColumn::make('commission')->label('Commission'),
                Tables\Columns\TextColumn::make('commission_type')
                ->label('Tipo de comissão')
                ->badge()
                ->color(fn ($record) => $record->commission_type === 'cpa' ? 'primary' : 'success'),

               // Coluna de status com lógica de cores
                BadgeColumn::make('status')
                    ->label('Status')
                    ->badge()
                    ->color(fn ($record) => $record->status === 'pendente' ? 'danger' : 'success'), // Lógica de cor para o status

                // Coluna de comissões com lógica de cores
                BadgeColumn::make('commission_paid')
                    ->label('Comissões')
                    ->badge()
                    ->color(fn ($record) => $record->commission_paid > 0 ? 'success' : 'danger'), // Lógica de cor
                
                Tables\Columns\TextColumn::make('created_at')->label('Created At')->dateTime(),
            ])
            ->filters([
                // Filtro por status
                SelectFilter::make('status')
                    ->options([
                        '0' => 'Pendente',
                        '1' => 'Pago',
                         // Mudei de 'Pending' para 'Pendente' se necessário
                    ])
                    ->label('Status'),

                // Filtro por tipo de comissão
                SelectFilter::make('commission_type')
                    ->options([
                        'CPA' => 'CPA',
                        'Revshare' => 'Revshare',
                    ])
                    ->label('Commission Type'),

                // Filtro por data de criação (últimos 30 dias)
                Filter::make('created_last_30_days')
                    ->label('Created in Last 30 Days')
                    ->query(fn ($query) => $query->where('created_at', '>=', Carbon::now()->subDays(30))),
            ])
            ->actions([
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ])
            ->searchable();
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListAffiliateHistories::route('/'),
            'create' => Pages\CreateAffiliateHistory::route('/create'),
            //'edit' => Pages\EditAffiliateHistory::route('/{record}/edit'),
        ];
    }
}
