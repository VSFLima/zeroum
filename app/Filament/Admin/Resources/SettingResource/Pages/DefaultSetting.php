<?php

namespace App\Filament\Admin\Resources\SettingResource\Pages;

use App\Filament\Admin\Resources\SettingResource;
use App\Models\Setting;
use AymanAlhattami\FilamentPageWithSidebar\Traits\HasPageSidebar;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Group;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Contracts\HasForms;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\Page;
use Filament\Support\Exceptions\Halt;
use Illuminate\Contracts\Support\Htmlable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;
use Jackiedo\DotenvEditor\Facades\DotenvEditor;
use Filament\Forms\Components\RichEditor;
use Livewire\Features\SupportFileUploads\TemporaryUploadedFile;
use Filament\Forms\Components\Toggle;
use Illuminate\Support\Facades\Hash;
use App\Models\AproveSaveSetting;

class DefaultSetting extends Page implements HasForms
{
    use HasPageSidebar, InteractsWithForms;

    protected static string $resource = SettingResource::class;

    protected static string $view = 'filament.resources.setting-resource.pages.default-setting';

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
        return __('Icones & Textos');
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

            $favicon = $this->data['software_favicon'];
            $logoWhite = $this->data['software_logo_white'];
            $logoBlack = $this->data['software_logo_black'];
            $softwareBackground = $this->data['software_background'];
            $softwareLoading = $this->data['software_loading'];
            //$imageCassinoSidebar = $this->data['image_cassino_sidebar'];
            $imageFavoritosSidebar = $this->data['image_favoritos_sidebar'];
            $imageWalletSidebar = $this->data['image_wallet_sidebar'];
            $imageSuporteSidebar = $this->data['image_suporte_sidebar'];
            $imagePromotionsSidebar = $this->data['image_promotions_sidebar'];
            $imageIndiqueSidebar = $this->data['image_indique_sidebar'];
            //$imageHomeSidebar = $this->data['image_home_sidebar'];
            $imageHomeBottom = $this->data['image_home_bottom'];
            $imageCassinoBottom = $this->data['image_cassino_bottom'];
            $imageDepositoBottom = $this->data['image_deposito_bottom'];
            $imageConvidarBottom = $this->data['image_convidar_bottom'];
            $imageWalletBottom = $this->data['image_wallet_bottom'];
            $imageHomeBottomhover = $this->data['image_home_bottom_hover'];
            $imageCassinoBottomhover = $this->data['image_cassino_bottom_hover'];
            $imageDepositoBottomhover = $this->data['image_deposito_bottom_hover'];
            $imageConvidarBottomhover = $this->data['image_convidar_bottom_hover'];
            $imageWalletBottomhover = $this->data['image_wallet_bottom_hover'];
            $imageMenuNav = $this->data['image_menu_nav'];
            // $imageUserNav = $this->data['image_user_nav'];
            //images botoes jackpot e suporte flutuante
            $imageJackpot = $this->data['image_jackpot'];
            $iconbt1 = $this->data['icon_bt_1'];
            $iconbt2 = $this->data['icon_bt_2'];
            $iconbt3 = $this->data['icon_bt_3'];
            $iconbt4 = $this->data['icon_bt_4'];
            $iconbt5 = $this->data['icon_bt_5'];
            $iconbt6 = $this->data['icon_bt_6'];
            $iconbt7 = $this->data['icon_bt_7'];
            $iconbt8 = $this->data['icon_bt_8'];
            //background image
            $imgbg1 = $this->data['img_bg_1'];
            //navbarwallet image
            $iconwt1 = $this->data['icon_wt_1'];
            $iconwt2 = $this->data['icon_wt_2'];
            $iconwt3 = $this->data['icon_wt_3'];
            $iconwt4 = $this->data['icon_wt_4'];
            $iconwt5 = $this->data['icon_wt_5'];
            $iconwt6 = $this->data['icon_wt_6'];
            $iconwt7 = $this->data['icon_wt_7'];
            $iconwt8 = $this->data['icon_wt_8'];
            $iconwt9 = $this->data['icon_wt_9'];
            $iconwt10 = $this->data['icon_wt_10'];
            $iconwt11 = $this->data['icon_wt_11'];
            $iconwt12 = $this->data['icon_wt_12'];
            // Acessando valores do array $this->data
            $backgroundPerfilTop = $this->data['background_perfil_top'];
            $subBackgroundPerfilTop = $this->data['sub_background_perfil_top'];

            $fundoNavLeftBottom = $this->data['icon_nav_bottom_left'];
            $fundoNavRightBottom = $this->data['icon_nav_bottom_right'];
            $fundoLeftBottom = $this->data['icon_bottom_left'];
            $fundoRightBottom = $this->data['icon_bottom_right'];


            $imgmodalpop = $this->data['img_modal_pop'];

            if (is_array($softwareBackground) || is_object($softwareBackground)) {
                if (!empty($softwareBackground)) {
                    $this->data['software_background'] = $this->uploadFile($softwareBackground);

                    if (is_array($this->data['software_background'])) {
                        unset($this->data['software_background']);
                    }
                }
            }
            if (is_array($softwareLoading) || is_object($softwareLoading)) {
                if (!empty($softwareLoading)) {
                    $this->data['software_loading'] = $this->uploadFile($softwareLoading);

                    if (is_array($this->data['software_loading'])) {
                        unset($this->data['software_loading']);
                    }
                }
            }
            // Função para upload da imagem do POP UP
            if (is_array($imgmodalpop) || is_object($imgmodalpop)) {
                if (!empty($imgmodalpop)) {
                    $this->data['img_modal_pop'] = $this->uploadFile($imgmodalpop);
                    if (is_array($this->data['img_modal_pop'])) {
                        unset($this->data['img_modal_pop']);
                    }
                }
            }

             // Função para upload da imagem do fundo nav and bottom
            if (is_array($fundoNavLeftBottom) || is_object($fundoNavLeftBottom)) {
                if (!empty($fundoNavLeftBottom)) {
                    $this->data['icon_nav_bottom_left'] = $this->uploadFile($fundoNavLeftBottom);
                    if (is_array($this->data['icon_nav_bottom_left'])) {
                        unset($this->data['icon_nav_bottom_left']);
                    }
                }
            }

            // Função para upload da imagem do fundo nav and bottom
            if (is_array($fundoNavRightBottom) || is_object($fundoNavRightBottom)) {
                if (!empty($fundoNavRightBottom)) {
                    $this->data['icon_nav_bottom_right'] = $this->uploadFile($fundoNavRightBottom);
                    if (is_array($this->data['icon_nav_bottom_right'])) {
                        unset($this->data['icon_nav_bottom_right']);
                    }
                }
            }
             // Função para upload da imagem do fundo  and bottom
            if (is_array($fundoLeftBottom) || is_object($fundoLeftBottom)) {
                if (!empty($fundoLeftBottom)) {
                    $this->data['icon_bottom_left'] = $this->uploadFile($fundoLeftBottom);
                    if (is_array($this->data['icon_bottom_left'])) {
                        unset($this->data['icon_bottom_left']);
                    }
                }
            }

            // Função para upload da imagem do fundo  and bottom
            if (is_array($fundoRightBottom) || is_object($fundoRightBottom)) {
                if (!empty($fundoRightBottom)) {
                    $this->data['icon_bottom_right'] = $this->uploadFile($fundoRightBottom);
                    if (is_array($this->data['icon_bottom_right'])) {
                        unset($this->data['icon_bottom_right']);
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
            // Função para upload do botao 6 da navbar
            if (is_array($iconwt6) || is_object($iconwt3)) {
                if (!empty($iconwt6)) {
                    $this->data['icon_wt_6'] = $this->uploadFile($iconwt6);
                    if (is_array($this->data['icon_wt_6'])) {
                        unset($this->data['icon_wt_6']);
                    }
                }
            }
            // Função para upload do botao 7 da navbar
            if (is_array($iconwt7) || is_object($iconwt7)) {
                if (!empty($iconwt7)) {
                    $this->data['icon_wt_7'] = $this->uploadFile($iconwt7);
                    if (is_array($this->data['icon_wt_7'])) {
                        unset($this->data['icon_wt_7']);
                    }
                }
            }
            // Função para upload do botao 8 da navbar
            if (is_array($iconwt8) || is_object($iconwt8)) {
                if (!empty($iconwt8)) {
                    $this->data['icon_wt_8'] = $this->uploadFile($iconwt8);
                    if (is_array($this->data['icon_wt_8'])) {
                        unset($this->data['icon_wt_8']);
                    }
                }
            }
            // Função para upload do botao 11 registro
            if (is_array($iconwt11) || is_object($iconwt11)) {
                if (!empty($iconwt11)) {
                    $this->data['icon_wt_11'] = $this->uploadFile($iconwt11);
                    if (is_array($this->data['icon_wt_11'])) {
                        unset($this->data['icon_wt_11']);
                    }
                }
            }
            // Função para upload do botao 12 da registro
            if (is_array($iconwt12) || is_object($iconwt12)) {
                if (!empty($iconwt12)) {
                    $this->data['icon_wt_12'] = $this->uploadFile($iconwt12);
                    if (is_array($this->data['icon_wt_12'])) {
                        unset($this->data['icon_wt_12']);
                    }
                }
            }
            // Função para upload do background_perfil_top
            if (is_array($backgroundPerfilTop) || is_object($backgroundPerfilTop)) {
                if (!empty($backgroundPerfilTop)) {
                    $this->data['background_perfil_top'] = $this->uploadFile($backgroundPerfilTop);
                    if (is_array($this->data['background_perfil_top'])) {
                        unset($this->data['background_perfil_top']);
                    }
                }
            }

            // Função para upload do sub_background_perfil_top
            if (is_array($subBackgroundPerfilTop) || is_object($subBackgroundPerfilTop)) {
                if (!empty($subBackgroundPerfilTop)) {
                    $this->data['sub_background_perfil_top'] = $this->uploadFile($subBackgroundPerfilTop);
                    if (is_array($this->data['sub_background_perfil_top'])) {
                        unset($this->data['sub_background_perfil_top']);
                    }
                }
            }
            // Função para upload do botao 9 da navbar
            if (is_array($iconwt9) || is_object($iconwt9)) {
                if (!empty($iconwt9)) {
                    $this->data['icon_wt_9'] = $this->uploadFile($iconwt9);
                    if (is_array($this->data['icon_wt_9'])) {
                        unset($this->data['icon_wt_9']);
                    }
                }
            }
            // Função para upload do botao 10 da navbar
            if (is_array($iconwt10) || is_object($iconwt10)) {
                if (!empty($iconwt10)) {
                    $this->data['icon_wt_10'] = $this->uploadFile($iconwt10);
                    if (is_array($this->data['icon_wt_10'])) {
                        unset($this->data['icon_wt_10']);
                    }
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
             // Função para upload do botao 1
             if (is_array($imageJackpot) || is_object($imageJackpot)) {
                if (!empty($imageJackpot)) {
                    $this->data['image_jackpot'] = $this->uploadFile($imageJackpot);
                    if (is_array($this->data['image_jackpot'])) {
                        unset($this->data['image_jackpot']);
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




            // Função para upload de imageHomeBottom
            if (is_array($imageHomeBottomhover) || is_object($imageHomeBottomhover)) {
                if (!empty($imageHomeBottomhover)) {
                    $this->data['image_home_bottom_hover'] = $this->uploadFile($imageHomeBottomhover);
                    if (is_array($this->data['image_home_bottom_hover'])) {
                        unset($this->data['image_home_bottom_hover']);
                    }
                }
            }

            // Função para upload de imageCassinoBottom
            if (is_array($imageCassinoBottomhover) || is_object($imageCassinoBottomhover)) {
                if (!empty($imageCassinoBottomhover)) {
                    $this->data['image_cassino_bottom_hover'] = $this->uploadFile($imageCassinoBottomhover);
                    if (is_array($this->data['image_cassino_bottom_hover'])) {
                        unset($this->data['image_cassino_bottom_hover']);
                    }
                }
            }

            // Função para upload de imageDepositoBottom
            if (is_array($imageDepositoBottomhover) || is_object($imageDepositoBottomhover)) {
                if (!empty($imageDepositoBottomhover)) {
                    $this->data['image_deposito_bottom_hover'] = $this->uploadFile($imageDepositoBottomhover);
                    if (is_array($this->data['image_deposito_bottom_hover'])) {
                        unset($this->data['image_deposito_bottom_hover']);
                    }
                }
            }

            // Função para upload de imageConvidarBottom
            if (is_array($imageConvidarBottomhover) || is_object($imageConvidarBottomhover)) {
                if (!empty($imageConvidarBottomhover)) {
                    $this->data['image_convidar_bottom_hover'] = $this->uploadFile($imageConvidarBottomhover);
                    if (is_array($this->data['image_convidar_bottom_hover'])) {
                        unset($this->data['image_convidar_bottom_hover']);
                    }
                }
            }
            // Função para upload de imageWalletBottom
            if (is_array($imageWalletBottomhover) || is_object($imageWalletBottomhover)) {
                if (!empty($imageWalletBottomhover)) {
                    $this->data['image_wallet_bottom_hover'] = $this->uploadFile($imageWalletBottomhover);
                    if (is_array($this->data['image_wallet_bottom_hover'])) {
                        unset($this->data['image_wallet_bottom_hover']);
                    }
                }
            }





            if (is_array($imageMenuNav) || is_object($imageMenuNav)) {
                if (!empty($imageMenuNav)) {
                    $this->data['image_menu_nav'] = $this->uploadFile($imageMenuNav);
                    if (is_array($this->data['image_menu_nav'])) {
                        unset($this->data['image_menu_nav']);
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

                redirect(route('filament.admin.resources.settings.index'));

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
                Section::make('Ajuste Visual')
                    ->description('Formulário ajustar o visual da plataforma')
                    ->schema([
                        Group::make()->schema([
                            TextInput::make('software_name')
                                ->label('Nome')
                                ->placeholder('Digite o nome do site')
                                ->required()
                                ->maxLength(191),
                            TextInput::make('software_description')
                                ->placeholder('Digite a descrição do site')
                                ->label('Descrição')
                                ->maxLength(800),
                        ])->columns(2),
                        Group::make()->schema([
                            FileUpload::make('software_favicon')
                                ->label('Favicon')
                                ->placeholder('Carregue um favicon')
                                ->image(),
                            FileUpload::make('software_logo_white')
                                ->label('Logo Branca TAM (650px X 200px)')
                                ->placeholder('Carregue uma logo branca')
                                ->image(),

                            FileUpload::make('software_logo_black')
                                ->label('Logo Escura TAM (650px X 200px)')
                                ->placeholder('Carregue uma logo escura')
                                ->image(),
                            FileUpload::make('software_loading')
                                ->label('Imagem do Loading')
                                ->placeholder('Carregue a Imagem do Loading')
                                ->image(),
                        ])->columns(2),
                        Group::make()->schema([
                            TextInput::make('collum_games')
                                ->label('Quantidades de colunas de jogos, recomendado entre 2 e 4!')
                                ->placeholder('Digite a quantidade')
                                ->required()
                                ->maxLength(191),
                        ])->columns(2),
                    ]),

                Section::make('Botões de navegação')
                    ->description('Imagens para botões de navegação')
                    ->schema([
                        FileUpload::make('image_home_bottom')
                            ->label('Home')
                            ->placeholder('Carregue a imagem para o botão Home')
                            ->image()
                            ->hint('Max: 100x100'),
                        FileUpload::make('image_cassino_bottom')
                            ->label('Login')
                            ->placeholder('Carregue a imagem para o botão Login')
                            ->image()
                            ->hint('Max: 100x100'),
                        FileUpload::make('image_deposito_bottom')
                            ->label('Depósito')
                            ->placeholder('Carregue a imagem para o botão Depósito')
                            ->image()
                            ->hint('Max: 100x100'),
                        FileUpload::make('image_convidar_bottom')
                            ->label('Promoções')
                            ->placeholder('Carregue a imagem para o botão Promoções')
                            ->image()
                            ->hint('Max: 100x100'),
                        FileUpload::make('image_wallet_bottom')
                            ->label('Perfil')
                            ->placeholder('Carregue a imagem para o botão Perfil')
                            ->image()
                            ->hint('Max: 100x100'),

                        FileUpload::make('image_home_bottom_hover')
                            ->label('Home')
                            ->placeholder('Carregue a imagem para o botão Home')
                            ->image()
                            ->hint('Max: 100x100'),
                        FileUpload::make('image_cassino_bottom_hover')
                            ->label('Login')
                            ->placeholder('Carregue a imagem para o botão Login')
                            ->image()
                            ->hint('Max: 100x100'),
                        FileUpload::make('image_deposito_bottom_hover')
                            ->label('Depósito')
                            ->placeholder('Carregue a imagem para o botão Depósito')
                            ->image()
                            ->hint('Max: 100x100'),
                        FileUpload::make('image_convidar_bottom_hover')
                            ->label('Promoções')
                            ->placeholder('Carregue a imagem para o botão Promoções')
                            ->image()
                            ->hint('Max: 100x100'),
                        FileUpload::make('image_wallet_bottom_hover')
                            ->label('Perfil')
                            ->placeholder('Carregue a imagem para o botão Perfil')
                            ->image()
                            ->hint('Max: 100x100'),
                    ])->columns(5),

                Section::make('Botões da NAV TOP')
                    ->description('Imagens para NAV TOP')
                    ->schema([
                        FileUpload::make('image_menu_nav')
                            ->label('Menu')
                            ->placeholder('Carregue a imagem para o Menu')
                            ->image()
                            ->hint('Max: 100x100'),

                             FileUpload::make('icon_nav_bottom_right')
                            ->label('Imagem DIREITA')
                            ->placeholder('Carregue a imagem de fundo da direita da NAV')
                            ->image()
                            ->hint('Max: 200x100'),
                             FileUpload::make('icon_nav_bottom_left')
                            ->label('Imagem Esquerda')
                            ->placeholder('Carregue a imagem de fundo da esquerda da NAV')
                            ->image()
                            ->hint('Max: 200x100'),
                             FileUpload::make('icon_bottom_right')
                            ->label('Imagem DIREITA BOTTOM')
                            ->placeholder('Carregue a imagem de fundo da direita da BOTTOM')
                            ->image()
                            ->hint('Max: 200x100'),
                             FileUpload::make('icon_bottom_left')
                            ->label('Imagem ESQUERDA BOTTOM')
                            ->placeholder('Carregue a imagem de fundo da esquerda da BOTTOM')
                            ->image()
                            ->hint('Max: 200x100'),
                        
                    ])->columns(5),
                Section::make('Botões do slider text e Botões voltar')
                    ->description('Imagens para SLIDER TEXT')
                    ->schema([
                        FileUpload::make('image_favoritos_sidebar')
                            ->label('GIF SOM')
                            ->placeholder('Carregue o ícone para SOM')
                            ->image()
                            ->hint('Max: 100x100'),
                        FileUpload::make('image_wallet_sidebar')
                            ->label('notificações')
                            ->placeholder('Carregue o ícone para notificações')
                            ->image()
                            ->hint('Max: 100x100'),
                        FileUpload::make('icon_wt_10')
                            ->label('Voltar')
                            ->placeholder('Carregue o ícone para voltar')
                            ->image()
                            ->hint('Max: 100x100'),
                    ])->columns(5),

                Section::make('Icones da sidebar')
                    ->description('Icones para a sidebar, jackpot, suporte')
                    ->schema([

                        FileUpload::make('image_suporte_sidebar')
                            ->label('Suporte')
                            ->placeholder('Carregue o ícone para Suporte')
                            ->image()
                            ->hint('Max: 100x100'),
                        FileUpload::make('image_promotions_sidebar')
                            ->label('Promotions')
                            ->placeholder('Carregue o ícone para Promotions')
                            ->image()
                            ->hint('Max: 100x100'),
                        FileUpload::make('image_indique_sidebar')
                            ->label('Indique')
                            ->placeholder('Carregue o ícone para Indique')
                            ->image()
                            ->hint('Max: 100x100'),
                        FileUpload::make('icon_bt_8')
                            ->label('Agente na sidebar')
                            ->placeholder('Carregue o icone do agente')
                            ->image(),
                    ])->columns(5),

                Section::make('JACKPOT')
                    ->description('Altere a imagem do jackpot')
                    ->schema([
                        FileUpload::make('image_jackpot')
                            ->label('Imagem Jackpot')
                            ->placeholder('Carregue o jackpot')
                            ->image(),
                        // FileUpload::make('icon_bt_1')
                        //     ->label('botão 1 do jackpot')
                        //     ->placeholder('Carregue a logo do icone 1')
                        //     ->image(),
                        // FileUpload::make('icon_bt_2')
                        //     ->label('botão 2 do jackpot')
                        //     ->placeholder('Carregue a logo do icone 2')
                        //     ->image(),
                        // FileUpload::make('icon_bt_3')
                        //     ->label('botão 3 do jackpot')
                        //     ->placeholder('Carregue a logo do icone 3')
                        //     ->image(),
                        // FileUpload::make('icon_bt_4')
                        //     ->label('botão 4 do jackpot')
                        //     ->placeholder('Carregue a logo do icone 4')
                        //     ->image(),
                        // TextInput::make('name_bt_1')
                        //     ->label('Nome do botão 1')
                        //     ->maxLength(191),
                        // TextInput::make('name_bt_2')
                        //     ->label('Nome do botão 2')
                        //     ->maxLength(191),
                        // TextInput::make('name_bt_3')
                        //     ->label('Nome do botão 3')
                        //     ->maxLength(191),
                        // TextInput::make('name_bt_4')
                        //     ->label('Nome do botão 4')
                        //     ->maxLength(191),
                    ])->columns(2),

                Section::make('Botão flutuante & imagem de fundo')
                    ->description('Icones para a sidebar, jackpot, suporte')
                    ->schema([
                        FileUpload::make('icon_bt_5')
                            ->label('suporte flutuante')
                            ->placeholder('Carregue a logo do icone 5')
                            ->image(),
                        FileUpload::make('img_bg_1')
                            ->label('imagem de fundo')
                            ->placeholder('Carregue a imagem')
                            ->image(),
                    ])->columns(5),
                Section::make('Icones do modal de login e registro')
                    ->description('Icones')
                    ->schema([
                        FileUpload::make('icon_bt_6')
                            ->label('botão login')
                            ->placeholder('Carregue a logo do login')
                            ->image(),
                        FileUpload::make('icon_bt_7')
                            ->label('Botão Registro')
                            ->placeholder('Carregue a logo do registro')
                            ->image(),
                         FileUpload::make('icon_wt_11')
                            ->label('botão login ACTIVE')
                            ->placeholder('Carregue a logo do login')
                            ->image(),
                        FileUpload::make('icon_wt_12')
                            ->label('Botão Registro ACTIVE')
                            ->placeholder('Carregue a logo do registro')
                            ->image(),

                    ])->columns(5),

                Section::make('Icones do PERFIL')
                    ->description('Icones')
                    ->schema([
                        FileUpload::make('icon_wt_1')
                            ->label('botão Desempenho')
                            ->placeholder('Carregue a logo do Desempenho')
                            ->image(),
                        FileUpload::make('icon_wt_2')
                            ->label('Botão Depósito')
                            ->placeholder('Carregue a logo do Depósito')
                            ->image(),
                        FileUpload::make('icon_wt_3')
                            ->label('botão Saque')
                            ->placeholder('Carregue a logo do Saque')
                            ->image(),
                        FileUpload::make('icon_wt_4')
                            ->label('Botão Transação')
                            ->placeholder('Carregue a logo da Transação')
                            ->image(),
                        FileUpload::make('icon_wt_5')
                            ->label('Botão de Sair')
                            ->placeholder('Carregue a logo de Sair')
                            ->image(),
                        FileUpload::make('icon_wt_6')
                            ->label('botão Agente')
                            ->placeholder('Carregue a logo do Agente')
                            ->image(),
                        FileUpload::make('icon_wt_7')
                            ->label('Botão Gestão de retiradas')
                            ->placeholder('Carregue a logo da Gestão de retiradas')
                            ->image(),
                        FileUpload::make('icon_wt_8')
                            ->label('Botão senha de retiradas')
                            ->placeholder('Carregue a logo senha de retiradas')
                            ->image(),
                        FileUpload::make('icon_wt_9')
                            ->label('Botão de Dados')
                            ->placeholder('Carregue a logo Dados')
                            ->image(),
                    ])->columns(5),
                Section::make('Background TOP PERFIL')
                    ->description('Imagens para TOPO DO PERFIL')
                    ->schema([
                        FileUpload::make('background_perfil_top')
                            ->label('Fundo Principal')
                            ->placeholder('Carregue o Fundo Principal')
                            ->image()
                            ->hint('Max: 1080x419'),
                        FileUpload::make('sub_background_perfil_top')
                            ->label('SUB FUNDO')
                            ->placeholder('Carregue o SUB Fundo')
                            ->image()
                            ->hint('Max: 1080x293'),
                    ])->columns(5),

                Section::make('Configurações do modal POP UP')
                    ->description('Modal POP UP')
                    ->schema([
                        RichEditor::make('modal_pop_up')
                            ->label('Descrição')
                            ->columnSpanFull()
                            ->placeholder('Digite as informações que deseja usar!')
                            ->extraAttributes([
                                'data-tinymce-config' => json_encode([
                                    'plugins' => 'lists code', // Inclua apenas os plugins necessários
                                    'toolbar' => 'bold italic underline strikethrough blockquote code numlist bullist', // Exclua os botões de link e imagem
                                ]),
                            ]),
                        FileUpload::make('img_modal_pop')
                            ->label('Imagem do modal pop up')
                            ->placeholder('Carregue a Imagem do modal')
                            ->image(),
                        Toggle::make('modal_active')
                            ->label('Ativar e desativar MODAL')
                        ,
                    ])->columns(5),
                //Section::make('Mensagem em slide abaixo do banner')
                //    ->description('Mensagem')
                //   ->schema([
                //       RichEditor::make('message_home_page')
                //           ->label('Mensagem')
                //           ->columnSpanFull()
                //           ->placeholder('Adicione aqui sua mensagem para aparecer na HOMEPAGE!')
                //           ->extraAttributes([
                //               'data-tinymce-config' => json_encode([
                //                   'plugins' => 'lists code', // Inclua apenas os plugins necessários
                //                   'toolbar' => 'bold italic underline strikethrough blockquote code numlist bullist', // Exclua os botões de link e imagem
                //               ]),
                //           ]),
                //   ])->columns(1),
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
}
