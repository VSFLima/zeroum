<?php

namespace App\Enums;

enum DrakonEnum : string
{
    case GETBALANCE = 'getBalance';
    case WRITEBET = 'writeBet';
    case GAMELIST = 'gamesList';
    case OPENGAME = 'openGame';
    case GAMESESSION = 'gameSessionsLog';
}
