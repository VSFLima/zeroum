<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class AffiliateRevCpa extends Model
{
    // Outros métodos...

    public function affiliateHistories(): HasMany
    {
        return $this->hasMany(AffiliateHistory::class, 'affiliate_rev_cpa_id');
    }
}
