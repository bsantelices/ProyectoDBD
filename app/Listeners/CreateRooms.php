<?php

namespace App\Listeners;

use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

use App\Room;
use App\Events\NewHotel;

class CreateRooms
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
    public function handle(NewHotel $event)
    {
        $types = [
            'basic',
            'premium',
            'vip'
        ];

        for ($i=0; $i < 20; $i++) { 
            Room::create([
                'value' => rand(10000,90000),
                'state' => rand(1,5),
                'adultCapacity' => rand(1,5),
                'childrenCapacity' => rand(1,5),
                'type' => $types[array_rand($types)],
                'availability' => true,
                'hotel_id' => $event->hotel->id
            ]);
        }
    }
}