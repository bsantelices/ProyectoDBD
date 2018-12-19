<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Paquete extends Model
{
	protected $fillable = [
        'precio_normal','precio_descuento','descripcion','tipo',
    ];
}
