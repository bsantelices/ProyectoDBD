<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Seguro extends Model
{
    public function reserva()
    {
        return $this->belongsToMany(Reserva::class,'reserva_id');
    }	
    protected $fillable = [
        'fecha_inicio','fecha_termino','costo','tipo_seguro',
    ];  	
}
