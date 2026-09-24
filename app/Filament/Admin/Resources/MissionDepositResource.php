<?php

namespace App\Filament\Admin\Resources;

use App\Filament\admin\Resources\MissionDepositResource\Pages;
use App\Models\MissionDeposit;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Notifications\Notification;
use App\Models\AproveSaveSetting;
use Illuminate\Support\Facades\Hash;
use Filament\Forms\Components\TextInput;

class MissionDepositResource extends Resource
{
    protected static ?string $model = MissionDeposit::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-group';

    protected static ?string $navigationLabel = 'Missões de deposito';

    protected static ?string $modelLabel = 'Missões de deposito';

    protected static ?string $slug = 'centro-missoes-deposito';

    public static function canAccess(): bool
    {
        return auth()->user()->hasRole('admin');
    }

   public static function form(Form $form): Form
{
    return $form
        ->schema([
            // Primeira seção do formulário
            Forms\Components\Section::make('Informações da Missão')
                ->schema([
                    Forms\Components\TextInput::make('name_mission')
                        ->required()
                        ->label('Mission Name'),
                    //Forms\Components\Textarea::make('description')
                    //->required()
                    //->label('Description'),
                    Forms\Components\TextInput::make('bonus_amount')
                        ->required()
                        ->numeric()
                        ->label('Bonus Amount'),
                    Forms\Components\TextInput::make('deposit_acumulated_necessario')
                        ->required()
                        ->numeric()
                        ->label('Required Accumulated Deposit'),
                    Forms\Components\DateTimePicker::make('created_at')
                        ->label('Created At')
                        ->disabled(),
                    Forms\Components\DateTimePicker::make('updated_at')
                        ->label('Updated At')
                        ->disabled(),
                ])->columns(2), // Defina a quantidade de colunas conforme necessário

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
                Tables\Columns\TextColumn::make('name_mission')
                    ->label('Mission Name')
                    ->sortable()
                    ->searchable(),
                //Tables\Columns\TextColumn::make('description')
                // ->label('Description')
                // ->limit(50)
                // ->wrap(),
                Tables\Columns\TextColumn::make('bonus_amount')
                    ->label('Bonus Amount')
                    ->sortable(),
                Tables\Columns\TextColumn::make('deposit_acumulated_necessario')
                    ->label('Required Accumulated Deposit')
                    ->sortable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Created At')
                    ->sortable(),
                Tables\Columns\TextColumn::make('updated_at')
                    ->label('Updated At')
                    ->sortable(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make()
                    ->modalHeading('Confirme a exclusão')
                    ->modalSubheading('Por favor, insira sua senha para confirmar a exclusão.')
                    ->modalButton('Excluir')
                    ->form([
                        TextInput::make('approval_password_delete')
                            ->password()
                            ->required()
                            ->label('Senha de Aprovação')
                            ->helperText('Digite a senha de aprovação para confirmar a exclusão.')
                    ])
                    ->action(function ($record, array $data) {
                        // Verificação da senha
                        $approvalSettings = AproveSaveSetting::first();
                        $inputPassword = $data['approval_password_delete'] ?? '';

                        if (!Hash::check($inputPassword, $approvalSettings->approval_password_save)) {
                            Notification::make()
                                ->title('Erro de Autenticação')
                                ->body('Senha incorreta. Por favor, tente novamente.')
                                ->danger()
                                ->send();
                            return;
                        }

                        // Executa a exclusão se a senha estiver correta
                        $record->delete();

                        Notification::make()
                            ->title('Registro Excluído')
                            ->body('O registro foi excluído com sucesso.')
                            ->success()
                            ->send();
                    }),
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

    public static function getPages(): array
    {
        return [
            'index' => \App\Filament\Admin\Resources\MissionDepositResource\Pages\ListMissionDeposits::route('/'),
            'create' => \App\Filament\Admin\Resources\MissionDepositResource\Pages\CreateMissionDeposit::route('/create'),
            'edit' => \App\Filament\Admin\Resources\MissionDepositResource\Pages\EditMissionDeposit::route('/{record}/edit'),
        ];
    }
}
