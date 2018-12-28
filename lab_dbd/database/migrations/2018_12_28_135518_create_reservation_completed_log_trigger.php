<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Migrations\Migration;

class CreateReservationCompletedLogTrigger extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE OR REPLACE FUNCTION reservation_logging_trigger() RETURNS TRIGGER AS \$reservation_logging_trigger$
              DECLARE
              BEGIN
               INSERT INTO logs(user_id,title,description,created_at,updated_at)
                VALUES(OLD.user_id,'Reservation Completed','A Reservation has been completed',now(),now());
                RETURN NULL;
              END;
            \$reservation_logging_trigger$ LANGUAGE plpgsql;
            
            CREATE TRIGGER reservation_logging_trigger AFTER UPDATE
                ON reservations FOR EACH ROW
                WHEN (NEW.completed)
                EXECUTE PROCEDURE reservation_logging_trigger();
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
            DROP TRIGGER IF EXISTS reservation_logging_trigger ON users;
        ");
    }
}
