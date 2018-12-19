<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Aeropuerto extends Model
{
    protected $fillable = [
        'nombre_aeropuerto', 'tipo_aeropuerto',
    ];  
}
