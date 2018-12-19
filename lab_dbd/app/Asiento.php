<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Asiento extends Model
{
    public function vuelo(){
    	return $this->belongsTo(Vuelo::class,'vuelo_id');
    }
    public function avion(){
    	return $this->belongsTo(Avion::class,'avion_id');
    }
    protected $fillable = [
    'numero_asiento','tipo_asiento','disponibilidad',
    ];
}
