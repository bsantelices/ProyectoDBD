<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Vuelo extends Model
{
    public function asiento(){
    	return $this->hasMany(Asiento::class,'asiento_id');
    }
    protected $fillable = [
        'tipo_vuelo', 'precio', 'numero_escala','cantidad_equipaje','fecha_partida','fecha_regreso','hora_partida','hora_regreso',
    ];    
}
