<?php

namespace App\Filament\Admin\Resources\SettingResource\Pages;

use App\Filament\Admin\Resources\SettingResource;
use App\Models\Setting;
use App\Models\AproveSaveSetting;
use AymanAlhattami\FilamentPageWithSidebar\Traits\HasPageSidebar;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Contracts\HasForms;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\Page;
use Filament\Support\Exceptions\Halt;
use Filament\Forms\Components\Modal;
use Illuminate\Contracts\Support\Htmlable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Hash;

class AffiliatePage extends Page implements HasForms
{
    use HasPageSidebar, InteractsWithForms;

    protected static string $resource = SettingResource::class;

    protected static string $view = 'filament.resources.setting-resource.pages.affiliate-page';

    public function getTitle(): string|Htmlable
    {
        return __('Configurações Afiliados');
    }

    public Setting $record;
    public ?array $data = [];

    public static function canView(Model $record): bool
    {
        return auth()->user()->hasRole('admin');
    }

    public function mount(): void
    {
        $setting = Setting::first();
        $this->record = $setting;
        $this->form->fill($setting->toArray());
    }

    public function save()
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

            $setting = Setting::find($this->record->id);

            if ($setting->update($this->data)) {
                Cache::put('setting', $setting);

                Notification::make()
                    ->title('Dados alterados')
                    ->body('Dados alterados com sucesso!')
                    ->success()
                    ->send();

                redirect(route('filament.admin.resources.settings.affiliate', ['record' => $this->record->id]));
            }
        } catch (Halt $exception) {
            return;
        }
    }

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Ajuste de Baús')
                    ->description('Ajuste conforme o necessário. O sistema já realiza a soma dos baús para você')
                    ->schema([
                        TextInput::make('cirus_baseline')
                            ->label('Baseline BÁU')
                            ->numeric()
                            ->suffix('R$')
                            ->helperText('Valor que a pessoa precisa depositar para que o afiliado ganhe.')
                            ->maxLength(191),
                        TextInput::make('cirus_aposta')
                            ->label('Aposta Totais')
                            ->numeric()
                            ->suffix('R$')
                            ->helperText('Quantia que a pessoa vai precisar jogar para que o afiliado ganhe.')
                            ->maxLength(191),
                        TextInput::make('cirus_valor')
                            ->label('Valor por BÁU')
                            ->numeric()
                            ->suffix('R$')
                            ->helperText('Quantia que a pessoa vai ganhar por baú para cada pessoa indicada.')
                            ->maxLength(191),
                    ])->columns(3),
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
                    ])->columns(3)
            ])
            ->statePath('data');
    }
}
