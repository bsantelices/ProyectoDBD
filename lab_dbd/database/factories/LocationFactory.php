<?php

use Faker\Generator as Faker;

$factory->define(App\Location::class, function (Faker $faker) {
    return [
        'coordinates' => 'test',
        'city' => 'test',
        'country' => 'test',
        'postalCode' => 'test'
    ];
});
