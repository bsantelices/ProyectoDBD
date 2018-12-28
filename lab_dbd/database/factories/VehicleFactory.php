<?php

use Faker\Generator as Faker;

$factory->define(App\Vehicle::class, function (Faker $faker) {
    return [
        'model' => $faker->word,
        'brand' => $faker->word,
        'patent' => $faker->numerify('st ####')
    ];
});