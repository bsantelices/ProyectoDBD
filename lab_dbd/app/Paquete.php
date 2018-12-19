<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Paquete extends Model
{
	/*
	Falta agregar modelo de descuento.
    public function discount()
    {
        return $this->belongsTo(Discount::class,'discount_id');
    }	
    */
    public function vehiculo()
    {
        return $this->belongsToMany(Vehiculo::class,'vehiculo_id');
    }	
    public function reserva()
    {
        return $this->belongsToMany(Reserva::class,'reserva_id');
    }	

    public function habitacion()
    {
        return $this->belongsToMany(Habitacion::class,'habitacion_id');
    }	
    public function vuelo()
    {
        return $this->hasMany(Vuelo::class,'vuelo_id');
    }	    



	protected $fillable = [
        'precio_normal','precio_descuento','descripcion','tipo',
    ];
}
