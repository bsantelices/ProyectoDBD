<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Asiento extends Model
{
    public function vuelo(){
    	return $this->belongs(Vuelo::class,'vuelo_id');
    }
    public function avion(){
    	return $this->belongs(Avion::class,'avion_id');
    }
    protected $fillable = [
    'numero_asiento','tipo_asiento','disponibilidad',
    ];
}
