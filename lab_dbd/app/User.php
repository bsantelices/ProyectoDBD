<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{

    public function rol()
    {
        return $this->belongsToMany(Rol::class,'rol_id');
    }
    public function auditoria()
    {
        return $this->hasOne(Auditoria::class,'auditoria_id');
    }
    public function reserva()
    {
        return $this->hasMany(Reserva::class,'reserva_id');
    }

    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    
    protected $fillable = [
        'nombre','fondos', 'email', 'password','rut','dni_pasaporte','nombre_cuenta',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];
}
