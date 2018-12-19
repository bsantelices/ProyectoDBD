<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Auditoria extends Model
{
    public function auditoria()
    {
        return $this->hasOne(User::class,'user_id');
    }
    public function metodo_pago()
    {
        return $this->belongsTo(Metodo_pago::class,'metodo_pago_id');
    }
    protected $fillable = [
        'titulo_auditoria','descripcion_auditoria','fecha_auditoria',
    ];

}
