<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateReservationVehicleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('reservation_vehicle', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamps();

            $table->timestamp('rent_at');
            $table->timestamp('return_at');
            $table->timestamp('cancel')->nullable();

            $table->unsignedInteger('reservation_id');
            $table->foreign('reservation_id')->references('id')->on('reservations')->onDelete('cascade');
            
            $table->unsignedInteger('vehicle_id');
            $table->foreign('vehicle_id')->references('id')->on('vehicles')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('reservation_vehicle');
    }
}
