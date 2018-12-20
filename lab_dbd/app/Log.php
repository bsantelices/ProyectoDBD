<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Log extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'title',
        'description',
        'user_id'
    ];

    /**
     * Get the payment method record associated with the log.
     */
    public function paymentMethod()
    {
        return $this->belongsTo(PaymentMethod::class,'payment_method_id');
    }

    /**
     * Get the user record associated with the log.
     */
    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }
}
