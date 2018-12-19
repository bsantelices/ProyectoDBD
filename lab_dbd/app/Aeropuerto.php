<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Aeropuerto extends Model
{
    public function ubicacion()
    {
        return $this->hasOne(Ubicacion::class,'ubicacion_id');
    }	
    public function avion()
    {
        return $this->hasMany(Avion::class,'avion_id');
    }	
    protected $fillable = [
        'nombre_aeropuerto', 'tipo_aeropuerto',
    ];  
}
