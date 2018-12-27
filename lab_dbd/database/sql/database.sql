-- convert Laravel migrations to raw SQL scripts --

-- migration:2014_10_12_000000_create_users_table --
create table "users" (
  "id" serial primary key not null, 
  "name" varchar(255) not null, 
  "lastname" varchar(255) not null, 
  "email" varchar(255) not null, 
  "email_verified_at" timestamp(0) without time zone null, 
  "password" varchar(255) not null, 
  "moneyAmount" integer not null default '0', 
  "dni" varchar(255) not null, 
  "username" varchar(255) not null, 
  "remember_token" varchar(100) null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null
);
alter table 
  "users" 
add 
  constraint "users_email_unique" unique ("email");
alter table 
  "users" 
add 
  constraint "users_username_unique" unique ("username");

-- migration:2014_10_12_100000_create_password_resets_table --
create table "password_resets" (
  "email" varchar(255) not null, 
  "token" varchar(255) not null, 
  "created_at" timestamp(0) without time zone null
);
create index "password_resets_email_index" on "password_resets" ("email");

-- migration:2018_12_19_233223_create_roles_table --
create table "roles" (
  "id" serial primary key not null, 
  "name" varchar(255) not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null
);

-- migration:2018_12_19_233518_create_payment_methods_table --
create table "payment_methods" (
  "id" serial primary key not null, 
  "type" varchar(255) not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null
);

-- migration:2018_12_19_234115_create_logs_table --
create table "logs" (
  "id" serial primary key not null, 
  "transactionCode" varchar(255) null, 
  "title" varchar(255) not null, 
  "description" text not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null, 
  "user_id" integer not null, 
  "payment_method_id" integer null
);
alter table 
  "logs" 
add 
  constraint "logs_user_id_foreign" foreign key ("user_id") references "users" ("id");
alter table 
  "logs" 
add 
  constraint "logs_payment_method_id_foreign" foreign key ("payment_method_id") references "payment_methods" ("id");

-- migration:2018_12_19_234717_create_reservations_table --
create table "reservations" (
  "id" serial primary key not null, 
  "amount" integer not null, 
  "description" text not null, 
  "completed" boolean not null default '0', 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null, 
  "user_id" integer not null, 
  "payment_method_id" integer not null
);
alter table 
  "reservations" 
add 
  constraint "reservations_user_id_foreign" foreign key ("user_id") references "users" ("id");
alter table 
  "reservations" 
add 
  constraint "reservations_payment_method_id_foreign" foreign key ("payment_method_id") references "payment_methods" ("id");

-- migration:2018_12_19_234914_create_insurances_table --
create table "insurances" (
  "id" serial primary key not null, 
  "value" integer not null, 
  "type" varchar(255) not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null
);

-- migration:2018_12_20_000929_create_vehicles_table --
create table "vehicles" (
  "id" serial primary key not null, 
  "capacity" integer not null, 
  "model" varchar(255) not null, 
  "brand" varchar(255) not null, 
  "patent" varchar(255) not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null
);

-- migration:2018_12_20_000930_create_locations_table --
create table "locations" (
  "id" serial primary key not null, 
  "coordinates" varchar(255) not null, 
  "city" varchar(255) not null, 
  "country" varchar(255) not null, 
  "street" varchar(255) null, 
  "houseCode" integer null, 
  "postalCode" integer not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null
);

-- migration:2018_12_20_002227_create_hotels_table --
create table "hotels" (
  "id" serial primary key not null, 
  "name" varchar(255) not null, 
  "state" integer not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null, 
  "location_id" integer not null
);
alter table 
  "hotels" 
add 
  constraint "hotels_location_id_foreign" foreign key ("location_id") references "locations" ("id");

-- migration:2018_12_20_002747_create_rooms_table --
create table "rooms" (
  "id" serial primary key not null, 
  "value" integer not null, 
  "state" integer not null, 
  "adultCapacity" integer not null, 
  "childrenCapacity" integer not null, 
  "type" varchar(255) not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null, 
  "hotel_id" integer not null
);
alter table 
  "rooms" 
add 
  constraint "rooms_hotel_id_foreign" foreign key ("hotel_id") references "hotels" ("id");

-- migration:2018_12_20_003604_create_discounts_table --
create table "discounts" (
  "id" serial primary key not null, 
  "amount" integer not null, 
  "type" varchar(255) not null, 
  "title" varchar(255) not null, 
  "description" text not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null
);

-- migration:2018_12_20_004014_create_packages_table --
create table "packages" (
  "id" serial primary key not null, 
  "value" integer not null, 
  "description" text not null, 
  "type" varchar(255) not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null, 
  "discount_id" integer null
);
alter table 
  "packages" 
add 
  constraint "packages_discount_id_foreign" foreign key ("discount_id") references "discounts" ("id");

-- migration:2018_12_20_005837_create_airports_table --
create table "airports" (
  "id" serial primary key not null, 
  "name" varchar(255) not null, 
  "type" varchar(255) not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null, 
  "location_id" integer null
);
alter table 
  "airports" 
add 
  constraint "airports_location_id_foreign" foreign key ("location_id") references "locations" ("id");

-- migration:2018_12_20_010146_create_flights_table --
create table "flights" (
  "id" serial primary key not null, 
  "coordinatesStart" varchar(255) not null, 
  "coordinatesEnd" varchar(255) not null, 
  "type" varchar(255) not null, 
  "luggageCapacity" integer not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null, 
  "airport_id" integer null
);
alter table 
  "flights" 
add 
  constraint "flights_airport_id_foreign" foreign key ("airport_id") references "airports" ("id");

-- migration:2018_12_20_011057_create_planes_table --
create table "planes" (
  "id" serial primary key not null, 
  "brand" varchar(255) not null, 
  "capacity" integer not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null, 
  "airport_id" integer not null
);
alter table 
  "planes" 
add 
  constraint "planes_airport_id_foreign" foreign key ("airport_id") references "airports" ("id");

-- migration:2018_12_20_011453_create_seats_table --
create table "seats" (
  "id" serial primary key not null, 
  "code" varchar(255) not null, 
  "type" varchar(255) not null, 
  "available" boolean not null default '1', 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null, 
  "flight_id" integer not null, 
  "plane_id" integer not null
);
alter table 
  "seats" 
add 
  constraint "seats_flight_id_foreign" foreign key ("flight_id") references "flights" ("id");
alter table 
  "seats" 
add 
  constraint "seats_plane_id_foreign" foreign key ("plane_id") references "planes" ("id");

-- migration:2018_12_20_141333_create_role_user_table --
create table "role_user" (
  "id" serial primary key not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null, 
  "user_id" integer not null, 
  "role_id" integer not null
);
alter table 
  "role_user" 
add 
  constraint "role_user_user_id_foreign" foreign key ("user_id") references "users" ("id");
alter table 
  "role_user" 
add 
  constraint "role_user_role_id_foreign" foreign key ("role_id") references "roles" ("id");

-- migration:2018_12_20_142552_create_insurance_reservation_table --
create table "insurance_reservation" (
  "id" serial primary key not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null, 
  "start_at" timestamp(0) without time zone not null, 
  "end_at" timestamp(0) without time zone not null, 
  "reservation_id" integer not null, 
  "insurance_id" integer not null
);
alter table 
  "insurance_reservation" 
add 
  constraint "insurance_reservation_reservation_id_foreign" foreign key ("reservation_id") references "reservations" ("id");
alter table 
  "insurance_reservation" 
add 
  constraint "insurance_reservation_insurance_id_foreign" foreign key ("insurance_id") references "insurances" ("id");

-- migration:2018_12_20_142928_create_reservation_vehicle_table --
create table "reservation_vehicle" (
  "id" serial primary key not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null, 
  "rent_at" timestamp(0) without time zone not null, 
  "return_at" timestamp(0) without time zone not null, 
  "reservation_id" integer not null, 
  "vehicle_id" integer not null
);
alter table 
  "reservation_vehicle" 
add 
  constraint "reservation_vehicle_reservation_id_foreign" foreign key ("reservation_id") references "reservations" ("id");
alter table 
  "reservation_vehicle" 
add 
  constraint "reservation_vehicle_vehicle_id_foreign" foreign key ("vehicle_id") references "vehicles" ("id");

-- migration:2018_12_20_143522_create_reservation_room_table --
create table "reservation_room" (
  "id" serial primary key not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null, 
  "entry_at" timestamp(0) without time zone not null, 
  "exit_at" timestamp(0) without time zone not null, 
  "reservation_id" integer not null, 
  "room_id" integer not null
);
alter table 
  "reservation_room" 
add 
  constraint "reservation_room_reservation_id_foreign" foreign key ("reservation_id") references "reservations" ("id");
alter table 
  "reservation_room" 
add 
  constraint "reservation_room_room_id_foreign" foreign key ("room_id") references "rooms" ("id");

-- migration:2018_12_20_143905_create_package_reservation_table --
create table "package_reservation" (
  "id" serial primary key not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null, 
  "reservation_id" integer not null, 
  "package_id" integer not null
);
alter table 
  "package_reservation" 
add 
  constraint "package_reservation_reservation_id_foreign" foreign key ("reservation_id") references "reservations" ("id");
alter table 
  "package_reservation" 
add 
  constraint "package_reservation_package_id_foreign" foreign key ("package_id") references "packages" ("id");

-- migration:2018_12_20_144039_create_package_vehicle_table --
create table "package_vehicle" (
  "id" serial primary key not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null, 
  "vehicle_id" integer not null, 
  "package_id" integer not null
);
alter table 
  "package_vehicle" 
add 
  constraint "package_vehicle_vehicle_id_foreign" foreign key ("vehicle_id") references "vehicles" ("id");
alter table 
  "package_vehicle" 
add 
  constraint "package_vehicle_package_id_foreign" foreign key ("package_id") references "packages" ("id");

-- migration:2018_12_20_144133_create_package_room_table --
create table "package_room" (
  "id" serial primary key not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null, 
  "room_id" integer not null, 
  "package_id" integer not null
);
alter table 
  "package_room" 
add 
  constraint "package_room_room_id_foreign" foreign key ("room_id") references "rooms" ("id");
alter table 
  "package_room" 
add 
  constraint "package_room_package_id_foreign" foreign key ("package_id") references "packages" ("id");

-- migration:2018_12_20_144528_create_flight_reservation_table --
create table "flight_reservation" (
  "id" serial primary key not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null, 
  "go_at" timestamp(0) without time zone not null, 
  "return_at" timestamp(0) without time zone not null, 
  "reservation_id" integer not null, 
  "flight_id" integer not null
);
alter table 
  "flight_reservation" 
add 
  constraint "flight_reservation_reservation_id_foreign" foreign key ("reservation_id") references "reservations" ("id");
alter table 
  "flight_reservation" 
add 
  constraint "flight_reservation_flight_id_foreign" foreign key ("flight_id") references "flights" ("id");

-- migration:2018_12_20_144655_create_flight_package_table --
create table "flight_package" (
  "id" serial primary key not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null, 
  "package_id" integer not null, 
  "flight_id" integer not null
);
alter table 
  "flight_package" 
add 
  constraint "flight_package_package_id_foreign" foreign key ("package_id") references "packages" ("id");
alter table 
  "flight_package" 
add 
  constraint "flight_package_flight_id_foreign" foreign key ("flight_id") references "flights" ("id");

-- migration:2018_12_20_145039_create_reservation_seat_table --
create table "reservation_seat" (
  "id" serial primary key not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null, 
  "reservation_id" integer not null, 
  "seat_id" integer not null
);
alter table 
  "reservation_seat" 
add 
  constraint "reservation_seat_reservation_id_foreign" foreign key ("reservation_id") references "reservations" ("id");
alter table 
  "reservation_seat" 
add 
  constraint "reservation_seat_seat_id_foreign" foreign key ("seat_id") references "seats" ("id");
