<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Reserva extends Model
{
	protected $fillable = [
        'monto','descripcion','fecha_compra','hora_compra','correo',
    ];
}
