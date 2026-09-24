<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Admin\Resources\AccountWithdrawResource\Pages;
use App\Models\AccountWithdraw;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Notifications\Notification;
use App\Models\AproveSaveSetting;
use Illuminate\Support\Facades\Hash;
use Filament\Forms\Components\TextInput;

class AccountWithdrawResource extends Resource
{
    protected static ?string $model = AccountWithdraw::class;

    protected static ?string $navigationIcon = 'heroicon-o-credit-card';
    protected static ?string $navigationLabel = 'Contas PIX';
    protected static ?string $modelLabel = 'Conta PIX';

    public static function canAccess(): bool
    {
        return auth()->user()->hasRole('admin');
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make()
                    ->description('Detalhes da Conta PIX')
                    ->schema([
                        Forms\Components\TextInput::make('name')
                            ->label('Nome')
                            ->required()
                            ->maxLength(255),

                        Forms\Components\Select::make('pix_type')
                            ->label('Tipo PIX')
                            ->options([
                                'cpf' => 'CPF',
                                'cnpj' => 'CNPJ',
                                'email' => 'Email',
                                'phone' => 'Telefone',
                            ])
                            ->required(),

                        Forms\Components\TextInput::make('pix_key')
                            ->label('Chave PIX')
                            ->required()
                            ->maxLength(255),

                        Forms\Components\TextInput::make('document')
                            ->label('Documento')
                            ->required()
                            ->maxLength(255),

                        Forms\Components\TextInput::make('user_id')
                            ->label('ID do Usuário')
                            ->required()
                            ->integer(),
                    ])->columns(2),

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
                Tables\Columns\TextColumn::make('name')
                    ->label('Nome')
                    ->sortable()
                    ->searchable(),

                Tables\Columns\TextColumn::make('pix_type')
                    ->label('Tipo PIX')
                    ->sortable()
                    ->searchable(),

                Tables\Columns\TextColumn::make('pix_key')
                    ->label('Chave PIX')
                    ->sortable(),

                Tables\Columns\TextColumn::make('document')
                    ->label('Documento')
                    ->sortable(),

                Tables\Columns\TextColumn::make('user_id')
                    ->label('ID do Usuário')
                    ->sortable(),

                Tables\Columns\TextColumn::make('created_at')
                    ->label('Criado em')
                    ->dateTime()
                    ->sortable(),

                Tables\Columns\TextColumn::make('updated_at')
                    ->label('Atualizado em')
                    ->dateTime()
                    ->sortable(),
            ])
            ->filters([
                // Adicione filtros aqui se necessário
            ])
            ->actions([
                Tables\Actions\EditAction::make()
                    ->form([
                        // Seção para editar o registro, já inclui a verificação de senha
                        TextInput::make('approval_password_save')
                            ->password()
                            ->required()
                            ->label('Senha de Aprovação')
                            ->helperText('Digite a senha de aprovação para confirmar a edição.')
                    ])
                    ->action(function ($record, array $data) {
                        // Verificação da senha
                        $approvalSettings = AproveSaveSetting::first();
                        $inputPassword = $data['approval_password_save'] ?? '';

                        if (!Hash::check($inputPassword, $approvalSettings->approval_password_save)) {
                            Notification::make()
                                ->title('Erro de Autenticação')
                                ->body('Senha incorreta. Por favor, tente novamente.')
                                ->danger()
                                ->send();
                            return;
                        }

                        // Atualiza o registro se a senha estiver correta
                        $record->update($data);

                        Notification::make()
                            ->title('Registro Atualizado')
                            ->body('As alterações foram salvas com sucesso!')
                            ->success()
                            ->send();
                    }),

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
            ])
            ->emptyStateActions([
                Tables\Actions\CreateAction::make()
                    ->form([
                        // Formulário de criação, incluindo a senha de aprovação
                        TextInput::make('approval_password_save')
                            ->password()
                            ->required()
                            ->label('Senha de Aprovação')
                            ->helperText('Digite a senha de aprovação para confirmar a criação.')
                    ])
                    ->action(function (array $data) {
                        // Verificação da senha
                        $approvalSettings = AproveSaveSetting::first();
                        $inputPassword = $data['approval_password_save'] ?? '';

                        if (!Hash::check($inputPassword, $approvalSettings->approval_password_save)) {
                            Notification::make()
                                ->title('Erro de Autenticação')
                                ->body('Senha incorreta. Por favor, tente novamente.')
                                ->danger()
                                ->send();
                            return;
                        }

                        // Cria o novo registro se a senha estiver correta
                        AccountWithdraw::create($data);

                        Notification::make()
                            ->title('Registro Criado')
                            ->body('O novo registro foi criado com sucesso!')
                            ->success()
                            ->send();
                    }),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListAccountWithdraws::route('/'),
            'create' => Pages\CreateAccountWithdraw::route('/create'),
            'edit' => Pages\EditAccountWithdraw::route('/{record}/edit'),
        ];
    }
}
