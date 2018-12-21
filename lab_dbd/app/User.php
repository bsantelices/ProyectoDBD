<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */   
    protected $fillable = [
        'password',
        'name',
        'lastname',
        'email',
        'dni',
        'username'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * Get the roles records associated with the user.
     */
    public function roles()
    {
        return $this->belongsToMany(Role::class,'role_id');
    }

    /**
     * Get the log record associated with the user.
     */
    public function log()
    {
        return $this->hasOne(Log::class,'log_id');
    }

    /**
     * Get the reservations records associated with the user.
     */
    public function reservations()
    {
        return $this->hasMany(Reservation::class,'reservation_id');
    }
}
