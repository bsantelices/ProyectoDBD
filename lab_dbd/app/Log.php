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
        'transactionCode',
        'title',
        'description',
        'user_id',
        'payment_method_id'
    ];

    /**
     * Get the payment method record associated with the log.
     */
    public function paymentMethod()
    {
        return $this->belongsTo(PaymentMethod::class);
    }

    /**
     * Get the user record associated with the log.
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
