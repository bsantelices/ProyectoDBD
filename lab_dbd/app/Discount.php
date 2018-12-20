<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Discount extends Model
{	
	public function package()
    {
        return $this->hasMany(Package::class,'package_id');
    }

    protected $fillable = [
        'amount','type','title','description'
    ];
}
