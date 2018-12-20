<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Insurance extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'value',
        'type',
    ];

    /**
     * Get the reservations records associated with the insurance.
     */
    public function reservations()
    {
        return $this->belongsToMany(Reservation::class,'reservation_id');
    }
}
