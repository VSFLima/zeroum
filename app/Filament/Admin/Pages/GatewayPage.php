<?php

namespace App\Filament\Admin\Pages;

use App\Models\Gateway;
use App\Models\AproveSaveSetting; // Importação do modelo para verificação de senha
use Filament\Forms\Components\Section;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Pages\Page;
use Filament\Support\Exceptions\Halt;
use Illuminate\Support\Facades\Hash; // Importação para verificação da senha
use Jackiedo\DotenvEditor\Facades\DotenvEditor;
use Illuminate\Support\HtmlString;

class GatewayPage extends Page
{
    use InteractsWithForms;

    protected static ?string $navigationIcon = 'heroicon-o-document-text';

    protected static string $view = 'filament.pages.gateway-page';

    public ?array $data = [];
    public Gateway $setting;

    public static function canAccess(): bool
    {
        return auth()->user()->hasRole('admin');
    }

    public function mount(): void
    {
        $gateway = Gateway::first();
        if (!empty($gateway)) {
            $this->setting = $gateway;
            $this->form->fill($this->setting->toArray());
        } else {
            $this->form->fill();
        }
    }

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('knucklespay')
                    ->description(new HtmlString('<div style="display: flex; align-items: center;">Precisa de uma conta Knucklespay? Registre-se agora mesmo aprovação instantânea sem verificação de documentos:
                            <a class="dark:text-white" style="font-size: 14px;font-weight: 600;width: 127px;display: flex;background-color: #00b54d;padding: 10px;border-radius: 11px;justify-content: center;margin-left: 10px;" href="https://https://www.knucklespay.space/" target="_blank">Dashboard</a>
                        </div>'))
                    ->schema([
                        TextInput::make('suitpay_uri')
                            ->label('Client URI')
                            ->placeholder('Digite a URL da API')
                            ->maxLength(191)
                            ->columnSpanFull(),
                        TextInput::make('suitpay_cliente_id')
                            ->label('Client ID')
                            ->placeholder('Digite o Client ID')
                            ->maxLength(191)
                            ->columnSpanFull(),
                        TextInput::make('suitpay_cliente_secret')
                            ->label('Client Secret')
                            ->placeholder('Digite o Client Secret')
                            ->maxLength(191)
                            ->columnSpanFull(),
                        TextInput::make('callback_url')
                            ->label('Callback URL')
                            ->placeholder('Digite a URL de callback')
                            ->maxLength(191)
                            ->columnSpanFull(),
                    ]),
                Section::make('Digite a senha de confirmação')
                    ->description('Obrigatório digitar sua senha de confirmação!')
                    ->schema([
                        TextInput::make('approval_password_save')
                            ->label('Senha de Aprovação')
                            ->password()
                            ->required()
                            ->helperText('Digite a senha para salvar as alterações.')
                            ->maxLength(191),
                    ])->columns(2),
            ])
            ->statePath('data');
    }

    public function submit(): void
    {
        try {
            if (env('APP_DEMO')) {
                Notification::make()
                    ->title('Atenção')
                    ->body('Você não pode realizar esta alteração na versão demo')
                    ->danger()
                    ->send();
                return;
            }

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

            $setting = Gateway::first();
            if (!empty($setting)) {
                $setting->callback_url = $this->data['callback_url'] ?? $setting->callback_url;
                $setting->bspay_uri = $this->data['bspay_uri'] ?? $setting->bspay_uri;
                $setting->bspay_cliente_id = $this->data['bspay_cliente_id'] ?? $setting->bspay_cliente_id;
                $setting->bspay_cliente_secret = $this->data['bspay_cliente_secret'] ?? $setting->bspay_cliente_secret;
                $setting->suitpay_uri = $this->data['suitpay_uri'] ?? $setting->suitpay_uri;
                $setting->suitpay_cliente_id = $this->data['suitpay_cliente_id'] ?? $setting->suitpay_cliente_id;
                $setting->suitpay_cliente_secret = $this->data['suitpay_cliente_secret'] ?? $setting->suitpay_cliente_secret;

                $setting->save();

                Notification::make()
                    ->title('Chaves Alteradas')
                    ->body('Suas chaves foram alteradas com sucesso!')
                    ->success()
                    ->send();
            } else {
                Gateway::create($this->data);

                Notification::make()
                    ->title('Chaves Criadas')
                    ->body('Suas chaves foram criadas com sucesso!')
                    ->success()
                    ->send();
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
