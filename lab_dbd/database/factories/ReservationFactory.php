<?php

use Faker\Generator as Faker;

$factory->define(App\Reservation::class, function (Faker $faker) {
    return [
        'amount',
        'description',
        'completed',
        'payment_method_id',
        'user_id'
    ];
});
