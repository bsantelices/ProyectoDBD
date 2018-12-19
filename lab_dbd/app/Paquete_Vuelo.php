<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Paquete_Vuelo extends Model
{
    protected $fillable = [
        'monto','descripcion','fecha_reserva',
    ];
}
