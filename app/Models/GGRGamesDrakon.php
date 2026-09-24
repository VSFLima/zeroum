<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class GGRGamesDrakon extends Model
{
    use HasFactory;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'ggr_games_drakon';
    protected $appends = ['dateHumanReadable', 'createdAt'];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id',
        'provider',
        'game',
        'balance_bet',
        'balance_win',
        'currency'
    ];

    /**
     * Get the user that owns the game record.
     *
     * @return BelongsTo
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Get the created at attribute.
     *
     * @return Carbon
     */
    public function getCreatedAtAttribute()
    {
        return Carbon::parse($this->attributes['created_at']);
    }

    /**
     * Get the date in a human-readable format.
     *
     * @return string
     */
    public function getDateHumanReadableAttribute()
    {
        return $this->created_at->diffForHumans();
    }
     public function ggrGame()
    {
        return $this->belongsTo(GGRGames::class, 'game_id'); // Supondo que 'game_id' seja a chave estrangeira
    }
}
