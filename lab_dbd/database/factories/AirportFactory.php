<?php

use Faker\Generator as Faker;

$factory->define(App\Airport::class, function (Faker $faker) {
    // Faker provider
	$faker = app('Faker');
    
    return [
    	'name' => $faker->name,
    	'type' => $faker->unique()->typeAirport,
        'location_id' => 1,
    ];
});
