<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Seguro extends Model
{
    protected $fillable = [
        'fecha_inicio','fecha_termino','costo','tipo_seguro',
    ];  	
}
