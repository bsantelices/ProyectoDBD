<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFlightReservationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('flight_reservation', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamps();

            $table->timestamp('go_at');
            $table->timestamp('return_at');
            $table->timestamp('cancel')->nullable();

            $table->unsignedInteger('reservation_id');
            $table->foreign('reservation_id')->references('id')->on('reservations')->onDelete('cascade');
            
            $table->unsignedInteger('flight_id');
            $table->foreign('flight_id')->references('id')->on('flights')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('flight_reservation');
    }
}
