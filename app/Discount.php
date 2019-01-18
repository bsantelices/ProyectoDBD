<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Discount extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'amount',
        'type',
        'title',
        'description'
    ];

    /**
     * Get the package record associated with the discount.
     */
    public function packages()
    {
        return $this->hasMany(Package::class);
    }
}
