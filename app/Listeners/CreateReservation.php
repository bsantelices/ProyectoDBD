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
        /*
         * EXAMPLE
         *  vehicles => (string) 
         *              {
         *              "1":
         *                  {
         *                      "rent_at": "2019-01-20 00:12:15",
         *                      "return_at": "2019-01-20 00:12:15"
         *                  },
         *              "2": 
         *                  {
         *                      "rent_at": "2019-01-20 00:12:15",
         *                      "return_at": "2019-01-20 00:12:15"
         *                  }
         *              }"
         *
         */

        // Vehicles for a reservation
        if ($event->fill->vehicles) { 
            $vehicles = collect(json_decode($event->fill->vehicles));
            $vehicles->map(function ($data, $vehicle_id) use ($event) {
                $data = collect($data);
                if (Vehicle::find($vehicle_id)) {
                    $event->reservation->vehicles()->attach($vehicle_id, [
                        'rent_at'   => $data["rent_at"],
                        'return_at' => $data["return_at"]
                    ]);
                }
            });
        }

        // Insurances for a reservation
        if ($event->fill->insurances) { 
            $insurances = collect(json_decode($event->fill->insurances));
            $insurances->map(function ($data, $insurance_id) use ($event) {
                $data = collect($data);
                if (Insurance::find($insurance_id)) {
                    $event->reservation->insurances()->attach($insurance_id, [
                        'start_at'   => $data["start_at"],
                        'end_at' => $data["end_at"]
                    ]);
                }
            });
        }

        // Flights for a reservation
        if ($event->fill->flights) { 
            $flights = collect(json_decode($event->fill->flights));
            $flights->map(function ($data, $flight_id) use ($event) {
                $data = collect($data);
                if (Flight::find($flight_id)) {
                    $event->reservation->flights()->attach($flight_id, [
                        'go_at'   => $data["go_at"],
                        'return_at' => $data["return_at"]
                    ]);
                }
            });
        }   
    }
}
