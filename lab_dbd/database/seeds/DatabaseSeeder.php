<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(RolesTableSeeder::class);
        $this->call(UsersTableSeeder::class);
        $this->call(LocationsTableSeeder::class);
        $this->call(AirportsTableSeeder::class);
        $this->call(PlanesTableSeeder::class);
        $this->call(FlightsTableSeeder::class);
        $this->call(HotelsTableSeeder::class);
        $this->call(DiscountsTableSeeder::class);
        $this->call(InsurancesTableSeeder::class);
        $this->call(PaymentMethodsTableSeeder::class);
        $this->call(ReservationsTableSeeder::class);
        $this->call(VehiclesTableSeeder::class);
        $this->call(PackagesTableSeeder::class); 
    }
}
