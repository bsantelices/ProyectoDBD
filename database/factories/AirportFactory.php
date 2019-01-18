<?php

use Faker\Generator as Faker;

$factory->define(App\Airport::class, function (Faker $faker) {
    // Faker provider
	$faker = app('Faker');
    
    return [
    	'name' => $faker->name,
    	'type' => $faker->typeAirport,
      'location_id' => $faker->unique()->numberBetween($min = 1, $max = 50)
    ];
});
