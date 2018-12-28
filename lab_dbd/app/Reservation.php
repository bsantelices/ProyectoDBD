<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use App\Events\FillReservation;

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
        'completed',
        'payment_method_id',
        'user_id'
    ];

    /**
     * Execute FillRervation Event that asign a vehicle, flight and room for the new reservation
     */
    public static function boot()
    {
        parent::boot();
        //only when created
        static::created(function($reservation) {
            event(new FillReservation($reservation));
        });
    }

    /**
     * Get the insurances records associated with the reservation.
     */
    public function insurances()
    {
        return $this->belongsToMany(Insurance::class)->withTimestamps();
    }

    /**
     * Get the vehicles records associated with the reservation.
     */
    public function vehicles()
    {
        return $this->belongsToMany(Vehicle::class)->withTimestamps();
    }

    /**
     * Get the seats records associated with the reservation.
     */
    public function seats()
    {
        return $this->belongsToMany(Seat::class)->withTimestamps();
    }

    /**
     * Get the packages records associated with the reservation.
     */
    public function packages()
    {
        return $this->belongsToMany(Package::class)->withTimestamps();
    }

    /**
     * Get the flights records associated with the reservation.
     */
    public function flights()
    {
        return $this->belongsToMany(Flight::class)->withTimestamps();
    }

    /**
     * Get the rooms records associated with the reservation.
     */
    public function rooms()
    {
        return $this->belongsToMany(Room::class)->withTimestamps();
    }

    /**
     * Get the payment method record associated with the reservation.
     */
    public function paymentMethod()
    {
        return $this->belongsTo(PaymentMethod::class);
    }

    /**
     * Get the user method record associated with the reservation.
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
