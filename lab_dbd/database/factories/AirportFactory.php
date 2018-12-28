<?php

use Faker\Generator as Faker;

$factory->define(App\Airport::class, function (Faker $faker) {
	$faker = app('Faker');
    return [
    	'name' => $faker->name,
    	'type' => $faker->unique()->typeAirport,





    	'name' => $faker->name,
        'lastname' => $faker->lastName,
        'dni' => $faker->dni,
        'email' => $faker->unique()->safeEmail,
        'password' => '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', // secret
        'remember_token' => str_random(10),
        'username' => $faker->unique()->userName,



        $table->string('name');
        $table->string('type');
        $table->timestamps();
        $table->unsignedInteger('location_id')->nullable();
        $table->foreign('location_id')->references('id')->on('locations');
    ];
});
