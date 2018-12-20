<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Airport extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'names',
        'type',
        'location_id'
    ];

    /**
     * Get the location record associated with the airport.
     *
     * @return Location Object
     */
	public function location()
    {
        return $this->hasOne(Location::class,'location_id');
    }

    /**
     * Get the planes records associated with the airport.
     */
    public function planes()
    {
        return $this->hasMany(Plane::class,'plane_id');
    }

    /**
     * Get the flights records associated with the airport.
     */
    public function flights()
    {
        return $this->hasMany(Flight::class,'flight_id');
    }
}
