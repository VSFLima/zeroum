<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Admin\Resources\AffiliateInfoResource\Pages;
use App\Filament\Admin\Resources\AffiliateInfoResource\RelationManagers;
use App\Models\User;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;

class AffiliateInfoResource extends Resource
{
    protected static ?string $model = User::class;

    protected static ?string $navigationIcon = 'heroicon-o-currency-dollar';
    protected static ?string $navigationLabel = 'Resultado dos Afiliados';
    protected static ?string $modelLabel = 'Resultado dos Afiliados';
    protected static ?string $slug = 'resultado-afiliados';

    public static function form(Form $form): Form
    {
        return $form->schema([
            // Adicione o esquema do formulário aqui se necessário
        ]);
    }
    public static function canAccess(): bool
    {
        // Permissão para acesso (ajuste conforme necessário)
        return auth()->user()->hasRole('admin');
    }

   public static function table(Table $table): Table
{
    return $table
        ->columns([
            Tables\Columns\BadgeColumn::make('influencer_mode')
                ->label('Modo Influencer')
                ->colors([
                    'success' => fn($state) => $state === 1, // Verde se for Influencer
                    'secondary' => fn($state) => $state === 0, // Cinza se não for Influencer
                ])
                ->formatStateUsing(fn($state) => $state === 1 ? 'Influencer' : 'Não Influencer'),

            Tables\Columns\TextColumn::make('name')
                ->label('Nome do Usuário')
                ->searchable(), // Ativando pesquisa apenas nesta coluna

            Tables\Columns\TextColumn::make('wallet.balance')
                ->label('Carteira do Usuário')
                ->badge()
                ->color(fn($record) => $record->wallet && $record->wallet->balance < 0.01 ? 'danger' : 'success')
                ->formatStateUsing(fn($record) => 'R$ ' . number_format($record->wallet ? $record->wallet->balance : 0, 2, ',', '.')),

            Tables\Columns\TextColumn::make('affiliates_count')
                ->label('Número de Amigos Convidados')
                ->badge()
                ->color(fn($record) => $record->affiliates()->count() < 1 ? 'warning' : 'success')
                ->formatStateUsing(fn($record) => $record->affiliates()->count()),

            Tables\Columns\TextColumn::make('totalDeposits')
                ->label('Total de Depósitos')
                ->badge()
                ->color('primary')
                ->formatStateUsing(fn($record) => 'R$ ' . number_format($record->totalDeposits, 2, ',', '.')),

            Tables\Columns\TextColumn::make('affiliateDepositCount')
                ->label('Número de Depósitos dos Afiliados')
                ->badge()
                ->color(fn($record) => $record->affiliateDepositCount > 0 ? 'success' : 'danger')
                ->formatStateUsing(fn($record) => $record->affiliateDepositCount),

            Tables\Columns\TextColumn::make('totalWithdrawals')
                ->label('Total de Saques')
                ->badge()
                ->color('danger')
                ->formatStateUsing(fn($record) => 'R$ ' . number_format($record->totalWithdrawals, 2, ',', '.')),

            Tables\Columns\TextColumn::make('balance')
                ->label('Ganhos Brutos da Casa')
                ->badge()
                ->color(fn($record) => ($record->totalDeposits - $record->totalWithdrawals) < 0.01 ? 'danger' : 'success')
                ->formatStateUsing(fn($record) => 'R$ ' . number_format($record->totalDeposits - $record->totalWithdrawals, 2, ',', '.')),
        ])
        ->filters([
            Tables\Filters\TernaryFilter::make('influencer_mode')
                ->label('Mostrar apenas Influenciadores')
                ->trueLabel('Influencers')
                ->falseLabel('Não Influencers')
                ->queries(
                    true: fn(Builder $query) => $query->where('influencer_mode', 1),
                    false: fn(Builder $query) => $query->where('influencer_mode', 0),
                    blank: fn(Builder $query) => $query
                ),
        ])
        ->bulkActions([
            Tables\Actions\BulkActionGroup::make([
                // Ações em massa, se necessário
            ]),
        ])
        ->defaultSort('name') // Ordenação padrão, se necessário
        ->searchable(); // Ativando pesquisa global, que será aplicada apenas às colunas que têm o método `searchable()` definido
}

    public static function getRelations(): array
    {
        return [
            // Adicione relações aqui se necessário
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListAffiliateInfos::route('/'),
        ];
    }
}
