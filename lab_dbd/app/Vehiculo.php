<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Vehiculo extends Model
{
    public function reserva()
    {
        return $this->belongsToMany(Reserva::class,'reserva_id');
    }	
    public function paquete()
    {
        return $this->belongsToMany(Paquete::class,'paquete_id');
    }	

    protected $fillable = [
        'fecha_arriendo', 'fecha_devolucion', 'hora_arriendo','hora_devolucion','capacidad','modelo','marca','patente',
    ];  
}
