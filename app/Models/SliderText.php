<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SliderText extends Model
{
    use HasFactory;

    protected $table = 'slider_texts';


    public $timestamps = false;  // Desativar timestamps
    protected $fillable = ['message', 'created_at'];
}
