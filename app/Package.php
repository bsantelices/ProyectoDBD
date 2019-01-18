<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Events\FillPackage;

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
     * Execute FillPackage Event that asign a vehicle, flight and room for the new package
     */
    public static function boot()
    {
        parent::boot();
        //only when created
        static::created(function($package) {
            event(new FillPackage($package));
        });
    }

    /**
     * Get the vehicles records associated with the package.
     */
    public function vehicles()
    {
        return $this->belongsToMany(Vehicle::class)->withTimestamps();
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
        return $this->belongsToMany(Room::class)->withTimestamps();
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
        return $this->belongsToMany(Flight::class)->withTimestamps();
    }
}
