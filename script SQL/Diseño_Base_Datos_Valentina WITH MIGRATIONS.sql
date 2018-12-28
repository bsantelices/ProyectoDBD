

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

INSERT INTO airports (id, name, type, created_at, updated_at, location_id) VALUES (1, 'Lily Bogisich III', 'national', '2018-12-28 05:36:51', '2018-12-28 05:36:51', 24);
INSERT INTO airports (id, name, type, created_at, updated_at, location_id) VALUES (2, 'Monica Ebert', 'international', '2018-12-28 05:36:51', '2018-12-28 05:36:51', 4);
INSERT INTO airports (id, name, type, created_at, updated_at, location_id) VALUES (3, 'Mr. Junior Mayert II', 'international', '2018-12-28 05:36:51', '2018-12-28 05:36:51', 37);
INSERT INTO airports (id, name, type, created_at, updated_at, location_id) VALUES (4, 'Miss Hulda Hackett', 'national', '2018-12-28 05:36:51', '2018-12-28 05:36:51', 44);
INSERT INTO airports (id, name, type, created_at, updated_at, location_id) VALUES (5, 'Mauricio Brekke', 'international', '2018-12-28 05:36:51', '2018-12-28 05:36:51', 25);
INSERT INTO airports (id, name, type, created_at, updated_at, location_id) VALUES (6, 'Mikel Hodkiewicz DVM', 'national', '2018-12-28 05:36:51', '2018-12-28 05:36:51', 32);
INSERT INTO airports (id, name, type, created_at, updated_at, location_id) VALUES (7, 'Ms. Rosetta Rath Jr.', 'national', '2018-12-28 05:36:51', '2018-12-28 05:36:51', 17);
INSERT INTO airports (id, name, type, created_at, updated_at, location_id) VALUES (8, 'Prof. Favian Towne IV', 'national', '2018-12-28 05:36:51', '2018-12-28 05:36:51', 22);
INSERT INTO airports (id, name, type, created_at, updated_at, location_id) VALUES (9, 'Milan Torphy', 'national', '2018-12-28 05:36:51', '2018-12-28 05:36:51', 49);
INSERT INTO airports (id, name, type, created_at, updated_at, location_id) VALUES (10, 'Javonte Wisozk', 'national', '2018-12-28 05:36:51', '2018-12-28 05:36:51', 14);


--
-- Name: airports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('airports_id_seq', 10, true);


--
-- Data for Name: discounts; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO discounts (id, amount, type, title, description, created_at, updated_at) VALUES (1, 5102, 'christmas', 'qui', 'Ut eius sapiente earum necessitatibus. Aliquam omnis quia voluptatem. Animi eius officia sunt facere assumenda quos. Voluptas vel quia aliquid dolorum tenetur sint dicta.', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO discounts (id, amount, type, title, description, created_at, updated_at) VALUES (2, 9107, 'sale', 'maiores', 'Cum voluptatum corporis eos voluptas ut laudantium. Saepe quia enim quia eum voluptatem repudiandae dolor. Autem corrupti voluptas ratione repudiandae eveniet qui.', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO discounts (id, amount, type, title, description, created_at, updated_at) VALUES (3, 6610, 'low season', 'laborum', 'Explicabo ad architecto cum vero. Nihil hic repudiandae incidunt nihil. Similique delectus explicabo placeat unde. Accusantium vitae quae laboriosam omnis non.', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO discounts (id, amount, type, title, description, created_at, updated_at) VALUES (4, 9220, 'christmas', 'vero', 'Quae ut aut dolores eveniet hic fugit architecto quod. A dolorem quia voluptatibus odio velit rerum eaque totam. Libero quae tenetur illo velit totam temporibus rerum ipsa.', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO discounts (id, amount, type, title, description, created_at, updated_at) VALUES (5, 7840, 'sale', 'est', 'Ut tempora quasi quaerat autem perspiciatis aut tenetur. Tenetur molestias omnis ut nisi impedit quia necessitatibus. Voluptates non voluptates adipisci. Itaque minima eos sit quibusdam soluta vel.', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO discounts (id, amount, type, title, description, created_at, updated_at) VALUES (6, 7279, 'sale', 'sequi', 'Vel dolores commodi a. Commodi ut voluptatibus cum et. Commodi eos officia ad minima et ea.', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO discounts (id, amount, type, title, description, created_at, updated_at) VALUES (7, 9897, 'sale', 'perspiciatis', 'Quas deleniti delectus recusandae odio voluptas. Amet qui velit rem rerum dolores ut perferendis. Quibusdam quidem atque quis aliquam et eos qui.', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO discounts (id, amount, type, title, description, created_at, updated_at) VALUES (8, 5496, 'christmas', 'id', 'Tempora consequatur alias sed aut repellat id adipisci. Repellendus et sunt ducimus. Nam dolorum aut excepturi inventore a eius natus.', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO discounts (id, amount, type, title, description, created_at, updated_at) VALUES (9, 6576, 'low season', 'consectetur', 'Necessitatibus laudantium et est. Magnam iste iure sit cum. Unde quam qui nihil nemo rem doloremque fuga dolor. Ipsam necessitatibus nihil reprehenderit illo rerum.', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO discounts (id, amount, type, title, description, created_at, updated_at) VALUES (10, 5543, 'christmas', 'nobis', 'Eum quia reiciendis molestiae dolorum nulla tempore. Temporibus incidunt sunt iure. Dignissimos ex quae totam porro quo doloribus quia. Labore nihil aut est cupiditate corrupti eum rem delectus.', '2018-12-28 05:36:51', '2018-12-28 05:36:51');


--
-- Name: discounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('discounts_id_seq', 10, true);


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

INSERT INTO flights (id, "coordinatesStart", "coordinatesEnd", type, "luggageCapacity", created_at, updated_at, airport_id) VALUES (1, '-23.133853,57.36797', '20.273687,63.158436', 'Dolores error.', 354, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 9);
INSERT INTO flights (id, "coordinatesStart", "coordinatesEnd", type, "luggageCapacity", created_at, updated_at, airport_id) VALUES (2, '89.095055,87.709431', '-45.95941,-141.423195', 'Eius reiciendis.', 97, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 7);
INSERT INTO flights (id, "coordinatesStart", "coordinatesEnd", type, "luggageCapacity", created_at, updated_at, airport_id) VALUES (3, '88.918943,-173.499359', '5.306412,-129.155948', 'Nobis nam est.', 120, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 3);
INSERT INTO flights (id, "coordinatesStart", "coordinatesEnd", type, "luggageCapacity", created_at, updated_at, airport_id) VALUES (4, '-28.915394,-93.229136', '-6.082778,-2.095643', 'Aliquid qui.', 314, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 5);


--
-- Name: flights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('flights_id_seq', 4, true);


--
-- Data for Name: hotels; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO hotels (id, name, state, created_at, updated_at, location_id) VALUES (1, 'Murphy, Kerluke and Wunsch', 3, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 8);
INSERT INTO hotels (id, name, state, created_at, updated_at, location_id) VALUES (2, 'Thiel, Simonis and VonRueden', 2, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 34);
INSERT INTO hotels (id, name, state, created_at, updated_at, location_id) VALUES (3, 'Gislason, Marvin and Paucek', 5, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 41);
INSERT INTO hotels (id, name, state, created_at, updated_at, location_id) VALUES (4, 'Rice Group', 1, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 43);
INSERT INTO hotels (id, name, state, created_at, updated_at, location_id) VALUES (5, 'Konopelski Group', 3, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 25);
INSERT INTO hotels (id, name, state, created_at, updated_at, location_id) VALUES (6, 'Klein-Powlowski', 5, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 42);


--
-- Name: hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('hotels_id_seq', 6, true);


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

INSERT INTO insurances (id, value, type, created_at, updated_at) VALUES (1, 80235, 'thief', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO insurances (id, value, type, created_at, updated_at) VALUES (2, 48702, 'travel', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO insurances (id, value, type, created_at, updated_at) VALUES (3, 19824, 'travel', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO insurances (id, value, type, created_at, updated_at) VALUES (4, 89759, 'travel', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO insurances (id, value, type, created_at, updated_at) VALUES (5, 28793, 'thief', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO insurances (id, value, type, created_at, updated_at) VALUES (6, 50683, 'travel', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO insurances (id, value, type, created_at, updated_at) VALUES (7, 44414, 'travel', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO insurances (id, value, type, created_at, updated_at) VALUES (8, 67182, 'life', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO insurances (id, value, type, created_at, updated_at) VALUES (9, 11183, 'life', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO insurances (id, value, type, created_at, updated_at) VALUES (10, 63066, 'life', '2018-12-28 05:36:51', '2018-12-28 05:36:51');


--
-- Name: insurances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('insurances_id_seq', 10, true);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (1, '0.201291,-108.102683', 'Danaville', 'Netherlands', 'Crist Skyway', 4902, '19429', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (2, '85.965256,168.554923', 'West Xavierton', 'American Samoa', 'Fadel Centers', 7757, '07003-1645', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (3, '35.622478,38.254486', 'North Eladio', 'Bangladesh', 'Kayli Forges', 85363, '92365-3341', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (4, '-50.234833,74.244445', 'Kuphalchester', 'Solomon Islands', 'Thaddeus Meadows', 552, '30154-8537', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (5, '-74.453039,88.135836', 'Andremouth', 'Guinea', 'Reynolds Wall', 23220, '21822-4607', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (6, '-6.583571,69.528331', 'Lake Danielaberg', 'Australia', 'Steuber Run', 56065, '61195-1442', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (7, '-22.657883,-55.332902', 'Lake Giaburgh', 'Solomon Islands', 'Cleve River', 77315, '29470-9970', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (8, '39.754292,-8.143278', 'Blickfurt', 'Dominica', 'Harmon Bypass', 235, '05837', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (9, '70.999911,15.846948', 'North Chelsie', 'Ethiopia', 'Will Springs', 77778, '26078', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (10, '-57.611426,85.47922', 'Rexside', 'French Polynesia', 'Bette Oval', 90192, '11065-1854', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (11, '-15.771524,-165.440118', 'Isabelletown', 'French Polynesia', 'Elyssa Lights', 92055, '87116-1662', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (12, '-71.797783,143.046716', 'Port Jaylon', 'Lesotho', 'Berge Mews', 122, '64976-2331', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (13, '32.111254,10.222977', 'West Jerry', 'Bouvet Island (Bouvetoya)', 'Bruen Inlet', 754, '42211', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (14, '-48.497671,169.583903', 'Nicolastown', 'Djibouti', 'Dejuan Causeway', 23624, '87140', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (15, '77.335957,-19.979099', 'Jerdemouth', 'Sierra Leone', 'Carlee Spurs', 86565, '18086', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (16, '66.10893,-111.632917', 'Gradytown', 'Costa Rica', 'Mathew Harbor', 81408, '60442', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (17, '-45.029668,-74.135822', 'Brendanstad', 'Argentina', 'Amani Alley', 908, '32797', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (18, '-42.288329,-151.641121', 'South Ava', 'Germany', 'Purdy Land', 97585, '58233-8796', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (19, '34.393048,167.130967', 'New Quincyville', 'France', 'Beahan Island', 20048, '68714-0260', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (20, '14.999169,-124.677792', 'East Myleneside', 'Canada', 'Cruickshank Spring', 3380, '18091-9129', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (21, '76.568809,-149.630449', 'Schowalterland', 'Mexico', 'Addison Row', 776, '66953-2232', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (22, '37.426254,175.467577', 'Leathamouth', 'Bahamas', 'Stanford Ville', 52311, '87634', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (23, '-8.613232,-149.158219', 'Port Mekhiton', 'Latvia', 'Herman Gateway', 82165, '79884', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (24, '-31.499151,-88.264715', 'Lake Jennieborough', 'Qatar', 'Zemlak Shore', 2588, '50546', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (25, '47.386599,-138.831184', 'West Stanfordville', 'Turkey', 'Loma Springs', 968, '37326-7683', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (26, '0.501937,-39.305105', 'West Cleora', 'Vietnam', 'Murphy Ville', 15846, '66818-1132', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (27, '10.864094,159.173153', 'West Jonathonton', 'Vanuatu', 'Kirlin Estate', 1176, '32549-7072', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (28, '-50.664263,167.394497', 'Lake Elisaville', 'Gibraltar', 'Mraz Path', 23832, '68291-4976', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (29, '-38.845044,120.976092', 'Schmelerburgh', 'Palau', 'Diego Crossing', 1198, '23660-5753', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (30, '-28.164361,-59.885778', 'Smithberg', 'Hong Kong', 'Timothy Mews', 736, '77103-9442', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (31, '69.985442,-155.483109', 'New Daxland', 'Sudan', 'Dickinson Hill', 3593, '77059-7725', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (32, '75.078867,26.168516', 'Jameyview', 'South Georgia and the South Sandwich Islands', 'Koby Field', 3819, '99759', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (33, '-44.072634,28.092329', 'South Yesseniaburgh', 'Uruguay', 'Goldner Road', 357, '82638', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (34, '-45.959521,-47.983047', 'Wardhaven', 'Spain', 'Elyse Curve', 87464, '17177', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (35, '11.436751,174.40085', 'North Alexisbury', 'Faroe Islands', 'Ellie Groves', 2279, '48408', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (36, '76.903674,-70.679129', 'Starkberg', 'Argentina', 'Stamm Canyon', 6603, '06675', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (37, '-47.305376,-135.195891', 'East Mattie', 'Barbados', 'Marilyne Views', 662, '26361-9420', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (38, '-72.952873,-69.103004', 'Faustoburgh', 'Dominican Republic', 'Daphney Fields', 6037, '19462-6193', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (39, '-76.027299,137.721255', 'East Joanie', 'Tajikistan', 'Streich Avenue', 69542, '65742', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (40, '13.641973,-44.165305', 'Kulasshire', 'Martinique', 'Russ Drive', 47878, '17231-7522', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (41, '68.597681,-127.996156', 'North Delpha', 'Bolivia', 'Vincenza Mountains', 929, '33501-9035', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (42, '21.417876,-148.905712', 'Blickview', 'Faroe Islands', 'Weimann Spur', 57373, '66979', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (43, '-29.648991,-135.726009', 'North Sandyville', 'Faroe Islands', 'Johan Inlet', 6613, '35638', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (44, '-69.939068,-28.375885', 'Kayastad', 'Comoros', 'Karlee Stream', 653, '25147', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (45, '-89.130351,163.267118', 'East Willa', 'Lithuania', 'Bruen Estates', 8104, '77052', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (46, '-6.067125,32.795955', 'North Franco', 'Maldives', 'Waters Fork', 7469, '90750-2277', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (47, '-70.699793,151.743789', 'Lemkeport', 'Saint Barthelemy', 'Thiel Expressway', 14968, '36247', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (48, '23.85867,-115.18578', 'Barrowsfurt', 'United States Minor Outlying Islands', 'Crona Circles', 2704, '90352', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (49, '22.599087,126.61472', 'West Jeraldfurt', 'Indonesia', 'Aiyana Flats', 8069, '62613-3534', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO locations (id, coordinates, city, country, street, "houseCode", "postalCode", created_at, updated_at) VALUES (50, '8.219751,-175.057846', 'West Mallory', 'British Indian Ocean Territory (Chagos Archipelago)', 'Calista Port', 25636, '30615-7039', '2018-12-28 05:36:51', '2018-12-28 05:36:51');


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('locations_id_seq', 50, true);


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (1, '29269730', 'Voluptatem necessitatibus nesciunt vitae ut est.', 'March Hare had just begun to repeat it, but her.', '2018-12-28 05:36:51', '2018-12-28 05:36:51', 22, 9);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (2, '62698993', 'Pariatur temporibus eligendi reprehenderit id.', 'He only does it to be nothing but a pack of.', '2018-12-28 05:36:51', '2018-12-28 05:36:51', 48, 4);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (3, '67333769', 'Dolor molestias beatae excepturi delectus.', 'I only wish they WOULD go with Edgar Atheling to.', '2018-12-28 05:36:51', '2018-12-28 05:36:51', 31, 10);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (4, '91867803', 'Adipisci illo molestiae numquam iusto est.', 'Alice. ''I''m glad I''ve seen that done,'' thought.', '2018-12-28 05:36:51', '2018-12-28 05:36:51', 29, 2);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (5, '21523601', 'Consectetur cupiditate excepturi eum.', 'France-- Then turn not pale, beloved snail, but.', '2018-12-28 05:36:51', '2018-12-28 05:36:51', 17, 2);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (6, '11282952', 'Molestias consequatur nam autem dignissimos.', 'King; and the constant heavy sobbing of the.', '2018-12-28 05:36:51', '2018-12-28 05:36:51', 32, 1);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (7, '93041669', 'Odit officiis illum quo sapiente.', 'Beautiful, beauti--FUL SOUP!'' ''Chorus again!''.', '2018-12-28 05:36:51', '2018-12-28 05:36:51', 24, 3);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (8, '05837755', 'Voluptatem aut et et voluptatem hic.', 'I THINK I can kick a little!'' She drew her foot.', '2018-12-28 05:36:51', '2018-12-28 05:36:51', 6, 8);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (9, '46745040', 'Qui dolor incidunt voluptatem libero.', 'Alice, ''as all the right way of speaking to it,''.', '2018-12-28 05:36:51', '2018-12-28 05:36:51', 27, 1);
INSERT INTO logs (id, "transactionCode", title, description, created_at, updated_at, user_id, payment_method_id) VALUES (10, '56994001', 'Nostrum error quae saepe voluptatum et.', 'Alice, rather alarmed at the mouth with strings.', '2018-12-28 05:36:51', '2018-12-28 05:36:51', 11, 2);


--
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('logs_id_seq', 10, true);


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO migrations (id, migration, batch) VALUES (730, '2014_10_12_000000_create_users_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (731, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (732, '2018_12_19_233223_create_roles_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (733, '2018_12_19_233518_create_payment_methods_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (734, '2018_12_19_234115_create_logs_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (735, '2018_12_19_234717_create_reservations_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (736, '2018_12_19_234914_create_insurances_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (737, '2018_12_20_000929_create_vehicles_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (738, '2018_12_20_000930_create_locations_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (739, '2018_12_20_002227_create_hotels_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (740, '2018_12_20_002747_create_rooms_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (741, '2018_12_20_003604_create_discounts_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (742, '2018_12_20_004014_create_packages_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (743, '2018_12_20_005837_create_airports_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (744, '2018_12_20_010146_create_flights_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (745, '2018_12_20_011057_create_planes_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (746, '2018_12_20_011453_create_seats_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (747, '2018_12_20_141333_create_role_user_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (748, '2018_12_20_142552_create_insurance_reservation_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (749, '2018_12_20_142928_create_reservation_vehicle_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (750, '2018_12_20_143522_create_reservation_room_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (751, '2018_12_20_143905_create_package_reservation_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (752, '2018_12_20_144039_create_package_vehicle_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (753, '2018_12_20_144133_create_package_room_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (754, '2018_12_20_144528_create_flight_reservation_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (755, '2018_12_20_144655_create_flight_package_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (756, '2018_12_20_145039_create_reservation_seat_table', 1);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('migrations_id_seq', 756, true);


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

INSERT INTO packages (id, value, description, type, created_at, updated_at, discount_id) VALUES (1, 932869, 'Quasi cum ipsam iste. Tempora necessitatibus sed occaecati. Et quod laudantium ut.', 'fly-vehicle', '2018-12-28 05:36:52', '2018-12-28 05:36:52', 3);
INSERT INTO packages (id, value, description, type, created_at, updated_at, discount_id) VALUES (2, 553556, 'Sunt occaecati ut explicabo architecto unde beatae. Quas molestiae voluptatem voluptatum quod ipsam dolorem ratione. Ut ullam maxime atque ipsum quis.', 'fly-vehicle', '2018-12-28 05:36:52', '2018-12-28 05:36:52', 4);
INSERT INTO packages (id, value, description, type, created_at, updated_at, discount_id) VALUES (3, 380235, 'Ab ut est fuga sint vel totam. Enim voluptatem necessitatibus in sed itaque.', 'fly-hotel', '2018-12-28 05:36:52', '2018-12-28 05:36:52', 5);
INSERT INTO packages (id, value, description, type, created_at, updated_at, discount_id) VALUES (4, 324306, 'Corrupti dolorum sit aut omnis at veritatis. Commodi magni numquam nihil odit. Ut tenetur magni ipsam placeat.', 'fly-vehicle', '2018-12-28 05:36:52', '2018-12-28 05:36:52', 5);
INSERT INTO packages (id, value, description, type, created_at, updated_at, discount_id) VALUES (5, 348225, 'Perferendis id beatae ex eum rerum. Cumque ut similique odit labore nulla est. Ullam omnis architecto sed quis. Est non excepturi recusandae reiciendis modi molestiae explicabo.', 'fly-vehicle', '2018-12-28 05:36:52', '2018-12-28 05:36:52', 9);
INSERT INTO packages (id, value, description, type, created_at, updated_at, discount_id) VALUES (6, 755054, 'Tempore saepe doloribus id molestiae eos. Necessitatibus enim voluptatem ducimus voluptas blanditiis. Consequatur nemo consequuntur modi alias sit optio.', 'fly-vehicle', '2018-12-28 05:36:52', '2018-12-28 05:36:52', 2);
INSERT INTO packages (id, value, description, type, created_at, updated_at, discount_id) VALUES (7, 383273, 'Et ullam eos velit modi dignissimos. Voluptatem quos sunt consequatur officia. Labore soluta iure veritatis. Alias voluptas recusandae occaecati culpa adipisci inventore.', 'fly-vehicle', '2018-12-28 05:36:52', '2018-12-28 05:36:52', 3);
INSERT INTO packages (id, value, description, type, created_at, updated_at, discount_id) VALUES (8, 876121, 'Similique molestias rem reiciendis quisquam impedit nihil ut. Eos soluta est totam earum velit itaque. Explicabo aspernatur aliquam eos et et illo nobis. Occaecati quia sed et quaerat ut.', 'fly-vehicle', '2018-12-28 05:36:52', '2018-12-28 05:36:52', 10);
INSERT INTO packages (id, value, description, type, created_at, updated_at, discount_id) VALUES (9, 513084, 'Amet voluptatibus odio repellendus eaque. Quis officia aspernatur non quia. Quia harum eligendi distinctio ut voluptatum dolor et.', 'fly-vehicle', '2018-12-28 05:36:52', '2018-12-28 05:36:52', 1);
INSERT INTO packages (id, value, description, type, created_at, updated_at, discount_id) VALUES (10, 621546, 'Eos quos inventore cum. A mollitia aspernatur sint sit architecto molestiae.', 'fly-hotel', '2018-12-28 05:36:52', '2018-12-28 05:36:52', 5);


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

INSERT INTO payment_methods (id, type, created_at, updated_at) VALUES (1, 'Visa', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO payment_methods (id, type, created_at, updated_at) VALUES (2, 'MasterCard', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO payment_methods (id, type, created_at, updated_at) VALUES (3, 'MasterCard', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO payment_methods (id, type, created_at, updated_at) VALUES (4, 'MasterCard', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO payment_methods (id, type, created_at, updated_at) VALUES (5, 'Discover Card', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO payment_methods (id, type, created_at, updated_at) VALUES (6, 'Visa', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO payment_methods (id, type, created_at, updated_at) VALUES (7, 'MasterCard', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO payment_methods (id, type, created_at, updated_at) VALUES (8, 'Visa Retired', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO payment_methods (id, type, created_at, updated_at) VALUES (9, 'Visa Retired', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO payment_methods (id, type, created_at, updated_at) VALUES (10, 'MasterCard', '2018-12-28 05:36:51', '2018-12-28 05:36:51');


--
-- Name: payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('payment_methods_id_seq', 10, true);


--
-- Data for Name: planes; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (1, 'Denesik, Hoeger and Brakus', 90, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 2);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (2, 'Purdy-Berge', 77, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 5);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (3, 'Wisozk, Boehm and D''Amore', 143, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 8);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (4, 'Kozey, Sporer and Hammes', 53, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 10);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (5, 'Kuhic LLC', 127, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 9);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (6, 'Hessel and Sons', 111, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 6);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (7, 'O''Keefe, Hermann and Jones', 56, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 5);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (8, 'Becker, Kunze and Mayer', 150, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 5);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (9, 'Runolfsdottir-Connelly', 135, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 1);
INSERT INTO planes (id, brand, capacity, created_at, updated_at, airport_id) VALUES (10, 'Zboncak Group', 139, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 7);


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

INSERT INTO reservations (id, amount, description, completed, created_at, updated_at, user_id, payment_method_id) VALUES (1, 217491, 'Why, there''s hardly enough of me left to make.', false, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 1, 9);
INSERT INTO reservations (id, amount, description, completed, created_at, updated_at, user_id, payment_method_id) VALUES (2, 408359, 'Queen to-day?'' ''I should like to drop the jar.', false, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 46, 6);
INSERT INTO reservations (id, amount, description, completed, created_at, updated_at, user_id, payment_method_id) VALUES (3, 479831, 'I do so like that curious song about the games.', true, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 28, 4);
INSERT INTO reservations (id, amount, description, completed, created_at, updated_at, user_id, payment_method_id) VALUES (4, 339583, 'Alice very humbly: ''you had got its head to hide.', true, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 44, 3);
INSERT INTO reservations (id, amount, description, completed, created_at, updated_at, user_id, payment_method_id) VALUES (5, 36827, 'Alice, in a Little Bill It was so large in the.', true, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 38, 8);
INSERT INTO reservations (id, amount, description, completed, created_at, updated_at, user_id, payment_method_id) VALUES (6, 193938, 'Alice: ''besides, that''s not a mile high,'' said.', true, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 23, 6);
INSERT INTO reservations (id, amount, description, completed, created_at, updated_at, user_id, payment_method_id) VALUES (7, 477267, 'So she began again: ''Ou est ma chatte?'' which.', false, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 10, 8);
INSERT INTO reservations (id, amount, description, completed, created_at, updated_at, user_id, payment_method_id) VALUES (8, 36483, 'Alice did not like to go on. ''And so these three.', false, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 14, 1);
INSERT INTO reservations (id, amount, description, completed, created_at, updated_at, user_id, payment_method_id) VALUES (9, 207075, 'I mentioned before, And have grown most.', true, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 15, 5);
INSERT INTO reservations (id, amount, description, completed, created_at, updated_at, user_id, payment_method_id) VALUES (10, 51130, 'Queen was in the book,'' said the Hatter. This.', false, '2018-12-28 05:36:51', '2018-12-28 05:36:51', 33, 8);


--
-- Name: reservations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('reservations_id_seq', 10, true);


--
-- Data for Name: role_user; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (1, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 1, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (2, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 2, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (3, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 3, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (4, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 4, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (5, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 5, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (6, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 6, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (7, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 7, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (8, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 8, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (9, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 9, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (10, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 10, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (11, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 11, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (12, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 12, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (13, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 13, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (14, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 14, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (15, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 15, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (16, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 16, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (17, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 17, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (18, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 18, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (19, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 19, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (20, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 20, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (21, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 21, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (22, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 22, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (23, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 23, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (24, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 24, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (25, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 25, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (26, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 26, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (27, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 27, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (28, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 28, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (29, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 29, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (30, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 30, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (31, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 31, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (32, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 32, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (33, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 33, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (34, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 34, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (35, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 35, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (36, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 36, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (37, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 37, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (38, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 38, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (39, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 39, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (40, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 40, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (41, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 41, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (42, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 42, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (43, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 43, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (44, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 44, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (45, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 45, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (46, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 46, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (47, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 47, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (48, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 48, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (49, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 49, 3);
INSERT INTO role_user (id, created_at, updated_at, user_id, role_id) VALUES (50, '2018-12-28 05:36:50', '2018-12-28 05:36:50', 50, 3);


--
-- Name: role_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('role_user_id_seq', 50, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO roles (id, name, created_at, updated_at) VALUES (1, 'administrator', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO roles (id, name, created_at, updated_at) VALUES (2, 'developer', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO roles (id, name, created_at, updated_at) VALUES (3, 'normal', '2018-12-28 05:36:50', '2018-12-28 05:36:50');


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

INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (1, 'Dr. Martina Rascón', 'Laureano', 'wsaiz@example.com', NULL, 'l@<>e1&cA/E', 0, '34769136J', 'saez.carlos', 'sbNJZ9alcx', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (2, 'Eric Salcedo', 'Reynoso', 'eatencio@example.org', NULL, 'DKfE1q>?=N', 0, '69347155Q', 'antonio97', '8IoniiPHte', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (3, 'Noelia Leyva Segundo', 'Lemus', 'clara.longoria@example.com', NULL, 'O3"$maUa7NBpC<c.K', 0, '78804319V', 'baca.rodrigo', 'NfTeKLUaTu', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (4, 'Ing. Miriam Guillen', 'Barajas', 'galvan.julia@example.org', NULL, '{\Hi3FOX?aoOA', 0, '88147851Y', 'cesar.arias', 'T0rdl3X5nC', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (5, 'Andrés Barajas', 'Guajardo', 'antonio12@example.net', NULL, 'lO]ND/a[=@q9?39!.z9>', 0, '90712449N', 'emma.quintana', 'UPLaG84mGJ', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (6, 'Lic. Gabriel Rico', 'Arteaga', 'ainara91@example.org', NULL, 'C]:Sl5rK3DV6dx@r|', 0, '21648808N', 'mireles.ian', 'DXs65ggsIb', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (7, 'Ander Treviño', 'Orozco', 'biel.aleman@example.org', NULL, 'yHK2oNVJh@V3Ge', 0, '97860587A', 'gerard.longoria', 'jbZ7zG6Woe', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (8, 'Arnau Gálvez', 'Meléndez', 'victoria.atencio@example.org', NULL, 'clofeocIXh5_prcg~H_K', 0, '58856008C', 'rcarretero', 'W0MBvLRpll', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (9, 'Raúl Venegas Hijo', 'Castaño', 'lomeli.yaiza@example.org', NULL, ')j?S^,JiY', 0, '90191634D', 'jruelas', '0mWxSMop8e', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (10, 'David Mercado', 'Aguayo', 'nil.guajardo@example.com', NULL, '0DiYuo02.oBy#(VL{h', 0, '84140157Q', 'rmatias', 'bcJJ9NH4qG', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (11, 'Oriol Armas', 'Olivo', 'smoral@example.org', NULL, '{hMGUSm5H,2NEO})g+4!', 0, '14943855L', 'lucas32', 'O9JZgY5qJn', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (12, 'Leo Delatorre', 'de Anda', 'acosta.asier@example.net', NULL, 'zk4(3\p`%sgyA)xj5s', 0, '31807605P', 'reynoso.jana', 'tEilddPaLZ', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (13, 'Dr. Raquel Laureano', 'Expósito', 'rincon.abril@example.com', NULL, '\Vk:^^[y', 0, '62554666W', 'ona50', '4cFd18FQNT', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (14, 'Javier Carrillo', 'Benito', 'alvaro01@example.net', NULL, 'xO.4co-V7VQQy7.', 0, '20105994S', 'alejandro49', 'LJTVqEAwFb', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (15, 'Alberto Alfonso Hijo', 'Narváez', 'blasco.rayan@example.net', NULL, 'BazN,s#/g', 0, '18660119N', 'javier.oquendo', 'BTfAzZnx1s', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (16, 'Alexandra Águilar', 'Arteaga', 'uaguilar@example.org', NULL, 'u3&BM^GhNC;#QJ7Ea', 0, '97295257J', 'manuela.casillas', 'KMOfb0oLVe', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (17, 'Dr. Gabriel Casanova', 'Sosa', 'guillem33@example.org', NULL, '!;#GF``+>6hxh', 0, '51306242G', 'ignacio.manzanares', 'lHwRfgG6Hk', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (18, 'Ing. Guillem Expósito Segundo', 'Cornejo', 'nahia17@example.net', NULL, 'h^E3|GtxN(a!>Cg', 0, '76205916Q', 'qcarrero', 'kUEX3OmcxX', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (19, 'Óscar Cardona', 'Ocasio', 'mena.omar@example.net', NULL, 'c5vA0!5{sVHG6Z~', 0, '03543879Q', 'scastano', 'xtU1siFAWZ', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (20, 'Ariadna Montenegro', 'Montes', 'ncastano@example.org', NULL, '=Or#6[l8}hBm;+[', 0, '63540999A', 'josemanuel.domenech', 'gRPohurDqJ', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (21, 'Juan Pons', 'Bueno', 'joseantonio.caldera@example.net', NULL, '9yeQdR}|1N~_DM2', 0, '23074596F', 'diana25', 'V19WGIodzP', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (22, 'Daniela Covarrubias Hijo', 'Ortega', 'martin32@example.net', NULL, '_3DPO+', 0, '63631192J', 'acastro', 'psvYfLVePq', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (23, 'Cristina Casado', 'Casillas', 'pau79@example.org', NULL, '1lrjv%mxH/;', 0, '33094503X', 'oliver21', 'l1XA2HzGkz', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (24, 'Erik Rosa', 'Elizondo', 'alexandra90@example.com', NULL, '?~IS`7)1Ghc\Y^njw', 0, '75143453S', 'marco.cepeda', 'Dr75IfplsQ', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (25, 'Joan Bonilla', 'Briseño', 'vega79@example.org', NULL, '[}Ak"nk!x|', 0, '46766104C', 'joan78', '1q46SFAIRy', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (26, 'Yeray Paz', 'Mayorga', 'aguilar.marco@example.com', NULL, '[Vy|;hH:y6,I/', 0, '28171505R', 'nsierra', 'h3XOyVyWN4', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (27, 'Guillem Peláez Tercero', 'Tejeda', 'aya95@example.com', NULL, 'D9q9n@\', 0, '38036478K', 'serra.miguel', 'YciC5eVUdA', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (28, 'Rubén Delrío', 'Valverde', 'noa40@example.net', NULL, 'vtlB?g_]2^$kJH3', 0, '83436991Y', 'ainara85', 'CxHIxNWiB4', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (29, 'Gabriel Espinal', 'Galán', 'jluna@example.org', NULL, 'y,''g1cMK*WLzbc\YL}', 0, '05371591X', 'juanjose96', 'iRlnrzQ6CF', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (30, 'Lucas Fernández', 'Jiménez', 'ldomenech@example.net', NULL, 'HMf%DO4RwUHY', 0, '88673537G', 'ourbina', 'oDrDY3Iut6', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (31, 'Angela Santos Segundo', 'Segovia', 'rosales.jana@example.org', NULL, 'H1/K9"q}~TX"IQ37)', 0, '80274736K', 'gael56', '9T8eacmycH', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (32, 'Lic. Gael Tejeda', 'Reséndez', 'samuel.matos@example.com', NULL, 'BUe''c|O#QN72S?Y', 0, '53946199K', 'daniel53', 'tmBgbFeR6v', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (33, 'Jesús Godínez', 'Mejía', 'cesar97@example.net', NULL, ',%6$z5=', 0, '60678266B', 'pardo.hugo', 'ZKHDecchSC', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (34, 'Ainara Aguilar', 'Haro', 'naia.jiminez@example.org', NULL, '&K>^}"\''(5.', 0, '74142127V', 'barragan.yeray', '1stVKb7anH', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (35, 'Berta Guzmán', 'Montemayor', 'aguilar.andres@example.com', NULL, '_x)c_y7DN\$', 0, '71902829E', 'enrique.melendez', 'RmhYslObZy', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (36, 'María Peralta Tercero', 'Villa', 'adam12@example.net', NULL, '*5awt^eoyFD', 0, '07860051P', 'jgriego', 'FFcgTnL5Uu', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (37, 'Dr. Patricia Conde', 'Concepción', 'nuria08@example.org', NULL, ']''UE~`I+', 0, '72795925M', 'zepeda.jimena', 'Y5w5bCg7dL', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (38, 'Lic. Pablo Arreola Segundo', 'Romo', 'hgrijalva@example.org', NULL, 'OIV^bbw0}8>', 0, '72569213G', 'cvillalpando', 'vYt4qoHfqp', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (39, 'Sra. Nil Almanza Hijo', 'Alcántar', 'alberto.villareal@example.com', NULL, ':W}HanXZwAGCfbe8', 0, '94824481N', 'marti.alva', 'mq780z6Cja', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (40, 'Alma Saiz', 'Irizarry', 'alexandra34@example.org', NULL, 'Oyv5[]', 0, '34080245H', 'aroa53', 'SsSn4rId34', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (41, 'Gael Lara', 'Gil', 'irene14@example.org', NULL, '8^Nj{#,7p$vuR~rE', 0, '23960526T', 'qdominguez', 'ySfQSj7Wfj', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (42, 'Luis Farías Segundo', 'Rosas', 'jan.lorente@example.org', NULL, '.B,`W!@A=^=;z=n-', 0, '95096511K', 'imiguel', 'm0mj874YAv', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (43, 'Sr. Miguel Ángel Cuesta', 'Serra', 'francisco.aguirre@example.org', NULL, 'dO?OY3a;=ra', 0, '15386655T', 'miguel09', 'smnwkspXcp', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (44, 'Miguel Ocasio Hijo', 'Mercado', 'izan94@example.com', NULL, '<ed7DNLR%Z;!FR&p+I)', 0, '79440685L', 'ainhoa.acosta', 'GLZ9uC0vkB', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (45, 'Salma Ayala', 'Armenta', 'joseantonio.ontiveros@example.net', NULL, 'W@/o(5uyqc0FB', 0, '52314485L', 'jiglesias', 'nrN5gBr6fX', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (46, 'Mara Casado', 'Pedraza', 'pedraza.alejandra@example.com', NULL, '/&soQ/TH_!"NM', 0, '77831679R', 'celia.saiz', 'd8IpagtL1E', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (47, 'Ángel Romo', 'Bonilla', 'ismael47@example.net', NULL, ';4o:WGnjcN0>r}4MA', 0, '90112684H', 'ismael.teran', 'rLdTscgq5e', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (48, 'Iker Enríquez Tercero', 'Duarte', 'rayan.barreto@example.net', NULL, '{anLjNwEEOH=Z', 0, '38440791V', 'marc32', 'HmFwXTe2C2', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (49, 'Lola Barraza Segundo', 'Armendáriz', 'dzapata@example.net', NULL, '4G+^d5~bx4+Z70,$', 0, '02813047D', 'julia48', 'O089nkVwxW', '2018-12-28 05:36:50', '2018-12-28 05:36:50');
INSERT INTO users (id, name, lastname, email, email_verified_at, password, "moneyAmount", dni, username, remember_token, created_at, updated_at) VALUES (50, 'Sergio Chacón', 'Morales', 'sergio.porras@example.com', NULL, 'FH]QkR(Hd3MH9/~)Z0eP', 0, '99631027H', 'iria.mejia', 'Xo5YgTAXb9', '2018-12-28 05:36:50', '2018-12-28 05:36:50');


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('users_id_seq', 50, true);


--
-- Data for Name: vehicles; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (1, 7, 'quo', 'voluptatum', 'KV 525 N', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (2, 10, 'culpa', 'enim', 'WUM 753', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (3, 7, 'rerum', 'ea', 'AVX 8126', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (4, 2, 'dolorum', 'ratione', 'MKN 5943', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (5, 2, 'ad', 'illum', 'PXU 3418', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (6, 2, 'non', 'non', 'PATRIOT 9425', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (7, 2, 'deserunt', 'et', 'KV 5950 L', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (8, 2, 'vel', 'nihil', 'WRM 7725 A', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (9, 5, 'magnam', 'quos', 'NEP 8406', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (10, 6, 'corporis', 'molestiae', 'NBOS 2003', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (11, 9, 'alias', 'sunt', 'QM 8394 Y', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (12, 2, 'quia', 'nisi', 'WQ 9214 J', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (13, 10, 'velit', 'perferendis', 'WMF 7434', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (14, 2, 'modi', 'consequuntur', 'WGY 1909', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (15, 5, 'quibusdam', 'qui', 'DPV 6927', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (16, 6, 'qui', 'consequatur', 'KV 2817 ', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (17, 3, 'asperiores', 'et', 'WPK 5593 P', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (18, 3, 'velit', 'corrupti', 'CNL 2113', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (19, 5, 'doloribus', 'reiciendis', 'NPU 9675', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (20, 8, 'voluptatem', 'et', 'QB 9092 K', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (21, 10, 'a', 'non', 'AQU 5504', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (22, 3, 'tempora', 'omnis', 'WVQ 8013', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (23, 10, 'non', 'laudantium', 'AWY 7628', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (24, 7, 'dolore', 'vel', 'QC 2228 Y', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (25, 5, 'vel', 'qui', 'WWC 6223 L', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (26, 6, 'consequatur', 'doloribus', 'G1M 1649', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (27, 2, 'aut', 'est', 'KV 4610 C', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (28, 4, 'praesentium', 'qui', 'QA 609 D', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (29, 9, 'quam', 'neque', 'QT 1622 R', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (30, 7, 'impedit', 'ducimus', 'KV 4815 R', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (31, 3, 'assumenda', 'dicta', 'WVQ 4207 X', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (32, 4, 'nobis', 'facilis', 'WYE 8903 W', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (33, 4, 'voluptatibus', 'rem', 'WBV 2046 D', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (34, 9, 'qui', 'enim', 'FCB 816', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (35, 4, 'enim', 'aut', 'SAS 5751', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (36, 4, 'repellat', 'et', 'NJL 9246', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (37, 4, 'nihil', 'rem', 'WWL 9883 T', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (38, 8, 'necessitatibus', 'architecto', 'VME 1636', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (39, 7, 'suscipit', 'nostrum', 'G1M 6081', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (40, 6, 'ea', 'et', 'SD 9207 B', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (41, 4, 'quasi', 'rerum', 'QA 1898 K', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (42, 8, 'et', 'dolores', 'Proton 7386', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (43, 6, 'cupiditate', 'quidem', 'SSA 6400 D', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (44, 9, 'iusto', 'assumenda', 'PXL 4386', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (45, 3, 'illum', 'quia', 'SAS 4768', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (46, 2, 'neque', 'quam', 'WEA 3066 U', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (47, 10, 'quas', 'in', 'FEV 9993', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (48, 4, 'vel', 'voluptatem', 'CFQ 5342', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (49, 9, 'aut', 'consequuntur', 'WGU 871 C', '2018-12-28 05:36:51', '2018-12-28 05:36:51');
INSERT INTO vehicles (id, capacity, model, brand, patent, created_at, updated_at) VALUES (50, 9, 'odit', 'reprehenderit', 'WMX 8172', '2018-12-28 05:36:51', '2018-12-28 05:36:51');


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

