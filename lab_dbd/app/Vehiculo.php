<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Vehiculo extends Model
{
    protected $fillable = [
        'fecha_arriendo', 'fecha_devolucion', 'hora_arriendo','hora_devolucion','capacidad','modelo','marca','patente',
    ];  
}
