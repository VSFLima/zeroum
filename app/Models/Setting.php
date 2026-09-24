<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    use HasFactory;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'settings';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'software_name',
        'software_description',
        'message_home_page',

        /// logos e background
        'software_favicon',
        'software_logo_white',
        'software_logo_black',
        'software_background',
        'software_loading',
        'image_jackpot',
        'image_cassino_sidebar',
        'image_favoritos_sidebar',
        'image_wallet_sidebar',
        'image_suporte_sidebar',
        'image_promotions_sidebar',
        'image_indique_sidebar',
        'image_home_sidebar',
        'image_home_bottom',
        'image_cassino_bottom',
        'image_deposito_bottom',
        'image_convidar_bottom',
        'image_wallet_bottom',
        'image_home_bottom_hover',
        'image_cassino_bottom_hover',
        'image_deposito_bottom_hover',
        'image_convidar_bottom_hover',
        'image_wallet_bottom_hover',
        'image_menu_nav',
        'image_user_nav',
        ///images
        'icon_bt_1',
        'icon_bt_2',
        'icon_bt_3',
        'icon_bt_4',
        'icon_bt_5',
        'icon_bt_6',
        'icon_bt_7',
        'icon_bt_8',
        'img_bg_1',

        ///images navbarwallet
        'icon_wt_1',
        'icon_wt_2',
        'icon_wt_3',
        'icon_wt_4',
        'icon_wt_5',
        'icon_wt_6',
        'icon_wt_7',
        'icon_wt_8',
        'icon_wt_9',
        'icon_wt_10',
        'icon_wt_11',
        'icon_wt_12',
        'background_perfil_top',
        'sub_background_perfil_top',

        'icon_nav_bottom_left',
        'icon_nav_bottom_right',
        'icon_bottom_left',
        'icon_bottom_right',


        ///names bott
        'name_bt_1',
        'name_bt_2',
        'name_bt_3',
        'name_bt_4',

        'currency_code',
        'decimal_format',
        'currency_position',
        'prefix',
        'storage',
        'min_deposit',
        'max_deposit',
        'min_withdrawal',
        'max_withdrawal',

        /// vip
        'bonus_vip',
        'activate_vip_bonus',

        // Percent
        'ngr_percent',
        'revshare_percentage',
        'revshare_reverse',
        'saldo_ini',
        'cpa_value',
        'cpa_baseline',
        'cpa_percentage_n1',
        'cpa_percentage_n2',
        'cpa_percentage_baseline',

        /// soccer
        'soccer_percentage',
        'turn_on_football',

        'initial_bonus',
        'rollover_cadastro',
        'disable_rollover_cadastro',

        'suitpay_is_enable',
        'stripe_is_enable',
        'bspay_is_enable',
        'digitopay_is_enable',
        'ezzebank_is_enable',

        /// withdrawal limit
        'withdrawal_limit',
        'withdrawal_period',

        //'disable_spin',


        /// sub afiliado
        'perc_sub_lv1',
        'perc_sub_lv2',
        'perc_sub_lv3',

        /// Baús
        'cirus_baseline',
        'cirus_aposta',
        'cirus_valor',

        /// campos do rollover
        'rollover',
        'rollover_deposit',
        'disable_rollover',
        'rollover_protection',
        'deposit_min_saque',
        'disable_deposit_min',


        'default_gateway',

        /// Modal POP UP

        'img_modal_pop',
        'modal_pop_up',
        'modal_active',

        /// colunas games
        'collum_games',

    ];

    protected $hidden = array('updated_at');
}
