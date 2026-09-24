<?php

namespace App\Filament\Admin\Pages;

use App\Models\SettingMail;
use App\Models\AproveSaveSetting;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Pages\Page;
use Filament\Support\Exceptions\Halt;
use Illuminate\Support\Facades\Hash;
use Jackiedo\DotenvEditor\Facades\DotenvEditor;

class SettingMailPage extends Page
{
    use InteractsWithForms;

    protected static ?string $navigationIcon = 'heroicon-o-at-symbol';

    protected static string $view = 'filament.pages.setting-mail-page';

    public ?array $data = [];
    public SettingMail $setting;

    /**
     * @dev @anonymous
     * @return bool
     */
    public static function canAccess(): bool
    {
        return auth()->user()->hasRole('admin');
    }

    /**
     * @return void
     */
    public function mount(): void
    {
        $smtp = SettingMail::first();
        if (!empty($smtp)) {
            $this->setting = $smtp;
            $this->form->fill($this->setting->toArray());
        } else {
            $this->form->fill();
        }
    }

    /**
     * @param Form $form
     * @return Form
     */
    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('SMTP')
                    ->description('Ajustes de credenciais para a SMTP')
                    ->schema([
                        TextInput::make('software_smtp_type')
                            ->label('Mailer')
                            ->placeholder('Digite o mailer (smtp)')
                            ->maxLength(191),
                        TextInput::make('software_smtp_mail_host')
                            ->label('Host')
                            ->placeholder('Digite seu mail host')
                            ->maxLength(191),
                        TextInput::make('software_smtp_mail_port')
                            ->label('Porta')
                            ->placeholder('Digite a porta')
                            ->maxLength(191),
                        TextInput::make('software_smtp_mail_username')
                            ->label('Usuário')
                            ->placeholder('Digite o usuário')
                            ->maxLength(191),
                        TextInput::make('software_smtp_mail_password')
                            ->label('Senha')
                            ->placeholder('Digite a senha')
                            ->maxLength(191),
                        TextInput::make('software_smtp_mail_encryption')
                            ->label('Encryption')
                            ->placeholder('Digite a criptografia')
                            ->maxLength(191),
                        TextInput::make('software_smtp_mail_from_address')
                            ->label('E-mail Cabeçalho')
                            ->placeholder('Digite o endereço de E-mail de Cabeçalho')
                            ->maxLength(191),
                        TextInput::make('software_smtp_mail_from_name')
                            ->label('Nome Cabeçalho')
                            ->placeholder('Digite o nome de Cabeçalho')
                            ->maxLength(191)
                    ])->columns(4),
                Section::make('Digite a senha de confirmação')
                    ->description('Obrigatório digitar sua senha de confirmação!')
                    ->schema([
                        // Campo de senha
                        TextInput::make('approval_password_save')
                            ->label('Senha de Aprovação')
                            ->password()
                            ->required()
                            ->helperText('Digite a senha para salvar as alterações.')
                            ->maxLength(191),
                    ])->columns(4),
            ])
            ->statePath('data');
    }

    /**
     * @return void
     */
    public function submit(): void
    {
        try {
            if (env('APP_DEMO')) {
                Notification::make()
                    ->title('Atenção')
                    ->body('Você não pode realizar está alteração na versão demo')
                    ->danger()
                    ->send();
                return;
            }

            // Verificação da senha
            $approvalSettings = AproveSaveSetting::first();
            $inputPassword = $this->data['approval_password_save'] ?? '';

            if (!Hash::check($inputPassword, $approvalSettings->approval_password_save)) {
                Notification::make()
                    ->title('Erro de Autenticação')
                    ->body('Senha incorreta. Por favor, tente novamente.')
                    ->danger()
                    ->send();
                return;
            }

            $setting = SettingMail::first();
            if (!empty($setting)) {
                if (!empty($this->data['software_smtp_type'])) {
                    $envs = DotenvEditor::load(base_path('.env'));

                    $envs->setKeys([
                        'MAIL_MAILER' => $this->data['software_smtp_type'],
                        'MAIL_HOST' => $this->data['software_smtp_mail_host'],
                        'MAIL_PORT' => $this->data['software_smtp_mail_port'],
                        'MAIL_USERNAME' => $this->data['software_smtp_mail_username'],
                        'MAIL_PASSWORD' => $this->data['software_smtp_mail_password'],
                        'MAIL_ENCRYPTION' => $this->data['software_smtp_mail_encryption'],
                        'MAIL_FROM_ADDRESS' => $this->data['software_smtp_mail_from_address'],
                        'MAIL_FROM_NAME' => $this->data['software_smtp_mail_from_name'],
                    ]);

                    $envs->save();
                }

                if ($setting->update($this->data)) {
                    Notification::make()
                        ->title('Configurações Alteradas')
                        ->body('As configurações de SMTP foram alteradas com sucesso!')
                        ->success()
                        ->send();
                }
            } else {
                if (SettingMail::create($this->data)) {
                    Notification::make()
                        ->title('Configurações Criadas')
                        ->body('As configurações de SMTP foram criadas com sucesso!')
                        ->success()
                        ->send();
                }
            }

        } catch (Halt $exception) {
            Notification::make()
                ->title('Erro ao alterar dados!')
                ->body('Erro ao alterar dados!')
                ->danger()
                ->send();
        }
    }
}
