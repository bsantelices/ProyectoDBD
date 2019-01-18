<?php

namespace App\Listeners;

use App\Events\FillPackage;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

use App\Vehicle;

class LinkVehicle
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
     * @param  FillPackage  $event
     * @return void
     */
    public function handle(FillPackage $event)
    {
        $vehicle = Vehicle::inRandomOrder()->first();
        $event->package->vehicles()->attach($vehicle);
    }
}
