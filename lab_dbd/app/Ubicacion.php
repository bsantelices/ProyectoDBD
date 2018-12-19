<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ubicacion extends Model
{
    public function hotel()
    {
        return $this->hasOne(Hotel::class,'hotel_id');
    }	
    public function aeropuerto()
    {
        return $this->hasOne(Aeropuerto::class,'aeropuerto_id');
    }	

    
    protected $fillable = [
        'latitud','longitud','ciudad','pais','calle','numero_direccion','codigo_postal',
    ];  	
    //
}
