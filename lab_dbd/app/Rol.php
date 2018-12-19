<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Rol extends Model
{
    public function user()
    {
        return $this->belongsToMany(User::class,'user_id');
    }
    protected $fillable = [
        'nombre_rol',
    ];
}
