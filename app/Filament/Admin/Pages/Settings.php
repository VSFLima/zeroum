<?php

namespace App\Filament\Admin\Pages;

use App\Filament\Pages;
use App\Models\Setting;
use Filament\Forms\Components\Actions\Action;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Contracts\HasForms;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Pages\Page;
use Filament\Support\Exceptions\Halt;
use Illuminate\Support\Facades\Cache;
use Jackiedo\DotenvEditor\Facades\DotenvEditor;
use Livewire\Features\SupportFileUploads\TemporaryUploadedFile;


class Settings extends Page implements HasForms
{
    use InteractsWithForms;

    protected static ?string $navigationIcon = 'heroicon-o-cog-6-tooth';

    protected static string $view = 'filament.pages.settings';

    protected static ?string $navigationLabel = 'Configurações';

    protected static ?string $modelLabel = 'Configurações';

    protected static ?string $title = 'Configurações';

    protected static ?string $slug = 'configuracoes-pro';

    /**
     * @dev @anonymous
     * @return bool
     */
    public static function canAccess(): bool
    {
        return auth()->user()->hasRole('admin');
    }

    public ?array $data = [];
    public Setting $setting;

    /**
     * @dev anonymous - Meu instagram
     * @return void
     */
    public function mount(): void
    {
        $this->setting = Setting::first();
        $this->form->fill($this->setting->toArray());
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
                Section::make('Detalhes do Site')
                    ->schema([
                        TextInput::make('software_name')
                            ->label('Nome')
                            ->required()
                            ->maxLength(191),
                        TextInput::make('software_description')
                            ->label('Descrição')
                            ->maxLength(191),
                        TextInput::make('message_home_page')
                            ->label('Mensagem')
                            ->maxLength(191),
                    ])->columns(2),

                Section::make('Logos')
                    ->schema([
                        FileUpload::make('software_favicon')
                            ->label('Favicon')
                            ->placeholder('Carregue um favicon')
                            ->image(),
                        FileUpload::make('software_logo_white')
                            ->label('Logo Branca')
                            ->placeholder('Carregue uma logo branca')
                            ->image(),
                        FileUpload::make('software_logo_black')
                            ->label('Logo Escura')
                            ->placeholder('Carregue uma logo escura')
                            ->image(),
                        FileUpload::make('image_home_bottom')
                            ->label('Home')
                            ->placeholder('Carregue a imagem para o botão Home')
                            ->image(),
                        FileUpload::make('image_cassino_bottom')
                            ->label('Login & Registro')
                            ->placeholder('Carregue a imagem para o botão Cassino')
                            ->image(),
                        FileUpload::make('image_deposito_bottom')
                            ->label('Depósito')
                            ->placeholder('Carregue a imagem para o botão Depósito')
                            ->image(),
                        FileUpload::make('image_convidar_bottom')
                            ->label('Promoções')
                            ->placeholder('Carregue a imagem para o botão Convidar')
                            ->image(),
                        FileUpload::make('image_wallet_bottom')
                            ->label('Perfil')
                            ->placeholder('Carregue a imagem para o botão Wallet')
                            ->image(),
                        // FileUpload::make('image_cassino_sidebar')
                        //    ->label('Cassino')
                        //    ->placeholder('Carregue o ícone para Cassino')
                        //    ->image(),
                        FileUpload::make('image_favoritos_sidebar')
                            ->label('Favoritos')
                            ->placeholder('Carregue o ícone para Favoritos')
                            ->image(),
                        FileUpload::make('image_wallet_sidebar')
                            ->label('Wallet')
                            ->placeholder('Carregue o ícone para Wallet')
                            ->image(),
                        FileUpload::make('image_suporte_sidebar')
                            ->label('Suporte')
                            ->placeholder('Carregue o ícone para Suporte')
                            ->image(),
                        FileUpload::make('image_promotions_sidebar')
                            ->label('Promotions')
                            ->placeholder('Carregue o ícone para Promotions')
                            ->image(),
                        FileUpload::make('image_indique_sidebar')
                            ->label('Indique')
                            ->placeholder('Carregue o ícone para Indique')
                            ->image(),
                        FileUpload::make('icon_bt_8')
                            ->label('Agente na sidebar')
                            ->placeholder('Carregue o icone do agente')
                            ->image(),
                        //FileUpload::make('image_home_sidebar')
                        //     ->label('Home')
                        //     ->placeholder('Carregue o ícone para home sideBar')
                        //     ->image(),
                        //  FileUpload::make('image_user_nav')
                        //      ->label('User')
                        //      ->placeholder('Carregue o ícone para User')
                        //     ->image(),
                        FileUpload::make('image_menu_nav')
                            ->label('Menu')
                            ->placeholder('Carregue o ícone para menu')
                            ->image(),
                        FileUpload::make('icon_bt_1')
                            ->label('Icone do botão 1 do jackpot')
                            ->placeholder('Carregue a logo do icone 1')
                            ->image(),
                        FileUpload::make('icon_bt_2')
                            ->label('Icone do botão 2  do jackpot')
                            ->placeholder('Carregue a logo do icone 2')
                            ->image(),
                        FileUpload::make('icon_bt_3')
                            ->label('Icone do botão 3  do jackpot')
                            ->placeholder('Carregue a logo do icone 3')
                            ->image(),
                        FileUpload::make('icon_bt_4')
                            ->label('Icone do botão 4  do jackpot')
                            ->placeholder('Carregue a logo do icone 4')
                            ->image(),
                        FileUpload::make('icon_bt_5')
                            ->label('Icone do botão flutuante')
                            ->placeholder('Carregue a logo do icone 5')
                            ->image(),
                        FileUpload::make('icon_bt_6')
                            ->label('Icone do botão de login')
                            ->placeholder('Carregue a logo')
                            ->image(),
                        FileUpload::make('icon_bt_7')
                            ->label('Icone do botão de registro')
                            ->placeholder('Carregue a logo')
                            ->image(),
                        FileUpload::make('img_bg_1')
                            ->label('imagem de fundo')
                            ->placeholder('Carregue a imagem')
                            ->image(),
                        TextInput::make('name_bt_1')
                            ->label('Nome do botão 1')
                            ->maxLength(191),
                        TextInput::make('name_bt_2')
                            ->label('Nome do botão 2')
                            ->maxLength(191),
                        TextInput::make('name_bt_3')
                            ->label('Nome do botão 3')
                            ->maxLength(191),
                        TextInput::make('name_bt_4')
                            ->label('Nome do botão 4')
                            ->maxLength(191),
                        FileUpload::make('icon_wt_1')
                            ->label('Icone do botão do saldo')
                            ->placeholder('Carregue a logo do saldo')
                            ->image(),
                        FileUpload::make('icon_wt_2')
                            ->label('Icone do botão do depósito')
                            ->placeholder('Carregue a logo do depósito')
                            ->image(),
                        FileUpload::make('icon_wt_3')
                            ->label('Icone do botão do saque')
                            ->placeholder('Carregue a logo do saque')
                            ->image(),
                        FileUpload::make('icon_wt_4')
                            ->label('Icone do botão das transações')
                            ->placeholder('Carregue a logo das transações')
                            ->image(),
                        FileUpload::make('icon_wt_5')
                            ->label('Icone do botão de sair')
                            ->placeholder('Carregue a logo de sair')
                            ->image(),
                    ])->columns(3),

                Section::make('Background')
                    ->schema([
                        FileUpload::make('software_background')
                            ->label('Background')
                            ->placeholder('Carregue um background')
                            ->image()
                            ->columnSpanFull(),
                    ]),

                Section::make('Depositos e Saques')
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
                        TextInput::make('rollover')
                            ->label('Rollover')
                            ->numeric()
                            ->maxLength(191),
                    ])->columns(5),

                Section::make('Futebol')
                    ->description('Configurações de Futebol')
                    ->schema([
                        TextInput::make('soccer_percentage')
                            ->label('Futebol Comissão (%)')
                            ->numeric()
                            ->suffix('%')
                            ->maxLength(191),

                        Toggle::make('turn_on_football')
                            ->inline(false)
                            ->label('Ativar Futebol'),
                    ])->columns(2),

                Section::make('Taxas')
                    ->description('Configurações de Ganhos da Plataforma')
                    ->schema([
                        TextInput::make('revshare_percentage')
                            ->label('RevShare (%)')
                            ->numeric()
                            ->suffix('%')
                            ->maxLength(191),
                        Toggle::make('revshare_reverse')
                            ->inline(false)
                            ->label('Ativar RevShare Negativo')
                            ->helperText('Esta opção possibilita que o afiliado acumule saldos negativos decorrentes das perdas geradas pelos seus indicados.')
                        ,
                        TextInput::make('ngr_percent')
                            ->label('NGR (%)')
                            ->numeric()
                            ->suffix('%')
                            ->maxLength(191),
                    ])->columns(3),
                Section::make('Dados Gerais')
                    ->schema([
                        TextInput::make('initial_bonus')
                            ->label('Bônus Inicial (%)')
                            ->numeric()
                            ->suffix('%')
                            ->maxLength(191),
                        TextInput::make('currency_code')
                            ->label('Moeda')
                            ->maxLength(191),
                        Select::make('decimal_format')->options([
                            'dot' => 'Dot',
                        ]),
                        Select::make('currency_position')->options([
                            'left' => 'Left',
                            'right' => 'Right',
                        ]),
                        //  Toggle::make('disable_spin')
                        //     ->label('Disable Spin')
                        // ,
                        Toggle::make('suitpay_is_enable')
                            ->label('SuitPay Ativo')
                        ,
                        //Toggle::make('ezzebank_is_enable')
                        //    ->label('EzzeBank Ativo')
                        //,
                        // Toggle::make('stripe_is_enable')
                        //     ->label('Stripe Ativo')
                        // ,
                    ])->columns(4),
            ])
            ->statePath('data');
    }

    /**
     * @dev anonymous - Meu instagram
     * @param array $data
     * @return array
     */
    protected function mutateFormDataBeforeCreate(array $data): array
    {
        return $data;
    }

    /**
     *
     * @dev anonymous - Meu instagram
     * @return array
     */
    protected function getFormActions(): array
    {
        return [
            Action::make('save')
                ->label(__('Submit'))
                ->action(fn() => $this->submit())
                ->submit('submit')
            //->url(route('filament.admin.pages.dashboard'))
            ,
        ];
    }

    /**
     * @dev anonymous - Meu instagram
     * @param $array
     * @return mixed|void
     */
    private function uploadFile($array)
    {
        if (!empty($array) && is_array($array) || !empty($array) && is_object($array)) {
            foreach ($array as $k => $temporaryFile) {
                if ($temporaryFile instanceof TemporaryUploadedFile) {
                    $path = \Helper::upload($temporaryFile);
                    if ($path) {
                        return $path['path'];
                    }
                } else {
                    return $temporaryFile;
                }
            }
        }
    }


    /**
     * @dev anonymous - Meu instagram
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


            $setting = Setting::first();

            if (!empty($setting)) {

                $favicon = $this->data['software_favicon'];
                $logoWhite = $this->data['software_logo_white'];
                $logoBlack = $this->data['software_logo_black'];
                $softwareBackground = $this->data['software_background'];
                // $imageCassinoSidebar = $this->data['image_cassino_sidebar'];
                $imageFavoritosSidebar = $this->data['image_favoritos_sidebar'];
                $imageWalletSidebar = $this->data['image_wallet_sidebar'];
                $imageSuporteSidebar = $this->data['image_suporte_sidebar'];
                $imagePromotionsSidebar = $this->data['image_promotions_sidebar'];
                $imageIndiqueSidebar = $this->data['image_indique_sidebar'];
                // $imageHomeSidebar = $this->data['image_home_sidebar'];
                $imageHomeBottom = $this->data['image_home_bottom'];
                $imageCassinoBottom = $this->data['image_cassino_bottom'];
                $imageDepositoBottom = $this->data['image_deposito_bottom'];
                $imageConvidarBottom = $this->data['image_convidar_bottom'];
                $imageWalletBottom = $this->data['image_wallet_bottom'];
                //images botoes jackpot e suporte flutuante
                $iconbt1 = $this->data['icon_bt_1'];
                $iconbt2 = $this->data['icon_bt_2'];
                $iconbt3 = $this->data['icon_bt_3'];
                $iconbt4 = $this->data['icon_bt_4'];
                $iconbt5 = $this->data['icon_bt_5'];
                $iconbt8 = $this->data['icon_bt_8'];
                //background image
                $imgbg1 = $this->data['img_bg_1'];
                //images acessar e registro
                $iconbt6 = $this->data['icon_bt_6'];
                $iconbt7 = $this->data['icon_bt_7'];
                //navbarwallet image
                $iconwt1 = $this->data['icon_wt_1'];
                $iconwt2 = $this->data['icon_wt_2'];
                $iconwt3 = $this->data['icon_wt_3'];
                $iconwt4 = $this->data['icon_wt_4'];
                $iconwt5 = $this->data['icon_wt_5'];

                if (is_array($softwareBackground) || is_object($softwareBackground)) {
                    if (!empty($softwareBackground)) {
                        $this->data['software_background'] = $this->uploadFile($softwareBackground);
                    }
                }
                // Função para upload do IMG BG
                if (is_array($imgbg1) || is_object($imgbg1)) {
                    if (!empty($imgbg1)) {
                        $this->data['img_bg_1'] = $this->uploadFile($imgbg1);
                        if (is_array($this->data['img_bg_1'])) {
                            unset($this->data['img_bg_1']);
                        }
                    }
                }
                // Função para upload do botao 1 da navbar
                if (is_array($iconwt1) || is_object($iconwt1)) {
                    if (!empty($iconwt1)) {
                        $this->data['icon_wt_1'] = $this->uploadFile($iconwt1);
                        if (is_array($this->data['icon_wt_1'])) {
                            unset($this->data['icon_wt_1']);
                        }
                    }
                }
                // Função para upload do botao 2 da navbar
                if (is_array($iconwt2) || is_object($iconwt2)) {
                    if (!empty($iconwt2)) {
                        $this->data['icon_wt_2'] = $this->uploadFile($iconwt2);
                        if (is_array($this->data['icon_wt_2'])) {
                            unset($this->data['icon_wt_2']);
                        }
                    }
                }
                // Função para upload do botao 3 da navbar
                if (is_array($iconwt3) || is_object($iconwt3)) {
                    if (!empty($iconwt3)) {
                        $this->data['icon_wt_3'] = $this->uploadFile($iconwt3);
                        if (is_array($this->data['icon_wt_3'])) {
                            unset($this->data['icon_wt_3']);
                        }
                    }
                }
                // Função para upload do botao 4 da navbar
                if (is_array($iconwt4) || is_object($iconwt4)) {
                    if (!empty($iconwt4)) {
                        $this->data['icon_wt_4'] = $this->uploadFile($iconwt4);
                        if (is_array($this->data['icon_wt_4'])) {
                            unset($this->data['icon_wt_4']);
                        }
                    }
                }
                // Função para upload do botao 5 da navbar
                if (is_array($iconwt5) || is_object($iconwt5)) {
                    if (!empty($iconwt5)) {
                        $this->data['icon_wt_5'] = $this->uploadFile($iconwt5);
                        if (is_array($this->data['icon_wt_5'])) {
                            unset($this->data['icon_wt_5']);
                        }
                    }
                }
                // Função para upload do botao 1
                if (is_array($iconbt1) || is_object($iconbt1)) {
                    if (!empty($iconbt1)) {
                        $this->data['icon_bt_1'] = $this->uploadFile($iconbt1);
                        if (is_array($this->data['icon_bt_1'])) {
                            unset($this->data['icon_bt_1']);
                        }
                    }
                }
                // Função para upload do botao 2
                if (is_array($iconbt2) || is_object($iconbt2)) {
                    if (!empty($iconbt2)) {
                        $this->data['icon_bt_2'] = $this->uploadFile($iconbt2);
                        if (is_array($this->data['icon_bt_2'])) {
                            unset($this->data['icon_bt_2']);
                        }
                    }
                }
                // Função para upload do botao 3
                if (is_array($iconbt3) || is_object($iconbt3)) {
                    if (!empty($iconbt3)) {
                        $this->data['icon_bt_3'] = $this->uploadFile($iconbt3);
                        if (is_array($this->data['icon_bt_3'])) {
                            unset($this->data['icon_bt_3']);
                        }
                    }
                }
                // Função para upload do botao 4
                if (is_array($iconbt4) || is_object($iconbt4)) {
                    if (!empty($iconbt4)) {
                        $this->data['icon_bt_4'] = $this->uploadFile($iconbt4);
                        if (is_array($this->data['icon_bt_4'])) {
                            unset($this->data['icon_bt_4']);
                        }
                    }
                }
                // Função para upload do botao 5
                if (is_array($iconbt5) || is_object($iconbt5)) {
                    if (!empty($iconbt5)) {
                        $this->data['icon_bt_5'] = $this->uploadFile($iconbt5);
                        if (is_array($this->data['icon_bt_5'])) {
                            unset($this->data['icon_bt_5']);
                        }
                    }
                }
                // Função para upload do botao 6
                if (is_array($iconbt6) || is_object($iconbt6)) {
                    if (!empty($iconbt6)) {
                        $this->data['icon_bt_6'] = $this->uploadFile($iconbt6);
                        if (is_array($this->data['icon_bt_6'])) {
                            unset($this->data['icon_bt_6']);
                        }
                    }
                }
                // Função para upload do botao 7
                if (is_array($iconbt7) || is_object($iconbt7)) {
                    if (!empty($iconbt7)) {
                        $this->data['icon_bt_7'] = $this->uploadFile($iconbt7);
                        if (is_array($this->data['icon_bt_7'])) {
                            unset($this->data['icon_bt_7']);
                        }
                    }
                }
                // Função para upload do botao 8
                if (is_array($iconbt8) || is_object($iconbt8)) {
                    if (!empty($iconbt8)) {
                        $this->data['icon_bt_8'] = $this->uploadFile($iconbt8);
                        if (is_array($this->data['icon_bt_8'])) {
                            unset($this->data['icon_bt_8']);
                        }
                    }
                }

                // Função para upload de favicon
                if (is_array($favicon) || is_object($favicon)) {
                    if (!empty($favicon)) {
                        $this->data['software_favicon'] = $this->uploadFile($favicon);
                        if (is_array($this->data['software_favicon'])) {
                            unset($this->data['software_favicon']);
                        }
                    }
                }

                // Função para upload de logoWhite
                if (is_array($logoWhite) || is_object($logoWhite)) {
                    if (!empty($logoWhite)) {
                        $this->data['software_logo_white'] = $this->uploadFile($logoWhite);
                        if (is_array($this->data['software_logo_white'])) {
                            unset($this->data['software_logo_white']);
                        }
                    }
                }

                // Função para upload de logoBlack
                if (is_array($logoBlack) || is_object($logoBlack)) {
                    if (!empty($logoBlack)) {
                        $this->data['software_logo_black'] = $this->uploadFile($logoBlack);
                        if (is_array($this->data['software_logo_black'])) {
                            unset($this->data['software_logo_black']);
                        }
                    }
                }

                // Função para upload de softwareBackground
                if (is_array($softwareBackground) || is_object($softwareBackground)) {
                    if (!empty($softwareBackground)) {
                        $this->data['software_background'] = $this->uploadFile($softwareBackground);
                        if (is_array($this->data['software_background'])) {
                            unset($this->data['software_background']);
                        }
                    }
                }

                // Função para upload de imageCassinoSidebar
                // if (is_array($imageCassinoSidebar) || is_object($imageCassinoSidebar)) {
                //     if (!empty($imageCassinoSidebar)) {
                //         $this->data['image_cassino_sidebar'] = $this->uploadFile($imageCassinoSidebar);
                //         if (is_array($this->data['image_cassino_sidebar'])) {
                //             unset($this->data['image_cassino_sidebar']);
                //         }
                //     }
                //  }

                // Função para upload de imageFavoritosSidebar
                if (is_array($imageFavoritosSidebar) || is_object($imageFavoritosSidebar)) {
                    if (!empty($imageFavoritosSidebar)) {
                        $this->data['image_favoritos_sidebar'] = $this->uploadFile($imageFavoritosSidebar);
                        if (is_array($this->data['image_favoritos_sidebar'])) {
                            unset($this->data['image_favoritos_sidebar']);
                        }
                    }
                }

                // Função para upload de imageWalletSidebar
                if (is_array($imageWalletSidebar) || is_object($imageWalletSidebar)) {
                    if (!empty($imageWalletSidebar)) {
                        $this->data['image_wallet_sidebar'] = $this->uploadFile($imageWalletSidebar);
                        if (is_array($this->data['image_wallet_sidebar'])) {
                            unset($this->data['image_wallet_sidebar']);
                        }
                    }
                }

                // Função para upload de imageSuporteSidebar
                if (is_array($imageSuporteSidebar) || is_object($imageSuporteSidebar)) {
                    if (!empty($imageSuporteSidebar)) {
                        $this->data['image_suporte_sidebar'] = $this->uploadFile($imageSuporteSidebar);
                        if (is_array($this->data['image_suporte_sidebar'])) {
                            unset($this->data['image_suporte_sidebar']);
                        }
                    }
                }

                // Função para upload de imagePromotionsSidebar
                if (is_array($imagePromotionsSidebar) || is_object($imagePromotionsSidebar)) {
                    if (!empty($imagePromotionsSidebar)) {
                        $this->data['image_promotions_sidebar'] = $this->uploadFile($imagePromotionsSidebar);
                        if (is_array($this->data['image_promotions_sidebar'])) {
                            unset($this->data['image_promotions_sidebar']);
                        }
                    }
                }

                // Função para upload de imageIndiqueSidebar
                if (is_array($imageIndiqueSidebar) || is_object($imageIndiqueSidebar)) {
                    if (!empty($imageIndiqueSidebar)) {
                        $this->data['image_indique_sidebar'] = $this->uploadFile($imageIndiqueSidebar);
                        if (is_array($this->data['image_indique_sidebar'])) {
                            unset($this->data['image_indique_sidebar']);
                        }
                    }
                }

                // Função para upload de imageHomeSidebar
                // if (is_array($imageHomeSidebar) || is_object($imageHomeSidebar)) {
                //      if (!empty($imageHomeSidebar)) {
                //         $this->data['image_home_sidebar'] = $this->uploadFile($imageHomeSidebar);
                //         if (is_array($this->data['image_home_sidebar'])) {
                //             unset($this->data['image_home_sidebar']);
                //         }
                //     }
                // }

                // Função para upload de imageHomeBottom
                if (is_array($imageHomeBottom) || is_object($imageHomeBottom)) {
                    if (!empty($imageHomeBottom)) {
                        $this->data['image_home_bottom'] = $this->uploadFile($imageHomeBottom);
                        if (is_array($this->data['image_home_bottom'])) {
                            unset($this->data['image_home_bottom']);
                        }
                    }
                }

                // Função para upload de imageCassinoBottom
                if (is_array($imageCassinoBottom) || is_object($imageCassinoBottom)) {
                    if (!empty($imageCassinoBottom)) {
                        $this->data['image_cassino_bottom'] = $this->uploadFile($imageCassinoBottom);
                        if (is_array($this->data['image_cassino_bottom'])) {
                            unset($this->data['image_cassino_bottom']);
                        }
                    }
                }

                // Função para upload de imageDepositoBottom
                if (is_array($imageDepositoBottom) || is_object($imageDepositoBottom)) {
                    if (!empty($imageDepositoBottom)) {
                        $this->data['image_deposito_bottom'] = $this->uploadFile($imageDepositoBottom);
                        if (is_array($this->data['image_deposito_bottom'])) {
                            unset($this->data['image_deposito_bottom']);
                        }
                    }
                }

                // Função para upload de imageConvidarBottom
                if (is_array($imageConvidarBottom) || is_object($imageConvidarBottom)) {
                    if (!empty($imageConvidarBottom)) {
                        $this->data['image_convidar_bottom'] = $this->uploadFile($imageConvidarBottom);
                        if (is_array($this->data['image_convidar_bottom'])) {
                            unset($this->data['image_convidar_bottom']);
                        }
                    }
                }

                // Função para upload de imageWalletBottom
                if (is_array($imageWalletBottom) || is_object($imageWalletBottom)) {
                    if (!empty($imageWalletBottom)) {
                        $this->data['image_wallet_bottom'] = $this->uploadFile($imageWalletBottom);
                        if (is_array($this->data['image_wallet_bottom'])) {
                            unset($this->data['image_wallet_bottom']);
                        }
                    }
                }

                $envs = DotenvEditor::load(base_path('.env'));

                $envs->setKeys([
                    'APP_NAME' => $this->data['software_name'],
                ]);

                $envs->save();

                if ($setting->update($this->data)) {

                    Cache::put('setting', $setting);

                    Notification::make()
                        ->title('Dados alterados')
                        ->body('Dados alterados com sucesso!')
                        ->success()
                        ->send();

                    redirect(route('filament.admin.pages.dashboard-admin'));

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
