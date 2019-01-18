<?php

namespace App\Listeners;

use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

use App\Events\NewPlane;
use App\Seat;

class CreateSeats
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
     * @param  object  $event
     * @return void
     */
    public function handle(NewPlane $event)
    {
        $code = 65;
        for ($i=0; $i < $event->plane->capacity; $i++) {
            Seat::create([
                'code' => strval($i+1).chr(intval($code + ($i/4))),
                'type' => 'basic',
                'plane_id' => $event->plane->id
            ]);
        }
    }
}