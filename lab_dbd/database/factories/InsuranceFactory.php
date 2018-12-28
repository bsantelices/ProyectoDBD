<?php

use Faker\Generator as Faker;

$factory->define(App\Insurance::class, function (Faker $faker) {
	$faker = app('Faker');
    return [
    	'value' => $faker->numberBetween($min = 10000, $max = 90000),
    	'type' => $faker->typeInsurance
    ];
});
