<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Events\NewPlane;

class Plane extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'brand',
        'capacity',
        'airport_id'
    ];

    /**
     * Execute CreateSeats Event that create seats for the new plane
     */
    public static function boot()
    {
        parent::boot();
        //only when created
        static::created(function($plane) {
            event(new NewPlane($plane));
        });
    }


    /**
     * Get the airport record associated with the plane.
     */
    public function airport()
    {
        return $this->belongsTo(Airport::class);
    }

    /**
     * Get the seats records associated with the plane.
     */
    public function seats()
    {
        return $this->hasMany(Seat::class);
    }

    /**
     * Get the flights records associated with the plane.
     */
    public function flights()
    {
        return $this->hasMany(Flight::class);
    }
}
