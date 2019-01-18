<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

class CreateNewUserLogTrigger extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE OR REPLACE FUNCTION logging_trigger() RETURNS TRIGGER AS \$logging_trigger$
              DECLARE
              BEGIN
                INSERT INTO logs(user_id,title,description,created_at,updated_at)
                VALUES(NEW.id,'User Created','user account created',now(),now());
                RETURN NULL;
              END;
            \$logging_trigger$ LANGUAGE plpgsql;

            CREATE TRIGGER logging_trigger AFTER INSERT 
                ON users FOR EACH ROW 
                EXECUTE PROCEDURE logging_trigger();
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
            DROP TRIGGER IF EXISTS logging_trigger ON users;
        ");
    }
}
