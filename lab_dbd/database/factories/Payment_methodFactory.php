<?php

use Faker\Generator as Faker;

$factory->define(App\Payment_method::class, function (Faker $faker) {

    return [
        'type'=> $faker->creditCardType
    ];
});
