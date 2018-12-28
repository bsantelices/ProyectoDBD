<?php

use Faker\Generator as Faker;

$factory->define(App\Log::class, function (Faker $faker) {

    return [
       	'transactionCode' => $faker->ean8,
        'title' => $faker->sentence($nbWords = 4, $variableNbWords = true),
        'description' => $faker->realText($maxNbChars = 50, $indexSize = 2),
        'user_id' => $faker->unique()->numberBetween($min = 1, $max = 50),
        'payment_method_id'=> $faker->numberBetween($min = 1, $max = 10)
    ];
});
