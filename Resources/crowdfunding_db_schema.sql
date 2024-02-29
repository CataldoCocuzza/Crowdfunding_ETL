--create database

CREATE DATABASE crowdfunding_db
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
-- create category table
CREATE TABLE IF NOT EXISTS public.category
(
    category_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    category character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT category_pkey PRIMARY KEY (category_id)
)

ALTER TABLE IF EXISTS public.category
    OWNER to postgres;
	
--create subcategory table	
CREATE TABLE IF NOT EXISTS public.subcategory
(
    subcategory_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    sub character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT subcategory_pkey PRIMARY KEY (subcategory_id)
)

ALTER TABLE IF EXISTS public.subcategory
    OWNER to postgres;
	
--create contacts table
CREATE TABLE IF NOT EXISTS public.contacts
(
    contact_id integer NOT NULL,
    first_name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    email character varying(70) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT contacts_pkey PRIMARY KEY (contact_id)
)

ALTER TABLE IF EXISTS public.contacts
    OWNER to postgres;
	
--create campaign table
CREATE TABLE IF NOT EXISTS public.campaign
(
    cf_id integer NOT NULL,
    contact_id integer REFERENCES contacts (contact_id),
    company_name character varying(100) COLLATE pg_catalog."default",
    description character varying(100) COLLATE pg_catalog."default",
    goal double precision,
    pledged double precision,
    outcome character varying(10) COLLATE pg_catalog."default",
    backers_count integer,
    country character varying(20) COLLATE pg_catalog."default",
    currency character varying(10) COLLATE pg_catalog."default",
    launched_date date,
    end_date date,
    category_id character varying(10) REFERENCES category(category_id),
    subcategory_id character varying(10) REFERENCES subcategory(subcategory_id),
    CONSTRAINT campaign_pkey PRIMARY KEY (cf_id)
);

ALTER TABLE IF EXISTS public.campaign
    OWNER to postgres;
	
--check data import, data join, success	
select * from category;

select * from subcategory;

select * from contacts;

select * from campaign;

select * from campaign cam 
	inner join category c on cam.category_id=c.category_id
	inner join subcategory s on cam.subcategory_id=s.subcategory_id
	inner join contacts t on cam.contact_id=t.contact_id;