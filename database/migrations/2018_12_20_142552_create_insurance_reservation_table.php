<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateInsuranceReservationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('insurance_reservation', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamps();

            $table->timestamp('start_at');
            $table->timestamp('end_at');
            $table->timestamp('cancel')->nullable();

            $table->unsignedInteger('reservation_id');
            $table->foreign('reservation_id')->references('id')->on('reservations')->onDelete('cascade');
            
            $table->unsignedInteger('insurance_id');
            $table->foreign('insurance_id')->references('id')->on('insurances')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('insurance_reservation');
    }
}
