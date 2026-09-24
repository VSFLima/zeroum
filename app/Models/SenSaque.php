<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SenSaque extends Model
{
    use HasFactory;

    protected $table = 'sen_saques';

    protected $fillable = [
        'user_id',
        'valid_saque',
        'created_at',
        'updated_at',
    ];

    // Relacionamento com o usuário (opcional)
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
