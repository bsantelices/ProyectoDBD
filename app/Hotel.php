<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Events\NewHotel;

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
     * Execute CreateRooms Event that create rooms for the new hotel
     */
    public static function boot()
    {
        parent::boot();
        //only when created
        static::created(function($hotel) {
            event(new NewHotel($hotel));
        });
    }

    /**
     * Get the rooms records associated with the hotel.
     */
    public function rooms()
    {
        return $this->hasMany(Room::class);
    }

    /**
     * Get the location record associated with the hotel.
     */
    public function location()
    {
        return $this->belongsTo(Location::class);
    }
}
