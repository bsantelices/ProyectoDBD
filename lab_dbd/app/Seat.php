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
        'flight_id',
        'plane_id'
    ];

    /**
     * Get the reservations records associated with the seat.
     */
    public function reservations()
    {
        return $this->belongsToMany(Reservation::class,'reservation_id');
    }

    /**
     * Get the flight record associated with the seat.
     */
    public function flight()
    {
        return $this->belongsTo(Flight::class,'flight_id');
    }

    /**
     * Get the plane record associated with the seat.
     */
    public function plane()
    {
        return $this->belongsTo(Plane::class,'plane_id');
    }
}
