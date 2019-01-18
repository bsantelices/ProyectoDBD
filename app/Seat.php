<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Seat extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'code',
        'type',
        'available',
        'plane_id'
    ];

    /**
     * Get the reservations records associated with the seat.
     */
    public function reservations()
    {
        return $this->belongsToMany(Reservation::class);
    }

    /**
     * Get the plane record associated with the seat.
     */
    public function plane()
    {
        return $this->belongsTo(Plane::class);
    }
}
