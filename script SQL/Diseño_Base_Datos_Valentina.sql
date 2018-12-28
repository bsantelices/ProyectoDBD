--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.6.1

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
    flight_id integer NOT NULL,
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

INSERT INTO airports (id, name, type, created_at, updated_at, location_id) VALUES (1, 'Miss Gilda Harris', 'national', '2018-12-28 03:23:44', '2018-12-28 03:23:44', 1);
INSERT INTO airports (id, name, type, created_at, updated_at, location_id) VALUES (2, 'Deven Renner', 'international', '2018-12-28 03:23:44', '2018-12-28 03:23:44', 1);


--
-- Name: airports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('airports_id_seq', 2, true);


--
-- Data for Name: discounts; Type: TABLE DATA; Schema: public; Owner: homestead
--



--
-- Name: discounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('discounts_id_seq', 1, false);


--
-- Data for Name: flight_package; Type: TABLE DATA; Schema: public; Owner: homestead
--



--
-- Name: flight_package_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('flight_package_id_seq', 1, false);


--
-- Data for Name: flight_reservation; Type: TABLE DATA; Schema: public; Owner: homestead
--



--
-- Name: flight_reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('flight_reservation_id_seq', 1, false);


--
-- Data for Name: flights; Type: TABLE DATA; Schema: public; Owner: homestead
--



--
-- Name: flights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('flights_id_seq', 1, false);


--
-- Data for Name: hotels; Type: TABLE DATA; Schema: public; Owner: homestead
--



--
-- Name: hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('hotels_id_seq', 1, false);


--
-- Data for Name: insurance_reservation; Type: TABLE DATA; Schema: public; Owner: homestead
--



--
-- Name: insurance_reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('insurance_reservation_id_seq', 1, false);


--
-- Data for Name: insurances; Type: TABLE DATA; Schema: public; Owner: homestead
--



--
-- Name: insurances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('insurances_id_seq', 1, false);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (1, 'test', 'test', 'test', NULL, NULL, 'test', '2018-12-28 03:23:44', '2018-12-28 03:23:44');


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('locations_id_seq', 1, true);


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: homestead
--



--
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('logs_id_seq', 1, false);


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO migrations (id, migration, batch) VALUES (433, '2014_10_12_000000_create_users_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (434, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (435, '2018_12_19_233223_create_roles_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (436, '2018_12_19_233518_create_payment_methods_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (437, '2018_12_19_234115_create_logs_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (438, '2018_12_19_234717_create_reservations_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (439, '2018_12_19_234914_create_insurances_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (440, '2018_12_20_000929_create_vehicles_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (441, '2018_12_20_000930_create_locations_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (442, '2018_12_20_002227_create_hotels_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (443, '2018_12_20_002747_create_rooms_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (444, '2018_12_20_003604_create_discounts_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (445, '2018_12_20_004014_create_packages_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (446, '2018_12_20_005837_create_airports_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (447, '2018_12_20_010146_create_flights_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (448, '2018_12_20_011057_create_planes_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (449, '2018_12_20_011453_create_seats_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (450, '2018_12_20_141333_create_role_user_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (451, '2018_12_20_142552_create_insurance_reservation_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (452, '2018_12_20_142928_create_reservation_vehicle_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (453, '2018_12_20_143522_create_reservation_room_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (454, '2018_12_20_143905_create_package_reservation_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (455, '2018_12_20_144039_create_package_vehicle_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (456, '2018_12_20_144133_create_package_room_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (457, '2018_12_20_144528_create_flight_reservation_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (458, '2018_12_20_144655_create_flight_package_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (459, '2018_12_20_145039_create_reservation_seat_table', 1);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('migrations_id_seq', 459, true);


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



--
-- Name: package_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('package_room_id_seq', 1, false);


--
-- Data for Name: package_vehicle; Type: TABLE DATA; Schema: public; Owner: homestead
--



--
-- Name: package_vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('package_vehicle_id_seq', 1, false);


--
-- Data for Name: packages; Type: TABLE DATA; Schema: public; Owner: homestead
--



--
-- Name: packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('packages_id_seq', 1, false);


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: homestead
--



--
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: public; Owner: homestead
--



--
-- Name: payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('payment_methods_id_seq', 1, false);


--
-- Data for Name: planes; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (1, 'test', 150, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 1);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (2, 'test', 150, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 1);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (3, 'test', 150, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 1);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (4, 'test', 150, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 1);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (5, 'test', 150, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 1);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (6, 'test', 150, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 1);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (7, 'test', 150, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 1);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (8, 'test', 150, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 1);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (9, 'test', 150, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 1);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (10, 'test', 150, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 1);


--
-- Name: planes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('planes_id_seq', 10, true);


--
-- Data for Name: reservation_room; Type: TABLE DATA; Schema: public; Owner: homestead
--



--
-- Name: reservation_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('reservation_room_id_seq', 1, false);


--
-- Data for Name: reservation_seat; Type: TABLE DATA; Schema: public; Owner: homestead
--



--
-- Name: reservation_seat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('reservation_seat_id_seq', 1, false);


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



--
-- Name: reservations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('reservations_id_seq', 1, false);


--
-- Data for Name: role_user; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (1, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 1, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (2, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 2, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (3, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 3, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (4, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 4, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (5, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 5, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (6, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 6, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (7, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 7, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (8, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 8, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (9, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 9, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (10, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 10, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (11, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 11, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (12, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 12, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (13, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 13, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (14, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 14, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (15, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 15, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (16, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 16, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (17, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 17, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (18, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 18, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (19, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 19, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (20, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 20, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (21, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 21, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (22, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 22, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (23, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 23, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (24, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 24, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (25, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 25, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (26, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 26, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (27, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 27, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (28, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 28, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (29, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 29, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (30, '2018-12-28 03:23:44', '2018-12-28 03:23:44', 30, 3);


--
-- Name: role_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('role_user_id_seq', 30, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO roles (id, name, created_at, updated_at) VALUES (1, 'administrator', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO roles (id, name, created_at, updated_at) VALUES (2, 'developer', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO roles (id, name, created_at, updated_at) VALUES (3, 'normal', '2018-12-28 03:23:44', '2018-12-28 03:23:44');


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('roles_id_seq', 3, true);


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: homestead
--



--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('rooms_id_seq', 1, false);


--
-- Data for Name: seats; Type: TABLE DATA; Schema: public; Owner: homestead
--



--
-- Name: seats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('seats_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (1, 'Lic. Valeria Vergara', 'Quintero', 'ines71@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '08045512C', 'martin78', 'njbYwYypiM', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (2, 'Carlos Córdova', 'Narváez', 'palomino.francisco@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '72949548B', 'zfierro', 'WrcTm35bBe', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (3, 'Paula Tórrez', 'Carballo', 'soler.lucia@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '96188606F', 'javier90', 'LdFzwNOCFe', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (4, 'Dr. Izan Mares Segundo', 'Asensio', 'raquel.soliz@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '09767811X', 'alejandra78', 'FhpkQrhR86', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (5, 'Dr. Mara Andrés Tercero', 'Morales', 'ona70@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '04271211L', 'candela.quezada', 'fUogGQAe40', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (6, 'Pablo Covarrubias', 'Santos', 'berta62@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '60294353Z', 'jimena81', '2ZXddHTPuk', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (7, 'Ing. Ángel Bravo', 'Orozco', 'aaron22@example.net', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '36626956P', 'pau.leiva', '4Qd8vZPJWs', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (8, 'Nayara Yáñez', 'Alaniz', 'arnau.munoz@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '36578472P', 'marcos11', '4F9SOaIevl', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (9, 'Ing. David Villalba Hijo', 'Valles', 'gbenitez@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '50469193V', 'aponte.izan', 'vDQUMXEdnv', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (10, 'Ing. Juan Ontiveros', 'Barragán', 'pichardo.cristian@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '49194508S', 'asensio.julia', 'O4qys1aRAg', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (11, 'Héctor Laboy', 'Caldera', 'vicente.lucas@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '48377907Y', 'ynazario', 'ciMSfe0p9E', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (12, 'Ander Briseño Segundo', 'Brito', 'luis.salinas@example.net', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '85218876N', 'dario13', 'rkqsBEHx8s', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (13, 'Alexia Rosa', 'Gálvez', 'paola.tellez@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '57738225Z', 'joan30', 'PpkFxVFkb4', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (14, 'Iván Bustos', 'Muro', 'aya.esquibel@example.net', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '90199156X', 'gabriela.quiroz', 'wVaHadn9JY', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (15, 'Lic. Fernando Pons Hijo', 'Quiñones', 'nmadera@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '67479398C', 'blanca28', 'OuCLtMo8el', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (16, 'Miguel Valencia', 'Ozuna', 'alejandra.ponce@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '13045594V', 'opadron', 'hVlwhWrfcu', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (17, 'Dn. Oriol Mesa', 'Andrés', 'quiroz.marco@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '83397068B', 'nuria69', 'I6ixNv7G4O', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (18, 'Sra. Ainhoa Coronado', 'Porras', 'ane.carrasquillo@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '50215268N', 'anna19', '1hkXMHGP5V', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (19, 'Daniel Calvo', 'Juan', 'candela92@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '75968969S', 'ines.marin', 'HfewykKlGJ', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (20, 'Sra. Jana Hernádez Hijo', 'Cotto', 'vgallegos@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '92913742K', 'xsegovia', 'aCZdRdsvBO', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (21, 'Erik Mondragón', 'Gómez', 'joan66@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '62578807Q', 'nerea.florez', 'vl29Tq7EFN', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (22, 'Blanca Sáenz', 'Dueñas', 'leon.mara@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '37553957V', 'alicia87', 'QfIiT7bwEx', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (23, 'Ing. Zoe Soria', 'Oquendo', 'asier93@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '25306916Q', 'galvan.julia', 'uI08XH364h', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (24, 'Srita. Ainhoa Córdoba', 'Banda', 'salgado.nadia@example.net', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '65636166P', 'jordi38', 'TpIdTg1uTk', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (25, 'Vera Ruiz', 'Madrigal', 'cristian63@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '85135839M', 'sbustamante', 'uZ2GyiMO0D', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (26, 'Lucía Botello', 'Parra', 'aaron.galvez@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '41925007D', 'gabriel.garay', '1wHFVIz3LR', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (27, 'Helena Parra', 'Puga', 'mateo.valverde@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '14600506Z', 'hportillo', 'C5o5M52sLq', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (28, 'Ing. Guillermo Apodaca', 'Granados', 'iagosto@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '04560005W', 'pol.cervantez', 'VVOXX1wq9k', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (29, 'Lucas Salgado', 'Armendáriz', 'imercado@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '61863572N', 'amaya.sandra', 'lBmSTdmR2J', '2018-12-28 03:23:44', '2018-12-28 03:23:44');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (30, 'Adam Gracia', 'Cuellar', 'mateo.cabello@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '75279695M', 'aitana.arreola', 'Chd7JgjSfZ', '2018-12-28 03:23:44', '2018-12-28 03:23:44');


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('users_id_seq', 30, true);


--
-- Data for Name: vehicles; Type: TABLE DATA; Schema: public; Owner: homestead
--



--
-- Name: vehicles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('vehicles_id_seq', 1, false);


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
-- Name: seats seats_flight_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY seats
    ADD CONSTRAINT seats_flight_id_foreign FOREIGN KEY (flight_id) REFERENCES flights(id);


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

