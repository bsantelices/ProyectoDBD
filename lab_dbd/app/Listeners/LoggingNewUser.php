<?php

namespace App\Listeners;

use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

use App\Events\NewUser;
use App\Log;
use Carbon\Carbon;

class LoggingNewUser
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
    public function handle(NewUser $event)
    {
        Log::create([
            'title' => 'User Created',
            'description' => 'user '.$event->user->name.' created at '.Carbon::now(),
            'user_id' => $event->user->id
        ]);
    }
}
