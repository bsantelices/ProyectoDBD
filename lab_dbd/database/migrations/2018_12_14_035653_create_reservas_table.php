<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateReservasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('reservas', function (Blueprint $table) {
            $table->increments('id');
            //**Llave foranea de usuario.**
            $table->integer('monto');
            $table->string('descripcion',150);
            //OJO: Que contendran cuando el usuario no haya realizado ninguna compra?.
            $table->date('fecha_compra');
            $table->time('hora_compra');
            //Parece que nos equivocamo al pasar este wn.
            //$table->string('correo',25);
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
        Schema::dropIfExists('reservas');
    }
}
