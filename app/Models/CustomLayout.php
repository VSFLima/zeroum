<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomLayout extends Model
{
    use HasFactory;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'custom_layouts';


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'font_family_default',
        'primary_color',
        'primary_opacity_color',
        'secundary_color',
        'gray_dark_color',
        'gray_light_color',
        'gray_medium_color',
        'gray_over_color',
        'title_color',
        'text_color',
        'sub_text_color',
        'value_color_jackpot',
        'value_wallet_navtop',
        'bonus_color_dep',
        'placeholder_color',
        'background_color_cassino',

        'background_base',
        'background_base_dark',

        'input_primary',
        'input_primary_dark',

        'carousel_banners',
        'carousel_banners_dark',

        'sidebar_color',
        'sidebar_color_dark',

        'navtop_color',
        'navtop_color_dark',

        'side_menu',
        'side_menu_dark',

        'footer_color',
        'footer_color_dark',

        'card_color',
        'card_color_dark',
        'transaction_item_background',
        'transaction_background',
        'Border_bottons_and_selected',
        'text_color_deposit',
        'background_gateway_color',
        'background_deposit_buttons',
        'wallet_buttons_background',
        'background_color_deposit_items',
        'background_color_deposit',
        'categories_border_color',
        'search_border_color',
        'latest_earnings_background_color',
        'background_color_itens_siderbar',
        'divider_color_footer',
        'topcolor_border_footer',
        'background_bottom_navigation',
        'background_bottom_navigation_dark',
        'borders_and_dividers_colors',
        'search_back',
        'color_bt_1',
        'color_bt_2',
        'color_bt_3',
        'color_bt_4',
        'border_radius',
        'custom_css',
        'custom_js',
        'custom_header',
        'custom_body',
        'colors_deposit_value',
        'color_players',
        'placeholder_background',
        'card_transaction',
        'text_opacity',
        'background_color_category',
        'background_color_jackpot',
        'text_color_footer',
        'opacity_bottom_nav',
        'opacity_categories',

        'back_sub_color',
        'item_sub_color',
        'text_sub_color',
        'title_sub_color',

        /// redes sociais
        'instagram',
        'facebook',
        'telegram',
        'twitter',
        'whastapp',
        'youtube',

        /// LINKS BOTOES
        'bt_1_link',
        'bt_2_link',
        'bt_3_link',
        'bt_4_link',
        'bt_5_link',

        ///images
        'icon_bt_1',
        'icon_bt_2',
        'icon_bt_3',
        'icon_bt_4',

        ///termos
        'modal_termos_cpf',
        'modal_termos_register',

        'botao_deposito_background_nav',
        'botao_deposito_text_nav',

        'botao_login_background_nav',
        'botao_login_text_nav',
        'botao_registro_background_nav',
        'botao_registro_text_nav',

        'botao_login_background_modal',
        'botao_login_text_modal',
        'botao_registro_background_modal',
        'botao_registro_text_modal',
        'botao_deposito_border_nav',
        'botao_login_border_nav',
        'botao_registro_border_nav',

        'botao_deposito_text_dep',
        'botao_deposito_background_dep',
        'botao_deposito_border_dep',
        'botao_deposito_text_saq',
        'botao_deposito_background_saq',
        'botao_deposito_border_saq',

        'invert_percentage',
        'sepia_percentage',
        'saturate_percentage',
        'hue_rotate_deg',
        'brightness_percentage',
        'contrast_percentage',

    ];

}
