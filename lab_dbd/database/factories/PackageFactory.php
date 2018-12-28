<?php

use Faker\Generator as Faker;

$factory->define(App\Package::class, function (Faker $faker) {
	$faker = app('Faker');
    return [
       'value' => $faker->numberBetween($min = 90000, $max = 1000000),
       'description' => $faker->text,
       'type' => $faker->typePackage,
       'discount_id' => $faker->numberBetween($min = 0, $max = 10),
    ];
});