<?php

use Faker\Generator as Faker;

$factory->define(App\Location::class, function (Faker $faker) {
    return [
        'coordinates' => $faker->latitude($min = -90, $max = 90).','.$faker->longitude($min = -180, $max = 180),
        'city' => $faker->city,
        'country' => $faker->country,
        'street' => $faker->streetName,
        'houseCode' =>$faker->buildingNumber,
        'postalCode' => $faker->postcode,
    ];
});