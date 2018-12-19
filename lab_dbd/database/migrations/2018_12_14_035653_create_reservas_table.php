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
            $table->date('fecha_reserva');
            $table->time('fecha_reserva');
            $table->timestamps();
        });
    }

        protected $fillable = [
        'monto','descripcion','fecha_reserva',
    ];
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
