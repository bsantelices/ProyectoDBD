<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Metodo_pago extends Model
{
    public function auditoria()
    {
        return $this->hasMany(Auditoria::class,'auditoria_id');
    }	
    public function reserva()
    {
        return $this->hasMany(Reverva::class,'reserva_id');
    }	
	protected $fillable = [
        'tipo_metodo_pago',
    ];
}
