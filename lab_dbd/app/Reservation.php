<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Reservation extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'amount',
        'description',
        'payment_method_id',
        'user_id'
    ];

    /**
     * Get the insurances records associated with the reservation.
     */
    public function insurances()
    {
        return $this->belongsToMany(Insurance::class,'insurance_id');
    }

    /**
     * Get the vehicles records associated with the reservation.
     */
    public function vehicles()
    {
        return $this->belongsToMany(Vehicle::class,'vehicle_id');
    }

    /**
     * Get the seats records associated with the reservation.
     */
    public function seats()
    {
        return $this->belongsToMany(Seat::class,'seat_id');
    }

    /**
     * Get the packages records associated with the reservation.
     */
    public function packages()
    {
        return $this->belongsToMany(Package::class,'package_id');
    }

    /**
     * Get the flights records associated with the reservation.
     */
    public function flights()
    {
        return $this->belongsToMany(Flight::class,'flight_id');
    }

    /**
     * Get the rooms records associated with the reservation.
     */
    public function rooms()
    {
        return $this->belongsToMany(Room::class,'room_id');
    }

    /**
     * Get the payment method record associated with the reservation.
     */
    public function paymentMethod()
    {
        return $this->belongsTo(PaymentMethod::class,'payment_method_id');
    }

    /**
     * Get the user method record associated with the reservation.
     */
    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }
}
