<?php

namespace App\Filament\Admin\Pages;

use App\Models\CustomLayout;
use Creagia\FilamentCodeField\CodeField;
use Filament\Forms\Components\ColorPicker;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\TextArea;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Contracts\HasForms;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Pages\Page;
use Filament\Support\Exceptions\Halt;
use Illuminate\Support\Facades\Cache;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Slider;
use Illuminate\Validation\Rules\Between;
use Filament\Forms\Components\RichEditor;
use App\Models\AproveSaveSetting;
use Illuminate\Support\Facades\Hash;

class LayoutCssCustom extends Page implements HasForms
{
    use InteractsWithForms;

    protected static ?string $navigationIcon = 'heroicon-o-document-text';

    protected static string $view = 'filament.pages.layout-css-custom';

    protected static ?string $navigationLabel = 'Customização Layout';

    protected static ?string $modelLabel = 'Customização Layout';

    protected static ?string $title = 'Customização Layout';

    protected static ?string $slug = 'custom-style-pro';

    public ?array $data = [];
    public CustomLayout $custom;

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
        $this->custom = CustomLayout::first();
        $this->form->fill($this->custom->toArray());
    }

    /**
     * @param array $data
     * @return array
     */
    protected function mutateFormDataBeforeCreate(array $data): array
    {

        return $data;
    }

    /**
     * @param Form $form
     * @return Form
     */
    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make()
                    ->label('Background')
                    ->schema([
                        ColorPicker::make('background_base')
                            ->label('Background Principal')
                            ->required(),
                        ColorPicker::make('background_base_dark')
                            ->label('Background Principal (Dark)')
                            ->required(),
                        ColorPicker::make('carousel_banners')
                            ->label('Carousel Banners')
                            ->required(),
                        ColorPicker::make('carousel_banners_dark')
                            ->label('Carousel Banners (Dark)')
                            ->required(),
                    ])->columns(4)
                ,
                Section::make('Sidebar & NavTop & Footer & BottomNavigation')
                    ->description('Personalize a aparência do seu site, conferindo-lhe uma identidade única.')
                    ->collapsible()
                    ->collapsed(true)
                    ->schema([
                        ColorPicker::make('sidebar_color')
                            ->label('Sidebar')
                            ->required(),

                        ColorPicker::make('sidebar_color_dark')
                            ->label('Sidebar (Dark)')
                            ->required(),

                        ColorPicker::make('navtop_color')
                            ->label('Navtop')
                            ->required(),

                        ColorPicker::make('navtop_color_dark')
                            ->label('Navtop (Dark)')
                            ->required(),

                        ColorPicker::make('side_menu')
                            ->label('Side Menu Box')
                            ->required(),

                        ColorPicker::make('side_menu_dark')
                            ->label('Side Menu Box (Dark)')
                            ->required(),

                        ColorPicker::make('footer_color')
                            ->label('Footer Color')
                            ->required(),

                        ColorPicker::make('footer_color_dark')
                            ->label('Footer Color (Dark)')
                            ->required(),
                        ColorPicker::make('background_bottom_navigation')
                            ->label('Bottom Navigation')
                            ->required(),

                        ColorPicker::make('background_bottom_navigation_dark')
                            ->label('Bottom Navigation (Dark)')
                            ->required(),
                        ColorPicker::make('value_wallet_navtop')
                            ->label('Cor do valor do saldo na NAVTOP')
                            ->required(),
                    ])->columns(4),
                Section::make('Cores de botões')
                    ->description('Personalize as cores dos botões')
                    ->collapsible()
                    ->collapsed(true)
                    ->schema([
                        ColorPicker::make('botao_deposito_background_nav')
                            ->label('Background Botão Depósito NAVTOP')
                            ->required(),

                        ColorPicker::make('botao_deposito_text_nav')
                            ->label('Texto Botão Depósito NAVTOP')
                            ->required(),
                        ColorPicker::make('botao_deposito_border_nav')
                            ->label('Borda Botão Depósito NAVTOP')
                            ->required(),

                        ColorPicker::make('botao_login_background_nav')
                            ->label('Background Botão Login NAVTOP')
                            ->required(),

                        ColorPicker::make('botao_login_text_nav')
                            ->label('Texto Botão Login NAVTOP')
                            ->required(),
                        ColorPicker::make('botao_login_border_nav')
                            ->label('Borda Botão Login NAVTOP')
                            ->required(),

                        ColorPicker::make('botao_registro_background_nav')
                            ->label('Background Botão Registro NAVTOP')
                            ->required(),

                        ColorPicker::make('botao_registro_text_nav')
                            ->label('Texto Botão Registro NAVTOP')
                            ->required(),
                        ColorPicker::make('botao_registro_border_nav')
                            ->label('Borda Botão Registro NAVTOP')
                            ->required(),

                        ColorPicker::make('botao_login_background_modal')
                            ->label('Background Botão Login Modal')
                            ->required(),

                        ColorPicker::make('botao_login_text_modal')
                            ->label('Texto Botão Login Modal')
                            ->required(),

                        ColorPicker::make('botao_registro_background_modal')
                            ->label('Background Botão Registro Modal')
                            ->required(),

                        ColorPicker::make('botao_registro_text_modal')
                            ->label('Texto Botão Registro Modal')
                            ->required(),


                        ColorPicker::make('botao_deposito_background_dep')
                            ->label('Background Botão Depósito na tela de depósito')
                            ->required(),

                        ColorPicker::make('botao_deposito_text_dep')
                            ->label('Texto Botão Depósito na tela de depósito')
                            ->required(),
                        ColorPicker::make('botao_deposito_border_dep')
                            ->label('Borda Botão Depósito na tela de depósito')
                            ->required(),

                        ColorPicker::make('botao_deposito_background_saq')
                            ->label('Background Botão Saque na tela de saque')
                            ->required(),

                        ColorPicker::make('botao_deposito_text_saq')
                            ->label('Texto Botão Saque na tela de saque')
                            ->required(),
                        ColorPicker::make('botao_deposito_border_saq')
                            ->label('Borda Botão Saque na tela de saque')
                            ->required(),
                    ])
                    ->columns(4),


                    Section::make('Customização dos TEXTOS')
                    ->description('Personalize a aparência como desejar')
                    ->collapsible()
                    ->collapsed(true)
                    ->schema([
                        ColorPicker::make('title_color')
                            ->label('Title Color')
                            ->required(),
                        ColorPicker::make('text_color')
                            ->label('Text Color')
                            ->required(),
                        ColorPicker::make('sub_text_color')
                            ->label('Sub Text Color')
                            ->required(),
                        ColorPicker::make('placeholder_color')
                            ->label('Placeholder Color')
                            ->required(),
                        TextInput::make('text_opacity')
    ->label('Opacidade do Texto')
    ->numeric() // Define como numérico
    ->step(0.01) // Permite precisão decimal
    ->default(1) // Valor padrão é 1 (100%)
    ->minValue(0) // Valor mínimo (0% de opacidade)
    ->maxValue(1) // Valor máximo (100% de opacidade)
    ->suffix('%')
    ->helperText('Defina a opacidade do texto de 0 a 1, onde 0 é totalmente transparente e 1 é totalmente opaco.')
    ->required(),
                       TextInput::make('text_color_footer')
                            ->label('Opacidade do Texto do Footer')
                            ->numeric() // Define como numérico
    ->step(0.01) // Permite precisão decimal
    ->default(1) // Valor padrão é 1 (100%)
    ->minValue(0) // Valor mínimo (0% de opacidade)
    ->maxValue(1) // Valor máximo (100% de opacidade)
    ->suffix('%')
    ->helperText('Defina a opacidade do texto de 0 a 1, onde 0 é totalmente transparente e 1 é totalmente opaco.')
    ->required(),
                         TextInput::make('opacity_categories')
                            ->label('Opacidade do Texto das categorias')
                            ->numeric() // Define como numérico
    ->step(0.01) // Permite precisão decimal
    ->default(1) // Valor padrão é 1 (100%)
    ->minValue(0) // Valor mínimo (0% de opacidade)
    ->maxValue(1) // Valor máximo (100% de opacidade)
    ->suffix('%')
    ->helperText('Defina a opacidade do texto de 0 a 1, onde 0 é totalmente transparente e 1 é totalmente opaco.')
    ->required(),
      TextInput::make('opacity_bottom_nav')
                            ->label('Opacidade do Texto do Bottom')
                            ->numeric() // Define como numérico
    ->step(0.01) // Permite precisão decimal
    ->default(1) // Valor padrão é 1 (100%)
    ->minValue(0) // Valor mínimo (0% de opacidade)
    ->maxValue(1) // Valor máximo (100% de opacidade)
    ->suffix('%')
    ->helperText('Defina a opacidade do texto de 0 a 1, onde 0 é totalmente transparente e 1 é totalmente opaco.')
    ->required(),


                    ])->columns(4),







                Section::make('Customização')
                    ->description('Personalize a aparência do seu site, conferindo-lhe uma identidade única.')
                    ->collapsible()
                    ->collapsed(true)
                    ->schema([
                       
                        ColorPicker::make('placeholder_background')
                            ->label('Placeholder Background Color')
                            ->required(),
                        ColorPicker::make('card_transaction')
                            ->label('Background transações')
                            ->required(),
                        ColorPicker::make('value_color_jackpot')
                            ->label('Cor do Valor Do Jackpot')
                            ->required(),
                        ColorPicker::make('bonus_color_dep')
                            ->label('Cor do bonus na pagina de deposito')
                            ->required(),
                        ColorPicker::make('background_color_cassino')
                            ->label('Background Color')
                            ->required(),
                         ColorPicker::make('background_color_category')
                            ->label('Background Color categoria')
                            ->required(),
                         ColorPicker::make('background_color_jackpot')
                            ->label('Background Color jackpot')
                            ->required(),
                        ColorPicker::make('Border_bottons_and_selected')
                            ->label('Bordas De Botões e itens selecionados')
                            ->required(),
                        ColorPicker::make('search_border_color')
                            ->label('Search Border Color')
                            ->required(),
                        ColorPicker::make('borders_and_dividers_colors')
                            ->label('Borders And Dividers Colors')
                            ->required(),
                        ColorPicker::make('search_back')
                            ->label('Search Background')
                            ->required(),
                        ColorPicker::make('colors_deposit_value')
                            ->label('Valores na tela de depósito')
                            ->required(),
                        ColorPicker::make('color_players')
                            ->label('Cor dos icones de musica')
                            ->required(),
                        TextInput::make('border_radius')
                            ->label('Border Radius')
                            ->required(),
                    ])->columns(4),
                Section::make('Customização botões do JACKPOT')
                    ->description('Personalize a aparência como desejar')
                    ->collapsible()
                    ->collapsed(true)
                    ->schema([
                        ColorPicker::make('color_bt_1')
                            ->label('Cor do botão 1')
                            ->required(),
                        ColorPicker::make('color_bt_2')
                            ->label('Cor do botão 2')
                            ->required(),
                        ColorPicker::make('color_bt_3')
                            ->label('Cor do botão 3')
                            ->required(),
                        ColorPicker::make('color_bt_4')
                            ->label('Cor do botão 4')
                            ->required(),
                    ])->columns(4),
                Section::make('Links dos botoes do jackpot')
                    ->description('Adicione os links nos botoes jackpot e suporte telegram flutuante')
                    ->collapsible()
                    ->collapsed(true)
                    ->schema([
                        TextInput::make('bt_1_link')
                            ->label('Botão 1  do jackpot')
                            ->placeholder('Digite o LINK do botão 1')
                            ->maxLength(191),
                        TextInput::make('bt_2_link')
                            ->label('Botão 2  do jackpot')
                            ->placeholder('Digite o LINK do botão 2')
                            ->maxLength(191),
                        TextInput::make('bt_3_link')
                            ->label('Botão 3  do jackpot')
                            ->placeholder('Digite o LINK do botão 3')
                            ->maxLength(191),
                        TextInput::make('bt_4_link')
                            ->label('Botão 4  do jackpot')
                            ->placeholder('Digite o LINK do botão 4')
                            ->maxLength(191),
                        TextInput::make('bt_5_link')
                            ->label('Botão suporte flutuante')
                            ->placeholder('Digite o LINK do botão 5')
                            ->maxLength(191),
                    ])->columns(4),
                Section::make('Customização subordinados')
                    ->description('Personalize a aparência dossubordinados')
                    ->collapsible()
                    ->collapsed(true)
                    ->schema([
                        ColorPicker::make('back_sub_color')
                            ->label('Background color subordinados')
                            ->required(),
                        ColorPicker::make('item_sub_color')
                            ->label('Item Color subordinados')
                            ->required(),
                        ColorPicker::make('text_sub_color')
                            ->label('Text Color subordinados')
                            ->required(),
                        ColorPicker::make('title_sub_color')
                            ->label('Title Color subordinados')
                            ->required(),
                    ])->columns(4),
                Section::make('Termos de serviço')
                    ->description('Adicione os termos de serviços aqui')
                    ->collapsible()
                    ->collapsed(true)
                    ->schema([
                        RichEditor::make('modal_termos_register')
                            ->label('Termos de registro')
                            ->placeholder('Digite os termos de registro')
                            ->columnSpanFull()
                            ->extraAttributes([
                                'data-tinymce-config' => json_encode([
                                    'plugins' => 'lists code', // Inclua apenas os plugins necessários
                                    'toolbar' => 'bold italic underline strikethrough blockquote code numlist bullist', // Exclua os botões de link e imagem
                                ]),
                            ]),
                    ])->columns(),

                Section::make('Filtro dos icones do PERFIL')
                    ->description('Adicione as configurações aqui')
                    ->collapsible()
                    ->collapsed(true)
                    ->schema([
                        TextInput::make('invert_percentage')
                            ->label('Invert (%) (0 a 100)')
                            ->numeric() // Define como campo numérico
                            ->step(0.01) // Define o passo (não aplicável diretamente, mas útil para validação)
                            ->default(100)
                            ->suffix('%'),

                        TextInput::make('sepia_percentage')
                            ->label('Sepia (%) (0 a 100)')
                            ->numeric()
                            ->step(0.01)
                            ->default(5)
                            ->suffix('%'),

                        TextInput::make('saturate_percentage')
                            ->label('Saturate (%) (0 a 1000)')
                            ->numeric()
                            ->step(0.01)
                            ->default(500)
                            ->suffix('%'),

                        TextInput::make('hue_rotate_deg')
                            ->label('Hue Rotate (deg) (-360 a 360)')
                            ->numeric()
                            ->step(0.01)
                            ->default(190),

                        TextInput::make('brightness_percentage')
                            ->label('Brightness (%) (0 a 200)')
                            ->numeric()
                            ->step(0.01)
                            ->default(100)
                            ->suffix('%'),

                        TextInput::make('contrast_percentage')
                            ->label('Contrast (%) (0 a 200)')
                            ->numeric()
                            ->step(0.01)
                            ->default(100)
                            ->suffix('%'),
                    ])
                    ->columns(5),

                Section::make('Links Sociais')
                    ->description('Customize link das suas redes sociais')
                    ->collapsible()
                    ->collapsed(true)
                    ->schema([
                        TextInput::make('instagram')
                            ->label('Instagram')
                            ->placeholder('Digite a URL do seu Instagram')
                            ->url()
                            ->maxLength(191),
                        TextInput::make('facebook')
                            ->label('Facebook')
                            ->placeholder('Digite a URL do seu Facebook')
                            ->url()
                            ->maxLength(191),
                        TextInput::make('telegram')
                            ->label('Telegram')
                            ->placeholder('Digite a URL do seu Telegram')
                            ->url()
                            ->maxLength(191),
                        TextInput::make('twitter')
                            ->label('Twitter')
                            ->placeholder('Digite a URL do seu Twitter')
                            ->url()
                            ->maxLength(191),
                        TextInput::make('whastapp')
                            ->label('Whastapp')
                            ->placeholder('Digite a URL do seu Whastapp')
                            ->url()
                            ->maxLength(191),
                        TextInput::make('youtube')
                            ->label('Youtube')
                            ->placeholder('Digite a URL do seu Youtube')
                            ->url()
                            ->maxLength(191),
                    ])->columns(2),
                Section::make('SENHA DE CONFIRMAÇÃO')
                    ->description('DIGITE SUA SENHA PARA QUE SUAS CONFIGURAÇÕES SEJAM SALVAS')
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

            $custom = CustomLayout::first();

            if (!empty($custom)) {
                if ($custom->update($this->data)) {

                    Cache::put('custom', $custom);

                    Notification::make()
                        ->title('Dados alterados')
                        ->body('Dados alterados com sucesso!')
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
