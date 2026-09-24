<?php

// app/Models/MissionDepositUser.php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MissionDepositUser extends Model
{
    use HasFactory;

    protected $table = 'mission_deposit_user';

    protected $fillable = [
        'user_id',
        'mission_deposit_id',
        'status',
        'wallet_bonus',
    ];

    public function mission()
    {
        return $this->belongsTo(MissionDeposit::class, 'mission_deposit_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
