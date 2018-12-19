<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Hotel extends Model
{

    public function habitacion()
    {
        return $this->hasMany(Habitacion::class,'habitacion_id');
    }	

    public function ubicacion()
    {
        return $this->hasOne(Ubicacion::class,'ubicacion_id');
    }	

        protected $fillable = [
        'nombre_hotel','calificacion',
    ];
}
