<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Location;

class Flight extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'location_start',
        'location_end',
        'type',
        'luggageCapacity',
        'airport_id',
        'plane_id',
        'go_at',
        'return_at',
        'value'
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

    /**
     * Get the locationStart record associated with the flight.
     */
    public function locationStart()
    {
        return Location::find($this->location_start);
    }

    /**
     * Get the locationEnd record associated with the flight.
     */
    public function locationEnd()
    {
        return Location::find($this->location_end);
    }
}
