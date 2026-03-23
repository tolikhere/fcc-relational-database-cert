--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    distance_from_earth_mly numeric(9,3),
    description text,
    has_black_hole boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: jedi_academy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.jedi_academy (
    jedi_academy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    student_count integer DEFAULT 0,
    year_founded integer,
    is_active boolean DEFAULT true,
    description text
);


ALTER TABLE public.jedi_academy OWNER TO freecodecamp;

--
-- Name: jedi_academy_jedi_academy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.jedi_academy_jedi_academy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jedi_academy_jedi_academy_id_seq OWNER TO freecodecamp;

--
-- Name: jedi_academy_jedi_academy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.jedi_academy_jedi_academy_id_seq OWNED BY public.jedi_academy.jedi_academy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean DEFAULT true,
    radius_km numeric(8,2),
    is_geologically_active boolean DEFAULT false,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(50) DEFAULT 'Unknown'::character varying NOT NULL,
    mass_earth_masses numeric(10,4),
    radius_earth_radii numeric(10,4),
    has_life boolean DEFAULT false,
    is_spherical boolean DEFAULT true,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(10),
    temperature_k integer,
    mass_solar_masses numeric(8,4),
    constellation character varying(50),
    has_planets boolean DEFAULT false,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: jedi_academy jedi_academy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.jedi_academy ALTER COLUMN jedi_academy_id SET DEFAULT nextval('public.jedi_academy_jedi_academy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 0.000, 'Our home galaxy, containing Earth and the Solar System.', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2.537, 'The nearest major galaxy to the Milky Way, on a collision course with us.', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2.730, 'The third-largest member of the Local Group.', false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Unbarred Spiral', 29.350, 'Known for its bright nucleus and large central bulge.', true);
INSERT INTO public.galaxy VALUES (5, 'The Galaxy', 'Spiral', 0.012, 'A galaxy far, far away... home to the Jedi and the Republic.', true);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Satellite/Irregular', 0.158, 'A satellite galaxy of the Milky Way, visible from the Southern Hemisphere.', false);


--
-- Data for Name: jedi_academy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.jedi_academy VALUES (1, 'Coruscant Jedi Temple', 9, 10000, -25000, false, 'The historic central hub of the Jedi Order.');
INSERT INTO public.jedi_academy VALUES (2, 'Luke Skywalkers Academy', 3, 12, 1991, true, 'A secret new school hidden on a blue-green planet called Earth.');
INSERT INTO public.jedi_academy VALUES (3, 'Great Library of Ossus', 12, 500, -10000, false, 'An ancient center for Jedi learning and artifact storage.');
INSERT INTO public.jedi_academy VALUES (4, 'Tatooine Outpost', 7, 2, 0, true, 'A small, hidden training camp in the Jundland Wastes.');
INSERT INTO public.jedi_academy VALUES (5, 'Echo Base Training Wing', 8, 50, 3, false, 'A temporary training facility established during the rebellion.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 3, true, 1737.10, false, 'Earths only natural satellite.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 11.26, false, 'The larger, inner moon of Mars.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 6.20, false, 'The smaller, outer moon of Mars.');
INSERT INTO public.moon VALUES (4, 'Io', 5, true, 1821.60, true, 'The most geologically active body in the solar system.');
INSERT INTO public.moon VALUES (5, 'Europa', 5, true, 1560.80, true, 'Has a subsurface ocean of liquid water.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, true, 2634.10, false, 'The largest moon in the solar system.');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, true, 2410.30, false, 'A heavily cratered, ancient ice world.');
INSERT INTO public.moon VALUES (8, 'Titan', 6, true, 2574.70, true, 'Has a thick atmosphere and liquid methane lakes.');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, true, 252.10, true, 'Shoots plumes of water ice into space.');
INSERT INTO public.moon VALUES (10, 'Mimas', 6, true, 198.20, false, 'Resembles the Death Star due to its giant crater.');
INSERT INTO public.moon VALUES (11, 'Ghomrassen', 7, true, 500.00, false, 'The largest of Tatooines three moons.');
INSERT INTO public.moon VALUES (12, 'Guermessa', 7, true, 350.00, false, 'The second moon of Tatooine.');
INSERT INTO public.moon VALUES (13, 'Chenini', 7, false, 120.00, false, 'A small, irregular moon of Tatooine.');
INSERT INTO public.moon VALUES (14, 'Endor', 9, true, 2450.00, true, 'The Forest Moon, home to the Ewoks.');
INSERT INTO public.moon VALUES (15, 'Centax-1', 9, true, 800.00, false, 'The primary moon orbiting Coruscant.');
INSERT INTO public.moon VALUES (16, 'Centax-2', 9, true, 450.00, false, 'A secondary moon used for orbital defense.');
INSERT INTO public.moon VALUES (17, 'Hoth Prime Moon', 8, true, 300.00, false, 'A frozen satellite reflecting Hoths blinding white light.');
INSERT INTO public.moon VALUES (18, 'Alderaan Minor', 12, true, 600.00, false, 'A peaceful, glowing moon in the Alderaan system.');
INSERT INTO public.moon VALUES (19, 'Dagobah One', 10, false, 200.00, false, 'A murky satellite hidden in the systems fog.');
INSERT INTO public.moon VALUES (20, 'Proxima b-1', 11, false, 150.00, false, 'A theoretical small moon of the nearest exoplanet.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 0.0553, 0.3829, false, true, 'The smallest and innermost planet in the Solar System.');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 0.8150, 0.9499, false, true, 'Earths sister planet with a runaway greenhouse effect.');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 1.0000, 1.0000, true, true, 'Our home planet, the only one known to harbor life.');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 0.1070, 0.5320, false, true, 'The Red Planet, home to Olympus Mons.');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 317.8000, 11.2090, false, true, 'The largest planet in our solar system.');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 95.1600, 9.4490, false, true, 'Famous for its extensive ring system.');
INSERT INTO public.planet VALUES (7, 'Tatooine', 3, 'Terrestrial', 1.2000, 1.1000, true, true, 'A desert world orbiting binary stars.');
INSERT INTO public.planet VALUES (8, 'Hoth', 6, 'Terrestrial', 0.8000, 0.9000, true, true, 'Remote ice planet and former Rebel Alliance base.');
INSERT INTO public.planet VALUES (9, 'Coruscant', 3, 'Ecumenopolis', 2.5000, 1.5000, true, true, 'A planet-wide city and the heart of the galaxy.');
INSERT INTO public.planet VALUES (10, 'Dagobah', 4, 'Terrestrial/Swamp', 0.9000, 0.8500, true, true, 'A remote world of swamps and bayous.');
INSERT INTO public.planet VALUES (11, 'Proxima b', 5, 'Terrestrial', 1.1700, 1.0700, false, true, 'The closest known exoplanet to our solar system.');
INSERT INTO public.planet VALUES (12, 'Alderaan', 3, 'Terrestrial', 1.0000, 1.0500, true, true, 'A peaceful planet known for its beauty and culture.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 1, 'G2V', 5778, 1.0000, 'N/A', true, 'The central star of our solar system.');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A1V', 9940, 2.0600, 'Canis Major', true, 'The brightest star in the Earths night sky.');
INSERT INTO public.star VALUES (3, 'Tatoo I', 5, 'G', 5500, 1.1000, 'Arkanis', true, 'One of the twin suns of the planet Tatooine.');
INSERT INTO public.star VALUES (4, 'Tatoo II', 5, 'K', 4200, 0.8500, 'Arkanis', true, 'The second sun in the Tatooine binary system.');
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 'M5.5V', 3042, 0.1221, 'Centaurus', true, 'The closest known star to the Sun.');
INSERT INTO public.star VALUES (6, 'Hoth Solar', 5, 'F8', 6200, 1.2500, 'Anoat', true, 'The primary star for the remote ice planet Hoth.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: jedi_academy_jedi_academy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.jedi_academy_jedi_academy_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: jedi_academy jedi_academy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.jedi_academy
    ADD CONSTRAINT jedi_academy_name_key UNIQUE (name);


--
-- Name: jedi_academy jedi_academy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.jedi_academy
    ADD CONSTRAINT jedi_academy_pkey PRIMARY KEY (jedi_academy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: jedi_academy jedi_academy_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.jedi_academy
    ADD CONSTRAINT jedi_academy_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

