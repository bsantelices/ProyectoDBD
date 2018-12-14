<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRolsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('rols', function (Blueprint $table) {
            $table->increments('id'); 
            $table->string('nombre_rol', 15);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.     Ahi tienes los archivos bien, pero aun me causa conflicto una wea asi fue entero raro wn jasdj, borramo el archivo y la wea lo tomo como q no siiii, la caho ajsdj vamos a probar otra wea ahora, sigue ocupando tu pc nomas, pero no toques el proyecto ufff ya po, me hare un cafe mientras jasj wena
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('rols');
    }
}
