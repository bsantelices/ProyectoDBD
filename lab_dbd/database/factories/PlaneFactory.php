<?php

use Faker\Generator as Faker;

$factory->define(App\Plane::class, function (Faker $faker) {
    return [
        'brand' => $faker->company,
        'capacity' => $faker->numberBetween($min = 50, $max = 100),
        'airport_id' => $faker->numberBetween($min = 1, $max = 10),
    ];
});