<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Vuelo extends Model
{
    public function asiento(){
    	return $this->hasMany(Asiento::class,'asiento_id');
    }
}
