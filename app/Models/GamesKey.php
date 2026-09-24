<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;

class GamesKey extends Model
{
    use HasFactory;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'games_keys';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [

        // Play Fiver
        'playfiver_secret',
        'playfiver_code',
        'playfiver_token',

        // PlayConnect
        'playconnect_code',
        'playconnect_token',
        'playconnect_secret_key',

        'merchant_url',
        'merchant_id',
        'merchant_key',

        /// infinity
        'pig_agent_code',
        'pig_agent_token',
        'pig_agent_secret',

        /// EverGame
        'evergame_agent_code',
        'evergame_agent_token',
        'evergame_api_endpoint',

        /// PARALEL EVERGAME
        'evergame_agent_token2',
        'evergame_secret_key2',
        'evergame_api_endpoint2',

        /// WorldSlot
        'worldslot_agent_code',
        'worldslot_agent_token',
        'worldslot_agent_secret_key',
        'worldslot_api_endpoint',

        /// Fivers
        'agent_code',
        'agent_token',
        'agent_secret_key',
        'api_endpoint',

        /// parceira
        'agent_code_1',
        'agent_token_1',
        'agent_secret_key_1',
        'api_endpoint_1',

        /// Drakon
        'drakon_agent_code',
        'drakon_agent_token',
        'drakon_agent_secret',

        /// Play gaming
        'play_gaming_hall',
        'play_gaming_key',
        'play_gaming_login',
        
         
        'pgoneplayigaming_endpoint',
        'pgoneplayigaming_secret',
        'pgoneplayigaming_code',
        'pgoneplayigaming_token',
        //16
    ];

    protected $hidden = array('updated_at');

    /**
     * Get the user's first name.
     */
    protected function pigAgentCode(): Attribute
    {
        return Attribute::make(
            get: fn(?string $value) => env('APP_DEMO') ? '*********************' : $value,
        );
    }

    /**
     * Get the user's first name.
     */
    protected function pigAgentToken(): Attribute
    {
        return Attribute::make(
            get: fn(?string $value) => env('APP_DEMO') ? '*********************' : $value,
        );
    }

    /**
     * Get the user's first name.
     */
    protected function pigAgentSecret(): Attribute
    {
        return Attribute::make(
            get: fn(?string $value) => env('APP_DEMO') ? '*********************' : $value,
        );
    }





    protected function drakonAgentCode(): Attribute
    {
        return Attribute::make(
            get: fn(?string $value) => env('APP_DEMO') ? '*********************' : $value,
        );
    }

    /**
     * Get the user's first name.
     */
    protected function drakonAgentToken(): Attribute
    {
        return Attribute::make(
            get: fn(?string $value) => env('APP_DEMO') ? '*********************' : $value,
        );
    }

    /**
     * Get the user's first name.
     */
    protected function drakonAgentSecret(): Attribute
    {
        return Attribute::make(
            get: fn(?string $value) => env('APP_DEMO') ? '*********************' : $value,
        );
    }







    /**
     * Get the user's first name.
     */
    protected function merchantId(): Attribute
    {
        return Attribute::make(
            get: fn(?string $value) => env('APP_DEMO') ? '*********************' : $value,
        );
    }

    /**
     * Get the user's first name.
     */
    protected function merchantKey(): Attribute
    {
        return Attribute::make(
            get: fn(?string $value) => env('APP_DEMO') ? '*********************' : $value,
        );
    }
    /**
     * Get the user's first name.
     */
    protected function worldslotAgentCode(): Attribute
    {
        return Attribute::make(
            get: fn(?string $value) => env('APP_DEMO') ? '*********************' : $value,
        );
    }

    /**
     * Get the user's first name.
     */
    protected function worldslotAgentToken(): Attribute
    {
        return Attribute::make(
            get: fn(?string $value) => env('APP_DEMO') ? '*********************' : $value,
        );
    }

    /**
     * Get the user's first name.
     */
    protected function worldslotAgentSecretKey(): Attribute
    {
        return Attribute::make(
            get: fn(?string $value) => env('APP_DEMO') ? '*********************' : $value,
        );
    }

    /**
     * Get the user's first name.
     */
    protected function evergameAgentCode(): Attribute
    {
        return Attribute::make(
            get: fn(?string $value) => env('APP_DEMO') ? '*********************' : $value,
        );
    }

    /**
     * Get the user's first name.
     */
    protected function evergameAgentToken(): Attribute
    {
        return Attribute::make(
            get: fn(?string $value) => env('APP_DEMO') ? '*********************' : $value,
        );
    }

}
