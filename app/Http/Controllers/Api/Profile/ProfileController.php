<?php

namespace App\Http\Controllers\Api\Profile;

use App\Http\Controllers\Controller;
use App\Models\Deposit;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rules;
use App\Models\User;

class ProfileController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $totalEarnings = Order::where('user_id', auth('api')->id())->where('type', 'win')->sum('amount');
        $totalBets = Order::where('user_id', auth('api')->id())->where('type', 'bet')->count();
        $sumBets = Order::where('user_id', auth('api')->id())->where('type', 'bet')->sum('amount');

        return response()->json([
            'status' => true,
            'user' => auth('api')->user(),
            'totalEarnings' => \Helper::amountFormatDecimal($totalEarnings),
            'totalBets' => \Helper::amountFormatDecimal($totalBets),
            'sumBets' => $sumBets,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function updateName(Request $request)
    {
        $rules = [
            'name' => 'required',
        ];

        $validator = \Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        if (auth('api')->user()->update(['name' => $request->name])) {
            return response()->json(['status' => true, 'message' => trans('Name was updated successfully')]);
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function uploadAvatar(Request $request)
    {
        $rules = [
            'avatar' => ['required', 'image', 'mimes:jpg,png,jpeg'],
        ];

        $validator = \Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $avatar = \Helper::upload($request->avatar)['path'];
        if (auth('api')->user()->update(['avatar' => $avatar])) {
            return response()->json(['status' => true, 'message' => trans('Avatar has been updated successfully')]);
        }
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function updateLanguage(Request $request)
    {
        if (auth('api')->check()) {
            $user = auth('api')->user();

            $user->language = $request->input('language');
            $user->save();

            return response()->json(['message' => 'Idioma atualizado com sucesso']);
        }
        return response()->json(['message' => 'Idioma atualizado com sucesso, mas com dados salvo na sessão, faça login para salvar em seu perfil']);
    }

    /**
     * @return \Illuminate\Http\JsonResponse
     */
    public function getLanguage(Request $request)
    {
        $browserLanguages = $request->getLanguages();

        $preferredLanguage = $browserLanguages[0] ?? 'en';
        if (auth('api')->check()) {
            return response()->json(['language' => auth('api')->user()->language]);
        }

        return response()->json(['language' => $preferredLanguage]);
    }

    public function updateFacebookId(Request $request)
    {
        $rules = [
            'facebook_id' => 'required',
        ];

        $validator = \Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        if (auth('api')->user()->update(['facebook_id' => $request->facebook_id])) {
            return response()->json(['status' => true, 'message' => trans('Name was updated successfully')]);
        }
    }

    /**
     * Update WhatsApp ID.
     */
    public function updateWhatsappId(Request $request)
    {
        $rules = [
            'whatsapp_id' => 'required',
        ];

        $validator = \Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        if (auth('api')->user()->update(['whatsapp_id' => $request->whatsapp_id])) {
            return response()->json(['status' => true, 'message' => trans('Name was updated successfully')]);
        }
    }

    /**
     * Update Telegram ID.
     */
    public function updateTelegramId(Request $request)
    {
        $rules = [
            'telegram_id' => 'required',
        ];

        $validator = \Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        if (auth('api')->user()->update(['telegram_id' => $request->telegram_id])) {
            return response()->json(['status' => true, 'message' => trans('Name was updated successfully')]);
        }
    }

    /**
     * Update Aniversário.
     */
    public function updateAniversario(Request $request)
    {
        $rules = [
            'aniversario' => 'required',
        ];

        $validator = \Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        if (auth('api')->user()->update(['aniversario' => $request->aniversario])) {
            return response()->json(['status' => true, 'message' => trans('Name was updated successfully')]);
        }
    }
}

