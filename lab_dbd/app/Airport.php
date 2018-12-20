<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Airport extends Model
{
	public function location()
    {
        return $this->hasOne(Location::class,'location_id');
    }	
    public function plane()
    {
        return $this->hasMany(Plane::class,'plane_id');
    }

    public function flight()
    {
        return $this->hasOne(Flight::class,'flight_id');
    }


    protected $fillable = [
        'names','type'
    ];
}
