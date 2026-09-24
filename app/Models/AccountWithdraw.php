<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AccountWithdraw extends Model
{
    protected $fillable = ['name', 'pix_type', 'pix_key', 'cpf', 'user_id']; // Inclua user_id aqui
}
