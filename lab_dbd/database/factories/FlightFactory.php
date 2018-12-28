<?php

use Faker\Generator as Faker;

$factory->define(App\Flight::class, function (Faker $faker) {
    return [
        'coordinatesStart'=>$faker->latitude($min = -90, $max = 90),
        'coordinatesEnd'=>$faker->latitude($min = -90, $max = 90),
        'type'=>$faker->sentence($nbWords = 2, $variableNbWords = true),
        'luggageCapacity'=>$faker->unique->numberBetween($min = 10, $max = 400),
        'airport_id'=>$faker->unique()->numberBetween($min = 0, $max = 50)
    ];
});
