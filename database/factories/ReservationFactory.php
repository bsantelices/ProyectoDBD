<?php

use Faker\Generator as Faker;

$factory->define(App\Reservation::class, function (Faker $faker) {
    return [
        'amount' => $faker->numberBetween($min = 1000, $max = 500000),
        'description' => $faker->realText($maxNbChars = 50, $indexSize = 2),
        'completed' => $faker->boolean,
        'payment_method_id' => $faker->numberBetween($min = 1, $max = 10),
        'user_id' => $faker->unique()->numberBetween($min = 1, $max = 50)
    ];
});
