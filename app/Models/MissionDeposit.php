<?php

// app/Models/MissionDeposit.php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MissionDeposit extends Model
{
    use HasFactory;

    protected $table = 'mission_deposit';

    protected $fillable = [
        'bonus_amount',
        'description',
        'name_mission',
        'deposit_acumulated_necessario',
    ];

    public function users()
    {
        return $this->hasMany(MissionDepositUser::class, 'mission_deposit_id');
    }
}
