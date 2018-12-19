<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Auditoria extends Model
{
    protected $fillable = [
        'titulo_auditoria','descripcion_auditoria','fecha_auditoria',
    ];

}
