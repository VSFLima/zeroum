<?php

namespace App\Filament\Admin\Resources\SettingResource\Pages;

use App\Filament\Admin\Resources\SettingResource;
use App\Models\Setting;
use AymanAlhattami\FilamentPageWithSidebar\Traits\HasPageSidebar;
use Filament\Forms\Components\Group;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Contracts\HasForms;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\Page;
use Filament\Support\Exceptions\Halt;
use Illuminate\Contracts\Support\Htmlable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Hash;
use App\Models\AproveSaveSetting;

class RolloverSetting extends Page implements HasForms
{
    use HasPageSidebar, InteractsWithForms;

    protected static string $resource = SettingResource::class;

    protected static string $view = 'filament.resources.setting-resource.pages.rollover-setting';

    /**
     * @dev @anonymous
     * @param Model $record
     * @return bool
     */
    public static function canView(Model $record): bool
    {
        return auth()->user()->hasRole('admin');
    }

    /**
     * @return string|Htmlable
     */
    public function getTitle(): string|Htmlable
    {
        return __('Rollover');
    }

    public Setting $record;
    public ?array $data = [];

    /**
     * @dev anonymous - Meu instagram
     * @return void
     */
    public function mount(): void
    {
        $setting = Setting::first();
        $this->record = $setting;
        $this->form->fill($setting->toArray());
    }

    /**
     * @return void
     */
    public function save()
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


            $setting = Setting::find($this->record->id);

            if ($setting->update($this->data)) {
                Cache::put('setting', $setting);

                Notification::make()
                    ->title('Dados alterados')
                    ->body('Dados alterados com sucesso!')
                    ->success()
                    ->send();

                redirect(route('filament.admin.resources.settings.rollover', ['record' => $this->record->id]));

            }
        } catch (Halt $exception) {
            return;
        }
    }

    /**
     * @dev anonymous - Meu instagram
     * @param Form $form
     * @return Form
     */
    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Ajuste de Bônus')
                    ->description('Formulário ajustar o Bônus plataforma')
                    ->schema([
                        TextInput::make('rollover_deposit')
                            ->label('Rollover Deposito')
                            ->numeric()
                            ->default(1)
                            ->suffix('x')
                            ->helperText('Coloque a quantidade de multiplicação do Deposito')
                            ->maxLength(191),
                        Group::make()->schema([
                            TextInput::make('rollover')
                                ->label('Rollover Bônus')
                                ->numeric()
                                ->default(1)
                                ->suffix('x')
                                ->helperText('Coloque a quantidade de multiplicação do Bônus')
                                ->maxLength(191),
                            TextInput::make('rollover_protection')
                                ->label('Proteção de Rollover para Bônus')
                                ->numeric()
                                ->default(1)
                                ->suffix('x')
                                ->helperText('Defina a quantidade de transações minimas para zerar o Rollover')
                                ->maxLength(191),
                        ])->columns(2),
                        Toggle::make('disable_rollover')
                            ->label('Desativar Rollover')
                            ->helperText('Se tiver desmarcado é porque está ativo o Rollover de Bônus e Deposito')
                    ])->columns(2),
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
