<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PaymentMethod extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'type'
    ];

    /**
     * Get the logs records associated with the payment method.
     */
    public function logs()
    {
        return $this->hasMany(Log::class,'log_id');
    }

    /**
     * Get the reservations records associated with the payment method.
     */
    public function reservations()
    {
        return $this->hasMany(Reservations::class,'reservation_id');
    }
}
