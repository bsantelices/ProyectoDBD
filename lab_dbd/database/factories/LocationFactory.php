<?php

use Faker\Generator as Faker;

$factory->define(App\Location::class, function (Faker $faker) {
    return [
        'coordinates' => $faker->text,
        'city' => $faker->city,
        'country' => $faker->country,
        'street' => $faker->streetName,
        'houseCode' =>$faker->buildingNumber,
        'postalCode' => $faker->postcode,
    ];
});