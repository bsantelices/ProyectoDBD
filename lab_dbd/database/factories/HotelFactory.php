<?php

use Faker\Generator as Faker;

$factory->define(App\Hotel::class, function (Faker $faker) {
    return [
        'name'=>$faker->company,
        'state'=>$faker->numberBetween($min = 0, $max = 1),
        'location_id'=>$faker->unique()->numberBetween($min = 0, $max = 50)
    ];
});
