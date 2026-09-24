<?php

namespace App\Http\Controllers;

use App\Models\SliderText;
use Illuminate\Http\Request;

class SliderTextController extends Controller
{
    public function index()
    {
        try {
            $slidertext = SliderText::all(['id', 'message']);
            return response()->json($slidertext);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Something went wrong'], 500);
        }
    }
}
