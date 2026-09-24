<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as Middleware;

class VerifyCsrfToken extends Middleware
{
    /**
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array<int, string>
     */
    protected $except = [
        'playfiver/*', 
        'api/*',
        'digitopay/*',
        'ezzebank/*',
        'slotegrator/*',
        'suitpay/*',
        'bspay/*',
        'vgames/*',
        'webhooks/*',
        'salsa/*',
        'fivers/*',
        'callback',
		'callback/*',
        'gold_api',
        'gold_api/*',
        'playgaming',
        'playgaming/*',
        'playigaming_api',
        'playigaming_api/*',
        'kagaming/*',
        'vibra/*',
        'cron/*',
        'venix_api',
        'venix_api/*',
        'ever/*',
        'ever',
        'drakon_api',
        'drakon_api/*',
        'suitpay/*',
        'playfiver/*',
        'ezzepay/*',
        'pixupbr/*',
    ];
}
