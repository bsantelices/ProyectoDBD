<?php

use Faker\Generator as Faker;
use Faker\Factory as Factory;

/*
|--------------------------------------------------------------------------
| User Factory
|--------------------------------------------------------------------------
|
| Define a factory class to create users with faker
|
*/

$factory->define(App\User::class, function (Faker $faker) {

    /*
     * Faker can't create dni values from default (US), so I changed it to (es_ES) where it can
     * This makes the names and other stuff be in Spanish too
     */
    $faker = Factory::create('es_ES');

    return [
        'name' => $faker->name,
        'lastname' => $faker->lastName,
        'dni' => $faker->dni,
        'email' => $faker->unique()->safeEmail,
        'password' => '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', // secret
        'remember_token' => str_random(10),
        'username' => $faker->userName,
    ];
});
