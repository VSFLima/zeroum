<?php

namespace App\Http\Controllers\Api\Auth;

use App\Models\SpinRuns;
use App\Models\Setting;
use App\Models\Wallet;
use App\Traits\Affiliates\AffiliateHistoryTrait;
use App\Http\Controllers\Controller;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Support\Str;
use Illuminate\Validation\Rules;
use App\Helpers\Core as Helper;

class AuthController extends Controller
{
    use AffiliateHistoryTrait;

    public function __construct()
    {
        $this->middleware('auth.jwt', ['except' => ['login', 'register', 'submitForgetPassword', 'submitResetPassword']]);
    }

    public function register(Request $request)
    {
        try {
            $setting = \Helper::getSetting();

            $rules = [
                  'name' => 'required|string|unique:users', // Adicionado unique:users para o campo name
    'email' => 'required|email|unique:users',
    'password' => ['required', Rules\Password::min(8)],

            ];

            $validator = \Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return response()->json($validator->errors(), 400);
            }

            $userData = $request->only(['name', 'password', 'email']);

            // Gerar o código de afiliado
            $userData['inviter_code'] = $this->generateAffiliateCode();

            // Criando dados do afiliado
            $userData['affiliate_revenue_share'] = $setting->revshare_percentage;
            $userData['affiliate_cpa'] = $setting->cpa_value;
            $userData['affiliate_baseline'] = $setting->cpa_baseline;
            $userData['affiliate_bau_baseline'] = $setting->cirus_baseline;
            $userData['affiliate_bau_value'] = $setting->cirus_valor;
            $userData['affiliate_bau_aposta'] = $setting->cirus_aposta;

            // Definir o campo `utilizou_bonus_cadastro` como 0 inicialmente
            $userData['utilizou_bonus_cadastro'] = 0;

            if ($user = User::create($userData)) {

                if (isset($request->reference_code) && !empty($request->reference_code)) {
                    $checkAffiliate = User::where('inviter_code', $request->reference_code)->first();
                    if (!empty($checkAffiliate)) {
    $user->update(['inviter' => $checkAffiliate->id]);
    self::saveAffiliateHistory($user);
}

                }

                // Adicionar saldo inicial à carteira do usuário
                $initialBalance = $setting->saldo_ini;
                $wallet = Wallet::firstOrCreate(
                    ['user_id' => $user->id],
                    ['balance' => $initialBalance, 'balance_bonus' => 0]
                );

                if (!$wallet->wasRecentlyCreated) {
                    $wallet->balance_bonus += $initialBalance;
                    $wallet->save();
                }

                // Se foi adicionado saldo inicial, atualizar `utilizou_bonus_cadastro` para 1
                if ($initialBalance > 0) {
                    $user->update(['utilizou_bonus_cadastro' => 1]);
                }

                // Ativar o rollover do saldo inicial, se aplicável
                if ($setting->disable_rollover_cadastro == false) {
                    $wallet->increment('balance_bonus_rollover', ($initialBalance * intval($setting->rollover_cadastro)));
                }

                Helper::initializeMissions($user->id);

                if ($setting->disable_spin) {
                    if (!empty($request->spin_token)) {
                        try {
                            $str = base64_decode($request->spin_token);
                            $obj = json_decode($str);

                            $spin_run = SpinRuns::where([
                                'key' => $obj->signature,
                                'nonce' => $obj->nonce
                            ])->first();

                            $data = $spin_run->prize;
                            $obj = json_decode($data);
                            $value = $obj->value;

                            $wallet->balance_bonus += $value;
                            $wallet->save();
                        } catch (\Exception $e) {
                            return response()->json(['error' => $e->getMessage()], 400);
                        }
                    }
                }

                $credentials = $request->only(['email', 'password']);
                $token = auth('api')->attempt($credentials);
                if (!$token) {
                    return response()->json(['error' => 'Unauthorized'], 401);
                }

                return $this->respondWithToken($token);
            }
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e->getMessage()
            ], 400);
        }
    }


    private function generateAffiliateCode()
    {
        do {
            $code = \Helper::generateCode(10);
            $checkCode = User::where('inviter_code', $code)->first();
        } while ($checkCode);

        return $code;
    }

    public function verify()
    {
        return response()->json(auth('api')->user());
    }

   public function login()
{
    try {
        // Alterar para buscar as credenciais usando 'name' ao invés de 'email'
        $credentials = request(['name', 'password']);

        // Tentar autenticar o usuário com base nas credenciais fornecidas
        if (!$token = auth('api')->attempt($credentials)) {
            return response()->json(['error' => trans('Check credentials')], 400);
        }

        // Se a autenticação for bem-sucedida, retornar o token
        return $this->respondWithToken($token);
    } catch (JWTException $e) {
        return response()->json([
            'error' => 'Could not create token'
        ], 400);
    }
}


    public function me()
    {
        return response()->json(auth('api')->user());
    }

    public function logout()
    {
        auth('api')->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    public function refresh()
    {
        return $this->respondWithToken(auth('api')->refresh());
    }

    public function submitForgetPassword(Request $request)
    {
        $request->validate([
            'email' => 'required|email|exists:users',
        ]);

        $token = Str::random(5);

        $psr = DB::table('password_reset_tokens')->where('email', $request->email)->first();
        if (!empty($psr)) {
            DB::table('password_reset_tokens')->where('email', $request->email)->delete();
        }

        DB::table('password_reset_tokens')->insert([
            'email' => $request->email,
            'token' => $token,
            'created_at' => Carbon::now()
        ]);

        \Mail::send('emails.forget-password', ['token' => $token, 'resetLink' => url('/reset-password/' . $token)], function ($message) use ($request) {
            $message->to($request->email);
            $message->subject('Reset Password');
        });

        return response()->json(['status' => true, 'message' => 'We have e-mailed your password reset link!'], 200);
    }

    public function submitResetPassword(Request $request)
    {
        try {
            $request->validate([
                'email' => 'required|email|exists:users',
                'password' => 'required|string|min:6|confirmed',
                'password_confirmation' => 'required',
                'token' => 'required',
            ]);

            // Verifique se o token existe e se o e-mail associado ao token corresponde ao e-mail fornecido
            $resetToken = DB::table('password_reset_tokens')
                ->where('token', $request->token)
                ->where('email', $request->email)
                ->first();

            if (!empty($resetToken)) {
                // O token existe e o e-mail associado corresponde ao fornecido
                $user = User::where('email', $request->email)->first();
                if (!empty($user)) {
                    // Atualize a senha do usuário
                    if ($user->update(['password' => bcrypt($request->password)])) {
                        // Remova o token após a redefinição da senha
                        DB::table('password_reset_tokens')->where(['token' => $request->token])->delete();
                        return response()->json(['status' => true, 'message' => 'Sua senha foi alterada com sucesso!'], 200);
                    } else {
                        return response()->json(['error' => 'Erro ao atualizar a senha'], 400);
                    }
                } else {
                    return response()->json(['error' => 'Email não é válido!'], 400);
                }
            } else {
                // Token não é válido ou não está associado ao e-mail fornecido
                return response()->json(['error' => 'Token ou e-mail não são válidos!'], 400);
            }
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 400);
        }
    }


    protected function respondWithToken(string $token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'user' => auth('api')->user(),
            'expires_in' => time() + 1
        ]);
    }

}
