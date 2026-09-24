<?php

namespace App\Filament\Affiliate\Widgets;

use Filament\Tables;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget as BaseWidget;

class MeusIndicadinhos extends BaseWidget
{
    protected static ?string $heading = 'meus indicados';

    protected static ?int $navigationSort = -1;

    protected int|string|array $columnSpan = 'full';

    /**
     * @param Table $table
     * @return Table
     */
    public function table(Table $table): Table
    {


    }

    /**
     * @return bool
     */
    public static function canView(): bool
    {
        return auth()->user()->hasRole('afiliado');
    }
}
