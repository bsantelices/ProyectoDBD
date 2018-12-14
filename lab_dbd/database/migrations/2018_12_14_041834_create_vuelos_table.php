<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateVuelosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vuelos', function (Blueprint $table) {
            $table->increments('id');
            //**Llave foranea Aeropuerto Origen.**
            //**Llave foranea Aeropuerto Destino.**
            $table->integer('tipo_vuelo');
            $table->integer('precio');
            $table->integer('numero_escala');
            $table->integer('cantidad_equipaje');
            $table->date('fecha_partida');
            $table->date('fecha_regreso');
            $table->time('hora_partida');
            $table->time('hora_regreso');
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
        Schema::dropIfExists('vuelos');
    }
}
