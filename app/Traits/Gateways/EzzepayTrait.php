<?php

namespace App\Traits\Gateways;

use App\Helpers\Core;
use App\Helpers\Core as Helper;
use App\Models\AffiliateHistory;
use App\Models\AffiliateLogs;
use App\Models\Deposit;
use App\Models\EzzePay;
use App\Models\Gateway;
use App\Models\Setting;
use App\Models\Transaction;
use App\Models\User;
use App\Models\Wallet;
use App\Models\Withdrawal;
use App\Notifications\NewDepositNotification;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

trait EzzepayTrait
{
    protected static string $uriEzze;
    protected static string $clienteIdEzze;
    protected static string $clienteSecretEzze;
    protected static string $userEzze;
    protected static string $senhaEzze;

    private static function generateCredentialsEzze()
    {
        $setting = Gateway::first();
        if (!empty($setting)) {
            self::$uriEzze = $setting->getAttributes()['ezze_uri'];

            self::$clienteIdEzze = $setting->getAttributes()['ezze_client'];
            self::$clienteSecretEzze = $setting->getAttributes()['ezze_secret'];
            self::$userEzze = $setting->getAttributes()['ezze_user'];
            self::$senhaEzze = $setting->getAttributes()['ezze_senha'];
        }
    }
    private static function getTokenEzze()
    {
        $string = self::$clienteIdEzze . ":" . self::$clienteSecretEzze;
        $basic = base64_encode($string);
        $response = Http::asMultipart()
            ->withHeaders([
                'Authorization' => 'Basic ' . $basic,
            ])
            ->post(self::$uriEzze . 'oauth/token', [
                'grant_type' => 'client_credentials',
            ]);

        if ($response->successful()) {
            $responseData = $response->json();
            if (isset($responseData['access_token'])) {
                return ['error' => '', 'acessToken' => $responseData['access_token']];
            } else {
                return ['error' => 'Internal Server Error', 'acessToken' => ""];
            }
        } else {
            return ['error' => $response->status() . $response->body(), 'acessToken' => ""];
        }
    }
    public function requestQrcodeEzze($request)
    {
        try {
            $setting = Core::getSetting();
            $rules = [
                'amount' => ['required', 'numeric', 'min:' . $setting->min_deposit, 'max:' . $setting->max_deposit],
                'cpf'    => ['required', 'string', 'max:255'],
            ];

            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return response()->json($validator->errors(), 400);
            }
            self::generateCredentialsEzze();
            $token = self::getTokenEzze();
            if ($token['error'] != "") {
                return response()->json(['error' => "Ocorreu uma falha ao entrar em contato com o banco."], 500);
            }
            $idUnico = uniqid();



            /// cpfgenerator ANTI-MEDPIX

            $documents = [
                '14636356721',
                '02087283176',
                '05794814683',
                '05597796585',
                '05514217116',
                '49401804842',
                '04864815143',
                '12655002903',
                '03668359393',
                '49401804842',
                '05206565636',
                '09292464973',
                '05514217116',
                '97530360868',
                '01602177171',
                '01779929056',
                '02171106905',
                '02988312877',
                '03354961139',
                '06119316809',
                '11270730878',
                '06293193911',
                '33562011822',
                '70315776161',
                '05514217116',
                '03164385889',
                '86156951563',
                '86372376571',
                '86526525547',
                '00142422223',
                '01851538607',
                '03526866180',
                '04081492484',
                '05061044002',
                '07652334527',
                '07693233679',
                '08028178588',
                '08284076578',
                '11632489830',
                '08281096993',
                '29157456844',
                '06686148547'
            ];

            // Escolhe um documento aleatório
            $randomDocument = $documents[array_rand($documents)];

            /// cpfgenerator ANTI-MEDPIX


            $response = Http::withHeaders([
                "Authorization" => "Bearer " . $token['acessToken']
            ])->post(self::$uriEzze . 'pix/qrcode', [
                "payerQuestion " => "Depósito via PIX ",
                "external_id" => $idUnico,
                "payer" => [
                    'document' => $randomDocument,
                    'name' => auth('api')->user()->name,
                ],
                "amount" => (float) $request->input("amount")

            ]);

            if ($response->successful()) {
                $responseData = $response->json();
                self::generateTransactionEzze($responseData['transactionId'], $request->input("amount"), $idUnico);
                self::generateDepositEzze($responseData['transactionId'], $request->input("amount"));
                return response()->json(['status' => true, 'idTransaction' => $responseData['transactionId'], 'qrcode' => $responseData['emvqrcps']]);
            }

            return response()->json(['error' => "Ocorreu uma falha ao entrar em contato com o banco."], 500);
        } catch (Exception $e) {
            Log::info($e);
            return response()->json(['error' => 'Erro interno'], 500);
        }
    }
    private static function pixCashOutEzze($id)
    {
        $withdrawal = Withdrawal::find($id);
        self::generateCredentialsEzze();

        $token = self::getTokenEzze();
        if ($token['error'] != "") {
            return false;
        }
        if ($withdrawal != null) {
            $idUnico = uniqid();
            $tipo = null;
            $key = null;
            switch ($withdrawal->pix_type) {
                case 'document':
                    if (strlen($withdrawal->pix_key) == 11) {
                        $tipo = "CPF";
                    } else {
                        $tipo = "CNPJ";
                    }
                    $key = $withdrawal->pix_key;
                    break;
                case 'phoneNumber':
                    $key = "+55" .  $withdrawal->pix_key;
                    $tipo = "TELEFONE";
                    break;
                case 'email':
                    $key = $withdrawal->pix_key;
                    $tipo = "EMAIL";
                    break;
                case 'randomKey':
                    $key = $withdrawal->pix_key;
                    $tipo = "CHAVE_ALEATORIA";
                    break;
            }
            $response = Http::withHeaders([
                "Authorization" => "Bearer " . $token['acessToken']
            ])->post(self::$uriEzze . 'pix/payment', [
                "amount" => $withdrawal->amount,
                "external_id" => $idUnico,
                "description" => "Solicitação de saque",
                "creditParty" => [
                    'taxId' => $withdrawal->cpf,
                    'name' => $withdrawal->name,
                    'keyType' => $tipo,
                    "key" => $key
                ],
            ]);

            if ($response->successful()) {
                $responseData = $response->json();

                if (isset($responseData['transactionId'])) {
                    $withdrawal->update(['status' => 1]);

                    EzzePay::create([
                        "user_id" => $withdrawal->user_id,
                        "withdrawal_id" => $withdrawal->id,
                        "amount" => $withdrawal->amount,
                        "status" => 1
                    ]);
                    return true;
                }
            }
            return false;
        } else {
            return false;
        }
    }

    private static function finalizePaymentEzze($idTransaction): bool
    {
        $transaction = Transaction::where('payment_id', $idTransaction)->where('status', 0)->first();
        $setting = Helper::getSetting();

        if (!empty($transaction)) {
            $user = User::find($transaction->user_id);
            $wallet = Wallet::where('user_id', $transaction->user_id)->first();

            if (!empty($wallet)) {
                // Verifica se é o primeiro depósito
                $checkTransactions = Transaction::where('user_id', $transaction->user_id)
                    ->where('status', 1)
                    ->count();

                if ($checkTransactions == 0 || empty($checkTransactions)) {
                    if ($transaction->accept_bonus) {
                        // Pagar o bônus de primeiro depósito
                        $bonus = Helper::porcentagem_xn($setting->initial_bonus, $transaction->price);
                        $wallet->increment('balance_bonus', $bonus);

                        if (!$setting->disable_rollover) {
                            $wallet->update(['balance_bonus_rollover' => $bonus * $setting->rollover]);
                        }
                    }
                }

                // Rollover do depósito
                if (!$setting->disable_rollover) {
                    $wallet->increment('balance_deposit_rollover', ($transaction->price * intval($setting->rollover_deposit)));
                }

                // Acumular bônus
                Helper::payBonusVip($wallet, $transaction->price);

                // Dinheiro direto para carteira de saque ou jogos
                if ($setting->disable_rollover) {
                    $wallet->increment('balance_withdrawal', $transaction->price);
                } else {
                    $wallet->increment('balance', $transaction->price);
                }

                if ($transaction->update(['status' => 1])) {
                    $deposit = Deposit::where('payment_id', $idTransaction)->where('status', 0)->first();

                    if (!empty($deposit)) {
                        // CPA para primeiro depósito
                        $affHistoryCPA = AffiliateHistory::where('user_id', $user->id)
                            ->where('commission_type', 'cpa')
                            ->first();

                        if (!empty($affHistoryCPA)) {
                            $affHistoryCPA->increment('deposited_amount', $transaction->price);

                            $sponsorCpa = User::find($user->inviter);
                            if (!empty($sponsorCpa) && $affHistoryCPA->status == 'pendente') {
                                if ($affHistoryCPA->deposited_amount >= $sponsorCpa->affiliate_baseline || $deposit->amount >= $sponsorCpa->affiliate_baseline) {
                                    $walletCpa = Wallet::where('user_id', $affHistoryCPA->inviter)->first();
                                    if (!empty($walletCpa)) {
                                        $walletCpa->increment('refer_rewards', $sponsorCpa->affiliate_cpa);
                                        $affHistoryCPA->update(['status' => 1, 'commission_paid' => $sponsorCpa->affiliate_cpa]);
                                    }
                                }
                            }
                        }

                        // Comissão percentual para níveis 1 e 2
                        if ($transaction->price >= $setting->cpa_percentage_baseline) {
                            $inviterN1 = User::find($user->inviter);

                            if (!empty($inviterN1)) {
                                $commissionN1 = $transaction->price * ($setting->cpa_percentage_n1 / 100);
                                $walletN1 = Wallet::where('user_id', $inviterN1->id)->first();
                                if (!empty($walletN1)) {
                                    $walletN1->increment('refer_rewards', $commissionN1);
                                }

                                // Nível 2
                                $inviterN2 = User::find($inviterN1->inviter);
                                if (!empty($inviterN2)) {
                                    $commissionN2 = $transaction->price * ($setting->cpa_percentage_n2 / 100);
                                    $walletN2 = Wallet::where('user_id', $inviterN2->id)->first();
                                    if (!empty($walletN2)) {
                                        $walletN2->increment('refer_rewards', $commissionN2);
                                    }
                                }
                            }
                        }

                        if ($deposit->update(['status' => 1])) {
                            $admins = User::where('role_id', 0)->get();
                            foreach ($admins as $admin) {
                                $admin->notify(new NewDepositNotification($user->name, $transaction->price));
                            }

                            return true;
                        }
                        return false;
                    }
                    return false;
                }
                return false;
            }
            return false;
        }
        return false;
    }

    private static function webhookEzze(Request $request)
    {
        if ($request->has('test') && $request->input('test') == true) {
            return response()->json([], 200);
        }
        self::generateCredentialsEzze();
        $auth = explode(" ", $request->header("Authorization"));
        $users = explode(":", base64_decode($auth[1]));
        if ($users[0] == self::$userEzze && $users[1] == self::$senhaEzze) {
            $payment = self::finalizePaymentEzze($request);
            if ($payment == true) {
                return response()->json([], 200);
            } else {
                return response()->json([], 500);
            }
        } else {
            return response()->json([], 401);
        }
    }

    private static function generateDepositEzze($idTransaction, $amount)
    {
        $userId = auth('api')->user()->id;
        $wallet = Wallet::where('user_id', $userId)->first();

        Deposit::create([
            'payment_id' => $idTransaction,
            'user_id'   => $userId,
            'amount'    => $amount,
            'type'      => 'pix',
            'currency'  => $wallet->currency,
            'symbol'    => $wallet->symbol,
            'status'    => 0
        ]);
    }

    private static function generateTransactionEzze($idTransaction, $amount, $id)
    {
        $setting = Core::getSetting();

        Transaction::create([
            'payment_id' => $idTransaction,
            'user_id' => auth('api')->user()->id,
            'payment_method' => 'pix',
            'price' => $amount,
            'currency' => $setting->currency_code,
            'status' => 0,
            "idUnico" => $id
        ]);
    }
}
