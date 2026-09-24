<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Hash;

class AproveSaveSetting extends Model
{
    use HasFactory;
    protected $fillable = [
        'approval_password_save',
        'last_request_at',
    ];

    protected $hidden = [
        'approval_password_save',
    ];

    public function setApprovalPasswordAttribute($value)
    {
        $this->attributes['approval_password_save'] = Hash::make($value);
    }

    public function checkPassword($password)
    {
        return Hash::check($password, $this->approval_password);
    }
}
