<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Avion extends Model
{
    public function vuelo(){
    	return $this->belongs(Vuelo::class,'vuelo_id');
    }    
}
