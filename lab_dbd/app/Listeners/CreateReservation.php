<?php

namespace App\Listeners;

use App\Events\FillReservation;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

use App\Vehicle;
use App\Insurance;
use App\Seat;
use App\Package;
use App\Flight;
use App\Room;

use Carbon\Carbon;

class CreateReservation
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  FillReservation  $event
     * @return void
     */
    public function handle(FillReservation $event)
    {
        $vehicle = Vehicle::inRandomOrder()->first();
        $insurance = Insurance::inRandomOrder()->first();
        $seat = Seat::inRandomOrder()->first();
        $package = Package::inRandomOrder()->first();
        $flight = Flight::inRandomOrder()->first();
        $room = Room::inRandomOrder()->first();

        $event->reservation->vehicles()->attach($vehicle, [
            'start_at' => Carbon::now(),
            'end_at' => Carbon::now()
        ]);
        $event->reservation->insurances()->attach($insurance, [
            'start_at' => Carbon::now(),
            'end_at' => Carbon::now()
        ]);
        $event->reservation->seats()->attach($seat);
        $event->reservation->packages()->attach($package);
        $event->reservation->flights()->attach($flight, [
            'go_at' => Carbon::now(),
            'return_at' => Carbon::now()
        ]);
        $event->reservation->rooms()->attach($room, [
            'entry_at' => Carbon::now(),
            'exit_at' => Carbon::now()
        ]);
        
    }
}
