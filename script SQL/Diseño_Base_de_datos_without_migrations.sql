
--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: logging_trigger(); Type: FUNCTION; Schema: public; Owner: homestead
--

CREATE FUNCTION logging_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
              DECLARE
              BEGIN
                INSERT INTO logs(user_id,title,description,created_at,updated_at)
                VALUES(NEW.id,'User Created','user account created',now(),now());
                RETURN NULL;
              END;
            $$;


ALTER FUNCTION public.logging_trigger() OWNER TO homestead;

--
-- Name: reservation_logging_trigger(); Type: FUNCTION; Schema: public; Owner: homestead
--

CREATE FUNCTION reservation_logging_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
              DECLARE
              BEGIN
               INSERT INTO logs(user_id,title,description,created_at,updated_at)
                VALUES(NEW.user_id,'Reservation Completed','A Reservation has been completed',now(),now());
                RETURN NULL;
              END;
            $$;


ALTER FUNCTION public.reservation_logging_trigger() OWNER TO homestead;

--
-- Name: reservation_taken_logging_trigger(); Type: FUNCTION; Schema: public; Owner: homestead
--

CREATE FUNCTION reservation_taken_logging_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
              DECLARE
              BEGIN
               INSERT INTO logs(user_id,title,description,created_at,updated_at)
                VALUES(NEW.user_id,'New Reservation','A new Reservation has been created',now(),now());
                RETURN NULL;
              END;
            $$;


ALTER FUNCTION public.reservation_taken_logging_trigger() OWNER TO homestead;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: airports; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE airports (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    location_id integer NOT NULL
);


ALTER TABLE airports OWNER TO homestead;

--
-- Name: airports_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE airports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE airports_id_seq OWNER TO homestead;

--
-- Name: airports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE airports_id_seq OWNED BY airports.id;


--
-- Name: discounts; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE discounts (
    id integer NOT NULL,
    amount integer NOT NULL,
    type character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE discounts OWNER TO homestead;

--
-- Name: discounts_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE discounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE discounts_id_seq OWNER TO homestead;

--
-- Name: discounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE discounts_id_seq OWNED BY discounts.id;


--
-- Name: flight_package; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE flight_package (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    package_id integer NOT NULL,
    flight_id integer NOT NULL
);


ALTER TABLE flight_package OWNER TO homestead;

--
-- Name: flight_package_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE flight_package_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE flight_package_id_seq OWNER TO homestead;

--
-- Name: flight_package_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE flight_package_id_seq OWNED BY flight_package.id;


--
-- Name: flight_reservation; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE flight_reservation (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    go_at timestamp(0) without time zone NOT NULL,
    return_at timestamp(0) without time zone NOT NULL,
    reservation_id integer NOT NULL,
    flight_id integer NOT NULL
);


ALTER TABLE flight_reservation OWNER TO homestead;

--
-- Name: flight_reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE flight_reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE flight_reservation_id_seq OWNER TO homestead;

--
-- Name: flight_reservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE flight_reservation_id_seq OWNED BY flight_reservation.id;


--
-- Name: flights; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE flights (
    id integer NOT NULL,
    "coordinatesStart" character varying(255) NOT NULL,
    "coordinatesEnd" character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    "luggageCapacity" integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    plane_id integer NOT NULL,
    airport_id integer
);


ALTER TABLE flights OWNER TO homestead;

--
-- Name: flights_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE flights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE flights_id_seq OWNER TO homestead;

--
-- Name: flights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE flights_id_seq OWNED BY flights.id;


--
-- Name: hotels; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE hotels (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    state integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    location_id integer NOT NULL
);


ALTER TABLE hotels OWNER TO homestead;

--
-- Name: hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE hotels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hotels_id_seq OWNER TO homestead;

--
-- Name: hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE hotels_id_seq OWNED BY hotels.id;


--
-- Name: insurance_reservation; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE insurance_reservation (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    start_at timestamp(0) without time zone NOT NULL,
    end_at timestamp(0) without time zone NOT NULL,
    reservation_id integer NOT NULL,
    insurance_id integer NOT NULL
);


ALTER TABLE insurance_reservation OWNER TO homestead;

--
-- Name: insurance_reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE insurance_reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE insurance_reservation_id_seq OWNER TO homestead;

--
-- Name: insurance_reservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE insurance_reservation_id_seq OWNED BY insurance_reservation.id;


--
-- Name: insurances; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE insurances (
    id integer NOT NULL,
    value integer NOT NULL,
    type character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE insurances OWNER TO homestead;

--
-- Name: insurances_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE insurances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE insurances_id_seq OWNER TO homestead;

--
-- Name: insurances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE insurances_id_seq OWNED BY insurances.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE locations (
    id integer NOT NULL,
    coordinates character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    country character varying(255) NOT NULL,
    street character varying(255),
    "houseCode" integer,
    "postalCode" character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE locations OWNER TO homestead;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE locations_id_seq OWNER TO homestead;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: logs; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE logs (
    id integer NOT NULL,
    "transactionCode" character varying(255),
    title character varying(255) NOT NULL,
    description text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    user_id integer NOT NULL,
    payment_method_id integer
);


ALTER TABLE logs OWNER TO homestead;

--
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE logs_id_seq OWNER TO homestead;

--
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE logs_id_seq OWNED BY logs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE migrations OWNER TO homestead;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE migrations_id_seq OWNER TO homestead;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE migrations_id_seq OWNED BY migrations.id;


--
-- Name: package_reservation; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE package_reservation (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    reservation_id integer NOT NULL,
    package_id integer NOT NULL
);


ALTER TABLE package_reservation OWNER TO homestead;

--
-- Name: package_reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE package_reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE package_reservation_id_seq OWNER TO homestead;

--
-- Name: package_reservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE package_reservation_id_seq OWNED BY package_reservation.id;


--
-- Name: package_room; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE package_room (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    room_id integer NOT NULL,
    package_id integer NOT NULL
);


ALTER TABLE package_room OWNER TO homestead;

--
-- Name: package_room_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE package_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE package_room_id_seq OWNER TO homestead;

--
-- Name: package_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE package_room_id_seq OWNED BY package_room.id;


--
-- Name: package_vehicle; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE package_vehicle (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    vehicle_id integer NOT NULL,
    package_id integer NOT NULL
);


ALTER TABLE package_vehicle OWNER TO homestead;

--
-- Name: package_vehicle_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE package_vehicle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE package_vehicle_id_seq OWNER TO homestead;

--
-- Name: package_vehicle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE package_vehicle_id_seq OWNED BY package_vehicle.id;


--
-- Name: packages; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE packages (
    id integer NOT NULL,
    value integer NOT NULL,
    description text NOT NULL,
    type character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    discount_id integer
);


ALTER TABLE packages OWNER TO homestead;

--
-- Name: packages_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE packages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE packages_id_seq OWNER TO homestead;

--
-- Name: packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE packages_id_seq OWNED BY packages.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE password_resets OWNER TO homestead;

--
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE payment_methods (
    id integer NOT NULL,
    type character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE payment_methods OWNER TO homestead;

--
-- Name: payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE payment_methods_id_seq OWNER TO homestead;

--
-- Name: payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE payment_methods_id_seq OWNED BY payment_methods.id;


--
-- Name: planes; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE planes (
    id integer NOT NULL,
    brand character varying(255) NOT NULL,
    capacity integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    airport_id integer NOT NULL
);


ALTER TABLE planes OWNER TO homestead;

--
-- Name: planes_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE planes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE planes_id_seq OWNER TO homestead;

--
-- Name: planes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE planes_id_seq OWNED BY planes.id;


--
-- Name: reservation_room; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE reservation_room (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    entry_at timestamp(0) without time zone NOT NULL,
    exit_at timestamp(0) without time zone NOT NULL,
    reservation_id integer NOT NULL,
    room_id integer NOT NULL
);


ALTER TABLE reservation_room OWNER TO homestead;

--
-- Name: reservation_room_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE reservation_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reservation_room_id_seq OWNER TO homestead;

--
-- Name: reservation_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE reservation_room_id_seq OWNED BY reservation_room.id;


--
-- Name: reservation_seat; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE reservation_seat (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    reservation_id integer NOT NULL,
    seat_id integer NOT NULL
);


ALTER TABLE reservation_seat OWNER TO homestead;

--
-- Name: reservation_seat_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE reservation_seat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reservation_seat_id_seq OWNER TO homestead;

--
-- Name: reservation_seat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE reservation_seat_id_seq OWNED BY reservation_seat.id;


--
-- Name: reservation_vehicle; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE reservation_vehicle (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    rent_at timestamp(0) without time zone NOT NULL,
    return_at timestamp(0) without time zone NOT NULL,
    reservation_id integer NOT NULL,
    vehicle_id integer NOT NULL
);


ALTER TABLE reservation_vehicle OWNER TO homestead;

--
-- Name: reservation_vehicle_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE reservation_vehicle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reservation_vehicle_id_seq OWNER TO homestead;

--
-- Name: reservation_vehicle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE reservation_vehicle_id_seq OWNED BY reservation_vehicle.id;


--
-- Name: reservations; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE reservations (
    id integer NOT NULL,
    amount integer NOT NULL,
    description text NOT NULL,
    completed boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    user_id integer NOT NULL,
    payment_method_id integer NOT NULL
);


ALTER TABLE reservations OWNER TO homestead;

--
-- Name: reservations_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE reservations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reservations_id_seq OWNER TO homestead;

--
-- Name: reservations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE reservations_id_seq OWNED BY reservations.id;


--
-- Name: role_user; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE role_user (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    user_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE role_user OWNER TO homestead;

--
-- Name: role_user_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE role_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_user_id_seq OWNER TO homestead;

--
-- Name: role_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE role_user_id_seq OWNED BY role_user.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE roles OWNER TO homestead;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_id_seq OWNER TO homestead;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE rooms (
    id integer NOT NULL,
    value integer NOT NULL,
    state integer NOT NULL,
    "adultCapacity" integer NOT NULL,
    "childrenCapacity" integer NOT NULL,
    type character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    hotel_id integer NOT NULL
);


ALTER TABLE rooms OWNER TO homestead;

--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rooms_id_seq OWNER TO homestead;

--
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE rooms_id_seq OWNED BY rooms.id;


--
-- Name: seats; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE seats (
    id integer NOT NULL,
    code character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    available boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    plane_id integer NOT NULL
);


ALTER TABLE seats OWNER TO homestead;

--
-- Name: seats_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE seats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seats_id_seq OWNER TO homestead;

--
-- Name: seats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE seats_id_seq OWNED BY seats.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    "moneyAmount" integer DEFAULT 0 NOT NULL,
    dni character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE users OWNER TO homestead;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO homestead;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: vehicles; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE vehicles (
    id integer NOT NULL,
    capacity integer NOT NULL,
    model character varying(255) NOT NULL,
    brand character varying(255) NOT NULL,
    patent character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE vehicles OWNER TO homestead;

--
-- Name: vehicles_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE vehicles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehicles_id_seq OWNER TO homestead;

--
-- Name: vehicles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE vehicles_id_seq OWNED BY vehicles.id;


--
-- Name: airports id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY airports ALTER COLUMN id SET DEFAULT nextval('airports_id_seq'::regclass);


--
-- Name: discounts id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY discounts ALTER COLUMN id SET DEFAULT nextval('discounts_id_seq'::regclass);


--
-- Name: flight_package id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY flight_package ALTER COLUMN id SET DEFAULT nextval('flight_package_id_seq'::regclass);


--
-- Name: flight_reservation id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY flight_reservation ALTER COLUMN id SET DEFAULT nextval('flight_reservation_id_seq'::regclass);


--
-- Name: flights id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY flights ALTER COLUMN id SET DEFAULT nextval('flights_id_seq'::regclass);


--
-- Name: hotels id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY hotels ALTER COLUMN id SET DEFAULT nextval('hotels_id_seq'::regclass);


--
-- Name: insurance_reservation id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY insurance_reservation ALTER COLUMN id SET DEFAULT nextval('insurance_reservation_id_seq'::regclass);


--
-- Name: insurances id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY insurances ALTER COLUMN id SET DEFAULT nextval('insurances_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY logs ALTER COLUMN id SET DEFAULT nextval('logs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY migrations ALTER COLUMN id SET DEFAULT nextval('migrations_id_seq'::regclass);


--
-- Name: package_reservation id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY package_reservation ALTER COLUMN id SET DEFAULT nextval('package_reservation_id_seq'::regclass);


--
-- Name: package_room id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY package_room ALTER COLUMN id SET DEFAULT nextval('package_room_id_seq'::regclass);


--
-- Name: package_vehicle id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY package_vehicle ALTER COLUMN id SET DEFAULT nextval('package_vehicle_id_seq'::regclass);


--
-- Name: packages id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY packages ALTER COLUMN id SET DEFAULT nextval('packages_id_seq'::regclass);


--
-- Name: payment_methods id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY payment_methods ALTER COLUMN id SET DEFAULT nextval('payment_methods_id_seq'::regclass);


--
-- Name: planes id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY planes ALTER COLUMN id SET DEFAULT nextval('planes_id_seq'::regclass);


--
-- Name: reservation_room id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY reservation_room ALTER COLUMN id SET DEFAULT nextval('reservation_room_id_seq'::regclass);


--
-- Name: reservation_seat id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY reservation_seat ALTER COLUMN id SET DEFAULT nextval('reservation_seat_id_seq'::regclass);


--
-- Name: reservation_vehicle id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY reservation_vehicle ALTER COLUMN id SET DEFAULT nextval('reservation_vehicle_id_seq'::regclass);


--
-- Name: reservations id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY reservations ALTER COLUMN id SET DEFAULT nextval('reservations_id_seq'::regclass);


--
-- Name: role_user id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY role_user ALTER COLUMN id SET DEFAULT nextval('role_user_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: rooms id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY rooms ALTER COLUMN id SET DEFAULT nextval('rooms_id_seq'::regclass);


--
-- Name: seats id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY seats ALTER COLUMN id SET DEFAULT nextval('seats_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: vehicles id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY vehicles ALTER COLUMN id SET DEFAULT nextval('vehicles_id_seq'::regclass);


--
-- Data for Name: airports; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO airports (id, name, type, created_at, updated_at, location_id) VALUES (1, 'Carson Goldner', 'international', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 7);
INSERT INTO airports (id, name, type, created_at, updated_at, location_id) VALUES (2, 'Coty Flatley', 'national', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 34);
INSERT INTO airports (id, name, type, created_at, updated_at, location_id) VALUES (3, 'Keagan Johns', 'international', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 6);
INSERT INTO airports (id, name, type, created_at, updated_at, location_id) VALUES (4, 'Edwina Marks Jr.', 'international', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 13);
INSERT INTO airports (id, name, type, created_at, updated_at, location_id) VALUES (5, 'Prof. Conner Friesen', 'international', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 15);
INSERT INTO airports (id, name, type, created_at, updated_at, location_id) VALUES (6, 'Roxane Bergnaum', 'international', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 20);
INSERT INTO airports (id, name, type, created_at, updated_at, location_id) VALUES (7, 'Noe Hackett DVM', 'international', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 17);
INSERT INTO airports (id, name, type, created_at, updated_at, location_id) VALUES (8, 'Alphonso Crona', 'international', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 39);
INSERT INTO airports (id, name, type, created_at, updated_at, location_id) VALUES (9, 'Iva Kassulke', 'international', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 16);
INSERT INTO airports (id, name, type, created_at, updated_at, location_id) VALUES (10, 'Mr. Kristofer Luettgen', 'international', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 47);


--
-- Name: airports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('airports_id_seq', 10, true);


--
-- Data for Name: discounts; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO discounts (id, amount, type, title, description, created_at, updated_at) VALUES (1, 7497, 'low season', 'quo', 'Aut culpa aut fugit repudiandae delectus. Error unde et cum nam consequatur aut. Odio eos voluptatem commodi sunt alias. Dolorem pariatur voluptatem soluta facere.', '2018-12-28 16:54:17', '2018-12-28 16:54:17');
INSERT INTO discounts (id, amount, type, title, description, created_at, updated_at) VALUES (2, 6947, 'sale', 'qui', 'Corporis consequatur nisi similique cum similique saepe. Exercitationem laudantium facere eveniet est earum. Placeat laudantium maxime et quas beatae cumque. Quae eum dicta ut et aut accusantium id.', '2018-12-28 16:54:17', '2018-12-28 16:54:17');
INSERT INTO discounts (id, amount, type, title, description, created_at, updated_at) VALUES (3, 7213, 'christmas', 'molestiae', 'Harum animi odit voluptas esse dolorem qui ut est. Amet et laudantium officiis velit cumque at reiciendis. Inventore unde quia voluptate cumque quis. Quod impedit quam sint eius.', '2018-12-28 16:54:17', '2018-12-28 16:54:17');
INSERT INTO discounts (id, amount, type, title, description, created_at, updated_at) VALUES (4, 9186, 'sale', 'voluptatem', 'Expedita aut natus temporibus minima cum in. Cupiditate officiis et aliquam quasi laudantium sequi. Autem distinctio odit quaerat corrupti odio ut. Minus aut animi dolore.', '2018-12-28 16:54:17', '2018-12-28 16:54:17');
INSERT INTO discounts (id, amount, type, title, description, created_at, updated_at) VALUES (5, 6126, 'low season', 'qui', 'Iure voluptatem sit est eveniet. Qui qui molestias rerum sapiente totam. Qui ratione vero quo ducimus et qui autem. Et sit voluptatem sit et alias aut fuga eos.', '2018-12-28 16:54:17', '2018-12-28 16:54:17');
INSERT INTO discounts (id, amount, type, title, description, created_at, updated_at) VALUES (6, 5034, 'low season', 'qui', 'Omnis vero perferendis ea. Ea sit culpa amet exercitationem debitis ratione itaque. Officiis magnam fugit pariatur facere.', '2018-12-28 16:54:17', '2018-12-28 16:54:17');
INSERT INTO discounts (id, amount, type, title, description, created_at, updated_at) VALUES (7, 7993, 'low season', 'temporibus', 'Recusandae libero reiciendis et aliquam vel voluptas. Laudantium ea facilis qui quam. Libero qui quia velit explicabo.', '2018-12-28 16:54:17', '2018-12-28 16:54:17');
INSERT INTO discounts (id, amount, type, title, description, created_at, updated_at) VALUES (8, 8069, 'sale', 'nisi', 'Ad nihil labore tenetur quibusdam eaque necessitatibus laborum. Blanditiis non mollitia architecto at sint explicabo. Suscipit dolorem asperiores assumenda eveniet.', '2018-12-28 16:54:17', '2018-12-28 16:54:17');
INSERT INTO discounts (id, amount, type, title, description, created_at, updated_at) VALUES (9, 9725, 'low season', 'fuga', 'Recusandae occaecati maiores expedita praesentium non ducimus est. Et sed voluptas aut recusandae aut voluptate. Esse dolor impedit tenetur dolorem similique nisi.', '2018-12-28 16:54:17', '2018-12-28 16:54:17');
INSERT INTO discounts (id, amount, type, title, description, created_at, updated_at) VALUES (10, 5071, 'low season', 'voluptates', 'Non aut nisi et rerum. Pariatur illo amet et et velit unde qui. Aliquam ipsam itaque quae perspiciatis minima quia.', '2018-12-28 16:54:17', '2018-12-28 16:54:17');


--
-- Name: discounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('discounts_id_seq', 10, true);


--
-- Data for Name: flight_package; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO flight_package (id, created_at, updated_at, package_id, flight_id) VALUES (1, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 1, 1);
INSERT INTO flight_package (id, created_at, updated_at, package_id, flight_id) VALUES (2, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 2, 1);
INSERT INTO flight_package (id, created_at, updated_at, package_id, flight_id) VALUES (3, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 3, 1);
INSERT INTO flight_package (id, created_at, updated_at, package_id, flight_id) VALUES (4, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 4, 1);
INSERT INTO flight_package (id, created_at, updated_at, package_id, flight_id) VALUES (5, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 5, 2);
INSERT INTO flight_package (id, created_at, updated_at, package_id, flight_id) VALUES (6, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 6, 1);
INSERT INTO flight_package (id, created_at, updated_at, package_id, flight_id) VALUES (7, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 7, 1);
INSERT INTO flight_package (id, created_at, updated_at, package_id, flight_id) VALUES (8, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 8, 4);
INSERT INTO flight_package (id, created_at, updated_at, package_id, flight_id) VALUES (9, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 9, 4);
INSERT INTO flight_package (id, created_at, updated_at, package_id, flight_id) VALUES (10, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 10, 4);


--
-- Name: flight_package_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('flight_package_id_seq', 10, true);


--
-- Data for Name: flight_reservation; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO flight_reservation (id, created_at, updated_at, go_at, return_at, reservation_id, flight_id) VALUES (1, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 1, 4);
INSERT INTO flight_reservation (id, created_at, updated_at, go_at, return_at, reservation_id, flight_id) VALUES (2, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 2, 2);
INSERT INTO flight_reservation (id, created_at, updated_at, go_at, return_at, reservation_id, flight_id) VALUES (3, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 3, 2);
INSERT INTO flight_reservation (id, created_at, updated_at, go_at, return_at, reservation_id, flight_id) VALUES (4, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 4, 3);
INSERT INTO flight_reservation (id, created_at, updated_at, go_at, return_at, reservation_id, flight_id) VALUES (5, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 5, 2);
INSERT INTO flight_reservation (id, created_at, updated_at, go_at, return_at, reservation_id, flight_id) VALUES (6, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 6, 3);
INSERT INTO flight_reservation (id, created_at, updated_at, go_at, return_at, reservation_id, flight_id) VALUES (7, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 7, 3);
INSERT INTO flight_reservation (id, created_at, updated_at, go_at, return_at, reservation_id, flight_id) VALUES (8, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 8, 3);
INSERT INTO flight_reservation (id, created_at, updated_at, go_at, return_at, reservation_id, flight_id) VALUES (9, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 9, 3);
INSERT INTO flight_reservation (id, created_at, updated_at, go_at, return_at, reservation_id, flight_id) VALUES (10, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 10, 1);


--
-- Name: flight_reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('flight_reservation_id_seq', 10, true);


--
-- Data for Name: flights; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO flights (id, "coordinatesStart", "coordinatesEnd", type, "luggageCapacity", created_at, updated_at, plane_id, airport_id) VALUES (1, '8.438852,-162.023927', '-82.400263,6.909666', 'Expedita neque rem.', 384, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 8, 6);
INSERT INTO flights (id, "coordinatesStart", "coordinatesEnd", type, "luggageCapacity", created_at, updated_at, plane_id, airport_id) VALUES (2, '33.139755,-84.077627', '-37.629138,61.015307', 'Ipsam voluptas.', 120, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 7, 5);
INSERT INTO flights (id, "coordinatesStart", "coordinatesEnd", type, "luggageCapacity", created_at, updated_at, plane_id, airport_id) VALUES (3, '-73.038858,-77.299695', '-13.961403,-10.837593', 'Reprehenderit laborum.', 371, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10, 9);
INSERT INTO flights (id, "coordinatesStart", "coordinatesEnd", type, "luggageCapacity", created_at, updated_at, plane_id, airport_id) VALUES (4, '33.215469,-176.326708', '33.685543,-73.794161', 'Et ducimus.', 278, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 1, 4);


--
-- Name: flights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('flights_id_seq', 4, true);


--
-- Data for Name: hotels; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO hotels (id, name, state, created_at, updated_at, location_id) VALUES (1, 'Weimann Group', 4, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 40);
INSERT INTO hotels (id, name, state, created_at, updated_at, location_id) VALUES (2, 'Predovic, Rohan and Beier', 3, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 26);
INSERT INTO hotels (id, name, state, created_at, updated_at, location_id) VALUES (3, 'Schowalter-Lebsack', 5, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 30);
INSERT INTO hotels (id, name, state, created_at, updated_at, location_id) VALUES (4, 'Anderson Inc', 3, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 2);
INSERT INTO hotels (id, name, state, created_at, updated_at, location_id) VALUES (5, 'Dickens-Schowalter', 3, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 38);
INSERT INTO hotels (id, name, state, created_at, updated_at, location_id) VALUES (6, 'Schuster-Abshire', 5, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 49);


--
-- Name: hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('hotels_id_seq', 6, true);


--
-- Data for Name: insurance_reservation; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO insurance_reservation (id, created_at, updated_at, start_at, end_at, reservation_id, insurance_id) VALUES (1, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 1, 2);
INSERT INTO insurance_reservation (id, created_at, updated_at, start_at, end_at, reservation_id, insurance_id) VALUES (2, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 2, 2);
INSERT INTO insurance_reservation (id, created_at, updated_at, start_at, end_at, reservation_id, insurance_id) VALUES (3, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 3, 4);
INSERT INTO insurance_reservation (id, created_at, updated_at, start_at, end_at, reservation_id, insurance_id) VALUES (4, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 4, 4);
INSERT INTO insurance_reservation (id, created_at, updated_at, start_at, end_at, reservation_id, insurance_id) VALUES (5, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 5, 6);
INSERT INTO insurance_reservation (id, created_at, updated_at, start_at, end_at, reservation_id, insurance_id) VALUES (6, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 6, 5);
INSERT INTO insurance_reservation (id, created_at, updated_at, start_at, end_at, reservation_id, insurance_id) VALUES (7, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 7, 2);
INSERT INTO insurance_reservation (id, created_at, updated_at, start_at, end_at, reservation_id, insurance_id) VALUES (8, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 8, 10);
INSERT INTO insurance_reservation (id, created_at, updated_at, start_at, end_at, reservation_id, insurance_id) VALUES (9, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 9, 2);
INSERT INTO insurance_reservation (id, created_at, updated_at, start_at, end_at, reservation_id, insurance_id) VALUES (10, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 10, 9);


--
-- Name: insurance_reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('insurance_reservation_id_seq', 10, true);


--
-- Data for Name: insurances; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO insurances (id, value, type, created_at, updated_at) VALUES (1, 74796, 'thief', '2018-12-28 16:54:17', '2018-12-28 16:54:17');
INSERT INTO insurances (id, value, type, created_at, updated_at) VALUES (2, 89229, 'thief', '2018-12-28 16:54:17', '2018-12-28 16:54:17');
INSERT INTO insurances (id, value, type, created_at, updated_at) VALUES (3, 13871, 'travel', '2018-12-28 16:54:17', '2018-12-28 16:54:17');
INSERT INTO insurances (id, value, type, created_at, updated_at) VALUES (4, 56658, 'travel', '2018-12-28 16:54:17', '2018-12-28 16:54:17');
INSERT INTO insurances (id, value, type, created_at, updated_at) VALUES (5, 51759, 'thief', '2018-12-28 16:54:17', '2018-12-28 16:54:17');
INSERT INTO insurances (id, value, type, created_at, updated_at) VALUES (6, 86497, 'life', '2018-12-28 16:54:17', '2018-12-28 16:54:17');
INSERT INTO insurances (id, value, type, created_at, updated_at) VALUES (7, 45596, 'travel', '2018-12-28 16:54:17', '2018-12-28 16:54:17');
INSERT INTO insurances (id, value, type, created_at, updated_at) VALUES (8, 30002, 'life', '2018-12-28 16:54:17', '2018-12-28 16:54:17');
INSERT INTO insurances (id, value, type, created_at, updated_at) VALUES (9, 86236, 'life', '2018-12-28 16:54:17', '2018-12-28 16:54:17');
INSERT INTO insurances (id, value, type, created_at, updated_at) VALUES (10, 87903, 'thief', '2018-12-28 16:54:17', '2018-12-28 16:54:17');


--
-- Name: insurances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('insurances_id_seq', 10, true);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (1, '56.433603,72.819067', 'Port Adelbert', 'Belgium', 'Erwin Hills', 59898, '13543', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (2, '-45.468763,-159.483745', 'Greenmouth', 'Egypt', 'Emelia Camp', 8283, '02550-1943', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (3, '18.425853,-87.716206', 'Elyssamouth', 'Heard Island and McDonald Islands', 'Judge Well', 554, '78298-2581', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (4, '-17.464446,83.790112', 'North Brennonhaven', 'Pakistan', 'Anjali Viaduct', 5714, '79761-1626', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (5, '-39.791721,72.436755', 'South Darron', 'Qatar', 'Dashawn Square', 3207, '22554-8552', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (6, '-12.306068,93.007827', 'West Haven', 'Albania', 'Goldner Courts', 6038, '90102', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (7, '-51.837652,-92.816459', 'Arnoldhaven', 'New Caledonia', 'Klein Mill', 3672, '28387-8858', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (8, '26.63772,-6.255661', 'East Breanne', 'Macedonia', 'Carmel Trail', 2805, '69505', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (9, '-20.409878,157.175548', 'Majorburgh', 'Sweden', 'Jerde Unions', 1960, '39705-2012', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (10, '32.432417,-9.911471', 'North Hollisfurt', 'Malawi', 'Goodwin Camp', 901, '98410-1284', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (11, '-83.363,155.588103', 'East Haley', 'Libyan Arab Jamahiriya', 'Schaden Vista', 3733, '04517', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (12, '5.808843,4.68937', 'West Vincent', 'Brazil', 'Filomena Course', 310, '68515-4386', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (13, '-20.920639,-106.942544', 'East Vincenzo', 'Yemen', 'Mylene Road', 1258, '82629', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (14, '-59.53232,96.52608', 'East Finnton', 'British Virgin Islands', 'Bernier Street', 5739, '81059', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (15, '-24.656577,-114.549247', 'Runteville', 'Afghanistan', 'Wiegand Extension', 412, '14965-6204', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (16, '9.173265,-144.980486', 'East Kenyon', 'Kazakhstan', 'Yost Valley', 6673, '34880-3439', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (17, '40.735865,-125.605655', 'Lake Edmond', 'Italy', 'Imani Prairie', 265, '50308', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (18, '3.663027,169.927752', 'Toyview', 'Canada', 'Kris Rapid', 59445, '35947-2755', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (19, '85.469367,-27.35498', 'East Gregorio', 'Saint Pierre and Miquelon', 'Newton Ville', 2116, '63879-1288', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (20, '41.56731,-73.016413', 'West Breanne', 'Czech Republic', 'Watsica Unions', 5736, '42387', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (21, '22.194398,3.933668', 'North Zion', 'Seychelles', 'Fadel Junction', 133, '55636', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (22, '2.562547,-152.032687', 'Turcottefurt', 'Zimbabwe', 'Shannon Haven', 49605, '12823-2562', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (23, '-1.157755,145.223816', 'East Lesterland', 'China', 'Leuschke Neck', 6398, '03228', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (24, '79.661147,-112.267359', 'East Elise', 'Togo', 'Rath Burg', 446, '33653-1878', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (25, '-7.217233,-98.027771', 'South Harry', 'Dominican Republic', 'McClure Points', 106, '30421-6945', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (26, '66.808935,20.384839', 'Port Colby', 'Netherlands Antilles', 'Wyatt Views', 622, '11909-9116', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (27, '32.607815,-154.184915', 'North Edythstad', 'Isle of Man', 'Schiller Wall', 8980, '50876-8347', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (28, '-5.873196,106.13266', 'Morarside', 'Guinea-Bissau', 'Auer Locks', 88650, '54662', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (29, '-88.813973,-131.579895', 'Lottieberg', 'Aruba', 'Tyree Lakes', 31627, '60811', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (30, '61.416553,30.991596', 'Port Evangelineburgh', 'Bermuda', 'Muhammad Knoll', 213, '67689-0161', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (31, '-53.247968,-162.087526', 'East Luisa', 'Bulgaria', 'Eugene Prairie', 4523, '93883', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (32, '1.00501,-140.832614', 'West Angel', 'Timor-Leste', 'Marcos Station', 2110, '62211-5540', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (33, '48.408791,-54.627817', 'Carrollside', 'Ethiopia', 'Katelynn Extension', 389, '71752', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (34, '-46.179243,-62.298129', 'Darleneberg', 'Dominica', 'Darby Tunnel', 4603, '24004', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (35, '-6.260792,14.001079', 'South Lorenzofort', 'Jordan', 'Delores Crest', 29863, '12502-4477', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (36, '15.911623,76.960534', 'South Lilly', 'Seychelles', 'June Field', 45192, '22015', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (37, '6.141535,-152.901316', 'Lake Twila', 'Svalbard & Jan Mayen Islands', 'Labadie Grove', 613, '35808', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (38, '71.815037,107.430279', 'New Vidastad', 'French Southern Territories', 'Littel Well', 4982, '54785-3516', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (39, '31.794996,75.854373', 'Watersmouth', 'Andorra', 'Walsh Pike', 68246, '82096-7706', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (40, '-77.768208,137.054058', 'Hansenside', 'Guernsey', 'Koch Lakes', 16393, '22845-4692', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (41, '67.46554,74.589459', 'Lake Domenica', 'Djibouti', 'Myrtis Bypass', 7673, '46568-7704', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (42, '31.925886,74.715139', 'Larkinton', 'Northern Mariana Islands', 'Branson Plains', 14046, '76529', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (43, '-15.420304,-72.620338', 'Lake Jany', 'Sierra Leone', 'Hackett Locks', 2703, '54383', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (44, '-10.670066,104.975123', 'Lefflershire', 'Puerto Rico', 'Raquel Mills', 21208, '19655', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (45, '-54.406689,81.782013', 'Donnellyville', 'Slovenia', 'Goyette Walk', 6946, '28477', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (46, '-47.6009,72.025581', 'Port Cordeliaberg', 'Falkland Islands (Malvinas)', 'Damien Mills', 619, '05405-8072', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (47, '15.169875,93.826972', 'New Mireya', 'Portugal', 'Arlo Forge', 70834, '29446', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (48, '86.097782,53.757768', 'Daniellachester', 'Saint Lucia', 'Reinger Drive', 3559, '19154', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (49, '-28.422338,83.745487', 'West Timmothy', 'Macao', 'Beer Path', 100, '14306', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (50, '-84.734678,-153.178965', 'Lake Hettie', 'Taiwan', 'Bud Camp', 4587, '15859', '2018-12-28 16:54:14', '2018-12-28 16:54:14');


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('locations_id_seq', 50, true);


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (1, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (2, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 2, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (3, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 3, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (4, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 4, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (5, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 5, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (6, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 6, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (7, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 7, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (8, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 8, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (9, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 9, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (10, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 10, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (11, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 11, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (12, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 12, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (13, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 13, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (14, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 14, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (15, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 15, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (16, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 16, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (17, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 17, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (18, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 18, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (19, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 19, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (20, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 20, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (21, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 21, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (22, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 22, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (23, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 23, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (24, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 24, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (25, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 25, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (26, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 26, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (27, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 27, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (28, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 28, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (29, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 29, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (30, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 30, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (31, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 31, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (32, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 32, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (33, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 33, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (34, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 34, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (35, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 35, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (36, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 36, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (37, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 37, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (38, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 38, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (39, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 39, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (40, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 40, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (41, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 41, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (42, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 42, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (43, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 43, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (44, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 44, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (45, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 45, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (46, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 46, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (47, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 47, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (48, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 48, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (49, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 49, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (50, NULL, 'User Created', 'user account created', '2018-12-28 16:54:14', '2018-12-28 16:54:14', 50, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (51, NULL, 'New Reservation', 'A new Reservation has been created', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 13, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (52, NULL, 'New Reservation', 'A new Reservation has been created', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 37, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (53, NULL, 'New Reservation', 'A new Reservation has been created', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 14, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (54, NULL, 'New Reservation', 'A new Reservation has been created', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 45, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (55, NULL, 'New Reservation', 'A new Reservation has been created', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 33, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (56, NULL, 'Reservation Completed', 'A Reservation has been completed', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 41, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (57, NULL, 'New Reservation', 'A new Reservation has been created', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 41, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (58, NULL, 'Reservation Completed', 'A Reservation has been completed', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 16, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (59, NULL, 'New Reservation', 'A new Reservation has been created', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 16, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (60, NULL, 'Reservation Completed', 'A Reservation has been completed', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 35, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (61, NULL, 'New Reservation', 'A new Reservation has been created', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 35, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (62, NULL, 'New Reservation', 'A new Reservation has been created', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 31, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (63, NULL, 'Reservation Completed', 'A Reservation has been completed', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 43, NULL);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (64, NULL, 'New Reservation', 'A new Reservation has been created', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 43, NULL);


--
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('logs_id_seq', 64, true);


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO migrations (id, migration, batch) VALUES (116, '2014_10_12_000000_create_users_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (117, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (118, '2018_12_19_233223_create_roles_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (119, '2018_12_19_233518_create_payment_methods_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (120, '2018_12_19_234115_create_logs_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (121, '2018_12_19_234717_create_reservations_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (122, '2018_12_19_234914_create_insurances_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (123, '2018_12_20_000929_create_vehicles_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (124, '2018_12_20_000930_create_locations_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (125, '2018_12_20_002227_create_hotels_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (126, '2018_12_20_002747_create_rooms_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (127, '2018_12_20_003604_create_discounts_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (128, '2018_12_20_004014_create_packages_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (129, '2018_12_20_005837_create_airports_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (130, '2018_12_20_011057_create_planes_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (131, '2018_12_20_011058_create_flights_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (132, '2018_12_20_011453_create_seats_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (133, '2018_12_20_141333_create_role_user_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (134, '2018_12_20_142552_create_insurance_reservation_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (135, '2018_12_20_142928_create_reservation_vehicle_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (136, '2018_12_20_143522_create_reservation_room_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (137, '2018_12_20_143905_create_package_reservation_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (138, '2018_12_20_144039_create_package_vehicle_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (139, '2018_12_20_144133_create_package_room_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (140, '2018_12_20_144528_create_flight_reservation_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (141, '2018_12_20_144655_create_flight_package_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (142, '2018_12_20_145039_create_reservation_seat_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (143, '2018_12_28_133207_create_new_user_log_trigger', 1);
INSERT INTO migrations (id, migration, batch) VALUES (144, '2018_12_28_135518_create_reservation_completed_log_trigger', 1);
INSERT INTO migrations (id, migration, batch) VALUES (145, '2018_12_28_144906_create_reservation_taken_log_trigger', 1);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('migrations_id_seq', 145, true);


--
-- Data for Name: package_reservation; Type: TABLE DATA; Schema: public; Owner: homestead
--



--
-- Name: package_reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('package_reservation_id_seq', 1, false);


--
-- Data for Name: package_room; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO package_room (id, created_at, updated_at, room_id, package_id) VALUES (1, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 36, 1);
INSERT INTO package_room (id, created_at, updated_at, room_id, package_id) VALUES (2, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 62, 2);
INSERT INTO package_room (id, created_at, updated_at, room_id, package_id) VALUES (3, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 68, 3);
INSERT INTO package_room (id, created_at, updated_at, room_id, package_id) VALUES (4, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 91, 4);
INSERT INTO package_room (id, created_at, updated_at, room_id, package_id) VALUES (5, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 27, 5);
INSERT INTO package_room (id, created_at, updated_at, room_id, package_id) VALUES (6, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 23, 6);
INSERT INTO package_room (id, created_at, updated_at, room_id, package_id) VALUES (7, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 99, 7);
INSERT INTO package_room (id, created_at, updated_at, room_id, package_id) VALUES (8, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 5, 8);
INSERT INTO package_room (id, created_at, updated_at, room_id, package_id) VALUES (9, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 119, 9);
INSERT INTO package_room (id, created_at, updated_at, room_id, package_id) VALUES (10, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 114, 10);


--
-- Name: package_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('package_room_id_seq', 10, true);


--
-- Data for Name: package_vehicle; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO package_vehicle (id, created_at, updated_at, vehicle_id, package_id) VALUES (1, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 45, 1);
INSERT INTO package_vehicle (id, created_at, updated_at, vehicle_id, package_id) VALUES (2, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 25, 2);
INSERT INTO package_vehicle (id, created_at, updated_at, vehicle_id, package_id) VALUES (3, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 39, 3);
INSERT INTO package_vehicle (id, created_at, updated_at, vehicle_id, package_id) VALUES (4, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 29, 4);
INSERT INTO package_vehicle (id, created_at, updated_at, vehicle_id, package_id) VALUES (5, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 49, 5);
INSERT INTO package_vehicle (id, created_at, updated_at, vehicle_id, package_id) VALUES (6, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 22, 6);
INSERT INTO package_vehicle (id, created_at, updated_at, vehicle_id, package_id) VALUES (7, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 1, 7);
INSERT INTO package_vehicle (id, created_at, updated_at, vehicle_id, package_id) VALUES (8, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 47, 8);
INSERT INTO package_vehicle (id, created_at, updated_at, vehicle_id, package_id) VALUES (9, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 29, 9);
INSERT INTO package_vehicle (id, created_at, updated_at, vehicle_id, package_id) VALUES (10, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 7, 10);


--
-- Name: package_vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('package_vehicle_id_seq', 10, true);


--
-- Data for Name: packages; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO packages (id, value, description, type, created_at, updated_at, discount_id) VALUES (1, 676524, 'Commodi eius placeat autem assumenda qui. Ab quo porro quas. Aspernatur magni quia debitis eos et soluta. Quod quia quaerat quaerat sint dolores molestiae non.', 'fly-vehicle', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 10);
INSERT INTO packages (id, value, description, type, created_at, updated_at, discount_id) VALUES (2, 935466, 'Vitae dicta voluptas saepe voluptas repellendus nemo. Autem a fugiat quia veritatis dolorum a. Molestiae eveniet mollitia non minima corrupti sit sequi voluptatem.', 'fly-hotel', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 8);
INSERT INTO packages (id, value, description, type, created_at, updated_at, discount_id) VALUES (3, 744640, 'Quaerat possimus voluptas reprehenderit inventore expedita dolor consequuntur expedita. Velit deleniti eos odio laborum omnis consectetur.', 'fly-hotel', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 9);
INSERT INTO packages (id, value, description, type, created_at, updated_at, discount_id) VALUES (4, 587850, 'Officia ipsum quia quidem. Ut rerum error magni eos amet. Totam velit enim sint minima quibusdam qui. Aut aspernatur voluptas necessitatibus explicabo ut nulla.', 'fly-vehicle', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 10);
INSERT INTO packages (id, value, description, type, created_at, updated_at, discount_id) VALUES (5, 237631, 'Voluptatum eius distinctio voluptatem rerum quas deserunt quod. Et fugit deleniti dolores totam corrupti.', 'fly-hotel', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 6);
INSERT INTO packages (id, value, description, type, created_at, updated_at, discount_id) VALUES (6, 164273, 'Ut fugiat amet illum aspernatur ab vel. Sunt laborum est beatae pariatur. Maxime expedita quas rerum quidem nobis. At quae natus perferendis voluptate sit.', 'fly-hotel', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 2);
INSERT INTO packages (id, value, description, type, created_at, updated_at, discount_id) VALUES (7, 882378, 'Et omnis sunt id est pariatur non voluptatum. Et aut sed ex qui corporis beatae. Unde officia eum sed voluptas animi velit ipsum. Commodi quasi molestias eum voluptas.', 'fly-vehicle', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 5);
INSERT INTO packages (id, value, description, type, created_at, updated_at, discount_id) VALUES (8, 649237, 'Aliquam amet deserunt eum maiores nobis eveniet. Saepe quaerat nostrum aut quo et ullam. Ab dolores est omnis aliquid est dolorum.', 'fly-vehicle', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 1);
INSERT INTO packages (id, value, description, type, created_at, updated_at, discount_id) VALUES (9, 826513, 'Voluptatum dolorum nulla animi aut sit. Officia omnis sed nihil voluptatem tempore. Natus et eius voluptates repellat animi qui tempore. Cupiditate amet nulla quam qui accusamus fugit consequuntur.', 'fly-hotel', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 6);
INSERT INTO packages (id, value, description, type, created_at, updated_at, discount_id) VALUES (10, 139497, 'In ut vel id nobis. Suscipit exercitationem adipisci velit voluptas. Nulla voluptatem qui repellendus porro eos harum quasi.', 'fly-hotel', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 6);


--
-- Name: packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('packages_id_seq', 10, true);


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: homestead
--



--
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO payment_methods (id, type, created_at, updated_at) VALUES (1, 'MasterCard', '2018-12-28 16:54:17', '2018-12-28 16:54:17');
INSERT INTO payment_methods (id, type, created_at, updated_at) VALUES (2, 'Visa', '2018-12-28 16:54:17', '2018-12-28 16:54:17');
INSERT INTO payment_methods (id, type, created_at, updated_at) VALUES (3, 'MasterCard', '2018-12-28 16:54:17', '2018-12-28 16:54:17');
INSERT INTO payment_methods (id, type, created_at, updated_at) VALUES (4, 'Visa', '2018-12-28 16:54:17', '2018-12-28 16:54:17');
INSERT INTO payment_methods (id, type, created_at, updated_at) VALUES (5, 'Visa', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO payment_methods (id, type, created_at, updated_at) VALUES (6, 'Visa', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO payment_methods (id, type, created_at, updated_at) VALUES (7, 'Discover Card', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO payment_methods (id, type, created_at, updated_at) VALUES (8, 'MasterCard', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO payment_methods (id, type, created_at, updated_at) VALUES (9, 'Discover Card', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO payment_methods (id, type, created_at, updated_at) VALUES (10, 'Visa Retired', '2018-12-28 16:54:18', '2018-12-28 16:54:18');


--
-- Name: payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('payment_methods_id_seq', 10, true);


--
-- Data for Name: planes; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (1, 'Quigley-Hane', 100, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 10);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (2, 'Shields, Lindgren and Kohler', 95, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 9);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (3, 'Bergstrom, O''Connell and Towne', 59, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (4, 'Heidenreich PLC', 83, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 7);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (5, 'Carroll-Strosin', 100, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 8);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (6, 'Wiegand-Fay', 92, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 3);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (7, 'Sanford, Koss and Jerde', 93, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (8, 'Morissette, Bechtelar and Mante', 93, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (9, 'Stark-Schmitt', 87, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 2);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (10, 'Reichel-Boyer', 52, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 6);


--
-- Name: planes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('planes_id_seq', 10, true);


--
-- Data for Name: reservation_room; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO reservation_room (id, created_at, updated_at, entry_at, exit_at, reservation_id, room_id) VALUES (1, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 1, 95);
INSERT INTO reservation_room (id, created_at, updated_at, entry_at, exit_at, reservation_id, room_id) VALUES (2, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 2, 1);
INSERT INTO reservation_room (id, created_at, updated_at, entry_at, exit_at, reservation_id, room_id) VALUES (3, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 3, 55);
INSERT INTO reservation_room (id, created_at, updated_at, entry_at, exit_at, reservation_id, room_id) VALUES (4, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 4, 49);
INSERT INTO reservation_room (id, created_at, updated_at, entry_at, exit_at, reservation_id, room_id) VALUES (5, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 5, 40);
INSERT INTO reservation_room (id, created_at, updated_at, entry_at, exit_at, reservation_id, room_id) VALUES (6, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 6, 53);
INSERT INTO reservation_room (id, created_at, updated_at, entry_at, exit_at, reservation_id, room_id) VALUES (7, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 7, 64);
INSERT INTO reservation_room (id, created_at, updated_at, entry_at, exit_at, reservation_id, room_id) VALUES (8, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 8, 81);
INSERT INTO reservation_room (id, created_at, updated_at, entry_at, exit_at, reservation_id, room_id) VALUES (9, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 9, 112);
INSERT INTO reservation_room (id, created_at, updated_at, entry_at, exit_at, reservation_id, room_id) VALUES (10, '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', '2018-12-28 16:54:18', 10, 35);


--
-- Name: reservation_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('reservation_room_id_seq', 10, true);


--
-- Data for Name: reservation_seat; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO reservation_seat (id, created_at, updated_at, reservation_id, seat_id) VALUES (1, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 1, 424);
INSERT INTO reservation_seat (id, created_at, updated_at, reservation_id, seat_id) VALUES (2, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 2, 794);
INSERT INTO reservation_seat (id, created_at, updated_at, reservation_id, seat_id) VALUES (3, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 3, 93);
INSERT INTO reservation_seat (id, created_at, updated_at, reservation_id, seat_id) VALUES (4, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 4, 833);
INSERT INTO reservation_seat (id, created_at, updated_at, reservation_id, seat_id) VALUES (5, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 5, 92);
INSERT INTO reservation_seat (id, created_at, updated_at, reservation_id, seat_id) VALUES (6, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 6, 445);
INSERT INTO reservation_seat (id, created_at, updated_at, reservation_id, seat_id) VALUES (7, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 7, 572);
INSERT INTO reservation_seat (id, created_at, updated_at, reservation_id, seat_id) VALUES (8, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 8, 308);
INSERT INTO reservation_seat (id, created_at, updated_at, reservation_id, seat_id) VALUES (9, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 9, 14);
INSERT INTO reservation_seat (id, created_at, updated_at, reservation_id, seat_id) VALUES (10, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 10, 215);


--
-- Name: reservation_seat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('reservation_seat_id_seq', 10, true);


--
-- Data for Name: reservation_vehicle; Type: TABLE DATA; Schema: public; Owner: homestead
--



--
-- Name: reservation_vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('reservation_vehicle_id_seq', 1, false);


--
-- Data for Name: reservations; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO reservations (id, amount, description, completed, created_at, updated_at, user_id, payment_method_id) VALUES (1, 418762, 'White Rabbit: it was the Duchess''s cook. She.', false, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 13, 3);
INSERT INTO reservations (id, amount, description, completed, created_at, updated_at, user_id, payment_method_id) VALUES (2, 195770, 'They''re dreadfully fond of pretending to be.', false, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 37, 9);
INSERT INTO reservations (id, amount, description, completed, created_at, updated_at, user_id, payment_method_id) VALUES (3, 220101, 'Queen. ''Well, I hardly know--No more, thank ye.', false, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 14, 6);
INSERT INTO reservations (id, amount, description, completed, created_at, updated_at, user_id, payment_method_id) VALUES (4, 157121, 'VERY turn-up nose, much more like a snout than a.', false, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 45, 6);
INSERT INTO reservations (id, amount, description, completed, created_at, updated_at, user_id, payment_method_id) VALUES (5, 69259, 'The pepper when he pleases!'' CHORUS. ''Wow! wow!.', false, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 33, 8);
INSERT INTO reservations (id, amount, description, completed, created_at, updated_at, user_id, payment_method_id) VALUES (6, 120410, 'I''d taken the highest tree in front of the sea.''.', true, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 41, 1);
INSERT INTO reservations (id, amount, description, completed, created_at, updated_at, user_id, payment_method_id) VALUES (7, 16002, 'March Hare said to the croquet-ground. The other.', true, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 16, 6);
INSERT INTO reservations (id, amount, description, completed, created_at, updated_at, user_id, payment_method_id) VALUES (8, 50842, 'Eaglet, and several other curious creatures.', true, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 35, 1);
INSERT INTO reservations (id, amount, description, completed, created_at, updated_at, user_id, payment_method_id) VALUES (9, 166840, 'Duchess was sitting on a crimson velvet cushion.', false, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 31, 2);
INSERT INTO reservations (id, amount, description, completed, created_at, updated_at, user_id, payment_method_id) VALUES (10, 483461, 'For he can thoroughly enjoy The pepper when he.', true, '2018-12-28 16:54:18', '2018-12-28 16:54:18', 43, 5);


--
-- Name: reservations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('reservations_id_seq', 10, true);


--
-- Data for Name: role_user; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (1, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (2, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 2, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (3, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 3, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (4, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 4, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (5, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 5, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (6, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 6, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (7, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 7, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (8, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 8, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (9, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 9, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (10, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 10, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (11, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 11, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (12, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 12, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (13, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 13, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (14, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 14, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (15, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 15, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (16, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 16, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (17, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 17, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (18, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 18, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (19, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 19, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (20, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 20, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (21, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 21, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (22, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 22, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (23, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 23, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (24, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 24, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (25, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 25, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (26, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 26, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (27, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 27, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (28, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 28, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (29, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 29, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (30, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 30, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (31, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 31, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (32, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 32, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (33, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 33, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (34, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 34, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (35, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 35, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (36, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 36, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (37, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 37, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (38, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 38, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (39, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 39, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (40, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 40, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (41, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 41, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (42, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 42, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (43, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 43, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (44, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 44, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (45, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 45, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (46, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 46, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (47, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 47, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (48, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 48, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (49, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 49, 1);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (50, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 50, 1);


--
-- Name: role_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('role_user_id_seq', 50, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO roles (id, name, created_at, updated_at) VALUES (1, 'normal', '2018-12-28 16:54:13', '2018-12-28 16:54:13');
INSERT INTO roles (id, name, created_at, updated_at) VALUES (2, 'developer', '2018-12-28 16:54:13', '2018-12-28 16:54:13');
INSERT INTO roles (id, name, created_at, updated_at) VALUES (3, 'administrator', '2018-12-28 16:54:13', '2018-12-28 16:54:13');


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('roles_id_seq', 3, true);


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (1, 79827, 5, 1, 5, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 1);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (2, 18644, 2, 1, 4, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 1);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (3, 45543, 3, 3, 3, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 1);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (4, 53365, 2, 2, 5, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 1);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (5, 66958, 1, 2, 1, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 1);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (6, 15329, 2, 4, 4, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 1);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (7, 70472, 1, 2, 2, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 1);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (8, 74749, 3, 5, 1, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 1);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (9, 88000, 2, 4, 1, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 1);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (10, 28678, 4, 5, 3, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 1);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (11, 82079, 5, 3, 5, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 1);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (12, 59045, 2, 5, 1, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 1);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (13, 14459, 4, 1, 4, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 1);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (14, 12204, 2, 1, 2, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 1);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (15, 11827, 4, 1, 5, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 1);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (16, 29484, 3, 5, 4, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 1);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (17, 39197, 2, 5, 5, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 1);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (18, 35673, 3, 2, 3, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 1);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (19, 29966, 4, 3, 5, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 1);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (20, 11800, 1, 1, 5, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 1);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (21, 61715, 3, 4, 2, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 2);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (22, 26855, 2, 2, 3, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 2);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (23, 49397, 3, 4, 5, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 2);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (24, 82272, 5, 3, 1, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 2);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (25, 14084, 4, 5, 2, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 2);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (26, 66060, 4, 3, 1, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 2);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (27, 73364, 2, 2, 3, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 2);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (28, 63733, 3, 3, 3, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 2);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (29, 56525, 5, 2, 3, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 2);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (30, 10785, 1, 4, 4, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 2);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (31, 13652, 4, 5, 3, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 2);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (32, 24386, 3, 2, 5, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 2);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (33, 54491, 5, 4, 1, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 2);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (34, 64547, 5, 4, 1, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 2);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (35, 62822, 1, 3, 5, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 2);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (36, 54571, 5, 2, 3, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 2);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (37, 64591, 2, 4, 1, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 2);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (38, 42146, 5, 2, 2, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 2);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (39, 37087, 2, 4, 3, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 2);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (40, 43471, 1, 1, 3, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 2);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (41, 27077, 2, 1, 4, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 3);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (42, 33138, 1, 2, 3, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 3);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (43, 53679, 2, 1, 2, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 3);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (44, 65060, 1, 3, 5, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 3);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (45, 75545, 4, 5, 4, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 3);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (46, 40240, 1, 4, 1, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 3);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (47, 20882, 4, 2, 5, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 3);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (48, 85645, 2, 2, 1, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 3);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (49, 49249, 1, 2, 4, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 3);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (50, 65782, 5, 5, 2, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 3);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (51, 71919, 1, 3, 5, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 3);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (52, 43484, 5, 3, 2, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 3);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (53, 30565, 3, 5, 5, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 3);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (54, 54157, 2, 4, 2, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 3);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (55, 47244, 4, 2, 3, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 3);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (56, 89660, 1, 4, 3, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 3);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (57, 54154, 5, 3, 5, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 3);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (58, 37618, 1, 5, 1, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 3);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (59, 45270, 3, 1, 4, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 3);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (60, 86922, 3, 5, 3, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 3);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (61, 39995, 1, 5, 3, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 4);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (62, 52796, 1, 4, 2, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 4);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (63, 13467, 2, 4, 1, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 4);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (64, 57923, 5, 4, 5, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 4);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (65, 78328, 3, 3, 4, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 4);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (66, 34531, 4, 1, 3, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 4);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (67, 89688, 2, 4, 1, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 4);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (68, 85018, 4, 1, 1, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 4);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (69, 34474, 5, 1, 3, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 4);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (70, 79347, 5, 5, 4, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 4);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (71, 41429, 5, 1, 4, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 4);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (72, 17990, 3, 1, 3, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 4);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (73, 77609, 1, 1, 3, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 4);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (74, 12772, 4, 5, 3, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 4);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (75, 27110, 3, 2, 5, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 4);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (76, 50598, 2, 3, 2, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 4);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (77, 23581, 3, 1, 5, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 4);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (78, 36366, 5, 5, 2, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 4);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (79, 57933, 2, 3, 4, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 4);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (80, 26337, 4, 2, 2, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 4);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (81, 33307, 2, 2, 3, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 5);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (82, 71252, 5, 3, 5, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 5);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (83, 58901, 4, 1, 2, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 5);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (84, 64540, 1, 3, 3, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 5);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (85, 15386, 1, 4, 2, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 5);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (86, 80578, 5, 4, 5, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 5);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (87, 24554, 3, 5, 2, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 5);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (88, 63999, 2, 2, 1, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 5);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (89, 43224, 3, 5, 1, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 5);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (90, 45463, 3, 1, 1, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 5);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (91, 80298, 2, 1, 2, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 5);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (92, 88591, 4, 3, 1, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 5);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (93, 38209, 5, 5, 2, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 5);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (94, 68574, 1, 1, 5, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 5);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (95, 60575, 1, 1, 5, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 5);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (96, 81009, 5, 3, 2, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 5);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (97, 85911, 3, 1, 3, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 5);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (98, 58837, 5, 5, 3, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 5);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (99, 84838, 2, 1, 2, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 5);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (100, 47109, 2, 4, 1, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 5);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (101, 52593, 5, 5, 5, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 6);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (102, 19414, 1, 3, 2, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 6);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (103, 39890, 1, 4, 5, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 6);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (104, 57020, 2, 4, 4, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 6);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (105, 55613, 1, 1, 2, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 6);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (106, 22811, 2, 2, 5, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 6);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (107, 33762, 5, 2, 2, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 6);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (108, 85195, 5, 4, 2, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 6);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (109, 88560, 3, 3, 2, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 6);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (110, 72802, 3, 2, 1, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 6);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (111, 17034, 3, 5, 4, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 6);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (112, 70100, 5, 5, 5, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 6);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (113, 88729, 4, 3, 1, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 6);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (114, 32683, 1, 2, 4, 'vip', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 6);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (115, 27016, 5, 3, 1, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 6);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (116, 45484, 5, 1, 1, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 6);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (117, 70677, 5, 4, 1, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 6);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (118, 82661, 2, 4, 1, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 6);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (119, 50486, 3, 5, 5, 'basic', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 6);
INSERT INTO rooms (id, value, state, "adultCapacity", "childrenCapacity", type, created_at, updated_at, hotel_id) VALUES (120, 57782, 5, 1, 2, 'premium', '2018-12-28 16:54:17', '2018-12-28 16:54:17', 6);


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('rooms_id_seq', 120, true);


--
-- Data for Name: seats; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (1, '1A', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (2, '2A', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (3, '3A', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (4, '4A', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (5, '5B', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (6, '6B', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (7, '7B', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (8, '8B', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (9, '9C', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (10, '10C', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (11, '11C', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (12, '12C', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (13, '13D', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (14, '14D', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (15, '15D', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (16, '16D', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (17, '17E', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (18, '18E', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (19, '19E', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (20, '20E', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (21, '21F', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (22, '22F', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (23, '23F', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (24, '24F', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (25, '25G', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (26, '26G', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (27, '27G', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (28, '28G', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (29, '29H', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (30, '30H', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (31, '31H', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (32, '32H', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (33, '33I', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (34, '34I', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (35, '35I', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (36, '36I', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (37, '37J', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (38, '38J', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (39, '39J', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (40, '40J', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (41, '41K', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (42, '42K', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (43, '43K', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (44, '44K', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (45, '45L', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (46, '46L', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (47, '47L', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (48, '48L', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (49, '49M', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (50, '50M', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (51, '51M', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (52, '52M', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (53, '53N', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (54, '54N', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (55, '55N', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (56, '56N', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (57, '57O', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (58, '58O', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (59, '59O', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (60, '60O', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (61, '61P', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (62, '62P', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (63, '63P', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (64, '64P', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (65, '65Q', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (66, '66Q', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (67, '67Q', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (68, '68Q', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (69, '69R', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (70, '70R', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (71, '71R', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (72, '72R', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (73, '73S', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (74, '74S', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (75, '75S', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (76, '76S', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (77, '77T', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (78, '78T', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (79, '79T', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (80, '80T', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (81, '81U', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (82, '82U', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (83, '83U', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (84, '84U', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (85, '85V', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (86, '86V', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (87, '87V', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (88, '88V', 'basic', true, '2018-12-28 16:54:14', '2018-12-28 16:54:14', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (89, '89W', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (90, '90W', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (91, '91W', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (92, '92W', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (93, '93X', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (94, '94X', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (95, '95X', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (96, '96X', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (97, '97Y', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (98, '98Y', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (99, '99Y', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (100, '100Y', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 1);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (101, '1A', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (102, '2A', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (103, '3A', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (104, '4A', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (105, '5B', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (106, '6B', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (107, '7B', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (108, '8B', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (109, '9C', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (110, '10C', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (111, '11C', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (112, '12C', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (113, '13D', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (114, '14D', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (115, '15D', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (116, '16D', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (117, '17E', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (118, '18E', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (119, '19E', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (120, '20E', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (121, '21F', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (122, '22F', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (123, '23F', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (124, '24F', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (125, '25G', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (126, '26G', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (127, '27G', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (128, '28G', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (129, '29H', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (130, '30H', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (131, '31H', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (132, '32H', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (133, '33I', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (134, '34I', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (135, '35I', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (136, '36I', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (137, '37J', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (138, '38J', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (139, '39J', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (140, '40J', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (141, '41K', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (142, '42K', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (143, '43K', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (144, '44K', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (145, '45L', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (146, '46L', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (147, '47L', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (148, '48L', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (149, '49M', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (150, '50M', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (151, '51M', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (152, '52M', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (153, '53N', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (154, '54N', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (155, '55N', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (156, '56N', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (157, '57O', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (158, '58O', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (159, '59O', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (160, '60O', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (161, '61P', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (162, '62P', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (163, '63P', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (164, '64P', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (165, '65Q', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (166, '66Q', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (167, '67Q', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (168, '68Q', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (169, '69R', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (170, '70R', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (171, '71R', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (172, '72R', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (173, '73S', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (174, '74S', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (175, '75S', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (176, '76S', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (177, '77T', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (178, '78T', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (179, '79T', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (180, '80T', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (181, '81U', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (182, '82U', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (183, '83U', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (184, '84U', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (185, '85V', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (186, '86V', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (187, '87V', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (188, '88V', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (189, '89W', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (190, '90W', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (191, '91W', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (192, '92W', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (193, '93X', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (194, '94X', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (195, '95X', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 2);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (196, '1A', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (197, '2A', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (198, '3A', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (199, '4A', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (200, '5B', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (201, '6B', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (202, '7B', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (203, '8B', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (204, '9C', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (205, '10C', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (206, '11C', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (207, '12C', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (208, '13D', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (209, '14D', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (210, '15D', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (211, '16D', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (212, '17E', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (213, '18E', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (214, '19E', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (215, '20E', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (216, '21F', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (217, '22F', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (218, '23F', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (219, '24F', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (220, '25G', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (221, '26G', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (222, '27G', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (223, '28G', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (224, '29H', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (225, '30H', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (226, '31H', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (227, '32H', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (228, '33I', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (229, '34I', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (230, '35I', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (231, '36I', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (232, '37J', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (233, '38J', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (234, '39J', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (235, '40J', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (236, '41K', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (237, '42K', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (238, '43K', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (239, '44K', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (240, '45L', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (241, '46L', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (242, '47L', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (243, '48L', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (244, '49M', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (245, '50M', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (246, '51M', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (247, '52M', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (248, '53N', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (249, '54N', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (250, '55N', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (251, '56N', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (252, '57O', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (253, '58O', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (254, '59O', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 3);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (255, '1A', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (256, '2A', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (257, '3A', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (258, '4A', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (259, '5B', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (260, '6B', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (261, '7B', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (262, '8B', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (263, '9C', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (264, '10C', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (265, '11C', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (266, '12C', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (267, '13D', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (268, '14D', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (269, '15D', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (270, '16D', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (271, '17E', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (272, '18E', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (273, '19E', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (274, '20E', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (275, '21F', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (276, '22F', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (277, '23F', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (278, '24F', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (279, '25G', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (280, '26G', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (281, '27G', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (282, '28G', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (283, '29H', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (284, '30H', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (285, '31H', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (286, '32H', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (287, '33I', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (288, '34I', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (289, '35I', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (290, '36I', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (291, '37J', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (292, '38J', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (293, '39J', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (294, '40J', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (295, '41K', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (296, '42K', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (297, '43K', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (298, '44K', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (299, '45L', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (300, '46L', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (301, '47L', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (302, '48L', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (303, '49M', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (304, '50M', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (305, '51M', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (306, '52M', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (307, '53N', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (308, '54N', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (309, '55N', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (310, '56N', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (311, '57O', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (312, '58O', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (313, '59O', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (314, '60O', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (315, '61P', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (316, '62P', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (317, '63P', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (318, '64P', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (319, '65Q', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (320, '66Q', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (321, '67Q', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (322, '68Q', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (323, '69R', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (324, '70R', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (325, '71R', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (326, '72R', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (327, '73S', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (328, '74S', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (329, '75S', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (330, '76S', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (331, '77T', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (332, '78T', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (333, '79T', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (334, '80T', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (335, '81U', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (336, '82U', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (337, '83U', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 4);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (338, '1A', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (339, '2A', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (340, '3A', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (341, '4A', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (342, '5B', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (343, '6B', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (344, '7B', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (345, '8B', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (346, '9C', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (347, '10C', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (348, '11C', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (349, '12C', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (350, '13D', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (351, '14D', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (352, '15D', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (353, '16D', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (354, '17E', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (355, '18E', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (356, '19E', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (357, '20E', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (358, '21F', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (359, '22F', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (360, '23F', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (361, '24F', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (362, '25G', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (363, '26G', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (364, '27G', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (365, '28G', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (366, '29H', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (367, '30H', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (368, '31H', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (369, '32H', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (370, '33I', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (371, '34I', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (372, '35I', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (373, '36I', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (374, '37J', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (375, '38J', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (376, '39J', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (377, '40J', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (378, '41K', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (379, '42K', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (380, '43K', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (381, '44K', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (382, '45L', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (383, '46L', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (384, '47L', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (385, '48L', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (386, '49M', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (387, '50M', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (388, '51M', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (389, '52M', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (390, '53N', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (391, '54N', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (392, '55N', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (393, '56N', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (394, '57O', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (395, '58O', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (396, '59O', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (397, '60O', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (398, '61P', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (399, '62P', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (400, '63P', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (401, '64P', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (402, '65Q', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (403, '66Q', 'basic', true, '2018-12-28 16:54:15', '2018-12-28 16:54:15', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (404, '67Q', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (405, '68Q', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (406, '69R', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (407, '70R', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (408, '71R', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (409, '72R', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (410, '73S', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (411, '74S', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (412, '75S', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (413, '76S', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (414, '77T', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (415, '78T', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (416, '79T', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (417, '80T', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (418, '81U', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (419, '82U', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (420, '83U', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (421, '84U', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (422, '85V', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (423, '86V', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (424, '87V', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (425, '88V', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (426, '89W', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (427, '90W', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (428, '91W', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (429, '92W', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (430, '93X', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (431, '94X', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (432, '95X', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (433, '96X', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (434, '97Y', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (435, '98Y', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (436, '99Y', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (437, '100Y', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 5);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (438, '1A', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (439, '2A', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (440, '3A', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (441, '4A', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (442, '5B', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (443, '6B', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (444, '7B', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (445, '8B', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (446, '9C', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (447, '10C', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (448, '11C', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (449, '12C', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (450, '13D', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (451, '14D', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (452, '15D', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (453, '16D', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (454, '17E', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (455, '18E', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (456, '19E', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (457, '20E', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (458, '21F', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (459, '22F', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (460, '23F', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (461, '24F', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (462, '25G', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (463, '26G', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (464, '27G', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (465, '28G', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (466, '29H', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (467, '30H', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (468, '31H', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (469, '32H', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (470, '33I', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (471, '34I', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (472, '35I', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (473, '36I', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (474, '37J', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (475, '38J', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (476, '39J', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (477, '40J', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (478, '41K', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (479, '42K', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (480, '43K', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (481, '44K', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (482, '45L', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (483, '46L', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (484, '47L', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (485, '48L', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (486, '49M', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (487, '50M', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (488, '51M', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (489, '52M', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (490, '53N', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (491, '54N', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (492, '55N', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (493, '56N', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (494, '57O', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (495, '58O', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (496, '59O', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (497, '60O', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (498, '61P', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (499, '62P', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (500, '63P', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (501, '64P', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (502, '65Q', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (503, '66Q', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (504, '67Q', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (505, '68Q', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (506, '69R', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (507, '70R', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (508, '71R', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (509, '72R', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (510, '73S', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (511, '74S', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (512, '75S', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (513, '76S', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (514, '77T', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (515, '78T', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (516, '79T', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (517, '80T', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (518, '81U', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (519, '82U', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (520, '83U', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (521, '84U', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (522, '85V', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (523, '86V', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (524, '87V', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (525, '88V', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (526, '89W', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (527, '90W', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (528, '91W', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (529, '92W', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 6);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (530, '1A', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (531, '2A', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (532, '3A', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (533, '4A', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (534, '5B', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (535, '6B', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (536, '7B', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (537, '8B', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (538, '9C', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (539, '10C', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (540, '11C', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (541, '12C', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (542, '13D', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (543, '14D', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (544, '15D', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (545, '16D', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (546, '17E', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (547, '18E', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (548, '19E', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (549, '20E', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (550, '21F', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (551, '22F', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (552, '23F', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (553, '24F', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (554, '25G', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (555, '26G', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (556, '27G', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (557, '28G', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (558, '29H', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (559, '30H', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (560, '31H', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (561, '32H', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (562, '33I', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (563, '34I', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (564, '35I', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (565, '36I', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (566, '37J', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (567, '38J', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (568, '39J', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (569, '40J', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (570, '41K', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (571, '42K', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (572, '43K', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (573, '44K', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (574, '45L', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (575, '46L', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (576, '47L', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (577, '48L', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (578, '49M', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (579, '50M', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (580, '51M', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (581, '52M', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (582, '53N', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (583, '54N', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (584, '55N', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (585, '56N', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (586, '57O', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (587, '58O', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (588, '59O', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (589, '60O', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (590, '61P', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (591, '62P', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (592, '63P', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (593, '64P', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (594, '65Q', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (595, '66Q', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (596, '67Q', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (597, '68Q', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (598, '69R', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (599, '70R', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (600, '71R', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (601, '72R', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (602, '73S', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (603, '74S', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (604, '75S', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (605, '76S', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (606, '77T', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (607, '78T', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (608, '79T', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (609, '80T', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (610, '81U', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (611, '82U', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (612, '83U', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (613, '84U', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (614, '85V', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (615, '86V', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (616, '87V', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (617, '88V', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (618, '89W', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (619, '90W', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (620, '91W', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (621, '92W', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (622, '93X', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 7);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (623, '1A', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (624, '2A', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (625, '3A', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (626, '4A', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (627, '5B', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (628, '6B', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (629, '7B', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (630, '8B', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (631, '9C', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (632, '10C', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (633, '11C', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (634, '12C', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (635, '13D', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (636, '14D', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (637, '15D', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (638, '16D', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (639, '17E', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (640, '18E', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (641, '19E', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (642, '20E', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (643, '21F', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (644, '22F', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (645, '23F', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (646, '24F', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (647, '25G', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (648, '26G', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (649, '27G', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (650, '28G', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (651, '29H', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (652, '30H', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (653, '31H', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (654, '32H', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (655, '33I', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (656, '34I', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (657, '35I', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (658, '36I', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (659, '37J', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (660, '38J', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (661, '39J', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (662, '40J', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (663, '41K', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (664, '42K', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (665, '43K', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (666, '44K', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (667, '45L', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (668, '46L', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (669, '47L', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (670, '48L', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (671, '49M', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (672, '50M', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (673, '51M', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (674, '52M', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (675, '53N', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (676, '54N', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (677, '55N', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (678, '56N', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (679, '57O', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (680, '58O', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (681, '59O', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (682, '60O', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (683, '61P', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (684, '62P', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (685, '63P', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (686, '64P', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (687, '65Q', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (688, '66Q', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (689, '67Q', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (690, '68Q', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (691, '69R', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (692, '70R', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (693, '71R', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (694, '72R', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (695, '73S', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (696, '74S', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (697, '75S', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (698, '76S', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (699, '77T', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (700, '78T', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (701, '79T', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (702, '80T', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (703, '81U', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (704, '82U', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (705, '83U', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (706, '84U', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (707, '85V', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (708, '86V', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (709, '87V', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (710, '88V', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (711, '89W', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (712, '90W', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (713, '91W', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (714, '92W', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (715, '93X', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 8);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (716, '1A', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (717, '2A', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (718, '3A', 'basic', true, '2018-12-28 16:54:16', '2018-12-28 16:54:16', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (719, '4A', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (720, '5B', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (721, '6B', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (722, '7B', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (723, '8B', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (724, '9C', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (725, '10C', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (726, '11C', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (727, '12C', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (728, '13D', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (729, '14D', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (730, '15D', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (731, '16D', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (732, '17E', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (733, '18E', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (734, '19E', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (735, '20E', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (736, '21F', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (737, '22F', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (738, '23F', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (739, '24F', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (740, '25G', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (741, '26G', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (742, '27G', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (743, '28G', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (744, '29H', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (745, '30H', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (746, '31H', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (747, '32H', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (748, '33I', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (749, '34I', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (750, '35I', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (751, '36I', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (752, '37J', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (753, '38J', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (754, '39J', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (755, '40J', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (756, '41K', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (757, '42K', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (758, '43K', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (759, '44K', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (760, '45L', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (761, '46L', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (762, '47L', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (763, '48L', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (764, '49M', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (765, '50M', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (766, '51M', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (767, '52M', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (768, '53N', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (769, '54N', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (770, '55N', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (771, '56N', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (772, '57O', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (773, '58O', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (774, '59O', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (775, '60O', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (776, '61P', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (777, '62P', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (778, '63P', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (779, '64P', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (780, '65Q', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (781, '66Q', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (782, '67Q', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (783, '68Q', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (784, '69R', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (785, '70R', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (786, '71R', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (787, '72R', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (788, '73S', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (789, '74S', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (790, '75S', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (791, '76S', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (792, '77T', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (793, '78T', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (794, '79T', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (795, '80T', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (796, '81U', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (797, '82U', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (798, '83U', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (799, '84U', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (800, '85V', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (801, '86V', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (802, '87V', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 9);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (803, '1A', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (804, '2A', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (805, '3A', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (806, '4A', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (807, '5B', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (808, '6B', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (809, '7B', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (810, '8B', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (811, '9C', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (812, '10C', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (813, '11C', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (814, '12C', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (815, '13D', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (816, '14D', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (817, '15D', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (818, '16D', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (819, '17E', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (820, '18E', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (821, '19E', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (822, '20E', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (823, '21F', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (824, '22F', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (825, '23F', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (826, '24F', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (827, '25G', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (828, '26G', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (829, '27G', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (830, '28G', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (831, '29H', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (832, '30H', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (833, '31H', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (834, '32H', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (835, '33I', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (836, '34I', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (837, '35I', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (838, '36I', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (839, '37J', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (840, '38J', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (841, '39J', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (842, '40J', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (843, '41K', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (844, '42K', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (845, '43K', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (846, '44K', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (847, '45L', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (848, '46L', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (849, '47L', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (850, '48L', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (851, '49M', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (852, '50M', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (853, '51M', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);
INSERT INTO seats (id, code, type, available, created_at, updated_at, plane_id) VALUES (854, '52M', 'basic', true, '2018-12-28 16:54:17', '2018-12-28 16:54:17', 10);


--
-- Name: seats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('seats_id_seq', 854, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (1, 'Martín Anguiano', 'Tovar', 'leire.caban@example.org', NULL, 'f"0keB|}s''$~,', 0, '18946054B', 'avillar', 's8LSp6Jce8', '2018-12-28 16:54:13', '2018-12-28 16:54:13');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (2, 'Adrián Alonzo', 'Garibay', 'jon.plaza@example.net', NULL, '^_[BwDXu@', 0, '33831676X', 'vera.ruiz', 'kA43G1fDPK', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (3, 'Ainhoa Pérez', 'Arguello', 'valadez.miguel@example.com', NULL, 'M!Z4+F3$c("kdWP6j', 0, '14881060Z', 'mireia.guajardo', 'vsVQNcq49J', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (4, 'Sara Ledesma', 'Abeyta', 'aaguayo@example.net', NULL, '6-q&<UMKBf', 0, '53483412V', 'elena11', 'JK3GTNCeyo', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (5, 'Ariadna Oquendo', 'Corral', 'lucia.rojas@example.com', NULL, 'RB:8/}@[>t', 0, '03827076Z', 'luis.herrera', 'NBpvmTNbjE', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (6, 'Marina Ávila', 'Palomo', 'dominquez.alba@example.org', NULL, 'OHp/K[>)W_fZ=d}cj', 0, '61522239E', 'sosa.arnau', 'PFAqEjtotD', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (7, 'Rayan Paz', 'Tamayo', 'madera.candela@example.net', NULL, 'Se!hqCPh(''<', 0, '67100603N', 'yago.cepeda', 'nb2pKQzB5O', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (8, 'María Cano', 'Rangel', 'tirado.cristian@example.net', NULL, 'UU{Ze|89', 0, '06595589V', 'guillermo.granado', 'OytorMjfTc', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (9, 'Sra. Beatriz Pizarro Hijo', 'Méndez', 'trujillo.nerea@example.com', NULL, '-.+LzgV!9?[_G+(oa', 0, '80071585Y', 'uocasio', 'inhxzEpvd0', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (10, 'Luna Bueno', 'Colunga', 'aitana.rascon@example.net', NULL, ',p7Q+C\)H}pU?;.', 0, '42362225C', 'chavarria.jorge', 'GcaodroTa4', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (11, 'Srita. Sara Izquierdo', 'Saldivar', 'leon.alberto@example.com', NULL, 'Yf@Lo9g', 0, '96085913D', 'alberto.dominguez', 'EXAAT5YRzK', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (12, 'Marc Rosa', 'Gonzáles', 'ian83@example.net', NULL, 'M_dIg@h@[', 0, '27292623H', 'zcarmona', 'LDJiuX8ust', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (13, 'Aina Hernándes Hijo', 'Martín', 'opena@example.net', NULL, '>(kYeh),qz$=', 0, '95049449V', 'moran.ane', 'iDvUQnYD4W', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (14, 'Aya Téllez', 'Meraz', 'vmedrano@example.org', NULL, 'nHAp#uP;', 0, '72522556Z', 'ilorenzo', 'ySHx0HgLPQ', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (15, 'Nil Correa', 'Mesa', 'jpardo@example.org', NULL, 'DjT-g}z', 0, '78914482X', 'onavarro', 'w0j4onq2FD', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (16, 'Aitor Palomino Tercero', 'Briseño', 'trobledo@example.com', NULL, 'n,H$gA', 0, '50439577W', 'florez.laura', 'Spk1Z29jfp', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (17, 'Leire Becerra', 'Samaniego', 'jan97@example.org', NULL, 'D(:d]_x/^xw:)', 0, '61372465R', 'egarza', 'XVAI68XGcG', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (18, 'Dr. Carla Chapa Hijo', 'Ibáñez', 'jesus00@example.net', NULL, 'Y$I~a6U6Y77&Hp+iW', 0, '19102759V', 'leon.naia', '5NidFeCBF5', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (19, 'Ing. Juan Herrera Segundo', 'Garrido', 'cesar.carrasco@example.net', NULL, ':>vUxO\gZe.|J~ZF', 0, '02166195D', 'carlos14', 'FCB4ca5fh7', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (20, 'Dn. Gabriel Llamas Tercero', 'Valadez', 'carolina87@example.net', NULL, '7:f8;U&<EyE`h', 0, '27523883J', 'acuna.lola', 'jzsr9x2cCf', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (21, 'Eva Castellano', 'García', 'mar.lozada@example.net', NULL, 'TH;\tL{H', 0, '06738618D', 'victoria.gurule', 'G1bvI9nxzx', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (22, 'Lucas Castro Segundo', 'Estrada', 'qcamacho@example.org', NULL, ';YG\+;ZdMd\/y!w', 0, '40779059J', 'trevino.ona', 'xCiMtKCk3E', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (23, 'Carolina Bueno', 'Vanegas', 'qdelgado@example.com', NULL, 'rk94(z^', 0, '85663032S', 'raquel52', 'yalRPQB41f', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (24, 'Gabriela Niño', 'Cortés', 'alex05@example.com', NULL, 'S/8/ca;h*', 0, '18277804A', 'emma73', 'FEFwVmyONN', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (25, 'Guillem Archuleta', 'Espinosa', 'cristina29@example.org', NULL, 'A^--nhqv^()_wP!<w', 0, '87169104R', 'wguevara', 'gOsPYj4szH', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (26, 'Hugo Casanova', 'Castillo', 'ccenteno@example.net', NULL, '_rQk\qaIC#', 0, '09224902Q', 'olivares.maria', 'njHPdT4soZ', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (27, 'Mar Blasco', 'Ferrer', 'polo.claudia@example.net', NULL, '<2cqomMpkPpv"', 0, '72873708W', 'fvicente', 'BTqA4FVC08', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (28, 'Sra. Andrea Sandoval', 'Rangel', 'castillo.jorge@example.com', NULL, '+MALk%T,+6[4,D0hKF', 0, '77428256K', 'lorente.naia', 'YGbh1POwX0', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (29, 'Raquel Rosas', 'Robledo', 'iker60@example.net', NULL, 'lI6]SW0:r<', 0, '75030343L', 'sofia.rubio', '6lYZhyXhny', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (30, 'Nicolás Frías', 'Valdivia', 'dcanales@example.com', NULL, 'kdx`~n', 0, '64496861P', 'calero.elsa', 'n8u5fyjgWh', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (31, 'Natalia Téllez', 'Armas', 'aitor.pacheco@example.org', NULL, 'Hdn%.j[C([k)', 0, '50064753D', 'gonzalo12', 'UeLZVSuuSe', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (32, 'Jorge Torres', 'Cuevas', 'rcarrasquillo@example.net', NULL, 'cvPL''^m)u', 0, '79586083B', 'colon.victoria', 'hu5ysuEcWo', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (33, 'Celia Villegas', 'Mora', 'jana86@example.org', NULL, '_Eo5\cwyXo[Te(5+Tktw', 0, '76201449B', 'qloera', 'JBQFjx2M9F', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (34, 'Alexia Reséndez Segundo', 'Navarrete', 'ruiz.adam@example.com', NULL, 'f1NC?~zJi', 0, '68481571Z', 'iroldan', 'gOmKlK8jeR', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (35, 'Yago Velasco Hijo', 'Rodríguez', 'mar.alaniz@example.net', NULL, 'Q0R_`(?h&nQOH7i', 0, '38418774B', 'xgrijalva', '2l5shwpIVw', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (36, 'Adrián Loera', 'Nieto', 'elena.casas@example.org', NULL, 'v=B+eT3WK*S', 0, '37703032Y', 'jvelazquez', 'xkvcnaH7kG', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (37, 'Francisco Javier Collazo Segundo', 'Serrato', 'adam.banda@example.org', NULL, '&j1zvDP^y8!qm$tg"\', 0, '95986692X', 'isabel40', 'yoHNaR4dyC', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (38, 'Lucas Valentín', 'Orosco', 'almonte.laia@example.com', NULL, '9Db~2Zme', 0, '61411591G', 'vega90', 'T7nLQ98AKk', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (39, 'Mireia Cruz', 'Garibay', 'rmedrano@example.org', NULL, 'S$8!Ntq:%Wc0013(f4)', 0, '40928576F', 'hidalgo.lucia', '6474BYjbhg', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (40, 'Lic. Adriana Torres Tercero', 'Zayas', 'carbonell.candela@example.net', NULL, '5b9a^q''f', 0, '48098826F', 'concepcion.maria', 'j7xHgsooiP', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (41, 'César Sierra Hijo', 'Benito', 'carolina10@example.com', NULL, '^}=DsP%^]w4A+R', 0, '43001131D', 'olivia.reina', 'sqINCuSzPb', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (42, 'Marta Villalpando Segundo', 'Ornelas', 'alozano@example.net', NULL, 'Evnp"Ya\0@[.@6Q.UW7z', 0, '21324972Q', 'armijo.carla', 'mkm8ma2HHa', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (43, 'Nahia Aponte', 'Betancourt', 'nerea.roque@example.net', NULL, 'op8drL*\b\@:Ukl', 0, '07930922Q', 'rayan.urbina', 'EzkvXYFYXW', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (44, 'Africa Sandoval', 'Ramón', 'hernandes.cesar@example.net', NULL, 'lo@FKI|k}Epe<)+s', 0, '20771250L', 'nora78', 'yjoyuVT0LV', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (45, 'María Muro', 'Olivares', 'alonso.sauceda@example.com', NULL, 'QQgcQ?^u.r~', 0, '48108033Z', 'gmuro', 'b8duhIEsKC', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (46, 'Ainara Salas Hijo', 'Villareal', 'dsantiago@example.net', NULL, 'E.W_4r(V!rn:c5\', 0, '86883964S', 'jon.villalba', '4D2SHMj8jR', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (47, 'Adrián Garay Hijo', 'Cruz', 'claudia84@example.com', NULL, '8+%GpYCEL>gO', 0, '95594497B', 'martin86', 'WYSJXqF1ZH', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (48, 'Raquel Holguín', 'Muñoz', 'jlaureano@example.net', NULL, '"XIDgNS}xwDSS', 0, '61423955V', 'jan.dominguez', '978kggiYC0', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (49, 'Álvaro Barajas', 'Pabón', 'guillem.ceballos@example.org', NULL, '<2k>pQ18wRIla|5', 0, '76781984A', 'vazquez.martina', 'KwtDR2TOVg', '2018-12-28 16:54:14', '2018-12-28 16:54:14');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (50, 'Sergio Delgado', 'Domenech', 'marina.centeno@example.org', NULL, ')N]Zv/*Q`]fN', 0, '28048858J', 'bautista.mireia', 'TuY4xgtyiz', '2018-12-28 16:54:14', '2018-12-28 16:54:14');


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('users_id_seq', 50, true);


--
-- Data for Name: vehicles; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (1, 3, 'maxime', 'eveniet', 'BAMbee 4598', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (2, 5, 'nisi', 'quae', 'JJ 2278', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (3, 4, 'numquam', 'sit', 'QS 6384 M', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (4, 6, 'unde', 'maxime', 'KV 7238 C', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (5, 7, 'quis', 'dolore', 'RXY 3165', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (6, 6, 'cupiditate', 'impedit', 'JVC 9639', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (7, 3, 'repellendus', 'cupiditate', 'WUE 6995 C', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (8, 7, 'autem', 'quia', 'VKE 2643', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (9, 9, 'voluptatem', 'sequi', 'WQJ 662 E', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (10, 8, 'veniam', 'voluptate', 'XXVIASEAN 4300', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (11, 9, 'explicabo', 'vel', 'WLG 5037', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (12, 10, 'odio', 'officia', 'TFS 4494', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (13, 4, 'nihil', 'nihil', 'WLD 3143', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (14, 2, 'ut', 'sint', 'KUQ 9180', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (15, 9, 'nam', 'necessitatibus', 'SU 1477 R', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (16, 9, 'molestias', 'accusamus', 'WTJ 2165 M', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (17, 10, 'laudantium', 'qui', 'QL 9911 N', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (18, 10, 'exercitationem', 'accusamus', 'JKM 2358', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (19, 9, 'atque', 'similique', 'KV 8970 G', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (20, 2, 'numquam', 'eos', 'QS 2396 B', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (21, 10, 'temporibus', 'quibusdam', 'QA 5606 W', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (22, 10, 'voluptatum', 'laboriosam', 'ALA 75', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (23, 2, 'autem', 'omnis', 'AAJ 5439', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (24, 8, 'aliquid', 'dolore', 'JAG 189', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (25, 2, 'suscipit', 'tempore', 'AFK 5780', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (26, 10, 'expedita', 'vitae', 'WTY 6724 C', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (27, 7, 'et', 'inventore', 'RYE 66', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (28, 6, 'ipsam', 'nihil', 'QK 5272 S', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (29, 6, 'blanditiis', 'tempora', 'VJK 9671', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (30, 3, 'quidem', 'quae', 'JBP 6099', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (31, 3, 'qui', 'error', 'FBY 8730', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (32, 9, 'voluptas', 'itaque', 'Jaguh 9430', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (33, 8, 'ducimus', 'eaque', 'QC 1429 F', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (34, 3, 'nesciunt', 'omnis', 'FEX 8800', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (35, 10, 'aut', 'neque', 'AUF 2590', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (36, 8, 'aut', 'molestias', 'FXE 1417', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (37, 8, 'facilis', 'aut', 'PRR 5905', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (38, 8, 'voluptatum', 'nisi', 'SSA 8395 N', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (39, 8, 'voluptatem', 'vitae', 'Perodua 1638', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (40, 8, 'quo', 'explicabo', 'WM 5653 C', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (41, 4, 'ratione', 'temporibus', 'WBP 2041', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (42, 9, 'cumque', 'ab', 'TSW 9978', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (43, 5, 'harum', 'aspernatur', 'WUV 7344', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (44, 5, 'non', 'ad', 'AC 9228', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (45, 6, 'assumenda', 'temporibus', 'VAH 4063', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (46, 2, 'recusandae', 'dolores', 'CNE 749', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (47, 6, 'optio', 'dolor', 'QL 8207 E', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (48, 9, 'placeat', 'sed', 'BDD 9311', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (49, 2, 'omnis', 'a', 'FCN 5280', '2018-12-28 16:54:18', '2018-12-28 16:54:18');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (50, 5, 'magni', 'rerum', 'SD 5991 V', '2018-12-28 16:54:18', '2018-12-28 16:54:18');


--
-- Name: vehicles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('vehicles_id_seq', 50, true);


--
-- Name: airports airports_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY airports
    ADD CONSTRAINT airports_pkey PRIMARY KEY (id);


--
-- Name: discounts discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY discounts
    ADD CONSTRAINT discounts_pkey PRIMARY KEY (id);


--
-- Name: flight_package flight_package_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY flight_package
    ADD CONSTRAINT flight_package_pkey PRIMARY KEY (id);


--
-- Name: flight_reservation flight_reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY flight_reservation
    ADD CONSTRAINT flight_reservation_pkey PRIMARY KEY (id);


--
-- Name: flights flights_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY flights
    ADD CONSTRAINT flights_pkey PRIMARY KEY (id);


--
-- Name: hotels hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (id);


--
-- Name: insurance_reservation insurance_reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY insurance_reservation
    ADD CONSTRAINT insurance_reservation_pkey PRIMARY KEY (id);


--
-- Name: insurances insurances_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY insurances
    ADD CONSTRAINT insurances_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: package_reservation package_reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY package_reservation
    ADD CONSTRAINT package_reservation_pkey PRIMARY KEY (id);


--
-- Name: package_room package_room_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY package_room
    ADD CONSTRAINT package_room_pkey PRIMARY KEY (id);


--
-- Name: package_vehicle package_vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY package_vehicle
    ADD CONSTRAINT package_vehicle_pkey PRIMARY KEY (id);


--
-- Name: packages packages_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (id);


--
-- Name: payment_methods payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);


--
-- Name: planes planes_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY planes
    ADD CONSTRAINT planes_pkey PRIMARY KEY (id);


--
-- Name: reservation_room reservation_room_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY reservation_room
    ADD CONSTRAINT reservation_room_pkey PRIMARY KEY (id);


--
-- Name: reservation_seat reservation_seat_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY reservation_seat
    ADD CONSTRAINT reservation_seat_pkey PRIMARY KEY (id);


--
-- Name: reservation_vehicle reservation_vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY reservation_vehicle
    ADD CONSTRAINT reservation_vehicle_pkey PRIMARY KEY (id);


--
-- Name: reservations reservations_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY reservations
    ADD CONSTRAINT reservations_pkey PRIMARY KEY (id);


--
-- Name: role_user role_user_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY role_user
    ADD CONSTRAINT role_user_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: seats seats_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY seats
    ADD CONSTRAINT seats_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_unique; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_username_unique UNIQUE (username);


--
-- Name: vehicles vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY vehicles
    ADD CONSTRAINT vehicles_pkey PRIMARY KEY (id);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: homestead
--

CREATE INDEX password_resets_email_index ON password_resets USING btree (email);


--
-- Name: users logging_trigger; Type: TRIGGER; Schema: public; Owner: homestead
--

CREATE TRIGGER logging_trigger AFTER INSERT ON users FOR EACH ROW EXECUTE PROCEDURE logging_trigger();


--
-- Name: reservations reservation_logging_trigger; Type: TRIGGER; Schema: public; Owner: homestead
--

CREATE TRIGGER reservation_logging_trigger AFTER INSERT ON reservations FOR EACH ROW WHEN (new.completed) EXECUTE PROCEDURE reservation_logging_trigger();


--
-- Name: reservations reservation_taken_logging_trigger; Type: TRIGGER; Schema: public; Owner: homestead
--

CREATE TRIGGER reservation_taken_logging_trigger AFTER INSERT ON reservations FOR EACH ROW EXECUTE PROCEDURE reservation_taken_logging_trigger();


--
-- Name: airports airports_location_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY airports
    ADD CONSTRAINT airports_location_id_foreign FOREIGN KEY (location_id) REFERENCES locations(id);


--
-- Name: flight_package flight_package_flight_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY flight_package
    ADD CONSTRAINT flight_package_flight_id_foreign FOREIGN KEY (flight_id) REFERENCES flights(id);


--
-- Name: flight_package flight_package_package_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY flight_package
    ADD CONSTRAINT flight_package_package_id_foreign FOREIGN KEY (package_id) REFERENCES packages(id);


--
-- Name: flight_reservation flight_reservation_flight_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY flight_reservation
    ADD CONSTRAINT flight_reservation_flight_id_foreign FOREIGN KEY (flight_id) REFERENCES flights(id);


--
-- Name: flight_reservation flight_reservation_reservation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY flight_reservation
    ADD CONSTRAINT flight_reservation_reservation_id_foreign FOREIGN KEY (reservation_id) REFERENCES reservations(id);


--
-- Name: flights flights_airport_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY flights
    ADD CONSTRAINT flights_airport_id_foreign FOREIGN KEY (airport_id) REFERENCES airports(id);


--
-- Name: flights flights_plane_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY flights
    ADD CONSTRAINT flights_plane_id_foreign FOREIGN KEY (plane_id) REFERENCES planes(id);


--
-- Name: hotels hotels_location_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY hotels
    ADD CONSTRAINT hotels_location_id_foreign FOREIGN KEY (location_id) REFERENCES locations(id);


--
-- Name: insurance_reservation insurance_reservation_insurance_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY insurance_reservation
    ADD CONSTRAINT insurance_reservation_insurance_id_foreign FOREIGN KEY (insurance_id) REFERENCES insurances(id);


--
-- Name: insurance_reservation insurance_reservation_reservation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY insurance_reservation
    ADD CONSTRAINT insurance_reservation_reservation_id_foreign FOREIGN KEY (reservation_id) REFERENCES reservations(id);


--
-- Name: logs logs_payment_method_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY logs
    ADD CONSTRAINT logs_payment_method_id_foreign FOREIGN KEY (payment_method_id) REFERENCES payment_methods(id);


--
-- Name: logs logs_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY logs
    ADD CONSTRAINT logs_user_id_foreign FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: package_reservation package_reservation_package_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY package_reservation
    ADD CONSTRAINT package_reservation_package_id_foreign FOREIGN KEY (package_id) REFERENCES packages(id);


--
-- Name: package_reservation package_reservation_reservation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY package_reservation
    ADD CONSTRAINT package_reservation_reservation_id_foreign FOREIGN KEY (reservation_id) REFERENCES reservations(id);


--
-- Name: package_room package_room_package_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY package_room
    ADD CONSTRAINT package_room_package_id_foreign FOREIGN KEY (package_id) REFERENCES packages(id);


--
-- Name: package_room package_room_room_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY package_room
    ADD CONSTRAINT package_room_room_id_foreign FOREIGN KEY (room_id) REFERENCES rooms(id);


--
-- Name: package_vehicle package_vehicle_package_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY package_vehicle
    ADD CONSTRAINT package_vehicle_package_id_foreign FOREIGN KEY (package_id) REFERENCES packages(id);


--
-- Name: package_vehicle package_vehicle_vehicle_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY package_vehicle
    ADD CONSTRAINT package_vehicle_vehicle_id_foreign FOREIGN KEY (vehicle_id) REFERENCES vehicles(id);


--
-- Name: packages packages_discount_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_discount_id_foreign FOREIGN KEY (discount_id) REFERENCES discounts(id);


--
-- Name: planes planes_airport_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY planes
    ADD CONSTRAINT planes_airport_id_foreign FOREIGN KEY (airport_id) REFERENCES airports(id);


--
-- Name: reservation_room reservation_room_reservation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY reservation_room
    ADD CONSTRAINT reservation_room_reservation_id_foreign FOREIGN KEY (reservation_id) REFERENCES reservations(id);


--
-- Name: reservation_room reservation_room_room_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY reservation_room
    ADD CONSTRAINT reservation_room_room_id_foreign FOREIGN KEY (room_id) REFERENCES rooms(id);


--
-- Name: reservation_seat reservation_seat_reservation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY reservation_seat
    ADD CONSTRAINT reservation_seat_reservation_id_foreign FOREIGN KEY (reservation_id) REFERENCES reservations(id);


--
-- Name: reservation_seat reservation_seat_seat_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY reservation_seat
    ADD CONSTRAINT reservation_seat_seat_id_foreign FOREIGN KEY (seat_id) REFERENCES seats(id);


--
-- Name: reservation_vehicle reservation_vehicle_reservation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY reservation_vehicle
    ADD CONSTRAINT reservation_vehicle_reservation_id_foreign FOREIGN KEY (reservation_id) REFERENCES reservations(id);


--
-- Name: reservation_vehicle reservation_vehicle_vehicle_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY reservation_vehicle
    ADD CONSTRAINT reservation_vehicle_vehicle_id_foreign FOREIGN KEY (vehicle_id) REFERENCES vehicles(id);


--
-- Name: reservations reservations_payment_method_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY reservations
    ADD CONSTRAINT reservations_payment_method_id_foreign FOREIGN KEY (payment_method_id) REFERENCES payment_methods(id);


--
-- Name: reservations reservations_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY reservations
    ADD CONSTRAINT reservations_user_id_foreign FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: role_user role_user_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY role_user
    ADD CONSTRAINT role_user_role_id_foreign FOREIGN KEY (role_id) REFERENCES roles(id);


--
-- Name: role_user role_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY role_user
    ADD CONSTRAINT role_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: rooms rooms_hotel_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT rooms_hotel_id_foreign FOREIGN KEY (hotel_id) REFERENCES hotels(id);


--
-- Name: seats seats_plane_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY seats
    ADD CONSTRAINT seats_plane_id_foreign FOREIGN KEY (plane_id) REFERENCES planes(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

