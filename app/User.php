<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use App\Events\NewUser;

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
        'moneyAmount',
        'name',
        'lastname',
        'dni',
        'email',
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
     * Execute NewUser Event that asign a role for the new user
     */
    public static function boot()
    {
        parent::boot();
        //only when created
        static::created(function($user) {
            event(new NewUser($user));
        });
    }


    /**
     * Get the roles records associated with the user.
     */
    public function roles()
    {
        return $this->belongsToMany(Role::class)->withTimestamps();
    }

    /**
     * Get the roles records associated with the user.
     */
    public function hasRole($role)
    {
        $array = $this->roles->map(function($roleEl) {
            return $roleEl->name;
        });
        return in_array($role,$array->toArray());
    }

    /**
     * Get the log record associated with the user.
     */
    public function log()
    {
        return $this->hasOne(Log::class);
    }

    /**
     * Get the reservations records associated with the user.
     */
    public function reservations()
    {
        return $this->hasMany(Reservation::class);
    }
}
