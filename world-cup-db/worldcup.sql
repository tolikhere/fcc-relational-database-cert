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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (33, 2018, 'Final', 817, 818, 4, 2);
INSERT INTO public.games VALUES (34, 2018, 'Third Place', 819, 820, 2, 0);
INSERT INTO public.games VALUES (35, 2018, 'Semi-Final', 818, 820, 2, 1);
INSERT INTO public.games VALUES (36, 2018, 'Semi-Final', 817, 819, 1, 0);
INSERT INTO public.games VALUES (37, 2018, 'Quarter-Final', 818, 826, 3, 2);
INSERT INTO public.games VALUES (38, 2018, 'Quarter-Final', 820, 828, 2, 0);
INSERT INTO public.games VALUES (39, 2018, 'Quarter-Final', 819, 830, 2, 1);
INSERT INTO public.games VALUES (40, 2018, 'Quarter-Final', 817, 832, 2, 0);
INSERT INTO public.games VALUES (41, 2018, 'Eighth-Final', 820, 834, 2, 1);
INSERT INTO public.games VALUES (42, 2018, 'Eighth-Final', 828, 836, 1, 0);
INSERT INTO public.games VALUES (43, 2018, 'Eighth-Final', 819, 838, 3, 2);
INSERT INTO public.games VALUES (44, 2018, 'Eighth-Final', 830, 840, 2, 0);
INSERT INTO public.games VALUES (45, 2018, 'Eighth-Final', 818, 842, 2, 1);
INSERT INTO public.games VALUES (46, 2018, 'Eighth-Final', 826, 844, 2, 1);
INSERT INTO public.games VALUES (47, 2018, 'Eighth-Final', 832, 846, 2, 1);
INSERT INTO public.games VALUES (48, 2018, 'Eighth-Final', 817, 848, 4, 3);
INSERT INTO public.games VALUES (49, 2014, 'Final', 849, 848, 1, 0);
INSERT INTO public.games VALUES (50, 2014, 'Third Place', 851, 830, 3, 0);
INSERT INTO public.games VALUES (51, 2014, 'Semi-Final', 848, 851, 1, 0);
INSERT INTO public.games VALUES (52, 2014, 'Semi-Final', 849, 830, 7, 1);
INSERT INTO public.games VALUES (53, 2014, 'Quarter-Final', 851, 858, 1, 0);
INSERT INTO public.games VALUES (54, 2014, 'Quarter-Final', 848, 819, 1, 0);
INSERT INTO public.games VALUES (55, 2014, 'Quarter-Final', 830, 834, 2, 1);
INSERT INTO public.games VALUES (56, 2014, 'Quarter-Final', 849, 817, 1, 0);
INSERT INTO public.games VALUES (57, 2014, 'Eighth-Final', 830, 866, 2, 1);
INSERT INTO public.games VALUES (58, 2014, 'Eighth-Final', 834, 832, 2, 0);
INSERT INTO public.games VALUES (59, 2014, 'Eighth-Final', 817, 870, 2, 0);
INSERT INTO public.games VALUES (60, 2014, 'Eighth-Final', 849, 872, 2, 1);
INSERT INTO public.games VALUES (61, 2014, 'Eighth-Final', 851, 840, 2, 1);
INSERT INTO public.games VALUES (62, 2014, 'Eighth-Final', 858, 876, 2, 1);
INSERT INTO public.games VALUES (63, 2014, 'Eighth-Final', 848, 836, 1, 0);
INSERT INTO public.games VALUES (64, 2014, 'Eighth-Final', 819, 880, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (817, 'France');
INSERT INTO public.teams VALUES (818, 'Croatia');
INSERT INTO public.teams VALUES (819, 'Belgium');
INSERT INTO public.teams VALUES (820, 'England');
INSERT INTO public.teams VALUES (826, 'Russia');
INSERT INTO public.teams VALUES (828, 'Sweden');
INSERT INTO public.teams VALUES (830, 'Brazil');
INSERT INTO public.teams VALUES (832, 'Uruguay');
INSERT INTO public.teams VALUES (834, 'Colombia');
INSERT INTO public.teams VALUES (836, 'Switzerland');
INSERT INTO public.teams VALUES (838, 'Japan');
INSERT INTO public.teams VALUES (840, 'Mexico');
INSERT INTO public.teams VALUES (842, 'Denmark');
INSERT INTO public.teams VALUES (844, 'Spain');
INSERT INTO public.teams VALUES (846, 'Portugal');
INSERT INTO public.teams VALUES (848, 'Argentina');
INSERT INTO public.teams VALUES (849, 'Germany');
INSERT INTO public.teams VALUES (851, 'Netherlands');
INSERT INTO public.teams VALUES (858, 'Costa Rica');
INSERT INTO public.teams VALUES (866, 'Chile');
INSERT INTO public.teams VALUES (870, 'Nigeria');
INSERT INTO public.teams VALUES (872, 'Algeria');
INSERT INTO public.teams VALUES (876, 'Greece');
INSERT INTO public.teams VALUES (880, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 64, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 880, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

