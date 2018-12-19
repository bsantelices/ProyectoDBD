<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Vuelo extends Model
{
    public function asiento(){
    	return $this->hasMany(Asiento::class,'asiento_id');
    }
    public function paquete()
    {
        return $this->belongsTo(Paquete::class,'paquete_id');
    }	
    public function reserva()
    {
        return $this->belongsToMany(Reserva::class,'reserva_id');
    }	

    protected $fillable = [
        'tipo_vuelo', 'precio', 'numero_escala','cantidad_equipaje','fecha_partida','fecha_regreso','hora_partida','hora_regreso',
    ];    
}
