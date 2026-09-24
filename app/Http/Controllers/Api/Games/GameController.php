<?php

namespace App\Http\Controllers\Api\Games;

use App\Http\Controllers\Controller;
use App\Models\Game;
use App\Models\GameFavorite;
use App\Models\GameLike;
use App\Models\GamesKey;
use App\Models\Gateway;
use App\Models\Provider;
use App\Models\Wallet;
use App\Traits\Providers\EvergameTrait;
use app\Traits\Providers\DrakonTrait;
use App\Traits\Providers\WorldSlotTrait;
use App\Traits\Providers\PlayConnectTrait;
use App\Traits\Providers\FiversTrait;
//use App\Traits\Providers\PGSoftTrait;
use App\Traits\Providers\PlayGamingTrait;
use App\Traits\Providers\PGClonesTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Helpers\Core as Helper;
use App\Traits\Providers\PlayFiverTrait;
use App\Traits\Providers\PgOnePlayiGamingTrait;

class GameController extends Controller
{
    use
        PgOnePlayiGamingTrait,
        WorldSlotTrait,
        DrakonTrait,
        EvergameTrait,
        FiversTrait,
//        PGSoftTrait,
        PlayGamingTrait,
        PGClonesTrait,
  PlayFiverTrait,
        PlayConnectTrait;


    /**
     * @dev anonymous
     * Display a listing of the resource.
     */
    public function index()
    {
        $providers = Provider::with(['games', 'games.provider'])
            ->whereHas('games')
            ->orderBy('name', 'desc')
            ->where('status', 1)
            ->get();

        return response()->json(['providers' => $providers]);
    }

    /**
     * @dev anonymous
     * @return \Illuminate\Http\JsonResponse
     */
    public function featured()
    {
        $featured_games = Game::with(['provider'])
            ->where('is_featured', 1)
            ->where('status', 1)
            ->get();

        return response()->json(['featured_games' => $featured_games]);
    }
    public function pescaria()
    {
        $pescaria_games = Game::with(['provider'])
            ->where('is_pescaria', 1)
            ->where('status', 1)
            ->get();

        return response()->json(['pescaria_games' => $pescaria_games]);
    }
    public function blockchain()
    {
        $blockchain_games = Game::with(['provider'])
            ->where('is_blockchain', 1)
            ->where('status', 1)
            ->get();

        return response()->json(['blockchain_games' => $blockchain_games]);
    }
    public function influencer()
    {
        $influencer_games = Game::with(['provider'])
            ->where('is_influencer_mode', 1)
            ->where('status', 1)
            ->get();

        return response()->json(['influencer_games' => $influencer_games]);
    }


    /**
     * Source Provider
     *
     * @dev anonymous
     * @param Request $request
     * @param $token
     * @param $action
     * @return \Illuminate\Http\JsonResponse|void
     */
    public function sourceProvider(Request $request, $token, $action)
    {
        $tokenOpen = \Helper::DecToken($token);
        $validEndpoints = ['session', 'icons', 'spin', 'freenum'];

        if (in_array($action, $validEndpoints)) {
            if (isset($tokenOpen['status']) && $tokenOpen['status']) {
                $game = Game::whereStatus(1)->where('game_code', $tokenOpen['game'])->first();
                if (!empty($game)) {
                    $controller = \Helper::createController($game->game_code);

                    switch ($action) {
                        case 'session':
                            return $controller->session($token);
                        case 'spin':
                            return $controller->spin($request, $token);
                        case 'freenum':
                            return $controller->freenum($request, $token);
                        case 'icons':
                            return $controller->icons();
                    }
                }
            }
        } else {
            return response()->json([], 500);
        }
    }

    /**
     * @dev anonymous
     * Store a newly created resource in storage.
     */
    public function toggleFavorite($id)
    {
        if (auth('api')->check()) {
            $checkExist = GameFavorite::where('user_id', auth('api')->id())->where('game_id', $id)->first();
            if (!empty($checkExist)) {
                if ($checkExist->delete()) {
                    return response()->json(['status' => true, 'message' => 'Removido com sucesso']);
                }
            } else {
                $gameFavoriteCreate = GameFavorite::create([
                    'user_id' => auth('api')->id(),
                    'game_id' => $id
                ]);

                if ($gameFavoriteCreate) {
                    return response()->json(['status' => true, 'message' => 'Criado com sucesso']);
                }
            }
        }
    }

    /**
     * @dev anonymous
     * Store a newly created resource in storage.
     */
    public function toggleLike($id)
    {
        if (auth('api')->check()) {
            $checkExist = GameLike::where('user_id', auth('api')->id())->where('game_id', $id)->first();
            if (!empty($checkExist)) {
                if ($checkExist->delete()) {
                    return response()->json(['status' => true, 'message' => 'Removido com sucesso']);
                }
            } else {
                $gameLikeCreate = GameLike::create([
                    'user_id' => auth('api')->id(),
                    'game_id' => $id
                ]);

                if ($gameLikeCreate) {
                    return response()->json(['status' => true, 'message' => 'Criado com sucesso']);
                }
            }
        }
    }

    /**
     * @dev anonymous
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $game = Game::with(['categories', 'provider'])->whereStatus(1)->find($id);
        if (!empty($game)) {
            if (auth('api')->check()) {
                $wallet = Wallet::where('user_id', auth('api')->user()->id)->first();
                if ($wallet->total_balance > 0) {
                    $game->increment('views');

                    $token = \Helper::MakeToken([
                        'id' => auth('api')->user()->id,
                        'game' => $game->game_code
                    ]);

                    switch ($game->distribution) {
                        case 'pgoneplayigaming':
                          $pgoneplayigaming = self::GameLaunchPgOnePlayiGaming($game->provider->code, $game->game_id, 'pt', auth('api')->user()->id);
                          if(isset($pgoneplayigaming['launchUrl'])){
                               return response()->json([
                                   'game'=> $game,
                                   'gameUrl'=> $pgoneplayigaming['launchUrl']
                               ]);
                           } else {
                               return response()->json($pgoneplayigaming);
                           }
                                        case 'play_fiver':
                    $playfiver = self::playFiverLaunch($game->game_id, $game->only_demo);
                    return response()->json([
                        'game' => $game,
                        'gameUrl' => $playfiver['launch_url'],
                        'token' => $token
                    ]);
                        case 'source':
                            return response()->json([
                                'game' => $game,
                                'gameUrl' => url('/originals/' . $game->game_code . '/index.html?token=' . $token),
                                'token' => $token
                            ]);
                        case 'playconnect':
                            $gameLauncher = self::GameLaunchPlayConnect($game);

                            if ($gameLauncher) {
                                return response()->json([
                                    'game' => $game,
                                    'gameUrl' => $gameLauncher,
                                    'token' => $token
                                ]);
                            } else {
                                return response()->json();
                            }
                         case 'pgclone':
                            $cloneLaunch = self::GameLaunchClone($game->provider->code, $game->game_id, 'pt', auth('api')->id());
        
                            if (isset($cloneLaunch['launchUrl'])) {
                                return response()->json([
                                    'game' => $game,
                                    'gameUrl' => $cloneLaunch['launchUrl'],
                                    'token' => $token
                                ]);
                            } else {
                                return response()->json($cloneLaunch);
                            }
                        case 'pgsoft':
                            $pgsoftLaunch = PGSoftTrait::GameLaunchPGSoft($game->provider->code, $game->game_code, 'pt_BR', auth('api')->id());

                            if (isset($pgsoftLaunch['url'])) {
                                return response()->json([
                                    'game' => $game,
                                    'gameUrl' => $pgsoftLaunch['url'],
                                    'token' => $token
                                ]);
                            }

                            return response()->json(['error' => $pgsoftLaunch, 'status' => false], 400);

                        case 'drakon':
                            $gameLauncher = self::GameLaunchDrakon($game);

                            if ($gameLauncher) {
                                return response()->json([
                                    'game' => $game,
                                    'gameUrl' => $gameLauncher,
                                    'token' => $token
                                ]);
                            } else {
                                return response()->json();
                            }
                        case 'venix':
                            $gameLauncher = self::GameLaunchVeniX($game);

                            if ($gameLauncher) {
                                return response()->json([
                                    'game' => $game,
                                    'gameUrl' => $gameLauncher,
                                    'token' => $token
                                ]);
                            } else {
                                return response()->json();
                            }
                        case 'playigaming':
                            $gameLauncher = self::GameLaunchPIG($game);

                            if ($gameLauncher) {
                                return response()->json([
                                    'game' => $game,
                                    'gameUrl' => $gameLauncher,
                                    'token' => $token
                                ]);
                            } else {
                                return response()->json();
                            }
                        case 'playgaming':
                            $gameLauncher = self::LaunchGamePlayGaming($game->game_id);

                            if ($gameLauncher) {
                                return response()->json([
                                    'game' => $game,
                                    'gameUrl' => $gameLauncher,
                                    'token' => $token
                                ]);
                            } else {
                                return response()->json();
                            }
                        case 'salsa':
                            return response()->json([
                                'game' => $game,
                                'gameUrl' => self::playGameSalsa('CHARGED', 'BRL', 'pt', $game->game_id),
                                'token' => $token
                            ]);
                        case 'kagaming':
                            return response()->json([
                                'game' => $game,
                                'gameUrl' => self::GameLaunchKaGaming($game->game_server_url, $game->game_code),
                                'token' => $token
                            ]);
                        case 'evergame':
                            $evergameLaunch = self::GameLaunchEvergame($game->provider->code, $game->game_id, 'pt', auth('api')->id());

                            if (isset($evergameLaunch['launchUrl'])) {
                                // Verifica se deve ser aberto em nova aba
                                if (isset($evergameLaunch['openInNewTab']) && $evergameLaunch['openInNewTab']) {
                                    // Redireciona para a nova URL em uma nova aba
                                    return redirect()->away($evergameLaunch['launchUrl']);
                                } else {
                                    // Retorna a resposta normalmente
                                    return response()->json([
                                        'game' => $game,
                                        'gameUrl' => $evergameLaunch['launchUrl'],
                                        'token' => $token
                                    ]);
                                }
                            } else {
                                return response()->json($evergameLaunch);
                            }
                        case 'vibra_gaming':
                            return response()->json([
                                'game' => $game,
                                'gameUrl' => self::GenerateGameLaunch($game),
                                'token' => $token
                            ]);
                        case 'fivers':
                            $fiversLaunch = self::GameLaunchFivers($game->provider->code, $game->game_id, 'pt', auth('api')->id());

                            if (isset($fiversLaunch['launch_url'])) {
                                return response()->json([
                                    'game' => $game,
                                    'gameUrl' => $fiversLaunch['launch_url'],
                                    'token' => $token
                                ]);
                            }

                            return response()->json(['error' => $fiversLaunch, 'status' => false], 400);
                        case 'games2_api':
                            $games2ApiLaunch = self::GameLaunchGames2($game->provider->code, $game->game_id, 'pt', auth('api')->id());

                            if (isset($games2ApiLaunch['launch_url'])) {
                                return response()->json([
                                    'game' => $game,
                                    'gameUrl' => $games2ApiLaunch['launch_url'],
                                    'token' => $token
                                ]);
                            }

                            return response()->json(['error' => $games2ApiLaunch, 'status' => false], 400);
                        case 'worldslot':
                            $worldslotLaunch = self::GameLaunchWorldSlot($game->provider->code, $game->game_id, 'pt', auth('api')->id());

                            if (isset($worldslotLaunch['launch_url'])) {
                                return response()->json([
                                    'game' => $game,
                                    'gameUrl' => $worldslotLaunch['launch_url'],
                                    'token' => $token
                                ]);
                            }

                            return response()->json(['error' => $worldslotLaunch, 'status' => false], 400);

                    }
                }
                return response()->json(['error' => 'Você precisa ter saldo para jogar', 'status' => false, 'action' => 'deposit'], 200);
            }
            return response()->json(['error' => 'Você precisa tá autenticado para jogar', 'status' => false], 400);
        }
        return response()->json(['error' => '', 'status' => false], 400);
    }

    /**
     * @dev anonymous
     * Show the form for editing the specified resource.
     */
    public function allGames(Request $request)
    {
        $query = Game::query();
        $query->with(['provider', 'categories']);

        if (!empty($request->provider) && $request->provider != 'all') {
            $query->where('provider_id', $request->provider);
        }

        if (!empty($request->category) && $request->category != 'all') {
            $query->whereHas('categories', function ($categoryQuery) use ($request) {
                $categoryQuery->where('slug', $request->category);
            });
        }

        if (isset($request->searchTerm) && !empty($request->searchTerm) && strlen($request->searchTerm) > 2) {
            $query->whereLike(['game_code', 'game_name', 'description', 'distribution', 'provider.name'], $request->searchTerm);
        } else {
            $query->orderBy('views', 'desc');
        }

        $games = $query
            ->where('status', 1)
            ->paginate(30)->appends(request()->query());

        return response()->json(['games' => $games]);
    }

    public function getGamesByProvider(Request $request)
    {
        $providerId = $request->input('provider_id');
        $perPage = $request->input('per_page', 6);
        $games = Game::where('provider_id', $providerId)->where('status', 1)->paginate($perPage);
        return response()->json($games);
    }

    public function webhookPlayIGamingMethod(Request $request)
    {
        return self::WebhookPIG($request);
    }

    public function webhookPlayConnectMethod(Request $request)
    {
        return self::WebhooksPlayConnect($request);
    }
    /**
     * @param Request $request
     * @return mixed
     */
    public function webhookDrakonMethod(Request $request)
    {
        return self::WebhookDrakon($request);
    }
    public function getBalanceCallback(Request $request)
    {
        // \Log::info('getBalanceCallback');
        // \Log::debug($request);
        return PGSoftTrait::getBalancePGSoft($request);
    }

    /**
     * @dev 
     */
    public function betWinCallback(Request $request)
    {
        // \Log::info('betWinCallback');
        // \Log::debug($request);
        return PGSoftTrait::ProcessPlayPGSoft($request);
    }

    /**
     * @dev anonymous
     */
    public function withdrawCallback(Request $request)
    {
        // \Log::info('withdrawCallback');
        // \Log::debug($request);
        // Lógica para lidar com o callback de Withdraw
        return PGSoftTrait::ProcessWithdrawCallbackPGSoft($request);
    }

    /**
     * @dev anonymous 
     */
    public function depositCallback(Request $request)
    {
        // \Log::info('depositCallback');
        // \Log::debug($request);
        // Lógica para lidar com o callback de Deposit
        return PGSoftTrait::ProcessDepositCallbackPGSoft($request);
        ;
    }
    public function rollbackTransactionCallback(Request $request)
    {
        // \Log::info('rollbackTransactionCallback');
        // \Log::debug($request);
        // Lógica para lidar com o callback de RollbackTransaction
        return response()->json(['message' => 'Callback de RollbackTransaction recebido com sucesso']);
    }
    /**
     * @dev anonymous
     * Update the specified resource in storage.
     */
    public function webhookGoldApiMethod(Request $request)
    {
        return self::WebhooksFivers($request);
    }

    /**
     * @dev anonymous
     * Update the specified resource in storage.
     */
    public function webhookUserBalanceMethod(Request $request)
    {
        return self::GetUserBalanceWorldSlot($request);
    }

    /**
     * @dev anonymous
     * Update the specified resource in storage.
     */
    public function webhookGameCallbackMethod(Request $request)
    {
        return self::GameCallbackWorldSlot($request);
    }

    /**
     * @dev anonymous
     * Update the specified resource in storage.
     */
    public function webhookMoneyCallbackMethod(Request $request)
    {
        return self::MoneyCallbackWorldSlot($request);
    }

    /**
     * Webhook Vibra Method
     *
     * @param Request $request
     * @param $parameters
     * @return array|\Illuminate\Http\JsonResponse|null
     */
    public function webhookVibraMethod(Request $request, $parameters)
    {
        return self::WebhookVibra($request, $parameters);
    }

    /**
     * @param Request $request
     * @return null
     */
    public function webhookKaGamingMethod(Request $request)
    {
        return self::WebhookKaGaming($request);
    }

    /**
     * @param Request $request
     * @return null
     */
    public function webhookSalsaMethod(Request $request)
    {
        return self::webhookSalsa($request);
    }

    /**
     * @param Request $request
     * @return mixed
     */
    public function webhookVeniXMethod(Request $request)
    {
        return self::WebhookVeniX($request);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse|null
     */
    public function webhookEvergameMethod(Request $request)
    {
        return self::WebhooksEvergame($request);
    }
   public function webhookGoldApiMethodClone(Request $request)
    {
        return self::WebhooksClones($request);
    }

    public function webhookUserBalanceMethodClone(Request $request)
    {
        Log::debug("Consultando saldo Clone");
        Log::debug($request->all());
        return self::GetUserBalanceClone($request);
    }

    public function webhookGameCallbackMethodClone(Request $request)
    {
        Log::debug("Callback Clone");
        return self::GameCallbackClone($request);
    }

    public function webhookMoneyCallbackMethodClone(Request $request)
    {
        Log::debug("MoneyCallback Clone");
        return self::MoneyCallbackClone($request);
    }


    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse|null
     */
    public function webhookPlayGamingMethod(Request $request)
    {
        return self::WebhooksPlayGaming($request);
    }
      public function webhookPlayFiver(Request $request)
    {
        return self::webhookPlayFiverAPI($request);
    }
     public function webhookPgOnePlayiGaming(Request $request)
    {
        return self::WebhooksPgOnePlayiGaming($request);
    }

}
