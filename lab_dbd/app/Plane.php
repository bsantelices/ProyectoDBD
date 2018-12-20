<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

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
     * Get the airport record associated with the plane.
     */
    public function airport()
    {
        return $this->belongsTo(Airport::class,'airport_id');
    }

    /**
     * Get the seats records associated with the plane.
     */
    public function seats()
    {
        return $this->hasMany(Seat::class,'seat_id');
    }
}
