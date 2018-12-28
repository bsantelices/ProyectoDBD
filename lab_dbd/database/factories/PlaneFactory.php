<?php

use Faker\Generator as Faker;

$factory->define(App\Plane::class, function (Faker $faker) {
    return [
        'brand' => $faker->company,
        'capacity' => $faker->numberBetween($min = 100, $max = 1000),
        'airport_id' => $faker->numberBetween($min = 0, $max = 10),
    ];
});