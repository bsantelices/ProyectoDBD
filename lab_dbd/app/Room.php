<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Room extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'value',
        'state',
        'adultCapacity',
        'childrenCapacity',
        'type',
        'hotel_id'
	];

    /**
     * Get the reservations records associated with the room.
     */
    public function reservations()
    {
        return $this->belongsToMany(Reservation::class,'reservation_id');
    }

    /**
     * Get the packages records associated with the room.
     */
    public function packages()
    {
        return $this->belongsToMany(Package::class,'package_id');
    }

    /**
     * Get the hotel record associated with the room.
     */
    public function hotel()
    {
        return $this->belongsTo(Hotel::class,'hotel_id');
    }
}
