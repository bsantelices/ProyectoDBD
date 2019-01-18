<?php

use Faker\Generator as Faker;

/*
|--------------------------------------------------------------------------
| Role Factory
|--------------------------------------------------------------------------
|
| Define a factory class to create roles with faker
|
*/

$factory->define(App\Role::class, function (Faker $faker) {
    /*
     * I created a FakerProvider so we can add created fakers (App\providers\FakerServiceProvider)
     * in order for that to work we need to added to the existing faker model with the following line
     */
    $faker = app('Faker');

    return [
        'name' => $faker->unique()->role
    ];
});
