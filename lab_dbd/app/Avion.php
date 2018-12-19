<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Avion extends Model
{
    public function vuelo(){
    	return $this->belongs(Vuelo::class,'vuelo_id');
    }   

    public function aeropuerto()
    {
        return $this->belongsTo(Aeropuerto::class,'aeropuerto_id');
    }	

    public function asiento()
    {
        return $this->hasMany(Asiento::class,'asiento_id');
    }	
    protected $fillable = [
    'marca','capacidad',
    ]; 
}
