<?php

namespace App\Traits\Providers;

use App\Helpers\Core as Helper;
use App\Models\Game;
use App\Models\GamesKey;
use App\Models\Order;
use App\Models\Provider;
use App\Models\User;
use App\Models\Wallet;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;

set_time_limit(0);

trait PlayConnectTrait
{
    /*** @var string
     */
    public static $apiUriPlayConnect = 'https://playconnectapi.com/api/v1/';

    public static function PlayConnectAuthentication()
    {
        $gateway = GamesKey::first();
        if (!empty($gateway)) {

            $basicToken = base64_encode($gateway->getAttributes()['playconnect_token'] . ':' . $gateway->getAttributes()['playconnect_secret_key']);
            $response = Http::withHeaders([
                'Authorization' => 'Bearer  ' . $basicToken,
            ])->post(self::$apiUriPlayConnect . 'auth/authentication');

            if ($response->successful()) {
                $json = $response->json();

                return $json['access_token'];
            }
            return false;
        }
        return false;
    }

    /*** @return void
     */
    public static function getPlayConnectProvider()
    {
        if ($token = self::PlayConnectAuthentication()) {
            $response = Http::withToken($token)->get(self::$apiUriPlayConnect . 'games/provider');
            if ($response->successful()) {
                $json = $response->json();
                if ($json['status']) {
                    foreach ($json['providers'] as $provider) {

                        $data = [
                            'code' => $provider['code'],
                            'name' => $provider['name'],
                            'rtp' => 90,
                            'status' => 1,
                            'distribution' => 'playconnect',
                        ];

                        $providerCheck = Provider::where('code', $provider['code'])->where('distribution', 'playconnect')->first();
                        if (empty($providerCheck)) {
                            Provider::create($data);
                            echo "provedor salvo com sucesso \n";
                        }
                    }
                }
            }
        }
    }

    /*** @return void
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public static function getPlayConnectGames()
    {


        if ($token = self::PlayConnectAuthentication()) {


            $response = Http::withToken($token)->get(self::$apiUriPlayConnect . 'games/all');

            if ($response->successful()) {
                $json = $response->json();
                if ($json['status'] == "success") {
                    foreach ($json['games'] as $game) {

                        $provider = Provider::where('distribution', 'playconnect')->where('name', $game['provider_game'])->first();
                        if (!empty($provider)) {
                            self::CreateGamePlayConnect($provider, $game);
                        } else {
                            $providerLabel = $game['provider_game'];
                            $providerTitle = $game['provider_game'];

                            $providerCreated = Provider::create([
                                'code' => $providerLabel,
                                'name' => $providerTitle,
                                'rtp' => 98,
                                'status' => 1,
                                'distribution' => 'playconnect',
                            ]);

                            self::CreateGamePlayConnect($providerCreated, $game);
                        }
                    }
                }
            }
        }
    }

    /*** @param $provider
     * @param $game
     * @return void
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    private static function CreateGamePlayConnect($provider, $game)
    {
        $checkGame = Game::where('provider_id', $provider->id)->where('game_code', $game['game_id'])->where('distribution', 'playconnect')->first();
        if (empty($checkGame)) {

            echo "\n";
            print_r($game['game_name']);
            echo "\n";

            if (isset($game['banner']) && !empty($game['banner'])) {
                $image = self::uploadFromUrlPlayConnect($game['banner'], $game['game_name']);
            }

            $data = [
                'provider_id' => $provider->id,
                'game_id' => $game['game_id'],
                'game_code' => $game['game_id'],
                'game_name' => $game['game_name'],
                'technology' => 'html5',
                'distribution' => 'playconnect',
                'rtp' => 95,
                'cover' => $image ?? null,
                'status' => 1,
            ];

            Game::create($data);
            echo "jogo salvo com sucesso \n";
        }
    }

    /*** @param Game $game
     * @return false|mixed
     */
    public function GameLaunchPlayConnect(Game $game)
    {
        if ($token = self::PlayConnectAuthentication()) {

            $gateway = GamesKey::first();

            if (!empty($gateway)) {
                $request = \Illuminate\Support\Facades\Http::withToken($token)
                    ->withQueryParameters([
                        'agent_code' => $gateway->getAttributes()['playconnect_code'],
                        'agent_token' => $gateway->getAttributes()['playconnect_token'],
                        'game_id' => "$game->game_id",
                        'type' => 'CHARGED',
                        'currency' => 'BRL',
                        'lang' => 'pt',
                        'user_id' => auth('api')->user()->id,
                    ])->get(self::$apiUriPlayConnect . 'games/game_launch');

                if ($request->successful()) {
                    $data = $request->json();
                    if (!empty($data['game_url'])) {
                        return $data['game_url'];
                    }
                    return false;
                }
                return false;
            }
            return false;
        }
    }

    public static function BalancePlayConnect()
    {
        if ($token = self::PlayConnectAuthentication()) {

            $gateway = GamesKey::first();

            if (!empty($gateway)) {
                $request = \Illuminate\Support\Facades\Http::withToken($token)
                    ->withQueryParameters([
                        'agent_code' => $gateway->getAttributes()['playconnect_code'],
                        'agent_token' => $gateway->getAttributes()['playconnect_token'],
                    ])->get(self::$apiUriPlayConnect . 'agent/balance');

                if ($request->successful()) {
                    $data = $request->json();
                    if (!empty($data['balance'])) {
                        return $data['balance'];
                    }
                    return 0;
                }
                return 0;
            }
            return 0;
        }
    }


    /*** @param $request
     * @return \Illuminate\Http\JsonResponse|mixed
     */
    public static function WebhooksPlayConnect(Request $request)
    {

        $gateway = GamesKey::first();

        $login = explode('#', $request->login);
        $login = $login[0];

        $user = User::find($login);
        $wallet = Wallet::where('user_id', $user->id)->where('active', 1)->first();
        $balance = $wallet->total_balance;
        $req = $request->all();

        if (isset($req['agent_secret_key'])) {
            if ($req['agent_secret_key'] != $gateway->getAttributes()['playconnect_secret_key']) {
                return response()->json([
                    'status' => 0,
                    'error' => 'NO_BALANCE'
                ], 400);
            }
        }

        if ($req['cmd'] == 'getBalance') {
            return response()->json([
                'status' => 'success',
                'error' => '',
                'login' => $req['login'],
                'balance' => $balance,
            ]);
        }

        $bet = $req['bet'];

        $changeBonus = Helper::DiscountBalance($wallet, $bet);
        if ($changeBonus != 'no_balance') {
            if ($req['cmd'] == 'writeBet') {
                if ($request->bet > 0 && $request->win == 0) {
                    $transactionCreated = self::CreateTransactionPlayConnect($user->id, time(), $request->tradeId, 'check', $changeBonus, $bet, $request->gameId);
                    Helper::generateGameHistory(
                        $wallet->user_id,
                        'bet',
                        0,
                        $request->bet,
                        $transactionCreated->type_money,
                        $transactionCreated->transaction_id
                    );

                } elseif ($request->win > 0) {
                    $transactionCreated = self::CreateTransactionPlayConnect($user->id, time(), $request->tradeId, 'check', $changeBonus, $bet, $request->gameId);
                    Helper::generateGameHistory(
                        $wallet->user_id,
                        'win',
                        $request->win,
                        0,
                        $transactionCreated->type_money,
                        $transactionCreated->transaction_id
                    );
                }

                return response()->json([
                    'status' => 'success',
                    'error' => '',
                    'login' => $req['login'],
                    'balance' => self::GetBalancePlayConnect($user->id),
                ]);
            }
        } else {
            return response()->json([
                'status' => 0,
                'error' => 'NO_BALANCE'
            ], 400);
        }

        return $request->all();
    }

    /*** Create Transactions
     *
     * @param $playerId
     * @param $betReferenceNum
     * @param $transactionID
     * @param $type
     * @param $changeBonus
     * @param $amount
     * @param $game
     * @return false
     */
    private static function CreateTransactionPlayConnect($playerId, $betReferenceNum, $transactionID, $type, $changeBonus, $amount, $game)
    {
        $order = Order::create([
            'user_id' => $playerId,
            'session_id' => $betReferenceNum,
            'transaction_id' => $transactionID,
            'type' => $type,
            'type_money' => $changeBonus,
            'amount' => $amount,
            'providers' => 'playconnect',
            'game' => $game,
            'game_uuid' => $game,
            'round_id' => 1,
        ]);

        if ($order) {
            return $order;
        }

        return false;
    }

    /*** @param $userId
     * @return mixed
     */
    private static function GetBalancePlayConnect($userId)
    {
        $wallet = Wallet::where('user_id', $userId)->where('active', 1)->first();
        return $wallet->total_balance;
    }



    /*** @param $url
     * @return string|null
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    private static function uploadFromUrlPlayConnect($url, $name = null)
    {
        try {
            $client = new \GuzzleHttp\Client();
            $response = $client->get($url);

            if ($response->getStatusCode() === 200) {
                $fileContent = $response->getBody();

                // Extrai o nome do arquivo e a extensão da URL
                $parsedUrl = parse_url($url);
                $pathInfo = pathinfo($parsedUrl['path']);
                //$fileName = $pathInfo['filename'] ?? 'file_' . time(); // Nome do arquivo
                $fileName = $name ?? $pathInfo['filename'];
                $extension = $pathInfo['extension'] ?? 'png'; // Extensão do arquivo

                // Monta o nome do arquivo com o prefixo e a extensão
                $fileName = 'playconnect/' . $fileName . '.' . $extension;

                // Salva o arquivo usando o nome extraído da URL
                Storage::disk('public')->put($fileName, $fileContent);

                return $fileName;
            }

            return null;
        } catch (\Exception $e) {
            return null;
        }
    }
}
