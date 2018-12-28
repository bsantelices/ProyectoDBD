<?php

use Faker\Generator as Faker;

$factory->define(App\Plane::class, function (Faker $faker) {
    return [
        'brand' => 'test',
        'capacity' => 150,
        'airport_id' => 1,
    ];
});