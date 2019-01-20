<?php

use Faker\Generator as Faker;

$factory->define(App\Flight::class, function (Faker $faker) {
    
    return [
        'coordinatesStart' => $faker->latitude($min = -90, $max = 90).','.$faker->longitude($min = -180, $max = 180),
        'coordinatesEnd' => $faker->latitude($min = -90, $max = 90).','.$faker->longitude($min = -180, $max = 180),
        'type' => $faker->sentence($nbWords = 2, $variableNbWords = true),
        'luggageCapacity' => $faker->numberBetween($min = 10, $max = 400),
        'airport_id' => $faker->unique(true)->numberBetween($min = 1, count(App\Airport::all())),
        'plane_id' => $faker->unique(true)->numberBetween($min = 1, count(App\Plane::all())),
    ];
});
