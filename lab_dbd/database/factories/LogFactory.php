<?php

use Faker\Generator as Faker;

$factory->define(App\Log::class, function (Faker $faker) {
    //Fake provider
    return [
       	'transactionCode'=>$faler->ean8,
        'title'=>$faker->sentence($nbWords = 4, $variableNbWords = true),
        'description'=>$faker->realText($maxNbChars = 50, $indexSize = 2),
        'user_id'=> $faker->unique->numberBetween($min = 0, $max = 50),
        'payment_method_id'=> $faker->unique->numberBetween($min = 0, $max = 50)
    ];
});
