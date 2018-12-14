<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateHabitacionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('habitacions', function (Blueprint $table) {
            $table->increments('id');
            //**Llave foranea de Hotel.**
            //Falta nombre del hotel jasj.
            $table->integer('precio_habitacion');
            $table->integer('calificacion');
            $table->integer('capacidad_adultos');
            $table->integer('capacidad_niños');
            $table->integer('tipo_habitacion');
            $table->date('fecha_ingreso');
            $table->date('fecha_salida');
            $table->time('hora_ingreso');
            $table->time('hora_salida');
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
        Schema::dropIfExists('habitacions');
    }
}
