<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Habitacion extends Model
{
    public function reserva()
    {
        return $this->belongsToMany(Reserva::class,'reserva_id');
    }	
    public function paquete()
    {
        return $this->belongsToMany(Reserva::class,'paquete_id');
    }	
        public function hotel()
    {
        return $this->belongsTo(Hotel::class,'hotel_id');
    }	



    protected $fillable = [
    'nombre','precio_habitacion','calificacion','capacidad_adultos','capacidad_niños','tipo_habitacion','fecha_ingreso','fecha_salida','hora_ingreso','hora_salida',
	];
}
