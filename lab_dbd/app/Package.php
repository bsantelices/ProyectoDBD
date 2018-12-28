<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Package extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'value',
        'description',
        'type',
        'discount_id'
    ];

    /**
     * Get the vehicles records associated with the package.
     */
    public function vehicles()
    {
        return $this->belongsToMany(Vehicle::class);
    }

    /**
     * Get the reservations records associated with the package.
     */
    public function reservations()
    {
        return $this->belongsToMany(Reservation::class);
    }

    /**
     * Get the rooms records associated with the package.
     */
    public function rooms()
    {
        return $this->belongsToMany(Room::class);
    }

    /**
     * Get the discount record associated with the package.
     */
    public function discount()
    {
        return $this->belongsTo(Discount::class);
    }

    /**
     * Get the flights records associated with the package.
     */
    public function flights()
    {
        return $this->belongsToMany(Flight::class);
    }
}
