<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Location extends Model
{
    protected $fillable = [
        'coordinates','city','country','street','houseCode','postalCode'
    ];
}
