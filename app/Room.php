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
        return $this->belongsToMany(Reservation::class);
    }

    /**
     * Get the packages records associated with the room.
     */
    public function packages()
    {
        return $this->belongsToMany(Package::class);
    }

    /**
     * Get the hotel record associated with the room.
     */
    public function hotel()
    {
        return $this->belongsTo(Hotel::class);
    }

    public function scopeState($query, $state)
    {
        if($state)
        {
            return $query->where('state','=',$state);
        }
    }

    public function scopeAdultCapacity($query, $adultCapacity)
    {
        if($adultCapacity)
        {
            return $query->where('adultCapacity','>=',$adultCapacity);
        }
    }

    public function scopeChildrenCapacity($query, $childrenCapacity)
    {
        if($childrenCapacity)
        {
            return $query->where('childrenCapacity','>=',$childrenCapacity);
        }
    }   

    public function scopeType($query, $type)
    {
        if($type)
        {
            return $query->where('type','=',$type);
        }
    }    

    public function scopeCountry($query, $country)
    {
        if($country)
        {
            return $query->whereHas('hotel',function($query) use ($country)
            {
                $query->whereHas('location',function($query) use ($country)
                {
                    $query->where('country','LIKE',"%$country%");
                });
            });
        }
    }  

    public function scopeCity($query, $city)
    {
        if($city)
        {
            return $query->whereHas('hotel',function($query) use ($city)
            {
                $query->whereHas('location',function($query) use ($city)
                {
                    $query->where('city','LIKE',"%$city%");
                });
            });
        }
    }  



}
