<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'coordinatesStart',
        'coordinatesEnd',
        'type',
        'luggageCapacity',
        'airport_id'
    ];

    /**
     * Get the reservations records associated with the flight.
     */
    public function reservations()
    {
        return $this->belongsToMany(Reservation::class,'reservation_id');
    }

    /**
     * Get the packages records associated with the flight.
     */
    public function packages()
    {
        return $this->belongsToMany(Package::class,'package_id');
    }

    /**
     * Get the seats records associated with the flight.
     */
    public function seats()
    {
        return $this->hasMany(Seat::class,'seat_id');
    }

    /**
     * Get the airport record associated with the flight.
     */
    public function airport()
    {
        return $this->belongsTo(Airport::class,'airport_id');
    }
}
