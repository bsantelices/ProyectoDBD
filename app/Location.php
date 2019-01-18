<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Location extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'coordinates',
        'city',
        'country',
        'street',
        'houseCode',
        'postalCode'
    ];

    /**
     * Get the airport record associated with the location.
     */
    public function airport()
    {
        return $this->hasOne(Airport::class);
    }

    /**
     * Get the hotel record associated with the location.
     */
    public function hotel()
    {
        return $this->hasOne(Hotel::class);
    }
}
