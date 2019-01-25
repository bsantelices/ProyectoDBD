<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Vehicle extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'capacity',
        'model',
        'brand',
        'patent',
        'availability'
    ];

    /**
     * Get the reservations records associated with the vehicle.
     */
    public function reservations()
    {
        return $this->belongsToMany(Reservations::class);
    }

    /**
     * Get the packages records associated with the vehicle.
     */
    public function packages()
    {
        return $this->belongsToMany(Package::class);
    }
}
