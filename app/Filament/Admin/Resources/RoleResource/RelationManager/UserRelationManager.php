<?php

namespace App\Filament\Admin\Resources\RoleResource\RelationManager;

use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables\Actions\AttachAction;
use Filament\Tables\Actions\DetachAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class UserRelationManager extends RelationManager
{
    protected static string $relationship = 'users';

    protected static ?string $recordTitleAttribute = 'name';

    public function mount(): void
    {
        // Check if the user is an admin
        if (!Auth::user()->hasRole('admin')) {
            abort(403);
        }
    }

    /*
     * Support changing tab title in RelationManager.
     */
    public static function getTitle(Model $ownerRecord, string $pageClass): string
    {
        return __('filament-spatie-roles-permissions::filament-spatie.section.users') ?? (string) str(static::getRelationshipName())
            ->kebab()
            ->replace('-', ' ')
            ->headline();
    }

    protected static function getModelLabel(): string
    {
        return __('filament-spatie-roles-permissions::filament-spatie.section.users');
    }

    protected static function getPluralModelLabel(): string
    {
        return __('filament-spatie-roles-permissions::filament-spatie.section.users');
    }

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make(config('filament-spatie-roles-permissions.user_name_column'))
                    ->label(__('filament-spatie-roles-permissions::filament-spatie.field.name')),
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            // Support changing table heading by translations.
            ->heading(__('filament-spatie-roles-permissions::filament-spatie.section.users'))
            ->columns([
                TextColumn::make(config('filament-spatie-roles-permissions.user_name_column'))
                    ->label(__('filament-spatie-roles-permissions::filament-spatie.field.name'))
                    ->searchable(),
            ])
            ->filters([

            ])->headerActions([
                    AttachAction::make(),
                ])->actions([
                    DetachAction::make(),
                ])->bulkActions([
                    //
                ]);
    }
}
