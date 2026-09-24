<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ImageController extends Controller
{
    public function getBackgroundImage()
    {
        // Busque o caminho da imagem no banco de dados
        $imagePath = DB::table('imagens')->where('id', 1)->value('img_bg_1');

        return response()->json(['imagePath' => $imagePath]);
    }
}
