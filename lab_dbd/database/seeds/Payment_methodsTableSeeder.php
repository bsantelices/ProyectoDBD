<?php

use Illuminate\Database\Seeder;

class Payment_methodsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(App\Payment_methods::class,10)->create();
    }
}
