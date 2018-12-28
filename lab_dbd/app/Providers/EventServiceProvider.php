<?php

namespace App\Providers;

use Illuminate\Support\Facades\Event;
use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Listeners\SendEmailVerificationNotification;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

use App\Events\NewUser;
use App\Events\NewHotel;
use App\Events\NewPlane;
use App\Listeners\AssignRole;
use App\Listeners\LoggingNewUser;
use App\Listeners\CreateRooms;
use App\Listeners\CreateSeats;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        Registered::class => [
            SendEmailVerificationNotification::class,
        ],

        NewUser::class => [
            AssignRole::class,
            LoggingNewUser::class,
        ],

        NewHotel::class => [
            CreateRooms::class,
        ],

        NewPlane::class => [
            CreateSeats::class,
        ],
    ];

    /**
     * Register any events for your application.
     *
     * @return void
     */
    public function boot()
    {
        parent::boot();

        //
    }
}
