<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Habitacion extends Model
{
    protected $fillable = [
    'nombre','precio_habitacion','calificacion','capacidad_adultos','capacidad_niños','tipo_habitacion','fecha_ingreso','fecha_salida','hora_ingreso','hora_salida',
	];
}
