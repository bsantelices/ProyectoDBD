<?php

namespace App\Listeners;

use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

use App\Role;
use App\Events\NewUser;

class AssignRole
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
     * @param  NewUser  $event
     * @return void
     */
    public function handle(NewUser $event)
    {
        $role = Role::Where('name','normal')->first();
        $event->user->roles()->attach($role);
    }
}
