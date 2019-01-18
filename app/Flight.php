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
        'airport_id',
        'plane_id'
    ];

    /**
     * Get the reservations records associated with the flight.
     */
    public function reservations()
    {
        return $this->belongsToMany(Reservation::class);
    }

    /**
     * Get the packages records associated with the flight.
     */
    public function packages()
    {
        return $this->belongsToMany(Package::class);
    }

    /**
     * Get the plane record associated with this flight.
     */
    public function plane()
    {
        return $this->belongsTo(Plane::class);
    }

    /**
     * Get the airport record associated with the flight.
     */
    public function airport()
    {
        return $this->belongsTo(Airport::class);
    }
}
