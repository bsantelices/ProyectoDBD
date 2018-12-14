<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUbicacionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ubicacions', function (Blueprint $table) {
            $table->increments('id');
            $table->string('latitud',15);
            $table->string('longitud',15);
            $table->string('ciudad',15);
            $table->string('pais',15);
            $table->string('calle',15);
            //Lo cambie a integer, estaba con stirng jasj.
            $table->integer('numero_calle');
            $table->integer('codigo_postal');
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
        Schema::dropIfExists('ubicacions');
    }
}
