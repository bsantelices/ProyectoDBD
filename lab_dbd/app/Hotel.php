<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Hotel extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'state',
        'location_id'
    ];

    /**
     * Get the rooms records associated with the hotel.
     */
    public function rooms()
    {
        return $this->hasMany(Room::class,'room_id');
    }

    /**
     * Get the location record associated with the hotel.
     */
    public function location()
    {
        return $this->belongsTo(Location::class,'location_id');
    }
}
