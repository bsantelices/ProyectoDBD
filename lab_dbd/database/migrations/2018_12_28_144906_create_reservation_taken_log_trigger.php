<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Migrations\Migration;

class CreateReservationTakenLogTrigger extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE OR REPLACE FUNCTION reservation_taken_logging_trigger() RETURNS TRIGGER AS \$reservation_taken_logging_trigger$
              DECLARE
              BEGIN
               INSERT INTO logs(user_id,title,description,created_at,updated_at)
                VALUES(NEW.user_id,'New Reservation','A new Reservation has been created',now(),now());
                RETURN NULL;
              END;
            \$reservation_taken_logging_trigger$ LANGUAGE plpgsql;
            
            CREATE TRIGGER reservation_taken_logging_trigger AFTER INSERT 
                ON reservations FOR EACH ROW
                EXECUTE PROCEDURE reservation_taken_logging_trigger();
        ");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::unprepared("
            DROP TRIGGER IF EXISTS reservation_taken_logging_trigger ON users;
        ");
    }
}
