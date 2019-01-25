<?php

use Faker\Generator as Faker;
use Carbon\Carbon;

$factory->define(App\Flight::class, function (Faker $faker) {
    
		$location_start = $faker->numberBetween($min = 1, count(App\Location::all()));
		$location_end = $faker->numberBetween($min = 1, count(App\Location::all()));
		while ($location_end == $location_start) {
			$location_end = $faker->numberBetween($min = 1, count(App\Location::all()));
		}

    return [
        'location_start' => $location_start,
        'location_end' => $location_end,
        'type' => $faker->sentence($nbWords = 2, $variableNbWords = true),
        'luggageCapacity' => $faker->numberBetween($min = 10, $max = 400),
        'airport_id' => $faker->unique(true)->numberBetween($min = 1, count(App\Airport::all())),
        'plane_id' => $faker->unique(true)->numberBetween($min = 1, count(App\Plane::all())),
        'go_at' => Carbon::now(),
        'return_at' => Carbon::tomorrow(),
        'value' => 10000,
    ];
});
