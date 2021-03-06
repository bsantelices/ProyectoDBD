<?php

use Faker\Generator as Faker;

$factory->define(App\Discount::class, function (Faker $faker) {
    // Faker provider
	$faker = app('Faker');
    
    return [
        'amount' => $faker->numberBetween($min = 5000, $max = 10000),
        'type' => $faker->typeDiscount,
        'description' => $faker->text,
        'title' => $faker->word,
    ];
});