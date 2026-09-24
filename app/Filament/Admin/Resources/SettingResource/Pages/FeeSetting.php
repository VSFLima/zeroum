<?php

namespace App\Filament\Admin\Resources\SettingResource\Pages;

use App\Filament\Admin\Resources\SettingResource;
use App\Models\Setting;
use AymanAlhattami\FilamentPageWithSidebar\Traits\HasPageSidebar;
use Filament\Forms\Components\Grid;
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

class FeeSetting extends Page implements HasForms
{
    use HasPageSidebar, InteractsWithForms;

    protected static string $resource = SettingResource::class;

    protected static string $view = 'filament.resources.setting-resource.pages.fee-setting';

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
        return __('Taxas');
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

                redirect(route('filament.admin.resources.settings.fee', ['record' => $this->record->id]));

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
                Section::make('Ajuste de Taxas, CPA e Bonus')
                    ->description('Formulário ajustar as taxas da plataforma')
                    ->schema([
                        Grid::make()->schema([
                            TextInput::make('cpa_baseline')
                                ->label('Deposito Min. CPA')
                                ->helperText('Valor mínimo que o indicado deve depositar para ganhar o CPA.')
                                ->numeric()
                                ->suffix('R$ ')
                                ->maxLength(191),
                            TextInput::make('cpa_value')
                                ->label('Afiliado CPA')
                                ->helperText('Valor da comissão CPA que ganhará por indicado.')
                                ->numeric()
                                ->suffix('R$ ')
                                ->maxLength(191),
                        ])->columns(2),

                        Grid::make()->schema([
                            TextInput::make('cpa_percentage_baseline')
                                ->label('Deposito Min. CPA (%)')
                                ->numeric()
                                ->suffix('R$')
                                ->helperText('Quanto é necessário depositar para ativar o CPA em %')
                                ->maxLength(191),
                            TextInput::make('cpa_percentage_n1')
                                ->label('% Afiliado Nível 1')
                                ->numeric()
                                ->suffix('%')
                                ->helperText('% afiliado N1 recebera dos depositos')
                                ->maxLength(191),
                            TextInput::make('cpa_percentage_n2')
                                ->label('% Afiliado Nível 2')
                                ->numeric()
                                ->suffix('%')
                                ->helperText('% afiliado N2 recebera dos depositos')
                                ->maxLength(191),
                        ])->columns(3),

                        Grid::make()->schema([        
                            TextInput::make('revshare_percentage')
                                ->label('RevShare (%)')
                                ->numeric()
                                ->suffix('%')
                                ->helperText('Este é o revshare padrão para cada usuário que se candidata a ser afiliado.')
                                ->maxLength(191),
                            TextInput::make('ngr_percent')
                                ->helperText('Esta taxa é deduzida dos ganhos do afiliado para plataforma.')
                                ->label('NGR (%)')
                                ->numeric()
                                ->suffix('%')
                                ->maxLength(191),                            
                        ])->columns(2),

                        Toggle::make('revshare_reverse')
                            ->inline(true)
                            ->label('Ativar RevShare Negativo')
                            ->helperText('Esta opção possibilita que o afiliado acumule saldos negativos decorrentes das perdas geradas pelos seus indicados。'),
                    ]),

                Section::make('Ajuste de saldo INICIAL')
                    ->description('Valor inicial')
                    ->schema([
                        Grid::make()->schema([
                            TextInput::make('saldo_ini')
                                ->label('Saldo inicial grátis no cadastro')
                                ->numeric()
                                ->suffix('R$ ')
                                ->maxLength(191),
                            TextInput::make('rollover_cadastro')
                                ->label('Rollover Bonus de cadastro')
                                ->numeric()
                                ->default(1)
                                ->suffix('x')
                                ->helperText('Coloque a quantidade de multiplicação do Deposito')
                                ->maxLength(191),
                            Toggle::make('disable_rollover_cadastro')
                                ->label('Desativar Rollover do cadastro')
                                ->helperText('Se tiver desmarcado é porque está ativo o Rollover de Cadastro')
                        ])->columns(2),
                        Grid::make()->schema([
                            TextInput::make('deposit_min_saque')
                                ->label('Defina um valor minimo de deposito para o usuario conseguir sacar')
                                ->numeric()
                                ->suffix('R$ ')
                                ->maxLength(191),
                            Toggle::make('disable_deposit_min')
                                ->label('Ativar o requisito de deposito para sacar')
                                ->helperText('Se tiver desmarcado é porque não está ativo a necessidade de depositar para sacar')
                        ])->columns(2),
                    ]),
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
