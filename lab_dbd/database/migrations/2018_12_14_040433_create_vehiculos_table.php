<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateVehiculosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vehiculos', function (Blueprint $table) {
            $table->increments('id');
            $table->date('fecha_arriendo');
            $table->date('fecha_devolucion');
            $table->time('hora_arriendo');
            $table->time('hora_devolucion');
            $table->integer('capacidad');
            $table->string('modelo',20);
            $table->string('marca',20);
            $table->string('patente',10);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('vehiculos');
    }
}
