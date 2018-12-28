<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class FakerServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }

    /**
     * Register services for creating new faker providers.
     *
     * @return void
     */
    public function register()
    {
        // access to the namespace
        $this->app->singleton('Faker', function($app) {
            // creating a provider with factory
            $faker = \Faker\Factory::create();

            // my providers
            $newClass = new class($faker) extends \Faker\Provider\Base {
                /*
                 * $faker->role
                 * from the existing roles picks one random
                 */
                public function role()
                {
                    $roles = [
                        'administrator', // admin or administrator
                        'developer',     // develop or developer
                        'normal',        // normal or --- 
                    ];
                    return $roles[array_rand($roles)];
                }

                /*
                 * $faker->typeDiscount
                 * picks a random discount type
                 */
                public function typeDiscount()
                {
                    $discountTypes = [
                        'christmas', 
                        'sale',     
                        'low season',
                    ];
                    return $discountTypes[array_rand($discountTypes)];
                }

                public function typeInsurance()
                {
                    $typeInsurances = [
                        'life', // life insurance
                        'travel', //For journey
                        'thief', //antithief
                    ];
                    return $typeInsurances[array_rand($typeInsurances)];
                }

                /*
                 * $faker->typeAirport
                 * picks a random Airport type
                 */
                public function typeAirport()
                {
                    $airportTypes = [
                        'national', 
                        'international',     
                    ];
                    return $airportTypes[array_rand($airportTypes)];
                }

                public function typePackage()
                {
                    $packageTypes = [
                        'fly-hotel', 
                        'fly-vehicle',     
                    ];
                    return $packageTypes[array_rand($packageTypes)];
                }


                /*
                 * $faker->new
                 * add new fakers in the following lines
                 */
                public function new()
                {
                    return 'example';
                }
            };

            // adding provider
            $faker->addProvider($newClass);
            return $faker;
        });
    }
}
