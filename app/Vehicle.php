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

    public function scopeCapacity($query, $capacity){
        if($capacity){
            return $query->where('capacity','=',$capacity);
        }
    }
    public function scopeBrand($query, $brand){
        if($brand){
            return $query->where('brand','=',$brand);
        }
    }
    public function scopeModel($query, $model){
        if($model){
            return $query->where('model','=',$model);
        }
    }
    public function scopeAvailability($query){
        return $query->where('availability','=',true);
    }
}
