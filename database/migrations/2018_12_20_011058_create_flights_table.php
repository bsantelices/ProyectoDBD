<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFlightsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('flights', function (Blueprint $table) {
            $table->increments('id');
            $table->string('coordinatesStart');
            $table->string('coordinatesEnd');
            $table->string('type');
            $table->integer('luggageCapacity');
            $table->timestamps();

            $table->unsignedInteger('plane_id');
            $table->foreign('plane_id')->references('id')->on('planes')->onDelete('cascade');

            $table->unsignedInteger('airport_id')->nullable();
            $table->foreign('airport_id')->references('id')->on('airports')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('flights');
    }
}
