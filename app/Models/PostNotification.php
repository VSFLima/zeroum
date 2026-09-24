<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PostNotification extends Model
{
    use HasFactory;

    protected $table = 'post_notifications';


    public $timestamps = false;  // Desativar timestamps
    protected $fillable = ['titulo', 'imagem', 'message', 'created_at'];
}
