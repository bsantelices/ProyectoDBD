<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Reserva extends Model
{
    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }	
    public function metodo_pago()
    {
        return $this->belongsTo(Metodo_pago::class,'metodo_pago_id');
    }	
    public function seguro()
    {
        return $this->belongsToMany(Seguro::class,'seguro_id');
    }	
    public function vehiculo()
    {
        return $this->belongsToMany(Vehiculo::class,'vehiculo_id');
    }	

    public function habitacion()
    {
        return $this->belongsToMany(Habitacion::class,'habitacion_id');
    }	

    public function vuelo()
    {
        return $this->belongsToMany(Vuelo::class,'vuelo_id');
    }	

    public function paquete()
    {
        return $this->belongsToMany(Paquete::class,'paquete_id');
    }	

    protected $fillable = [
        'monto','descripcion','fecha_reserva',
    ];
}