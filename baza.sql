--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

-- Started on 2020-01-27 11:52:24

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

--
-- TOC entry 8 (class 2615 OID 16396)
-- Name: loginregister; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA loginregister;


ALTER SCHEMA loginregister OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 206 (class 1259 OID 16416)
-- Name: jobs; Type: TABLE; Schema: loginregister; Owner: breznar-test
--

CREATE TABLE loginregister.jobs (
    job_id integer NOT NULL,
    title character varying(100) NOT NULL,
    comment text,
    job_done boolean DEFAULT false NOT NULL,
    time_due_date date,
    time_due_time time without time zone,
    user_id integer
);


ALTER TABLE loginregister.jobs OWNER TO "breznar-test";

--
-- TOC entry 205 (class 1259 OID 16414)
-- Name: jobs_job_id_seq; Type: SEQUENCE; Schema: loginregister; Owner: breznar-test
--

CREATE SEQUENCE loginregister.jobs_job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE loginregister.jobs_job_id_seq OWNER TO "breznar-test";

--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 205
-- Name: jobs_job_id_seq; Type: SEQUENCE OWNED BY; Schema: loginregister; Owner: breznar-test
--

ALTER SEQUENCE loginregister.jobs_job_id_seq OWNED BY loginregister.jobs.job_id;


--
-- TOC entry 204 (class 1259 OID 16404)
-- Name: users; Type: TABLE; Schema: loginregister; Owner: postgres
--

CREATE TABLE loginregister.users (
    user_id integer NOT NULL,
    name character varying(50) NOT NULL,
    surname character varying(50) NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(100) NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE loginregister.users OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16402)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: loginregister; Owner: postgres
--

CREATE SEQUENCE loginregister.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE loginregister.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 203
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: loginregister; Owner: postgres
--

ALTER SEQUENCE loginregister.users_user_id_seq OWNED BY loginregister.users.user_id;


--
-- TOC entry 2696 (class 2604 OID 16419)
-- Name: jobs job_id; Type: DEFAULT; Schema: loginregister; Owner: breznar-test
--

ALTER TABLE ONLY loginregister.jobs ALTER COLUMN job_id SET DEFAULT nextval('loginregister.jobs_job_id_seq'::regclass);


--
-- TOC entry 2695 (class 2604 OID 16407)
-- Name: users user_id; Type: DEFAULT; Schema: loginregister; Owner: postgres
--

ALTER TABLE ONLY loginregister.users ALTER COLUMN user_id SET DEFAULT nextval('loginregister.users_user_id_seq'::regclass);


--
-- TOC entry 2836 (class 0 OID 16416)
-- Dependencies: 206
-- Data for Name: jobs; Type: TABLE DATA; Schema: loginregister; Owner: breznar-test
--

COPY loginregister.jobs (job_id, title, comment, job_done, time_due_date, time_due_time, user_id) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 16404)
-- Dependencies: 204
-- Data for Name: users; Type: TABLE DATA; Schema: loginregister; Owner: postgres
--

COPY loginregister.users (user_id, name, surname, username, password, email) FROM stdin;
6	Jan	Breznar	kiwi	a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3	jan.breznar@neke.com
8	Tilen	Grah	tilko	a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3	tilen.greah@test.si
\.


--
-- TOC entry 2844 (class 0 OID 0)
-- Dependencies: 205
-- Name: jobs_job_id_seq; Type: SEQUENCE SET; Schema: loginregister; Owner: breznar-test
--

SELECT pg_catalog.setval('loginregister.jobs_job_id_seq', 1, false);


--
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 203
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: loginregister; Owner: postgres
--

SELECT pg_catalog.setval('loginregister.users_user_id_seq', 8, true);


--
-- TOC entry 2699 (class 2606 OID 16413)
-- Name: users email_uniq; Type: CONSTRAINT; Schema: loginregister; Owner: postgres
--

ALTER TABLE ONLY loginregister.users
    ADD CONSTRAINT email_uniq UNIQUE (email);


--
-- TOC entry 2705 (class 2606 OID 16425)
-- Name: jobs jobs_pk; Type: CONSTRAINT; Schema: loginregister; Owner: breznar-test
--

ALTER TABLE ONLY loginregister.jobs
    ADD CONSTRAINT jobs_pk PRIMARY KEY (job_id);


--
-- TOC entry 2701 (class 2606 OID 16411)
-- Name: users username_uniq; Type: CONSTRAINT; Schema: loginregister; Owner: postgres
--

ALTER TABLE ONLY loginregister.users
    ADD CONSTRAINT username_uniq UNIQUE (username);


--
-- TOC entry 2703 (class 2606 OID 16409)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: loginregister; Owner: postgres
--

ALTER TABLE ONLY loginregister.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2706 (class 2606 OID 16426)
-- Name: jobs jobs_users_user_id_fk; Type: FK CONSTRAINT; Schema: loginregister; Owner: breznar-test
--

ALTER TABLE ONLY loginregister.jobs
    ADD CONSTRAINT jobs_users_user_id_fk FOREIGN KEY (user_id) REFERENCES loginregister.users(user_id) ON DELETE CASCADE;


-- Completed on 2020-01-27 11:52:24

--
-- PostgreSQL database dump complete
--

