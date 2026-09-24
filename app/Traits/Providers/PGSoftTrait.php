<?php

namespace App\Traits\Providers;

use App\Helpers\CoreClone as Helper;
use App\Models\Game;
use App\Models\GamesKey;
use App\Models\GGRGames;
use App\Models\Order;
use App\Models\Provider;
use App\Models\Transaction;
use App\Models\User;
use App\Models\Wallet;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;

trait PGClonesTrait
{
    protected static $agentCode;
    protected static $agentToken;
    protected static $agentSecretKey;
    protected static $apiEndpoint;

    public static function getCredentialsPGClones(): bool
    {
        $setting = GamesKey::first();

        
        self::$agentCode        = "cassinosurf"; //$setting->getAttributes()['clones_agent_code'];
        self::$agentToken       = "4c851f51-04fd-4e2b-8dff-a6dd16769135"; //$setting->getAttributes()['clones_agent_token'];
        self::$agentSecretKey   = "828ee2dc-3322-46c9-8e8b-a91a1f397d35"; //$setting->getAttributes()['clones_agent_secret_key'];
        self::$apiEndpoint      = "https://api.gameskng.site"; //$setting->getAttributes()['clones_api_endpoint'];

        return true;
    }

    private static function getBalanceClone($id)
    {
        $user = Wallet::where("user_id", (int)$id)->first();
        if ($user != null) {
            $saldo = $user->balance + $user->balance_bonus + $user->balance_withdrawal;
            Log::debug('SALDO CARTEIRA CONFIRMACAO:' . json_encode([(float)sprintf('%.2f', $saldo)]));
            return (float)sprintf('%.2f', $saldo);
        } else {
            return 0.00;
        }
    }

    public static function createUserPGClone()
    {
        if (self::getCredentialsPGClones()) {
            $postArray = [
                "method"        => "user_create",
                "agent_code"    => self::$agentCode,
                "agent_token"   => self::$agentToken,
                "user_code"     => auth('api')->id() . '',
            ];

            $response = Http::post(self::$apiEndpoint, $postArray);

            if ($response->successful()) {
                return true;
            }
            return false;
        }
        return false;
    }

    public static function GameLaunchClone($provider_code, $game_code, $lang, $userId)
    {
        if (self::getCredentialsPGClones()) {
            $wallet = Wallet::where("id", $userId)->first();

            switch ($game_code) {
                case '40':
                    $gamename = "jungle-delight";
                    break;
                case '98':
                    $gamename = "fortune-ox";
                    break;
                case '63':
                    $gamename = "dragon-tiger-luck";
                    break;
                case '42':
                    $gamename = "ganesha-gold";
                    break;
                case '48':
                    $gamename = "double-fortune";
                    break;
                case '68':
                    $gamename = "fortune-mouse";
                    break;
                case '69':
                    $gamename = "bikini-paradise";
                    break;
                case '126':
                    $gamename = "fortune-tiger";
                    break;
                case '1543462':
                    $gamename = "fortune-rabbit";
                    break;
                case '1695365':
                    $gamename = "fortune-dragon";
                    break;
                case '1682240':
                    $gamename = "cash-mania";
                    break;
                case '1738001':
                    $gamename = "chicky-run";
                    break;
            }


            $postArray = [
                "secretKey"    => self::$agentSecretKey,
                "agentToken"   => self::$agentToken,
                "user_code"     => $userId . '',
                "provider_code" => $provider_code,
                "game_code"     => $gamename,
                "user_balance" => self::getBalanceClone($userId)
            ];

            //\DB::table('debug')->insert(['text' => json_encode($postArray)]);
            $response = Http::post(self::$apiEndpoint . '/api/v1/game_launch', $postArray);
            Log::debug([self::$apiEndpoint . '/api/v1/game_launch', $postArray, $response->json()]);
            $data = $response->json();
            //dd($data);
            $data['launchUrl'] = $data['launch_url'];
            return $data;
        }
    }

    public static function WebhooksClones(Request $request)
    {
        Log::debug('MONEY ' . json_encode($request));

        switch ($request->method) {
            case "user_balance":
                return self::GetUserBalanceClone($request);
            case "game_callback":
                return self::GameCallbackClone($request);
            case "money_callback":
                return self::MoneyCallbackClone($request);
            default:
                return response()->json(['status' => 0]);
        }
    }


    private static function GetUserBalanceClone($request)
    {
        $wallet = Wallet::where('user_id', (int)$request->user_code)->where('active', 1)->first();

        if (!empty($wallet) && self::getBalanceClone($request->user_code) > 0) {
            return response()->json([
                'status' => 1,
                'user_balance' => self::getBalanceClone($request->user_code)
            ]);
        }

        return response()->json([
            'status' => 0,
            'msg' => "INVALID_USER"
        ]);
    }

    private static function ProcessPlayClone($wallet, $userCode, $txnId, $betMoney, $winMoney, $gameCode, $providerCode)
    {
        Log::debug('PROCESS PLAY');
        $userCode = (int)$userCode;
        $user = User::find($userCode);
        $ordensCriadas = Order::where('user_id', $userCode)->orderBy('id', 'DESC');

        if (!empty($user)) {
            $changeBonus = 'balance';
            $bet = sprintf('%0.2f', $betMoney);
            $winFormated = sprintf('%0.2f', $winMoney);

            Log::debug('DEBUG BET:' . json_encode([$bet, $winFormated]));

            /// deduz o saldo apostado
            if ($wallet->balance_bonus >= $bet) {
                Log::debug('RETIROU DO SALDO BONUS:' . json_encode([$bet, $winFormated]));
                $wallet->decrement('balance_bonus', $bet); /// retira do bonus
                $changeBonus = 'balance_bonus'; /// define o tipo de transação
            } elseif ($wallet->balance >= $bet) {
                Log::debug('RETIROU DO SALDO BALANCE:' . json_encode([$bet, $winFormated]));
                $wallet->decrement('balance', $bet); /// retira do saldo depositado
                $changeBonus = 'balance'; /// define o tipo de transação
            } elseif ($wallet->balance_withdrawal >= $bet) {
                Log::debug('RETIROU DO SALDO SAQUE:' . json_encode([$bet, $winFormated]));
                $wallet->decrement('balance_withdrawal', $bet); /// retira do saldo liberado pra saque
                $changeBonus = 'balance_withdrawal'; /// define o tipo de transação
            } elseif (self::getBalanceClone($userCode) >= $bet) {
                Log::debug('ZEROU SALDO:' . json_encode([$bet, $winFormated]));
                $balanceBet = 0;
                $remainingBet = 0;

                if ($wallet->balance > 0) {
                    $balanceBet = self::getBalanceClone($userCode);
                    $wallet->decrement('balance', self::getBalanceClone($userCode));
                }

                if ($wallet->balance_withdrawal > 0) {
                    $remainingBet = ($bet - $balanceBet);
                    if ($wallet->balance_withdrawal >= $remainingBet) {
                        $wallet->decrement('balance_withdrawal', $remainingBet);
                    }
                }
            } else {
                Log::debug('SEM SALDO:' . json_encode([$bet, $winFormated]));

                return response()->json([
                    'error_code' => "INSUFFICIENT_FUNDS",
                    'error_description' => "User balance is not enough"
                ], 200);
            }

            if ($changeBonus == 'balance_bonus') {
                if ($wallet->balance_bonus_rollover > 0) {
                    $wallet->decrement('balance_bonus_rollover', $bet);
                } else {
                    /// caso contrario define como zero.
                    $wallet->update(['balance_bonus_rollover' => 0]);
                }
            } else {

                if ($wallet->balance_deposit_rollover > 0) {
                    $wallet->decrement('balance_deposit_rollover', $bet);
                } else {
                    /// caso contrario define como zero.
                    $wallet->update(['balance_deposit_rollover' => 0]);
                }
            }

            Log::debug('SALDO DEPOIS DA BET:' . json_encode([self::getBalanceClone($userCode)]));

            //add saldo
            //$wallet->increment($changeBonus, $winFormated);

            if ($winFormated >= $bet) {
                Log::debug('ELE DEU WIN');
                $typeAction = 'win';

                $checkTransactionExist = Order::where('transaction_id', $txnId)->first();
                $transaction = self::CreateTransactionsClone($userCode, time(), $txnId, $typeAction, $changeBonus, $winFormated, 'pgclone', $gameCode, $gameCode);

                if ($transaction && $checkTransactionExist == null) {
                    /// salvar transação GGR
                    GGRGames::create([
                        'user_id' => $userCode,
                        'provider' => $providerCode,
                        'game' => $gameCode,
                        'balance_bet' => $bet,
                        'balance_win' => $winFormated,
                        'currency' => $wallet->currency
                    ]);

                    /// pagar afiliado
                    Helper::generateGameHistory($userCode, $typeAction, $winFormated, $bet, $changeBonus, $txnId);

                    Log::debug('SALDO DEPOIS DO WIN:' . json_encode([self::getBalanceClone($userCode)]));
                    return response()->json([
                        'status' => 1,
                        'user_balance' => self::getBalanceClone($userCode)
                    ]);
                }
            } else if ($winFormated < $bet) {
                Log::debug('ELE DEU LOSS');

                $typeAction  = 'bet';
                /// criar uma transação
                $checkTransactionExist = Order::where('transaction_id', $txnId)->first();
                $checkTransaction = self::CreateTransactionsClone($userCode, time(), $txnId, $typeAction, $changeBonus, $bet, 'pgclone', $gameCode, $gameCode);
                if ($checkTransaction && $checkTransactionExist == null) {
                    //Log::debug('DEBUG CRIANDO TRANSACAO:' . json_encode($checkTransaction));
                    //\DB::table('debug')->insert(['text' => json_encode([$userCode, time(), $txnId, $typeAction, $changeBonus, $bet, 'fivers', $gameCode, $gameCode])]);
                    

                    //Log::debug('DEBUG SALVA GGR:' . json_encode([$user->id, $typeAction, $winMoney, $bet, $changeBonus, $checkTransaction->transaction_id]));
                    /// salvar transação GGR
                    GGRGames::create([
                        'user_id' => $userCode,
                        'provider' => $providerCode,
                        'game' => $gameCode,
                        'balance_bet' => $bet,
                        'balance_win' => $winFormated,
                        'currency' => $wallet->currency
                    ]);

                    //Helper::lossRollover($wallet, $bet);
                    Helper::generateGameHistory($userCode, $typeAction, $winFormated, $bet, $changeBonus, $checkTransaction->transaction_id);

                    Log::debug('SALDO DEPOIS DO LOSS:' . json_encode([self::getBalanceClone($userCode)]));
                    return response()->json([
                        'status' => 1,
                        'user_balance' => self::getBalanceClone($userCode)
                    ]);
                }
            } else {
                return response()->json([
                    'status' => 1,
                    'user_balance' => self::getBalanceClone($userCode)
                ]);
            }
        } else {
            return response()->json([
                'status' => 1,
                'user_balance' => self::getBalanceClone($userCode)
            ]);
        }
    }


    private static function GameCallbackClone($request)
    {
        $data = $request->all();
        Log::debug('GAMECALLBACK ' . json_encode($data));
        Log::debug('ID ' . json_encode($data['user_code']));

        $wallet = Wallet::where('user_id', $data['user_code'])->where('active', 1)->first();
        return self::ProcessPlayClone($wallet, $data['user_code'], $data['slot']['txn_id'], $data['slot']['bet'], $data['slot']['win'], $data['slot']['game_code'], $data['slot']['provider_code']);
    }

    private static function MoneyCallbackClone($request)
    {
        $data = $request->all();
        Log::debug('MONEY ' . json_encode($data));

        $transaction = Order::where('transaction_id', $data['txn_id'])->first();
        $wallet = Wallet::where('user_id', $transaction->user_id)->first();

        if (!empty($transaction) && !empty($wallet)) {
        }

        return response()->json([
            'status' => 1,
            'user_balance' => self::getBalanceClone($transaction->user_id)
        ]);
    }

    private static function CreateTransactionsClone($playerId, $betReferenceNum, $transactionID, $type, $changeBonus, $amount, $providers, $game, $pn)
    {

        $order = Order::create([
            'user_id'       => $playerId,
            'session_id'    => $betReferenceNum,
            'transaction_id' => $transactionID,
            'type'          => $type,
            'type_money'    => $changeBonus,
            'amount'        => $amount,
            'providers'     => $providers,
            'game'          => $game,
            'game_uuid'     => $pn,
            'round_id'      => 1,
        ]);

        if ($order) {
            return $order;
        }

        return false;
    }
}
