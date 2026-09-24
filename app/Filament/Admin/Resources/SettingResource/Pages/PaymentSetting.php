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

class PaymentSetting extends Page implements HasForms
{
    use HasPageSidebar, InteractsWithForms;

    protected static string $resource = SettingResource::class;

    protected static string $view = 'filament.resources.setting-resource.pages.payment-setting';

    /**
     * @return string|Htmlable
     */
    public function getTitle(): string|Htmlable
    {
        return __('Pagamentos');
    }

    public Setting $record;
    public ?array $data = [];

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
     * @dev anonymous - Meu instagram
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

                redirect(route('filament.admin.resources.settings.payment', ['record' => $this->record->id]));

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
                Section::make('Ajuste de Taxas')
                    ->description('Formulário ajustar as taxas da plataforma')
                    ->schema([
                        TextInput::make('min_deposit')
                            ->label('Min Deposito')
                            ->numeric()
                            ->maxLength(191),
                        TextInput::make('max_deposit')
                            ->label('Max Deposito')
                            ->numeric()
                            ->maxLength(191),
                        TextInput::make('min_withdrawal')
                            ->label('Min Saque')
                            ->numeric()
                            ->maxLength(191),
                        TextInput::make('max_withdrawal')
                            ->label('Max Saque')
                            ->numeric()
                            ->maxLength(191),
                        TextInput::make('initial_bonus')
                            ->label('Bônus Inicial (%)')
                            ->numeric()
                            ->suffix('%')
                            ->maxLength(191),
                        TextInput::make('currency_code')
                            ->label('Moeda')
                            ->maxLength(191),
                        //                        Select::make('decimal_format')->options([
//                            'dot' => 'Dot',
//                        ]),
//                        Select::make('currency_position')->options([
//                            'left' => 'Left',
//                            'right' => 'Right',
//                        ]),

                        Group::make()
                            ->label('Porcentagem de Sub-Afiliados')
                            ->schema([
                                TextInput::make('perc_sub_lv1')
                                    ->label('% Sub afiliado LV1')
                                    ->numeric()
                                    ->maxLength(191),
                                TextInput::make('perc_sub_lv2')
                                    ->label('% Sub afiliado LV2')
                                    ->numeric()
                                    ->maxLength(191),
                                //TextInput::make('perc_sub_lv3')
                                //    ->label('% Sub afiliado LV3')
                                //    ->numeric()
                                //    ->maxLength(191),
                            ])->columnSpanFull()->columns(3),
                        //    Toggle::make('disable_spin')
                        //       ->label('Disable Spin')
                        //  ,
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
