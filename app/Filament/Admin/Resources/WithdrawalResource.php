<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Resources\WithdrawalResource\Pages;
use App\Filament\Resources\WithdrawalResource\RelationManagers;
use App\Models\User;
use App\Models\Withdrawal;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Forms\Components\TextInput;
use Filament\Notifications\Notification;
use Filament\Tables;
use Filament\Tables\Actions\Action;
use Filament\Tables\Table;
use App\Models\AproveWithdrawal;
use App\Models\AproveSaveSetting;
use Illuminate\Support\Facades\Hash;

class WithdrawalResource extends Resource
{
    protected static ?string $model = Withdrawal::class;

    protected static ?string $navigationIcon = 'heroicon-o-arrow-up-tray';

    protected static ?string $navigationLabel = 'Saques de usuários';

    protected static ?string $modelLabel = 'Saques de usuários';

    protected static ?string $navigationGroup = 'Administração';

    protected static ?string $slug = 'todos-saques-historico';

    protected static ?int $navigationSort = 3;

    public static function canAccess(): bool
    {
        return auth()->user()->hasRole('admin');
    }

    public static function getGloballySearchableAttributes(): array
    {
        return ['type', 'bank_info', 'user.name', 'user.last_name', 'user.cpf', 'user.phone', 'user.email'];
    }

    public static function getNavigationBadge(): ?string
    {
        return static::getModel()::where('status', 0)->count();
    }

    public static function getNavigationBadgeColor(): string|array|null
    {
        return static::getModel()::where('status', 0)->count() > 5 ? 'success' : 'warning';
    }

    public static function form(Form $form): Form
    {
        return $form->schema([
            Forms\Components\Section::make('Cadastro de Saques')
                ->schema([
                    Forms\Components\Select::make('user_id')
                        ->label('Usuários')
                        ->placeholder('Selecione um usuário')
                        ->relationship(name: 'user', titleAttribute: 'name')
                        ->options(
                            fn($get) => User::query()
                                ->pluck('name', 'id')
                        )
                        ->searchable()
                        ->preload()
                        ->live()
                        ->required(),
                    Forms\Components\TextInput::make('amount')
                        ->label('Valor')
                        ->required()
                        ->default(0.00),
                    Forms\Components\TextInput::make('type')
                        ->label('Tipo')
                        ->required()
                        ->maxLength(191),
                    Forms\Components\FileUpload::make('proof')
                        ->label('Comprovante')
                        ->placeholder('Carregue a imagem do comprovante')
                        ->image()
                        ->columnSpanFull()
                        ->required(),
                    Forms\Components\Toggle::make('status')
                        ->required(),
                    // Seção separada para a senha de aprovação
                    Forms\Components\Section::make('Senha de confirmação de Alterações')
                        ->description('Digite sua senha de aprovação para confirmar as mudanças. OBS: SE FOR CRIAR UM DEPOSITO PODE DIGITAR QUALQUER COISA! USE APENAS PARA EXCLUSAO E EDICAO!')
                        ->schema([
                            Forms\Components\TextInput::make('approval_password_save')
                                ->label('Senha de Aprovação')
                                ->password()
                                ->required()
                                ->helperText('Digite a senha para salvar as alterações.')
                                ->maxLength(191),
                        ])->columns(2),
                ])
        ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->defaultSort('created_at', 'desc')
            ->columns([
                Tables\Columns\TextColumn::make('user.name')
                    ->label('Nome')
                    ->searchable(['users.name', 'users.last_name'])
                    ->sortable(),
                Tables\Columns\TextColumn::make('amount')
                    ->label('Valor')
                    ->formatStateUsing(fn(Withdrawal $record): string => $record->symbol . ' ' . $record->amount)
                    ->sortable(),
                Tables\Columns\TextColumn::make('pix_type')
                    ->label('Tipo')
                    ->formatStateUsing(fn(string $state): string => \Helper::formatPixType($state))
                    ->searchable(),
                Tables\Columns\TextColumn::make('pix_key')
                    ->label('Chave Pix'),
                Tables\Columns\IconColumn::make('status')
                    ->boolean(),
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Data')
                    ->dateTime()
                    ->sortable(),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->actions([
                Action::make('deny_payment')
                    ->label('Cancelar')
                    ->icon('heroicon-o-banknotes')
                    ->color('danger')
                    ->visible(fn(Withdrawal $withdrawal): bool => !$withdrawal->status)
                    ->action(function (Withdrawal $withdrawal) {
                        \Filament\Notifications\Notification::make()
                            ->title('Cancelar Saque')
                            ->success()
                            ->persistent()
                            ->body('Você está cancelando o saque de ' . \Helper::amountFormatDecimal($withdrawal->amount))
                            ->actions([
                                \Filament\Notifications\Actions\Action::make('view')
                                    ->label('Confirmar')
                                    ->button()
                                    ->url(route(\Helper::GetDefaultGateway() . '.cancelwithdrawal', ['id' => $withdrawal->id, 'action' => 'user']))
                                    ->close(),
                                \Filament\Notifications\Actions\Action::make('undo')
                                    ->color('gray')
                                    ->label('Cancelar')
                                    ->action(function (Withdrawal $withdrawal) {
                                        // Lógica para cancelar se necessário
                                    })
                                    ->close(),
                            ])
                            ->send();
                    }),

                Action::make('approve_payment')
                    ->label('Fazer pagamento')
                    ->icon('heroicon-o-banknotes')
                    ->color('success')
                    ->visible(fn(Withdrawal $withdrawal): bool => !$withdrawal->status)
                    ->form([
                        Forms\Components\TextInput::make('password')
                            ->label('Digite a senha de aprovação DE SAQUES')
                            ->password()
                            ->required(),
                    ])
                    ->action(function (Withdrawal $withdrawal, array $data) {
                        $withdrawalPassword = \DB::table('aprove_withdrawals')->value('approval_password');

                        // Verifique se a senha está correta
                        if (Hash::check($data['password'], $withdrawalPassword)) {
                            \Filament\Notifications\Notification::make()
                                ->title('Saque Aprovado')
                                ->success()
                                ->persistent()
                                ->body('Você está solicitando um saque de ' . \Helper::amountFormatDecimal($withdrawal->amount))
                                ->actions([
                                    \Filament\Notifications\Actions\Action::make('view')
                                        ->label('Confirmar')
                                        ->button()
                                        ->url(route('suitpay.withdrawal', ['id' => $withdrawal->id, 'action' => 'user'])) // ← CORRIGIDO
                                        ->close(),
                                    \Filament\Notifications\Actions\Action::make('undo')
                                        ->color('gray')
                                        ->label('Cancelar')
                                        ->action(function (Withdrawal $withdrawal) {
                                            // Lógica para cancelar se necessário
                                        })
                                        ->close(),
                                ])
                                ->send();
                        } else {
                            \Filament\Notifications\Notification::make()
                                ->title('Senha Incorreta')
                                ->danger()
                                ->body('A senha de aprovação está incorreta. O saque não foi aprovado.')
                                ->send();
                        }
                    }),

                Tables\Actions\EditAction::make()
                    ->form([
                        Forms\Components\TextInput::make('approval_password_save')
                            ->label('Senha de Aprovação')
                            ->password()
                            ->required()
                            ->helperText('Digite a senha para confirmar a edição.'),
                    ])
                    ->action(function (Withdrawal $withdrawal, array $data) {
                        $withdrawalPassword = \DB::table('aprove_withdrawals')->value('approval_password');

                        // Verifique se a senha está correta
                        if (!Hash::check($data['approval_password_save'], $withdrawalPassword)) {
                            Notification::make()
                                ->title('Senha Incorreta')
                                ->danger()
                                ->body('A senha de aprovação está incorreta. As alterações não foram salvas.')
                                ->send();
                            return;
                        }

                        // Caso a senha esteja correta, salve as alterações
                        $withdrawal->update($data);

                        Notification::make()
                            ->title('Alterações Salvas')
                            ->success()
                            ->body('As alterações foram salvas com sucesso.')
                            ->send();
                    }),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    // Ação de exclusão em massa com confirmação de senha
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
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index' => \App\Filament\Admin\Resources\WithdrawalResource\Pages\ListWithdrawals::route('/'),
            'create' => \App\Filament\Admin\Resources\WithdrawalResource\Pages\CreateWithdrawal::route('/create'),
            'edit' => \App\Filament\Admin\Resources\WithdrawalResource\Pages\EditWithdrawal::route('/{record}/edit'),
        ];
    }
}