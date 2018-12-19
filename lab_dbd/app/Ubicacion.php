<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ubicacion extends Model
{
    protected $fillable = [
        'latitud','longitud','ciudad','pais','calle','numero_direccion','codigo_postal',
    ];  	
    //
}
