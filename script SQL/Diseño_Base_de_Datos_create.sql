
-- Last modification date: 2018-12-20 15:43:22.014

-- tables
-- Table: airport
CREATE TABLE airport (
    id int  NOT NULL,
    location_id int  NOT NULL,
    name varchar(255)  NOT NULL,
    type varchar(255)  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT airport_pk PRIMARY KEY (id)
);

-- Table: discount
CREATE TABLE discount (
    id int  NOT NULL,
    amount int  NOT NULL,
    type varchar(255)  NOT NULL,
    title varchar(255)  NOT NULL,
    description text  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT discount_pk PRIMARY KEY (id)
);

-- Table: flight
CREATE TABLE flight (
    id int  NOT NULL,
    airport_id int  NOT NULL,
    coordinatesStart varchar(255)  NOT NULL,
    coordinatesEnd varchar(255)  NOT NULL,
    type varchar(255)  NOT NULL,
    luggageCapacity int  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT flight_pk PRIMARY KEY (id)
);

-- Table: flight_package
CREATE TABLE flight_package (
    id int  NOT NULL,
    package_id int  NOT NULL,
    flight_id int  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT flight_package_pk PRIMARY KEY (id)
);

-- Table: flight_reservation
CREATE TABLE flight_reservation (
    id int  NOT NULL,
    reservation_id int  NOT NULL,
    flight_id int  NOT NULL,
    go_at timestamp  NOT NULL,
    return_at timestamp  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT flight_reservation_pk PRIMARY KEY (id)
);

-- Table: hotel
CREATE TABLE hotel (
    id int  NOT NULL,
    location_id int  NOT NULL,
    name varchar(255)  NOT NULL,
    state int  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT hotel_pk PRIMARY KEY (id)
);

-- Table: insurance
CREATE TABLE insurance (
    id int  NOT NULL,
    value int  NOT NULL,
    type varchar(255)  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT insurance_pk PRIMARY KEY (id)
);

-- Table: insurance_reservation
CREATE TABLE insurance_reservation (
    id int  NOT NULL,
    reservation_id int  NOT NULL,
    insurance_id int  NOT NULL,
    start_at timestamp  NOT NULL,
    end_at timestamp  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT insurance_reservation_pk PRIMARY KEY (id)
);

-- Table: location
CREATE TABLE location (
    id int  NOT NULL,
    coordinates varchar(255)  NOT NULL,
    city varchar(255)  NOT NULL,
    country varchar(255)  NOT NULL,
    street varchar(255)  NULL,
    houseCode varchar(255)  NULL,
    postalCode varchar(255)  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT location_pk PRIMARY KEY (id)
);

-- Table: log
CREATE TABLE log (
    id int  NOT NULL,
    user_id int  NOT NULL,
    paymentMethod_id int  NULL,
    transactionCode varchar(255)  NULL,
    title varchar(255)  NOT NULL,
    description text  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT log_pk PRIMARY KEY (id)
);

-- Table: package
CREATE TABLE package (
    id int  NOT NULL,
    discount_id int  NULL,
    value int  NOT NULL,
    description text  NOT NULL,
    type varchar(255)  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT package_pk PRIMARY KEY (id)
);

-- Table: package_reservation
CREATE TABLE package_reservation (
    id int  NOT NULL,
    reservation_id int  NOT NULL,
    package_id int  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT package_reservation_pk PRIMARY KEY (id)
);

-- Table: package_room
CREATE TABLE package_room (
    id int  NOT NULL,
    package_id int  NOT NULL,
    room_id int  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT package_room_pk PRIMARY KEY (id)
);

-- Table: package_vehicle
CREATE TABLE package_vehicle (
    id int  NOT NULL,
    vehicle_id int  NOT NULL,
    package_id int  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT package_vehicle_pk PRIMARY KEY (id)
);

-- Table: paymentMethod
CREATE TABLE paymentMethod (
    id int  NOT NULL,
    type varchar(255)  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT paymentMethod_pk PRIMARY KEY (id)
);

-- Table: plane
CREATE TABLE plane (
    id int  NOT NULL,
    airport_id int  NOT NULL,
    brand varchar(255)  NOT NULL,
    capacity int  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT plane_pk PRIMARY KEY (id)
);

-- Table: reservation
CREATE TABLE reservation (
    id int  NOT NULL,
    user_id int  NOT NULL,
    paymentMethod_id int  NOT NULL,
    amount int  NOT NULL,
    description text  NOT NULL,
    completed boolean  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT reservation_pk PRIMARY KEY (id)
);

-- Table: reservation_room
CREATE TABLE reservation_room (
    id int  NOT NULL,
    reservation_id int  NOT NULL,
    room_id int  NOT NULL,
    entry_at timestamp  NOT NULL,
    exit_at timestamp  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT reservation_room_pk PRIMARY KEY (id)
);

-- Table: reservation_seat
CREATE TABLE reservation_seat (
    id int  NOT NULL,
    reservation_id int  NOT NULL,
    seat_id int  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT reservation_seat_pk PRIMARY KEY (id)
);

-- Table: reservation_vehicle
CREATE TABLE reservation_vehicle (
    id int  NOT NULL,
    vehicle_id int  NOT NULL,
    reservation_id int  NOT NULL,
    rent_at timestamp  NOT NULL,
    return_at timestamp  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT reservation_vehicle_pk PRIMARY KEY (id)
);

-- Table: role
CREATE TABLE role (
    id int  NOT NULL,
    name varchar(255)  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT role_pk PRIMARY KEY (id)
);

-- Table: role_user
CREATE TABLE role_user (
    id int  NOT NULL,
    user_id int  NOT NULL,
    role_id int  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT role_user_pk PRIMARY KEY (id)
);

-- Table: room
CREATE TABLE room (
    id int  NOT NULL,
    hotel_id int  NOT NULL,
    value int  NOT NULL,
    state int  NOT NULL,
    adultCapacity int  NOT NULL,
    childrenCapacity int  NOT NULL,
    type varchar(255)  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT room_pk PRIMARY KEY (id)
);

-- Table: seat
CREATE TABLE seat (
    id int  NOT NULL,
    flight_id int  NOT NULL,
    plane_id int  NOT NULL,
    code varchar(255)  NOT NULL,
    type varchar(255)  NOT NULL,
    available boolean  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT seat_pk PRIMARY KEY (id)
);

-- Table: user
CREATE TABLE "user" (
    id int  NOT NULL,
    password varchar(255)  NOT NULL,
    moneyAmount int  NOT NULL,
    name varchar(255)  NOT NULL,
    lastname varchar(255)  NOT NULL,
    dni varchar(255)  NOT NULL,
    email varchar(255)  NOT NULL,
    accountName varchar(255)  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT email UNIQUE (email) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT user_pk PRIMARY KEY (id)
);

-- Table: vehicle
CREATE TABLE vehicle (
    id int  NOT NULL,
    capacity int  NOT NULL,
    model varchar(255)  NOT NULL,
    brand varchar(255)  NOT NULL,
    patent varchar(255)  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT vehicle_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: airport_location (table: airport)
ALTER TABLE airport ADD CONSTRAINT airport_location
    FOREIGN KEY (location_id)
    REFERENCES location (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: flight_airport (table: flight)
ALTER TABLE flight ADD CONSTRAINT flight_airport
    FOREIGN KEY (airport_id)
    REFERENCES airport (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: flight_package_flight (table: flight_package)
ALTER TABLE flight_package ADD CONSTRAINT flight_package_flight
    FOREIGN KEY (flight_id)
    REFERENCES flight (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: flight_package_package (table: flight_package)
ALTER TABLE flight_package ADD CONSTRAINT flight_package_package
    FOREIGN KEY (package_id)
    REFERENCES package (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: flight_reservation_flight (table: flight_reservation)
ALTER TABLE flight_reservation ADD CONSTRAINT flight_reservation_flight
    FOREIGN KEY (flight_id)
    REFERENCES flight (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: flight_reservation_reservation (table: flight_reservation)
ALTER TABLE flight_reservation ADD CONSTRAINT flight_reservation_reservation
    FOREIGN KEY (reservation_id)
    REFERENCES reservation (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: hotel_location (table: hotel)
ALTER TABLE hotel ADD CONSTRAINT hotel_location
    FOREIGN KEY (location_id)
    REFERENCES location (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: insurance_reservation_insurance (table: insurance_reservation)
ALTER TABLE insurance_reservation ADD CONSTRAINT insurance_reservation_insurance
    FOREIGN KEY (insurance_id)
    REFERENCES insurance (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: insurance_reservation_reservation (table: insurance_reservation)
ALTER TABLE insurance_reservation ADD CONSTRAINT insurance_reservation_reservation
    FOREIGN KEY (reservation_id)
    REFERENCES reservation (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: log_paymentMethod (table: log)
ALTER TABLE log ADD CONSTRAINT log_paymentMethod
    FOREIGN KEY (paymentMethod_id)
    REFERENCES paymentMethod (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: log_user (table: log)
ALTER TABLE log ADD CONSTRAINT log_user
    FOREIGN KEY (user_id)
    REFERENCES "user" (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: package_discount (table: package)
ALTER TABLE package ADD CONSTRAINT package_discount
    FOREIGN KEY (discount_id)
    REFERENCES discount (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: package_reservation_package (table: package_reservation)
ALTER TABLE package_reservation ADD CONSTRAINT package_reservation_package
    FOREIGN KEY (package_id)
    REFERENCES package (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: package_reservation_reservation (table: package_reservation)
ALTER TABLE package_reservation ADD CONSTRAINT package_reservation_reservation
    FOREIGN KEY (reservation_id)
    REFERENCES reservation (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: package_room_package (table: package_room)
ALTER TABLE package_room ADD CONSTRAINT package_room_package
    FOREIGN KEY (package_id)
    REFERENCES package (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: package_room_room (table: package_room)
ALTER TABLE package_room ADD CONSTRAINT package_room_room
    FOREIGN KEY (room_id)
    REFERENCES room (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: package_vehicle_package (table: package_vehicle)
ALTER TABLE package_vehicle ADD CONSTRAINT package_vehicle_package
    FOREIGN KEY (package_id)
    REFERENCES package (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: package_vehicle_vehicle (table: package_vehicle)
ALTER TABLE package_vehicle ADD CONSTRAINT package_vehicle_vehicle
    FOREIGN KEY (vehicle_id)
    REFERENCES vehicle (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: plane_airport (table: plane)
ALTER TABLE plane ADD CONSTRAINT plane_airport
    FOREIGN KEY (airport_id)
    REFERENCES airport (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: reservation_paymentMethod (table: reservation)
ALTER TABLE reservation ADD CONSTRAINT reservation_paymentMethod
    FOREIGN KEY (paymentMethod_id)
    REFERENCES paymentMethod (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: reservation_room_reservation (table: reservation_room)
ALTER TABLE reservation_room ADD CONSTRAINT reservation_room_reservation
    FOREIGN KEY (reservation_id)
    REFERENCES reservation (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: reservation_room_room (table: reservation_room)
ALTER TABLE reservation_room ADD CONSTRAINT reservation_room_room
    FOREIGN KEY (room_id)
    REFERENCES room (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: reservation_seat_reservation (table: reservation_seat)
ALTER TABLE reservation_seat ADD CONSTRAINT reservation_seat_reservation
    FOREIGN KEY (reservation_id)
    REFERENCES reservation (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: reservation_seat_seat (table: reservation_seat)
ALTER TABLE reservation_seat ADD CONSTRAINT reservation_seat_seat
    FOREIGN KEY (seat_id)
    REFERENCES seat (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: reservation_user (table: reservation)
ALTER TABLE reservation ADD CONSTRAINT reservation_user
    FOREIGN KEY (user_id)
    REFERENCES "user" (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: reservation_vehicle_reservation (table: reservation_vehicle)
ALTER TABLE reservation_vehicle ADD CONSTRAINT reservation_vehicle_reservation
    FOREIGN KEY (reservation_id)
    REFERENCES reservation (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: reservation_vehicle_vehicle (table: reservation_vehicle)
ALTER TABLE reservation_vehicle ADD CONSTRAINT reservation_vehicle_vehicle
    FOREIGN KEY (vehicle_id)
    REFERENCES vehicle (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: rol_user_user (table: role_user)
ALTER TABLE role_user ADD CONSTRAINT rol_user_user
    FOREIGN KEY (user_id)
    REFERENCES "user" (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: role_user_role (table: role_user)
ALTER TABLE role_user ADD CONSTRAINT role_user_role
    FOREIGN KEY (role_id)
    REFERENCES role (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: room_hotel (table: room)
ALTER TABLE room ADD CONSTRAINT room_hotel
    FOREIGN KEY (hotel_id)
    REFERENCES hotel (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: seat_flight (table: seat)
ALTER TABLE seat ADD CONSTRAINT seat_flight
    FOREIGN KEY (flight_id)
    REFERENCES flight (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: seat_plane (table: seat)
ALTER TABLE seat ADD CONSTRAINT seat_plane
    FOREIGN KEY (plane_id)
    REFERENCES plane (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

