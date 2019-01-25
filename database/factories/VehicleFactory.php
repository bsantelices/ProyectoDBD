<?php

use Faker\Generator as Faker;
use Faker\Factory as Factory;

$factory->define(App\Vehicle::class, function (Faker $faker) {
    
    $patent = Factory::create('ms_MY');

    return [
        'model' => $faker->word,
        'brand' => $faker->word,
        'patent' => $patent->jpjNumberPlate,
        'capacity' => $faker->numberBetween($min = 2, $max = 10),
        'availability' => true,
    ];
});