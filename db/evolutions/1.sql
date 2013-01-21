# Users schema

# --- !Ups

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

-- CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;
-- ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO magnet;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

CREATE TABLE account (
    id bigint NOT NULL,
    datetype timestamp without time zone,
    email character varying(255),
    fullname character varying(255),
    isadmin boolean NOT NULL,
    password character varying(255),
    company_id bigint
);


ALTER TABLE public.account OWNER TO dbuser;

CREATE TABLE company (
    id bigint NOT NULL,
    doctornum integer,
    name character varying(255)
);


ALTER TABLE public.company OWNER TO dbuser;

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO dbuser;

SELECT pg_catalog.setval('hibernate_sequence', 4, true);


INSERT INTO account (id, datetype, email, fullname, isadmin, password, company_id) 
VALUES 
(3, '2013-01-21 10:02:03', 'admin@scalam.jp', 'admin', false, 'secret', 1),
(4, '2013-01-01 00:00:00', 'test@test.jp', 'test', false, 'secret', 1);


INSERT INTO company (id, doctornum, name) VALUES (1, 12, '会社１'),(2, 50, '会社２');

ALTER TABLE ONLY account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);

ALTER TABLE ONLY company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);

ALTER TABLE ONLY account
    ADD CONSTRAINT fk1d0c220d1366ccf6 FOREIGN KEY (company_id) REFERENCES company(id);

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM magnet;
GRANT ALL ON SCHEMA public TO magnet;
GRANT ALL ON SCHEMA public TO PUBLIC;

# --- !Downs

