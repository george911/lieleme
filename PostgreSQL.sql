--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.microposts DROP CONSTRAINT fk_rails_558c81314b;
DROP INDEX public.unique_schema_migrations;
DROP INDEX public.index_works_on_user_id;
DROP INDEX public.index_votes_on_voter_id_and_voter_type_and_vote_scope;
DROP INDEX public.index_votes_on_votable_id_and_votable_type_and_vote_scope;
DROP INDEX public.index_users_on_reset_password_token;
DROP INDEX public.index_users_on_email;
DROP INDEX public.index_talent_pools_on_talent_id_and_hunter_id;
DROP INDEX public.index_talent_pools_on_talent_id;
DROP INDEX public.index_talent_pools_on_hunter_id;
DROP INDEX public.index_summaries_on_user_id;
DROP INDEX public.index_subordinates_on_job_id;
DROP INDEX public.index_service_rates_on_line_item_id;
DROP INDEX public.index_saving_lists_on_user_id_and_job_id;
DROP INDEX public.index_reviews_on_user_id;
DROP INDEX public.index_relationships_on_follower_id_and_followed_id;
DROP INDEX public.index_relationships_on_follower_id;
DROP INDEX public.index_relationships_on_followed_id;
DROP INDEX public.index_read_marks_on_user_id_and_readable_type_and_readable_id;
DROP INDEX public.index_rating_caches_on_cacheable_id_and_cacheable_type;
DROP INDEX public.index_rates_on_rater_id;
DROP INDEX public.index_rates_on_rateable_id_and_rateable_type;
DROP INDEX public.index_microposts_on_user_id_and_created_at;
DROP INDEX public.index_microposts_on_user_id;
DROP INDEX public.index_line_items_on_user_id;
DROP INDEX public.index_line_items_on_job_id;
DROP INDEX public.index_job_rates_on_job_id;
DROP INDEX public.index_experiences_on_job_id;
DROP INDEX public.index_educations_on_user_id;
DROP INDEX public.index_comments_on_user_id;
DROP INDEX public.index_comments_on_job_id;
DROP INDEX public.index_bosses_on_job_id;
DROP INDEX public.index_admin_users_on_reset_password_token;
DROP INDEX public.index_admin_users_on_email;
DROP INDEX public.index_active_admin_comments_on_resource_type_and_resource_id;
DROP INDEX public.index_active_admin_comments_on_namespace;
DROP INDEX public.index_active_admin_comments_on_author_type_and_author_id;
ALTER TABLE ONLY public.works DROP CONSTRAINT works_pkey;
ALTER TABLE ONLY public.votes DROP CONSTRAINT votes_pkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.talent_pools DROP CONSTRAINT talent_pools_pkey;
ALTER TABLE ONLY public.summaries DROP CONSTRAINT summaries_pkey;
ALTER TABLE ONLY public.subordinates DROP CONSTRAINT subordinates_pkey;
ALTER TABLE ONLY public.service_rates DROP CONSTRAINT service_rates_pkey;
ALTER TABLE ONLY public.searches DROP CONSTRAINT searches_pkey;
ALTER TABLE ONLY public.saving_lists DROP CONSTRAINT saving_lists_pkey;
ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
ALTER TABLE ONLY public.relationships DROP CONSTRAINT relationships_pkey;
ALTER TABLE ONLY public.read_marks DROP CONSTRAINT read_marks_pkey;
ALTER TABLE ONLY public.rating_caches DROP CONSTRAINT rating_caches_pkey;
ALTER TABLE ONLY public.rates DROP CONSTRAINT rates_pkey;
ALTER TABLE ONLY public.overall_averages DROP CONSTRAINT overall_averages_pkey;
ALTER TABLE ONLY public.microposts DROP CONSTRAINT microposts_pkey;
ALTER TABLE ONLY public.line_items DROP CONSTRAINT line_items_pkey;
ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
ALTER TABLE ONLY public.job_rates DROP CONSTRAINT job_rates_pkey;
ALTER TABLE ONLY public.invitations DROP CONSTRAINT invitations_pkey;
ALTER TABLE ONLY public.interviews DROP CONSTRAINT interviews_pkey;
ALTER TABLE ONLY public.inquiries DROP CONSTRAINT inquiries_pkey;
ALTER TABLE ONLY public.experiences DROP CONSTRAINT experiences_pkey;
ALTER TABLE ONLY public.emails DROP CONSTRAINT emails_pkey;
ALTER TABLE ONLY public.educations DROP CONSTRAINT educations_pkey;
ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
ALTER TABLE ONLY public.bosses DROP CONSTRAINT bosses_pkey;
ALTER TABLE ONLY public.average_caches DROP CONSTRAINT average_caches_pkey;
ALTER TABLE ONLY public.admin_users DROP CONSTRAINT admin_users_pkey;
ALTER TABLE ONLY public.active_admin_comments DROP CONSTRAINT active_admin_comments_pkey;
ALTER TABLE public.works ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.votes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.talent_pools ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.summaries ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.subordinates ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.service_rates ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.searches ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.saving_lists ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.reviews ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.relationships ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.read_marks ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.rating_caches ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.rates ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.overall_averages ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.microposts ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.line_items ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.jobs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.job_rates ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.invitations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.interviews ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.inquiries ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.experiences ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.emails ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.educations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.bosses ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.average_caches ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.admin_users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.active_admin_comments ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.works_id_seq;
DROP TABLE public.works;
DROP SEQUENCE public.votes_id_seq;
DROP TABLE public.votes;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users;
DROP SEQUENCE public.talent_pools_id_seq;
DROP TABLE public.talent_pools;
DROP SEQUENCE public.summaries_id_seq;
DROP TABLE public.summaries;
DROP SEQUENCE public.subordinates_id_seq;
DROP TABLE public.subordinates;
DROP SEQUENCE public.service_rates_id_seq;
DROP TABLE public.service_rates;
DROP SEQUENCE public.searches_id_seq;
DROP TABLE public.searches;
DROP TABLE public.schema_migrations;
DROP SEQUENCE public.saving_lists_id_seq;
DROP TABLE public.saving_lists;
DROP SEQUENCE public.reviews_id_seq;
DROP TABLE public.reviews;
DROP SEQUENCE public.relationships_id_seq;
DROP TABLE public.relationships;
DROP SEQUENCE public.read_marks_id_seq;
DROP TABLE public.read_marks;
DROP SEQUENCE public.rating_caches_id_seq;
DROP TABLE public.rating_caches;
DROP SEQUENCE public.rates_id_seq;
DROP TABLE public.rates;
DROP SEQUENCE public.overall_averages_id_seq;
DROP TABLE public.overall_averages;
DROP SEQUENCE public.microposts_id_seq;
DROP TABLE public.microposts;
DROP SEQUENCE public.line_items_id_seq;
DROP TABLE public.line_items;
DROP SEQUENCE public.jobs_id_seq;
DROP TABLE public.jobs;
DROP SEQUENCE public.job_rates_id_seq;
DROP TABLE public.job_rates;
DROP SEQUENCE public.invitations_id_seq;
DROP TABLE public.invitations;
DROP SEQUENCE public.interviews_id_seq;
DROP TABLE public.interviews;
DROP SEQUENCE public.inquiries_id_seq;
DROP TABLE public.inquiries;
DROP SEQUENCE public.experiences_id_seq;
DROP TABLE public.experiences;
DROP SEQUENCE public.emails_id_seq;
DROP TABLE public.emails;
DROP SEQUENCE public.educations_id_seq;
DROP TABLE public.educations;
DROP SEQUENCE public.comments_id_seq;
DROP TABLE public.comments;
DROP SEQUENCE public.bosses_id_seq;
DROP TABLE public.bosses;
DROP SEQUENCE public.average_caches_id_seq;
DROP TABLE public.average_caches;
DROP SEQUENCE public.admin_users_id_seq;
DROP TABLE public.admin_users;
DROP SEQUENCE public.active_admin_comments_id_seq;
DROP TABLE public.active_admin_comments;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE active_admin_comments (
    id integer NOT NULL,
    namespace character varying,
    body text,
    resource_id character varying NOT NULL,
    resource_type character varying NOT NULL,
    author_id integer,
    author_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE active_admin_comments OWNER TO "George";

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE active_admin_comments_id_seq OWNER TO "George";

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE active_admin_comments_id_seq OWNED BY active_admin_comments.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE admin_users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE admin_users OWNER TO "George";

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin_users_id_seq OWNER TO "George";

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE admin_users_id_seq OWNED BY admin_users.id;


--
-- Name: average_caches; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE average_caches (
    id integer NOT NULL,
    rater_id integer,
    rateable_id integer,
    rateable_type character varying,
    avg double precision NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE average_caches OWNER TO "George";

--
-- Name: average_caches_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE average_caches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE average_caches_id_seq OWNER TO "George";

--
-- Name: average_caches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE average_caches_id_seq OWNED BY average_caches.id;


--
-- Name: bosses; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE bosses (
    id integer NOT NULL,
    title character varying,
    job_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE bosses OWNER TO "George";

--
-- Name: bosses_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE bosses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bosses_id_seq OWNER TO "George";

--
-- Name: bosses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE bosses_id_seq OWNED BY bosses.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    body text,
    author character varying,
    top boolean,
    job_id integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE comments OWNER TO "George";

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_id_seq OWNER TO "George";

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: educations; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE educations (
    id integer NOT NULL,
    school character varying,
    enter_school date,
    leave_school date,
    major character varying,
    degree character varying,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    uptonow boolean
);


ALTER TABLE educations OWNER TO "George";

--
-- Name: educations_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE educations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educations_id_seq OWNER TO "George";

--
-- Name: educations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE educations_id_seq OWNED BY educations.id;


--
-- Name: emails; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE emails (
    id integer NOT NULL,
    name character varying,
    email character varying,
    skill character varying,
    city character varying,
    year integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE emails OWNER TO "George";

--
-- Name: emails_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emails_id_seq OWNER TO "George";

--
-- Name: emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE emails_id_seq OWNED BY emails.id;


--
-- Name: experiences; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE experiences (
    id integer NOT NULL,
    skill character varying,
    year integer,
    job_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE experiences OWNER TO "George";

--
-- Name: experiences_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE experiences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE experiences_id_seq OWNER TO "George";

--
-- Name: experiences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE experiences_id_seq OWNED BY experiences.id;


--
-- Name: inquiries; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE inquiries (
    id integer NOT NULL,
    name character varying,
    employer character varying,
    title character varying,
    mobile character varying,
    email character varying,
    content text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    inquiry_type character varying
);


ALTER TABLE inquiries OWNER TO "George";

--
-- Name: inquiries_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE inquiries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE inquiries_id_seq OWNER TO "George";

--
-- Name: inquiries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE inquiries_id_seq OWNED BY inquiries.id;


--
-- Name: interviews; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE interviews (
    id integer NOT NULL,
    recipient_id integer,
    sender_id integer,
    job_id integer,
    accept boolean,
    address character varying,
    content text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    feedback text,
    datetime timestamp without time zone
);


ALTER TABLE interviews OWNER TO "George";

--
-- Name: interviews_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE interviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE interviews_id_seq OWNER TO "George";

--
-- Name: interviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE interviews_id_seq OWNED BY interviews.id;


--
-- Name: invitations; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE invitations (
    id integer NOT NULL,
    recipient_id integer,
    sender_id integer,
    job_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    accept boolean,
    job_title character varying,
    job_employer character varying,
    status character varying DEFAULT 'active'::character varying
);


ALTER TABLE invitations OWNER TO "George";

--
-- Name: invitations_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE invitations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE invitations_id_seq OWNER TO "George";

--
-- Name: invitations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE invitations_id_seq OWNED BY invitations.id;


--
-- Name: job_rates; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE job_rates (
    id integer NOT NULL,
    job_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE job_rates OWNER TO "George";

--
-- Name: job_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE job_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE job_rates_id_seq OWNER TO "George";

--
-- Name: job_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE job_rates_id_seq OWNED BY job_rates.id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE jobs (
    id integer NOT NULL,
    title character varying,
    addr character varying,
    city character varying,
    industry character varying,
    commission integer,
    role text,
    requirement text,
    base_pay integer,
    month integer,
    bonus character varying,
    allowance integer,
    stock character varying,
    stock_num integer,
    concall_date date,
    peer character varying,
    memo text,
    company_info text,
    work_year integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    employer character varying,
    status character varying DEFAULT 'active'::character varying,
    poster_id integer,
    interview boolean,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone
);


ALTER TABLE jobs OWNER TO "George";

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jobs_id_seq OWNER TO "George";

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE jobs_id_seq OWNED BY jobs.id;


--
-- Name: line_items; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE line_items (
    id integer NOT NULL,
    mobile character varying,
    email character varying,
    name character varying,
    status character varying,
    user_id integer,
    job_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    comment text,
    feedback text,
    sender_id integer,
    recipient_id integer,
    interviewed boolean
);


ALTER TABLE line_items OWNER TO "George";

--
-- Name: line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE line_items_id_seq OWNER TO "George";

--
-- Name: line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE line_items_id_seq OWNED BY line_items.id;


--
-- Name: microposts; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE microposts (
    id integer NOT NULL,
    content text,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    job_id integer
);


ALTER TABLE microposts OWNER TO "George";

--
-- Name: microposts_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE microposts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE microposts_id_seq OWNER TO "George";

--
-- Name: microposts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE microposts_id_seq OWNED BY microposts.id;


--
-- Name: overall_averages; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE overall_averages (
    id integer NOT NULL,
    rateable_id integer,
    rateable_type character varying,
    overall_avg double precision NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE overall_averages OWNER TO "George";

--
-- Name: overall_averages_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE overall_averages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE overall_averages_id_seq OWNER TO "George";

--
-- Name: overall_averages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE overall_averages_id_seq OWNED BY overall_averages.id;


--
-- Name: rates; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE rates (
    id integer NOT NULL,
    rater_id integer,
    rateable_id integer,
    rateable_type character varying,
    stars double precision NOT NULL,
    dimension character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE rates OWNER TO "George";

--
-- Name: rates_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rates_id_seq OWNER TO "George";

--
-- Name: rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE rates_id_seq OWNED BY rates.id;


--
-- Name: rating_caches; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE rating_caches (
    id integer NOT NULL,
    cacheable_id integer,
    cacheable_type character varying,
    avg double precision NOT NULL,
    qty integer NOT NULL,
    dimension character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE rating_caches OWNER TO "George";

--
-- Name: rating_caches_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE rating_caches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rating_caches_id_seq OWNER TO "George";

--
-- Name: rating_caches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE rating_caches_id_seq OWNED BY rating_caches.id;


--
-- Name: read_marks; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE read_marks (
    id integer NOT NULL,
    readable_id integer,
    readable_type character varying NOT NULL,
    user_id integer NOT NULL,
    "timestamp" timestamp without time zone
);


ALTER TABLE read_marks OWNER TO "George";

--
-- Name: read_marks_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE read_marks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE read_marks_id_seq OWNER TO "George";

--
-- Name: read_marks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE read_marks_id_seq OWNED BY read_marks.id;


--
-- Name: relationships; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE relationships (
    id integer NOT NULL,
    follower_id integer,
    followed_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE relationships OWNER TO "George";

--
-- Name: relationships_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE relationships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE relationships_id_seq OWNER TO "George";

--
-- Name: relationships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE relationships_id_seq OWNED BY relationships.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE reviews (
    id integer NOT NULL,
    author character varying,
    author_id integer,
    top boolean,
    body text,
    rating integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    employer character varying,
    title character varying
);


ALTER TABLE reviews OWNER TO "George";

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reviews_id_seq OWNER TO "George";

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE reviews_id_seq OWNED BY reviews.id;


--
-- Name: saving_lists; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE saving_lists (
    id integer NOT NULL,
    user_id integer,
    job_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE saving_lists OWNER TO "George";

--
-- Name: saving_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE saving_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE saving_lists_id_seq OWNER TO "George";

--
-- Name: saving_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE saving_lists_id_seq OWNED BY saving_lists.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO "George";

--
-- Name: searches; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE searches (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE searches OWNER TO "George";

--
-- Name: searches_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE searches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE searches_id_seq OWNER TO "George";

--
-- Name: searches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE searches_id_seq OWNED BY searches.id;


--
-- Name: service_rates; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE service_rates (
    id integer NOT NULL,
    line_item_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE service_rates OWNER TO "George";

--
-- Name: service_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE service_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE service_rates_id_seq OWNER TO "George";

--
-- Name: service_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE service_rates_id_seq OWNED BY service_rates.id;


--
-- Name: subordinates; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE subordinates (
    id integer NOT NULL,
    title character varying,
    num integer,
    job_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE subordinates OWNER TO "George";

--
-- Name: subordinates_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE subordinates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subordinates_id_seq OWNER TO "George";

--
-- Name: subordinates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE subordinates_id_seq OWNED BY subordinates.id;


--
-- Name: summaries; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE summaries (
    id integer NOT NULL,
    content text,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE summaries OWNER TO "George";

--
-- Name: summaries_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE summaries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE summaries_id_seq OWNER TO "George";

--
-- Name: summaries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE summaries_id_seq OWNED BY summaries.id;


--
-- Name: talent_pools; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE talent_pools (
    id integer NOT NULL,
    hunter_id integer,
    talent_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE talent_pools OWNER TO "George";

--
-- Name: talent_pools_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE talent_pools_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE talent_pools_id_seq OWNER TO "George";

--
-- Name: talent_pools_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE talent_pools_id_seq OWNED BY talent_pools.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    mobile character varying,
    user_name character varying,
    true_name character varying,
    user_type character varying,
    base_salary integer,
    month_num integer,
    bonus integer,
    housing integer,
    transport integer,
    stock character varying,
    stock_num integer,
    retention_bonus integer,
    expect_package integer,
    expect_month_salary integer,
    birthday date,
    city character varying,
    title character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    industry character varying,
    focus_job1 character varying,
    focus_job2 character varying,
    focus_job3 character varying,
    bank_id integer,
    verify character varying
);


ALTER TABLE users OWNER TO "George";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO "George";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: votes; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE votes (
    id integer NOT NULL,
    votable_id integer,
    votable_type character varying,
    voter_id integer,
    voter_type character varying,
    vote_flag boolean,
    vote_scope character varying,
    vote_weight integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE votes OWNER TO "George";

--
-- Name: votes_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE votes_id_seq OWNER TO "George";

--
-- Name: votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE votes_id_seq OWNED BY votes.id;


--
-- Name: works; Type: TABLE; Schema: public; Owner: George; Tablespace: 
--

CREATE TABLE works (
    id integer NOT NULL,
    title character varying,
    employer character varying,
    industry character varying,
    join_date date,
    leave_date date,
    job_scope text,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    uptonow boolean
);


ALTER TABLE works OWNER TO "George";

--
-- Name: works_id_seq; Type: SEQUENCE; Schema: public; Owner: George
--

CREATE SEQUENCE works_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE works_id_seq OWNER TO "George";

--
-- Name: works_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: George
--

ALTER SEQUENCE works_id_seq OWNED BY works.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY active_admin_comments ALTER COLUMN id SET DEFAULT nextval('active_admin_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY admin_users ALTER COLUMN id SET DEFAULT nextval('admin_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY average_caches ALTER COLUMN id SET DEFAULT nextval('average_caches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY bosses ALTER COLUMN id SET DEFAULT nextval('bosses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY educations ALTER COLUMN id SET DEFAULT nextval('educations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY emails ALTER COLUMN id SET DEFAULT nextval('emails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY experiences ALTER COLUMN id SET DEFAULT nextval('experiences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY inquiries ALTER COLUMN id SET DEFAULT nextval('inquiries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY interviews ALTER COLUMN id SET DEFAULT nextval('interviews_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY invitations ALTER COLUMN id SET DEFAULT nextval('invitations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY job_rates ALTER COLUMN id SET DEFAULT nextval('job_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY jobs ALTER COLUMN id SET DEFAULT nextval('jobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY line_items ALTER COLUMN id SET DEFAULT nextval('line_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY microposts ALTER COLUMN id SET DEFAULT nextval('microposts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY overall_averages ALTER COLUMN id SET DEFAULT nextval('overall_averages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY rates ALTER COLUMN id SET DEFAULT nextval('rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY rating_caches ALTER COLUMN id SET DEFAULT nextval('rating_caches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY read_marks ALTER COLUMN id SET DEFAULT nextval('read_marks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY relationships ALTER COLUMN id SET DEFAULT nextval('relationships_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY reviews ALTER COLUMN id SET DEFAULT nextval('reviews_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY saving_lists ALTER COLUMN id SET DEFAULT nextval('saving_lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY searches ALTER COLUMN id SET DEFAULT nextval('searches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY service_rates ALTER COLUMN id SET DEFAULT nextval('service_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY subordinates ALTER COLUMN id SET DEFAULT nextval('subordinates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY summaries ALTER COLUMN id SET DEFAULT nextval('summaries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY talent_pools ALTER COLUMN id SET DEFAULT nextval('talent_pools_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY votes ALTER COLUMN id SET DEFAULT nextval('votes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: George
--

ALTER TABLE ONLY works ALTER COLUMN id SET DEFAULT nextval('works_id_seq'::regclass);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: George
--

COPY active_admin_comments (id, namespace, body, resource_id, resource_type, author_id, author_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('active_admin_comments_id_seq', 1, false);


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: George
--

COPY admin_users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
1	admin@example.com	$2a$10$LFHtR2iTuxvlK62QUHM8AeeXGvass9SxGsvI1d/nxLsm/3dD.35f.	\N	\N	\N	9	2015-09-01 01:11:14.709766	2015-08-31 13:17:04.492138	112.64.209.103	112.64.209.103	2015-08-06 12:37:01.03254	2015-09-01 01:11:14.711671
\.


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('admin_users_id_seq', 1, true);


--
-- Data for Name: average_caches; Type: TABLE DATA; Schema: public; Owner: George
--

COPY average_caches (id, rater_id, rateable_id, rateable_type, avg, created_at, updated_at) FROM stdin;
\.


--
-- Name: average_caches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('average_caches_id_seq', 1, false);


--
-- Data for Name: bosses; Type: TABLE DATA; Schema: public; Owner: George
--

COPY bosses (id, title, job_id, created_at, updated_at) FROM stdin;
51		10001	2015-08-18 14:14:23.472795	2015-08-18 14:14:23.472795
52		10002	2015-08-18 14:14:23.490319	2015-08-18 14:14:23.490319
53		10003	2015-08-18 14:14:23.507588	2015-08-18 14:14:23.507588
54	CEO	10004	2015-08-18 14:14:23.528538	2015-08-18 14:14:23.528538
55	采购总监	10005	2015-08-18 14:14:23.551158	2015-08-18 14:14:23.551158
56	首席代表	10006	2015-08-18 14:14:23.566845	2015-08-18 14:14:23.566845
57	部门经理	10007	2015-08-18 14:14:23.585886	2015-08-18 14:14:23.585886
58	CTO	2	2015-08-25 02:46:06.099139	2015-08-25 02:46:06.099139
59	CEO	4	2015-08-25 06:39:19.851707	2015-08-25 06:39:19.851707
60	老外	5	2015-08-25 07:00:51.461685	2015-08-25 07:00:51.461685
61		6	2015-08-25 10:04:06.84708	2015-08-25 10:04:06.84708
63		21	2015-08-27 09:07:58.530664	2015-08-27 09:07:58.530664
64		22	2015-08-28 03:33:53.456744	2015-08-28 03:33:53.456744
65	项目经理	23	2015-08-28 14:15:19.849081	2015-08-28 14:15:19.849081
66	高级架构师和总监	26	2015-08-29 10:14:23.459924	2015-08-29 10:14:23.459924
67	商管公司副总	27	2015-08-30 14:15:43.111046	2015-08-30 14:15:43.111046
68		28	2015-08-31 01:28:55.419604	2015-08-31 01:28:55.419604
69	CTO	29	2015-09-01 01:22:18.731941	2015-09-01 01:22:18.731941
70		30	2015-09-01 06:52:38.583567	2015-09-01 06:52:38.583567
71		31	2015-09-01 07:56:18.695949	2015-09-01 07:56:18.695949
72	CEO	32	2015-09-02 02:08:12.914381	2015-09-02 02:08:12.914381
73		33	2015-09-03 03:01:23.509555	2015-09-03 03:01:23.509555
74	法国总监	34	2015-09-05 03:43:59.873506	2015-09-05 03:43:59.873506
75	CEO	35	2015-09-05 09:41:40.539374	2015-09-05 09:41:40.539374
\.


--
-- Name: bosses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('bosses_id_seq', 75, true);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: George
--

COPY comments (id, body, author, top, job_id, user_id, created_at, updated_at) FROM stdin;
1	*注意： 1、请在推荐报告中将手机和邮箱写上； 2、这边目前还缺10个Java； 3、面试流程：HR会将所有的Java简历发送给用人部门的不同业务小组，业务部门会根据简历的实际情况给候选人电话面试（平台将所有的简历推送给企业，暂时不会再平台发起面试申请）； 4、如果电话面试通过，企业HR会直接联系候选人让其来复试； 5、HR对于电话面试的情况，每周会给1-2次反馈，我会将其在平台职位上进行操作； 6、请各位跟进好自己的候选人，如果进行了电话面试的，请告知我，在平台补流程。	Jack	\N	22	2	2015-08-28 03:35:19.757316	2015-08-28 03:35:19.757316
2	【职位要求】 1.需要至少有3-5年互联网工作经验，能解决重要技术问题。踏实稳定一些的候选人，坚决不要跳槽频繁。有互联网和高并发项目背景优先。 2.此岗位重点招聘P3，5名，有优秀的P4也可以考虑，但不作重点。 【学历要求】本科及以上； 【面试流程】 1.2轮：一面：电话；二面：F2F (高级架构师和总监)； 2.接受异地候选人，不报销差旅费。 【反馈周期】2个工作日 【薪酬福利】 1.如有优秀候选人，薪酬和职级都open可谈； 2.一年12薪，1-2个月年终奖，7年年假，12天带薪病假，六险一金（按正常比例缴纳），提供三餐，弹性工作时间（一周工作5天，每天7.5小时）。 【佣金说明】 1.职级为P4/M2及以上的候选人，咨询服务费为劳动合同约定税前年薪的20%； 2.职级在P3级的候选人，咨询服务费为固定佣金15000元； 3.职级在P2级的候选人，咨询服务费为5000元/人； 4.职级在P2级以下的候选人，不支付任何咨询服务费。	乔吉	\N	26	10000	2015-08-29 12:36:34.75913	2015-08-29 12:36:34.75913
3	万科近期最主要的一个项目 位于七宝，24万平的购物中心，上海万科和新加坡GIC合资（各占50%） 由上海万科全权负责运营管理，直接汇报给商管公司副总 项目预期明年下半年开业，之前职位由平台招商运营总监兼任，现在需要一个有能力的全职人选，项目前后期管理都有要求，但是偏后期，下面会管理项目上的招商，运营，市场，物业，工程等团队。 该职位对于人选要求很高，背景一般的候选人不要推荐，可以参考万科虹桥和安亭项目总的背景（虹桥项目总的背景是凯德和合景泰富，安亭的背景是长泰广场，万科希望七宝项目总的背景要优于这两位） 薪水80-120万，年龄最好不要超过40（实在背景优秀，可以拓宽到45）	乔吉	\N	27	10000	2015-08-30 14:16:35.140292	2015-08-30 14:16:35.140292
4	需要有对马达很熟悉的候选人，如果有马达的技术背景最佳。单纯的马达质量经验不行。 此职位还是很着急，请大家帮忙推荐，谢谢	乔吉	\N	28	10000	2015-08-31 01:31:53.133285	2015-08-31 01:31:53.133285
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('comments_id_seq', 4, true);


--
-- Data for Name: educations; Type: TABLE DATA; Schema: public; Owner: George
--

COPY educations (id, school, enter_school, leave_school, major, degree, user_id, created_at, updated_at, uptonow) FROM stdin;
131	复旦大学	1999-09-01	2003-09-01	计算机	本科	30001	2015-08-18 14:14:18.355051	2015-08-18 14:14:18.355051	\N
132	浙江大学	1997-09-01	2001-09-01	计算机	本科	10000	2015-08-18 14:14:21.071495	2015-08-18 14:14:21.071495	\N
133	上海交通大学	2003-09-01	2007-09-01	计算机	本科	10001	2015-08-18 14:14:21.116703	2015-08-18 14:14:21.116703	\N
134	河海大学	1997-09-01	2001-09-01	法学硕士	本科	10002	2015-08-18 14:14:21.15377	2015-08-18 14:14:21.15377	\N
135	江西工业大学	1997-09-01	2001-09-01	法学硕士	本科	10003	2015-08-18 14:14:21.215823	2015-08-18 14:14:21.215823	\N
136	上海大学	1997-09-01	2001-09-01	物流专业	本科	10004	2015-08-18 14:14:21.267637	2015-08-18 14:14:21.267637	\N
137	厦门大学	1997-09-01	2001-09-01	计算机	本科	10005	2015-08-18 14:14:21.302904	2015-08-18 14:14:21.302904	\N
138	南京大学	1997-09-01	2001-09-01	电子信息	本科	10006	2015-08-18 14:14:21.337825	2015-08-18 14:14:21.337825	\N
139	山东建筑大学	1993-09-01	1997-07-01	机械电子专业	本科	10007	2015-08-18 14:14:21.375998	2015-08-18 14:14:21.375998	\N
140	山东科技大学	1997-09-01	2001-09-01	软件工程	本科	10008	2015-08-18 14:14:21.414521	2015-08-18 14:14:21.414521	\N
141	西安交通大学	1997-09-01	2001-09-01	工业工程	本科	10009	2015-08-18 14:14:21.46434	2015-08-18 14:14:21.46434	\N
142	南京大学	1997-09-01	2001-09-01	法学硕士	本科	10010	2015-08-18 14:14:21.498363	2015-08-18 14:14:21.498363	\N
143	复旦大学大学	1997-09-01	2001-09-01	人力资源管理	本科	20001	2015-08-18 14:14:23.155197	2015-08-18 14:14:23.155197	\N
144	London University	2001-09-01	2007-07-31	history	master	20002	2015-08-18 14:14:23.18854	2015-08-18 14:14:23.18854	\N
145	Nankai University	2001-09-01	2007-07-31	chemistry	bachelor	20003	2015-08-18 14:14:23.227598	2015-08-18 14:14:23.227598	\N
146	Nankai University	2001-09-01	2007-07-31	chemistry	bachelor	20004	2015-08-18 14:14:23.272492	2015-08-18 14:14:23.272492	\N
147	Nankai University	2001-09-01	2007-07-31	chemistry	bachelor	20005	2015-08-18 14:14:23.315683	2015-08-18 14:14:23.315683	\N
148	Nankai University	2001-09-01	2007-07-31	chemistry	bachelor	20006	2015-08-18 14:14:23.348271	2015-08-18 14:14:23.348271	\N
149	Nankai University	2001-09-01	2007-07-31	chemistry	bachelor	20007	2015-08-18 14:14:23.37954	2015-08-18 14:14:23.37954	\N
150	同济大学	2000-08-01	2004-08-01	建筑工程	本科	2	2015-08-25 01:25:55.472969	2015-08-25 01:25:55.472969	f
151	应用技术大学	2002-09-01	2006-09-01	计算机	本科	5	2015-09-01 06:27:15.527693	2015-09-01 06:27:15.527693	f
152	上海外贸大学	1989-09-01	1993-06-01	外贸	本科	7	2015-09-02 01:06:41.270034	2015-09-02 01:06:41.270034	f
\.


--
-- Name: educations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('educations_id_seq', 152, true);


--
-- Data for Name: emails; Type: TABLE DATA; Schema: public; Owner: George
--

COPY emails (id, name, email, skill, city, year, created_at, updated_at) FROM stdin;
\.


--
-- Name: emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('emails_id_seq', 1, false);


--
-- Data for Name: experiences; Type: TABLE DATA; Schema: public; Owner: George
--

COPY experiences (id, skill, year, job_id, created_at, updated_at) FROM stdin;
134	海上齿轮箱传动系统研发	3	10001	2015-08-18 14:14:23.476453	2015-08-18 14:14:23.476453
135	电梯现场工作经验	5	10002	2015-08-18 14:14:23.493812	2015-08-18 14:14:23.493812
136	券商资管	3	10003	2015-08-18 14:14:23.510459	2015-08-18 14:14:23.510459
137	券商机构	4	10003	2015-08-18 14:14:23.511826	2015-08-18 14:14:23.511826
138	基金公司专户	5	10003	2015-08-18 14:14:23.513135	2015-08-18 14:14:23.513135
139	银行投行	5	10003	2015-08-18 14:14:23.514522	2015-08-18 14:14:23.514522
140	金融市场部	5	10003	2015-08-18 14:14:23.515862	2015-08-18 14:14:23.515862
141	Python	3	10004	2015-08-18 14:14:23.531931	2015-08-18 14:14:23.531931
142	Java	4	10004	2015-08-18 14:14:23.533459	2015-08-18 14:14:23.533459
143	P2P网站技术开发	5	10004	2015-08-18 14:14:23.534722	2015-08-18 14:14:23.534722
144	面向对象分析设计能力	5	10004	2015-08-18 14:14:23.536018	2015-08-18 14:14:23.536018
145	eclipse	5	10004	2015-08-18 14:14:23.537372	2015-08-18 14:14:23.537372
146	供应链	3	10005	2015-08-18 14:14:23.554127	2015-08-18 14:14:23.554127
147	销售管理	3	10006	2015-08-18 14:14:23.569896	2015-08-18 14:14:23.569896
148	采购	4	10006	2015-08-18 14:14:23.571257	2015-08-18 14:14:23.571257
149	质量	5	10006	2015-08-18 14:14:23.572566	2015-08-18 14:14:23.572566
150	客户开发	5	10006	2015-08-18 14:14:23.574107	2015-08-18 14:14:23.574107
151	市场计划	5	10006	2015-08-18 14:14:23.575423	2015-08-18 14:14:23.575423
152	物流	3	10007	2015-08-18 14:14:23.588973	2015-08-18 14:14:23.588973
153	Ruby	2	2	2015-08-25 02:45:50.940568	2015-08-25 02:45:50.940568
154	Ruby on Rails	1	2	2015-08-25 02:45:50.944644	2015-08-25 02:45:50.944644
155	PHP	3	26	2015-08-29 10:13:59.491312	2015-08-29 10:13:59.491312
156	Java	5	30	2015-09-01 06:52:19.193274	2015-09-01 06:52:19.193274
157	Java	5	31	2015-09-01 07:56:14.922535	2015-09-01 07:56:14.922535
158	PHP开发	10	32	2015-09-02 02:02:00.01573	2015-09-02 02:02:00.01573
159	PHP开发10团队管理	5	32	2015-09-02 02:02:00.018064	2015-09-02 02:02:00.018064
160	RubyOnRails	2	35	2015-09-05 09:41:34.414868	2015-09-05 09:41:34.414868
\.


--
-- Name: experiences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('experiences_id_seq', 160, true);


--
-- Data for Name: inquiries; Type: TABLE DATA; Schema: public; Owner: George
--

COPY inquiries (id, name, employer, title, mobile, email, content, created_at, updated_at, inquiry_type) FROM stdin;
1	王小姐			15026408132		需要投资	2015-08-21 09:00:27.691495	2015-08-21 09:00:27.691495	我要投资
\.


--
-- Name: inquiries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('inquiries_id_seq', 1, true);


--
-- Data for Name: interviews; Type: TABLE DATA; Schema: public; Owner: George
--

COPY interviews (id, recipient_id, sender_id, job_id, accept, address, content, created_at, updated_at, feedback, datetime) FROM stdin;
27	10002	20002	\N	\N	上海张江	建立初步了解	2015-08-18 14:14:23.749455	2015-08-22 12:57:49.910229	换一下时间	2015-08-21 15:15:00
\.


--
-- Name: interviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('interviews_id_seq', 27, true);


--
-- Data for Name: invitations; Type: TABLE DATA; Schema: public; Owner: George
--

COPY invitations (id, recipient_id, sender_id, job_id, created_at, updated_at, accept, job_title, job_employer, status) FROM stdin;
50	20002	10000	10001	2015-08-18 14:14:23.718805	2015-08-18 14:14:23.718805	t	维塔斯_海上风机工程师	猎友会	active
51	20001	10000	10002	2015-08-18 14:14:23.722585	2015-08-18 14:14:23.722585	t	宝钢_区域EHS经理	猎友会	active
52	20002	10000	10003	2015-08-18 14:14:23.725313	2015-08-18 14:14:23.725313	\N	高盛_投资项目经理	猎友会	active
53	20002	10000	10004	2015-08-18 14:14:23.728203	2015-08-18 14:14:23.728203	\N	点融网_P2P项目总监	猎友会	active
54	20002	10000	10005	2015-08-18 14:14:23.730916	2015-08-18 14:14:23.730916	\N	斯伯丁_品牌合规主管	\N	active
55	20002	10000	10006	2015-08-18 14:14:23.733641	2015-08-18 14:14:23.733641	\N	宝时厨卫_销售经理	\N	active
56	20002	10000	10007	2015-08-18 14:14:23.736131	2015-08-18 14:14:23.736131	\N	世仓物流_大客户经理	\N	active
57	20006	2	2	2015-08-25 02:46:41.411191	2015-08-25 02:46:41.411191	\N	第一财经_Ruby开发工程师	\N	active
58	20005	2	2	2015-08-25 02:46:45.376649	2015-08-25 02:46:45.376649	\N	第一财经_Ruby开发工程师	\N	active
59	20004	2	2	2015-08-25 02:46:46.945202	2015-08-25 02:46:46.945202	\N	第一财经_Ruby开发工程师	\N	active
60	20006	2	4	2015-08-25 06:44:42.784557	2015-08-25 06:44:42.784557	\N	聚熵信息技术上海有限公司_首席财务官	\N	active
61	20005	2	4	2015-08-25 06:44:44.785531	2015-08-25 06:44:44.785531	\N	聚熵信息技术上海有限公司_首席财务官	\N	active
62	20004	2	4	2015-08-25 06:44:46.115714	2015-08-25 06:44:46.115714	\N	聚熵信息技术上海有限公司_首席财务官	\N	active
\.


--
-- Name: invitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('invitations_id_seq', 62, true);


--
-- Data for Name: job_rates; Type: TABLE DATA; Schema: public; Owner: George
--

COPY job_rates (id, job_id, created_at, updated_at) FROM stdin;
51	10001	2015-08-18 14:14:23.470692	2015-08-18 14:14:23.470692
52	10002	2015-08-18 14:14:23.488173	2015-08-18 14:14:23.488173
53	10003	2015-08-18 14:14:23.506073	2015-08-18 14:14:23.506073
54	10004	2015-08-18 14:14:23.526933	2015-08-18 14:14:23.526933
55	10005	2015-08-18 14:14:23.549506	2015-08-18 14:14:23.549506
56	10006	2015-08-18 14:14:23.565322	2015-08-18 14:14:23.565322
57	10007	2015-08-18 14:14:23.584402	2015-08-18 14:14:23.584402
58	2	2015-08-25 02:43:36.020887	2015-08-25 02:43:36.020887
59	3	2015-08-25 06:33:01.418338	2015-08-25 06:33:01.418338
60	4	2015-08-25 06:37:28.667646	2015-08-25 06:37:28.667646
61	5	2015-08-25 06:57:45.885142	2015-08-25 06:57:45.885142
62	6	2015-08-25 10:04:01.503992	2015-08-25 10:04:01.503992
77	21	2015-08-27 09:06:13.716392	2015-08-27 09:06:13.716392
78	22	2015-08-28 03:31:07.847649	2015-08-28 03:31:07.847649
79	23	2015-08-28 14:13:03.670749	2015-08-28 14:13:03.670749
82	26	2015-08-29 10:12:02.751453	2015-08-29 10:12:02.751453
83	27	2015-08-30 14:11:04.917689	2015-08-30 14:11:04.917689
84	28	2015-08-31 01:27:22.851288	2015-08-31 01:27:22.851288
85	29	2015-09-01 01:20:56.476548	2015-09-01 01:20:56.476548
86	30	2015-09-01 06:45:10.66435	2015-09-01 06:45:10.66435
87	31	2015-09-01 07:55:21.393419	2015-09-01 07:55:21.393419
88	32	2015-09-02 01:59:14.646657	2015-09-02 01:59:14.646657
89	33	2015-09-03 02:59:02.654583	2015-09-03 02:59:02.654583
90	34	2015-09-05 03:43:14.04432	2015-09-05 03:43:14.04432
91	35	2015-09-05 09:39:07.766411	2015-09-05 09:39:07.766411
\.


--
-- Name: job_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('job_rates_id_seq', 91, true);


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: George
--

COPY jobs (id, title, addr, city, industry, commission, role, requirement, base_pay, month, bonus, allowance, stock, stock_num, concall_date, peer, memo, company_info, work_year, created_at, updated_at, employer, status, poster_id, interview, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at) FROM stdin;
10001	海上风机工程师	罗湖区	深圳	工业	10000	1、负责海上风机齿轮箱技术进行调研、研究。\n  2、对海上风机齿轮箱及零部件（含电气元件）的防护进行前瞻性技术研究。\n  3、负责与产品性能提升相关的技术研究（例如海上防锈、防腐、电气防护等）。\n  4、组织协调技术投入和实施。\n  5、跟踪技术使用情况并提出改进建议。	1、工科专业背景。本科以上学历\n  2、具备海上风机、海上设备防护等行业背景。\n  3、具备良好的学习钻研能力和创新意识，沟通协调能力和团队合作能力。	30000	13	50000	15000	\N	\N	2014-10-23	\N	更有惊喜哦	国内领先的齿轮生产企业	3	2015-08-18 14:14:23.453656	2015-08-18 14:14:23.453656	维塔斯	active	30001	\N	\N	\N	\N	\N
10002	区域EHS经理	罗湖区	深圳	工业	10000	在总部EH&S部的指导之下，为区域/分公司的EH&S活动提供政策性指导。\n  参加区域/分公司的安委会\n  对一线部门的组织架构提供EHS方面的技术支持。协助并配合一线部门实施有效的EHS管理体系。\n  协助建立区域的环境、健康与安全战略、目标并支持此战略、目标的实施\n  协助建立各级人员的安全责任体系\n  协助分公司进行适用的EHS法律法规的合规性评估。\n  培训一线管理人员能够识别危险和风险。指导一线管理层识别、控制和预防危险/风险\n  协调和控制在商业活动和交易中对于环境、健康与安全的评估\n  建立区域的EH&S培训计划；提供EH&S培训；参加EH&S方面的培训\n  支持和评估交流程序的有效性\n  贯彻和执行环境、健康与安全规则和程序\n  制定检查、审查计划。识别发生问题的根本原因。进行环境、健康与安全检查、审查。识别并且确保整改行动方案的完成\n  向一线管理人员提供如何进行事故调查和预防、整改行动方案的技术支持\n  协调和组织程序评估，做趋势分析。指导区域管理层如何改进-包括程序评估结果及计划、指标/目标的进度情况\n  向区域管理层提出奖励/处罚建议，享有独立处罚权。\n  参与新项目的招标、审批流程，负责开工报告的审核和审批。\n  配合工地运营部门进行合作方的年度评估。   	学历： 本科\n  工作经验：5年以上电梯现场工作经验或者建筑或者工程类工作经验，三年以上安全管理工作经验\n  语言能力：英语熟练，能满足工作要，CET-4\n  计算机水平：能熟练操作OFFICE软件\n  有一定的机电专业技能\n  其它主要资质：符合国家法律法规要求的从事该岗位工作的相关资质	30000	13	50000	15000	\N	\N	2014-10-23	\N	更有惊喜哦	著名的垂直升降电梯、自动扶梯和自动人行道制造商和服务提供商现在华北（北京）和东北区域（沈阳）范围内寻访高级EHS管理人员，坚持以客户为导向，为客户提供金牌服务。	5	2015-08-18 14:14:23.48341	2015-08-18 14:14:23.48341	宝钢	active	30001	\N	\N	\N	\N	\N
10003	投资项目经理	南京西路188号	上海		19000	1.      参与项目拓展及开发，前期项目谈判，信息收集及反馈，项目考察以及可行性分析；\n\n  2.      能独立进行项目经济测算以及市场研究，起草及准备项目投资推介文件；\n\n  3.      能独立开展资本类项目投资交易结构及基金方案设计，项目投资实施及投后监管等工作；\n\n  4.      负责项目启动时具体工作的对接管理，并监控项目运作过程中的关键控制点。	1.      3-5年以上券商资管、券商机构、基金公司专户、银行投行或金融市场部等行业工作经验；\n\n  2.      金融投资，房产投资、经济、财务、等相关专业硕士以上学历；\n\n  3.      有良好的职业操守，无不良工作记录；具有优秀的沟通协调能力、高度的责任心和事业心；\n\n  4.      精通资本项目投资分析、财务分析及基金方案设计能力，具备相关法律知识；\n\n  5.      至少有1-2个资本类投资项目全程运作经验及成功案例；\n\n  6.      具有良好的人际交往、团队协作及执行力；\n\n  7.      具有丰富的项目和社会资源者优先。	0	\N	500000	\N	\N	\N	\N	\N			3	2015-08-18 14:14:23.502784	2015-08-18 14:14:23.502784	高盛	active	30001	\N	\N	\N	\N	\N
10004	P2P项目总监		上海	金融	19000	1.负责公司P2P平台的技术架构、技术规划与实施，负责交易系统安全防护，为公司提供全面的技术保障； \n  2.制定信息化管理制度、信息化标准、网络安全、信息安全措施并组织实施 ； \n  3.负责技术团队的梯队化建设及管理；\n  4.负责公司内部协调，全面主持技术部门的日常工作。	\N	0	13	32000	50000	\N	\N	2015-05-18	\N	公司即将上市	“融佳金融”是一个集财富管理、投融资服务、信用风险评估与小微借贷咨询服务于一体的综合性互联网金融服务平台。总部位于上海黄浦江南畔岸——绿地海外滩办公楼。我们致力于满足政府、国内/外机构及中、小型企业、高新创新项目与个人投融资及互联网金融的服务、咨询、项目管理及评估等需求。我们拥有完善、严谨的风控评估模型，规范、专业的外部融资担保合作机构（“上海中资融资担保有限公司”）。利用透彻、独到的研究分析，确保获得长期稳定安全增长的投资业绩。	5	2015-08-18 14:14:23.52338	2015-08-18 14:14:23.52338	点融网	active	30001	\N	\N	\N	\N	\N
10005	品牌合规主管	浦东陆家嘴	上海	体育用品	19000	1.负责给公司的产品编制物料编码，并在官方网站及公司系统上维护更新相关信息。\n  2.在物品编码会员到期前做好续办工作。\n  3. 在产品进行大货生产前安排样品检测，协调好供应商与质检中心两方面，同时要确保产品能够准时生产。\n  4. 原材料的审核确认，以确保大货使用的原材料符合产品的要求。\n  5. 在产品生产过程中、或交付前和产品经理前往工厂检视，以确保产品质量达标。\n  6.质检中心确定标签内容无误后，联系相关供应商印刷产品标签，并确保相关标签在产品交货前就绪，并告知供应商标签放置的要求。\n  7. 定期安排篮球/服饰/包类等样品的检测。\n  8. 收集并归档各类检测报告。\n  9.将编码信息及检测报告定期更新给相关部门。\n  10.企业质量标准的撰写安排及申报工作。\n  11. 处理日常退货相关事宜并做好数据统计。\n  12. 与天猫客服及库房沟通协调退货事宜。\n  13. 退货以及产品质量方面的相关报告统计与分析。	\N	0	13	89000	3000	\N	\N	2015-06-02	\N	有出国机会	1876年，拿下职棒场上250胜的A.G.Spalding先生创立斯伯丁公司，多年来不断并致力于开发最好的“球类”，提供给世界上所有的球类爱好者。\n     1891年，在Drames发明篮球运动的同时，斯伯丁公司制造出专属这项运动的第一颗篮球。历经百年，斯伯丁篮球以精湛的工艺、优异的品质被美国NBA等各大篮球比赛选定为比赛用球。\n     斯伯丁体育用品(中国)有限公司隶属于斯伯丁体育用品集团有限公司，成立于2013年10月23日。斯伯丁体育用品集团有限公司由美国Fruit of the Loom集团与台湾元吉集团合资所组成。\n     斯伯丁体育用品(中国)有限公司主要经营在中国大陆地区的斯伯丁品牌业务；现面向社会，诚聘英才。\n  \n     2014年，是Spalding与NBA合作30周年。斯伯丁比赛用球完成了38500多场NBA比赛，完成了近7百万的得分，并与NBA一起，在世界范围内展开各类篮球推广活动。“三十年”如此长期稳定的合作也成为了世界上最令人难以置信的品牌合作之一。\n  \n     2014年，斯伯丁体育用品（中国）有限公司将致力于斯伯丁篮球产品以及篮球文化在中国大陆地区的推广。除了在原有产品基础上带来全新创新，更将引入更多篮球相关产品，从篮球，篮球架，篮球鞋，运动服装，背包以及篮球配件等全方面满足中国篮球市场的需求，为中国消费者量身打造最完美的篮球产品。 	5	2015-08-18 14:14:23.544753	2015-08-18 14:14:23.544753	斯伯丁	active	30001	t	\N	\N	\N	\N
10006	销售经理	浦东龙阳路	上海	厨房家电	19000	如果你有远大的志向，并勤奋好学，通过自身的努力和坚持完成公司赋予的使命，我们将提供快速晋升的通道和远高于市场的薪酬待遇！\n  工作职责：\n  1.负责室内设计师渠道的开拓和销售，完成公司制定的月度和年度销售目标。\n  2.建立和维护和设计师的关系，提供很好的服务。\n  3.作为公司品牌的代表，向设计师介绍和推荐品牌和产品，提供厨房卫浴空间的解决方案。\n  4.针对销售过程中出现的问题，提供解决方案。\n  5.收集和反馈竞品和其他同类产品的市场信息和表现。\n  任职要求：\n  1. 气质形象佳，有很好的品味和鉴赏力。\n  2. 大专以上学历，具有洁具橱柜销售工作1-3年经验、丰富的客户资源者优先；\n  3. 室内设计专业，或熟悉上海地区的洁具橱柜市场和设计院者优先；\n  4. 具有较强的沟通和亲和能力；\n  5. 为人诚实守信，工作踏实具备良好的职业道德。\n  \n  薪资福利：五险一金的缴纳+带薪年假+商业保险， 丰富的员工活动和生日会	\N	0	13	43000	3000	\N	\N	2015-05-19	\N	急招,1周内close	Poshliving –宝时厨房卫浴设备（上海）有限公司是一家定位于高端市场，专营进口橱柜和卫浴产品，专注为高端客户提供厨房和浴室解决方案的优质企业。宝时厨卫拥有一批高端客户群体，通过给到客户精益求精的空间设计方案，和专业的私人订制化服务，目前已在行业内建立了非常好的口碑，立足于行业最前端。\n  公司旗下品牌主要有意大利第一品牌Fendi，Scic和高端卫浴品牌Devon&Devon等。Fendi芬迪，世界顶级时尚大牌中的翘楚，全球十大奢侈品家居品牌。奢华，时尚，更是引领3.0厨房时代，在做工和时尚细节上的演绎，精巧不凡。Scic喜客，意大利顶级厨房制造商，以卓越的创新能力，和接触的制造工艺享誉全。其为Fendi制造和整合的整体厨房，集时尚和奢华感于大成。出色的意大利的设计和精湛的工艺在全球高端物业享有盛誉。Devon&Devon, 意大利新古典风格的领跑者，是皇家，贵族和时尚界人士的不二之选。按照设计美学所展示的完整生活空间的一站式解决方案，非凡品味恒久远。\n  我们拥有强大的设计和产品服务团队，通过深入了解客户需求， 追求卓越，以服务取胜，塑造了良好的品牌形象 。鉴于公司业务的快速拓展，我们诚邀对自己有明确的奋斗目标，有梦想，有闯劲，并愿意通过勤奋和智慧获得成功的有贤人士加入我们的团队 ，与宝时厨卫共同打造辉煌！	8	2015-08-18 14:14:23.562017	2015-08-18 14:14:23.562017	宝时厨卫	active	30001	\N	\N	\N	\N	\N
10007	大客户经理	嘉定江桥	上海	物流	19000	1.根据公司市场营销目标，制定销售策略及销售计划，完成销售任务；\n  2.负责公司主力产品在食品、饮料、快消品、电子商务等市场销售、并做好客户管理工作，与主要客户保持良好的沟通，及时有效地为大客户提供高品质服务，以保证客户满意度；\n  3.负责发掘目标的行业大客户资源，与新客户建立前期的联系，获取需求信息、收集并了解客户需求材料、组织技术交流，并提供解决方案，争取订单成交；\n  4.针对客户提出的合同（交易条件、生产流程、产品要求、售后服务）作初步评估，并合同细节的沟通，保证合同正常实施；\n  5.及时回款及做好售后服务；\n  6.熟悉食品、饮料、外资、快消、电商行业者优先考虑。\n  职位要求：\n  1.本科以上学历，具有汽车驾照，熟悉CAD,office软件应用，精通英文听说读写；\n  2.有三年以上的大客户销售及管理经验；\n  3.具备良好的简报能力及商务谈判技巧；\n  4.长期派驻上海，能配合不定期出差；\n  5.形象气质佳，较强的人际交往能力与较好的人脉关系，具有良好的人际沟通能力；\n  6.市场敏锐的分析能力及判断能力，工作作风严谨，责任心强，具备解决问题能力及较强的职业素养及团队凝聚力、项目洽谈技巧、较强组织管控能力；\n  7.具备自动化设备、输送带等销售经验者尤佳；	\N	0	13	6500	4300	\N	\N	2015-06-01	\N	公司有班车接送	世仓物流设备（上海）有限公司创建于2001年，总部位于上海，是来自台湾的外商独资企业，致力于仓储货架的设计、制造、安装及售后服务。\n  2003年设立第一条生产线，2007年成立集团生产基地世仓货架制造（上海）有限公司，占地面积40,000㎡，厂房面积25,000㎡。生产基地拥有自动化生产线21条，以及多台数控机床等主要设备，采用瑞士Gema自动化涂装设备，运用科学、环保的方式，严格控管产品质量。基地年产能超过6万吨，是国内最大的专业仓储货架厂之一。公司通过ISO9001:2008质量认证体系认证、拥有多项国家实用新型专利，并获得上海市高新技术企业、上海市名牌产品、上海市三优企业、AAA级企业资信等级等多项荣誉，2006年起至今一直被评为为『守信用、重合同』单位。世仓现已在上海、北京、青岛、西安、苏州、广州、台湾等地均设有分公司或办事处，方便为全国客户服务。\n  公司成立以来，业务收入年增长率达30%以上，在中国站稳业界前三名，并计划在2015年大陆中小板上市。下步将朝世界一流货架生产企业努力。\n  中国地大人稠，密集存储将是发展的必然趋势；近年人工成本上涨及不易取得，更验证我们设定的「高效自动化密集存储」是正确的方向。世仓共有11个职级，晋升和职业发展路径清晰，培训体系完善，希望与所有高水平、肯吃苦、具高度企图心的优秀人才一起打拼成长。我们将提供一个公平、开放的平台，来到这里，您可以接受全面的培训和不同的挑战，更会和中国各地的客户一起共同解决仓储问题，欢迎一流的人才加入我们！	10	2015-08-18 14:14:23.581117	2015-08-18 14:14:23.581117	世仓物流	active	30001	\N	\N	\N	\N	\N
27	七宝购物中心项目总经理	上海七宝	上海		200000	-保持与业主的全面沟通，充分了解其投资预期收益； \r\n-制定切实可行的物业资产管理方案、运营计划和资金预算 \r\n-全面管理和协调项目团队（租赁专员、供货商、承包商和其他职员等），监管和推动各项工作的有效执行 \r\n 1.达到或超出预定的工作表现 \r\n2.领导约16人的现场管理团队（直属/外包） \r\n3.制定租金策略，确保租户续租，推动外部机构引入新机构 \r\n4.管理项目当前及未来的资本支出项目 \r\n5.准备月度及年度资产管理报告及资金预算 \r\n6.采取各项有力措施，确保项目业主的利益最大化	•房地产/房屋管理相关学历 \r\n•7年物业资产管理经验（商业及办公） \r\n•在租赁谈判、合同起草和行政管理等相关领域富有经验 \r\n•3年以上商业地产从业经验： \r\n•资金预算/财务报告 \r\n•熟悉楼宇系统 \r\n•适用基本办公系统（电子邮件、微软Office系统） \r\n•具备相关国内市场经验人士优先	100000	12		\N	股票	\N	\N	\N			7	2015-08-30 14:11:04.911369	2015-08-30 14:16:13.412608	万科	active	10000	f	19300534467311135294131675176_950.jpg	image/jpeg	27216	2015-08-30 14:11:04.635499
28	供应商质量工程师(马达)	嘉定	上海	汽车及零部件	20000	1. Support and perform the early supplier selection, process/product/system audit; \r\n2. Support at supplier component reviews; \r\n3. Conduct APQP, Run@Rate, perform PPAP release & line release at supplier; \r\n4. Coordination of improvements of processes including reduction of quality issues at supplier; \r\n5. Supplier complaint management from development till ramp up phase incl. monitoring of 8D reports; 6. Monitoring of escalation process from development, ramp up and serial phase; \r\n7. Other tasks assigned by superior.	1. Bachelor degree or above; \r\n2. Minimum 2 years of motor/sensor manufacturing experience; \r\n3. Good communication, negotiation skills both in Chinese and English; \r\n4. Knowledge of quality management, supplier quality related experience preferred.	12000	12	30000	1000	股票	\N	\N	\N	需要熟悉马达	嘉定区：大陆汽车嘉定研发中心	3	2015-08-31 01:27:22.845058	2015-08-31 01:30:31.669758	大陆汽车	active	10000	f	大陆汽车.jpg	image/jpeg	41264	2015-08-31 01:27:22.678054
2	Ruby开发工程师	上海南京西路	上海	互联网	20000	- 2年以上 Ruby 开发经验, 1年以上 Ruby on Rails 开发经验；\r\n- 有编写自动化测试用例的习惯； \r\n- 有扎实的编程功底, 熟悉数据结构和算法； \r\n- 喜爱服务器后台编程； \r\n- 有过 Sinatra, Padrino 或 Grape 框架下的开发经验者优先； \r\n- 熟悉 redis, MongoDB 之类的 NoSQL 数据仓库者优先； \r\n- 理解框架运作原理者优先。	- 具备良好的沟通能力和团队合作能力。 \r\n- 工作态度认真，积极主动。	10000	13	20000	\N	股票	\N	2015-08-29	\N	上海文广集团（SMG）与阿里巴巴在上海联合宣布，双方将充分发挥各自在传媒与大数据领域的资源优势，共同将SMG旗下的第一财经传媒公司，打造成具有全球影响力的新型数字化财经媒体与信息服务集团。	阿里巴巴12亿元参股第一财经，作为双方合作的第一步，第一财经新媒体科技有限公司已成立，目前启动的项目包括：1、基于拥有数亿用户的支付宝，第一财经已经成为其股票行情系统的资讯提供商，第一财经财富管理资讯也将很快登陆手机淘宝；2、立足于数据的DT财经移动终端预计今年8月上线；3、双方将在本月联合发布国内第一份中国消费大数据报告；4、互联网金融智库将于近日成立。	\N	2015-08-25 02:43:35.977893	2015-08-25 06:07:12.064997	第一财经	active	2	f	\N	\N	\N	\N
3	首席财务官	上海市浦东新区华佗路68号	上海	硬件	100000	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-25	\N		聚熵信息技术(上海)有限公司2012年初成立于上海浦东张江高科，公司致力于研发民用人工智能，并依托移动互联网实现让全民享受人工智能给人们日常生活带来的方便与快捷。 聚熵愿景：成为全球知名的移动智能服务商。 聚熵使命：让移动生活更加方便快捷。 聚熵团队：我们是一个富有激情和对移动互联网有深刻理解的团队，专注于移动互联网移动语音智能交互产品的研发和运营。团队相信移动互联网未来将会和人工智能紧密结合，人工智能能够让我们的移动生活更加方便快捷! 聚熵产品：智能360、智能360家庭版、语义云、通话录音	\N	2015-08-25 06:33:01.394986	2015-08-25 06:33:01.394986	聚熵信息技术上海有限公司	active	2	f	\N	\N	\N	\N
4	首席财务官	上海市浦东新区华佗路68号	上海	硬件	100000	1、组织建立公司符合上市要求的内控、财务、税务体系； \r\n2、组织梳理公司商业模式，盈利模式，商业计划书； \r\n3、组织撰写融资路演文件，并进行融资渠道开拓，融资路演； \r\n4、根据公司年度工作计划，组织编制、初审公司年度全面预算，审议公司上报的年度、月度全面预算执行情况报告，形成公司预算执行报告和执行差异分析报告； \r\n5、建立财务管理培训体系，指导、监控财务系统运行，跟踪分析本企业和下属企业经营财务指标，揭示潜在的经营问题供高层决策参考； \r\n6、建立维持与股东及银行的良好关系，确保以最低、最合理的财务费用获得公司所需资金，合理税务规划，建立及维护与税务管理部门的关系；	1、经历过公司上市筹备，主导过商业计划书制定，主导过融资路演，且有路演融资成功经历； \r\n2、具有移动的融资渠道和融资资源； \r\n3、会计、财务或相关专业大学本科以上学历，中级会计师职称以上（注册会计师优先），接受过管理学、战略管理、组织变革管理、人力资源管理、经济法、公司 产品的基本知识等方面的培训； \r\n4、有2年以上CFO工作经验，三年以上财务总监/财务副总监工作经历或知名VC投资总监以上任职经验； \r\n5、熟悉企业财务管理、财务规划、资金运作、财务分析等全面的财务管理知识，具备企业全盘财务管理的能力，熟悉财务规划、财务成本分析、财务预算、成本核 算、审计等财务管理工作； \r\n6、具有较全面的财会专业理论知识、现代企业管理知识，熟悉财经法律法规和制度，熟悉财务相关法律法规、企业财务制度和流程，参与过较大投资项目的分析、 论证和决策；\r\n7、 具备良好的财务分析和内部审计能力，能够从财务管理的角度为集团经营和投资提供专业建议和合理分析\r\n\r\n该岗位核心是能够帮助聚熵进行下一轮融资以及国内新三板上市，所以要求有路演融资的经历，最好可以是投资人出身，做过投资总监及以上职位。 目标公司：VC机构或者国内大型互联网公司投资部门。	60000	13	200000	\N	股票	2	2015-08-25	\N	职位诱惑: 薪资范围：60w-100w + 百万奖金，期权：可以给到占团队股份1%-3%\r\n\r\n    13薪\r\n    带薪年假\r\n    期权激励\r\n    期权奖励\r\n    通讯津贴\r\n    五险一金\r\n    年终绩效奖金\r\n    午餐补助	聚熵信息技术(上海)有限公司2012年初成立于上海浦东张江高科，公司致力于研发民用人工智能，并依托移动互联网实现让全民享受人工智能给人们日常生活带来的方便与快捷。 聚熵愿景：成为全球知名的移动智能服务商。 聚熵使命：让移动生活更加方便快捷。 聚熵团队：我们是一个富有激情和对移动互联网有深刻理解的团队，专注于移动互联网移动语音智能交互产品的研发和运营。团队相信移动互联网未来将会和人工智能紧密结合，人工智能能够让我们的移动生活更加方便快捷! 聚熵产品：智能360、智能360家庭版、语义云、通话录音	7	2015-08-25 06:37:28.664216	2015-08-25 06:44:39.601465	聚熵信息技术上海有限公司	active	2	f	\N	\N	\N	\N
5	游乐设备维护经理	上海浦东川沙	上海		60000	• 有高度的安全意识。 • 确保相关设备的安全性，可靠性以及演出质量。 • 带领10名左右的维修技术人员进行景点的日常维护和故障检修工作。 • 安排工作进度、排班计划和任务优先级。 • 领导团队并提供指导和技术支持。 • 协助创建和遵守部门年度运营计划（预算）。 • 负责评估出现问题的系统或设施，并确定需要进行的安装或维修服务。 • 分析根本原因来防止故障，推动改进流程，从而提供优质维护工作。 • 在项目开发期间参与游乐设施的安装、测试和调整工作，支持华特迪士尼幻想工程团队的工作。主动学习和掌握游乐设施的设备和系统。 • 参与维修人员的招聘、雇佣和培训。 • 管理由供应商和承包商提供的服务。 • 负责提供景点备件计划。 • 准备团队成员的培训计划，用各类培训资源为技术人员提供指导。	1. 8年以上工作经验\r\n2. 英语可以工作交流（3-3.5分/5分）\r\n3. 本科及以上学历\r\n4. 机械及电气方向皆可 5. 外资公司必须	30000	13		\N	股票	\N	2015-08-25	\N	负责园区10大类游乐设备日常维护（不是紧急维修）\r\n\r\n组织架构：\r\n向美方迪士尼的team leader汇报，TL下属带14人（本职位），包括工程师、经理（双方都向TL汇报，无汇报关系），下属10-20初级维修。\r\n\r\n职位问题：\r\n1. 本职位为常夜班，做三休三（晚10点至次日早8点）\r\n2. 路程较远（开园前有班车，之后需搭乘轨交或自驾）\r\n搜寻方向：\r\n第一大类：航空（1.东航、南航、春秋等；2.波音、空客等）、申通、汽车类（主机厂或动力总承）\r\n第二大类：大型制造业产线维护（化工、生物等行业）\r\n第三大类：特殊设备维护\r\n\r\n薪资：25-38万，13薪\r\n面试流程：1轮，HR及老外面试（可搭乘班车入园）	上海迪士尼度假区是迪士尼在中国大陆的第一个度假区，它集梦幻、想象、创意和探险于一身，是与至亲好友远离尘嚣的绝佳去处。在开幕当日，度假区将包括上海迪士尼乐园、两座全新主题酒店、大型的零售、餐饮和娱乐中心，以及室外休闲设施。上海迪士尼乐园将会是一座神奇王国风格的主题乐园，包含经典迪士尼故事及卡通形象，同时也兼顾原汁原味的中国文化体验和主题设计。上海迪士尼度假区老少咸宜，从刺激冒险到葱郁花园，宾客们可以一起放松和享受丰富的互动体验。在这里，宾客将体验到一切世界级的迪士尼优质服务。 	8	2015-08-25 06:57:45.88114	2015-08-25 07:01:28.357626	迪斯尼	active	2	f	\N	\N	\N	\N
23	XL9-web前端开发工程师	深圳市 高新技术产业园中区软件园二期	深圳	互联网	45000	1. 负责迅雷web前端(包括PC和手机)的相关开发 \r\n2. 负责通过技术提升用户体验和可用性	1. 熟练使用html、css、javascript等前端技术； \r\n2. 熟练使用常用javascript库和框架(如jQuery、zepto等)；\r\n3. 熟悉HTML5、CSS3等前沿技术；\r\n4. 了解任何一种后台语言，有相关开发经验优先；\r\n5. 有Web App开发经验优先； \r\n6. 有ActionScript开发经验优先 \r\n7. 具备良好的沟通能力和团队协作精神。	20000	13		\N	股票	\N	\N	\N			4	2015-08-28 14:13:03.655132	2015-08-28 14:15:42.490124	迅雷	active	2	f	2804008_456.jpg	image/jpeg	53359	2015-08-28 14:13:03.548324
6	CS工程师				\N			\N	\N		\N	股票	\N	\N	\N			\N	2015-08-25 10:04:01.477969	2015-08-25 10:04:09.358276		active	30001	f	130349254239018.jpg	image/jpeg	131194	2015-08-25 10:04:01.27009
22	Java工程师	上海 凯滨路166号	上海		25000	1、负责项目编码设计，编写软件设计说明书等文档 \r\n2、负责系统设计，并按照项目设计进度要求完成编码和测试 \r\n3、负责数据库设计，并根据开发规范独立完成编码和测试	1、全日制本科及以上学历并取得学位 （必选，除非有bat或者一线）\r\n2、3年以上JAVA开发经验，JAVA基础扎实，深刻理解各种常用数据结构与算法 \r\n3、熟练掌握以下两个以上的框架技术：Struts，JSF，Hibernate，Spring精通hbase、mongodb、redis等产品，熟悉oracle、mysql等关系数据库 \r\n4、熟悉lucene、 solr等产品，有大型网站实际搜索项目经验的优先；	16000	12		\N	股票	\N	\N	\N		万里通是国内首家通用积分平台，万里通积分是积累来源最广泛、花销渠道最广泛的通用积分。 \r\n万里通用户可以通过消费平安集团旗下各类金融产品来获得积分，如平安银行信用卡、借记卡，以及购买各类保险、理财产品。此外，通过万里通官网去淘宝、1号 店、京东、唯品会等购物也可获得万里通积分返利。中国电信、立邦中国等积分可以兑换成万里通积分，万里通积分是目前积累渠道最广泛的积分。	3	2015-08-28 03:31:07.841207	2015-08-28 03:34:36.758592	平安万里通	active	2	f	1366dd54012c73fdeb8c5f33.jpg	image/jpeg	72590	2015-08-28 03:31:07.587948
21	客户经理--投融资与并购	上海银城中路200号	上海	银行	50000	1、负责上海分行跨境业务，包括并购贷款、项目融资、银团贷款等； \r\n2、负责并购项目的营销、结构设计、谈判及项目的具体实施，包括与总行、有关分行、客户及中介机构等相关各方的协调与联系，促进项目的顺利开展； \r\n3、负责项目的文本谈判； \r\n4、负责自营项目的授信发起、操作和贷后管理； \r\n5、所在单位要求的其他职责。	1、从事相应领域的专业工作，相关业务经验丰富，既往工作业绩表现良好； \r\n2、从事银行公司金融业务5年以上；具有并购贷款、项目融资、银团贷款等实务经验；有项目资源者优先考虑； 3、具有扎实的英语读写能力和计算机应用能力。 \r\n4、四年以上相应领域专业工作经验（两年及以上学制的全日制硕士可减少一年）；	280000	13		\N	股票	\N	2015-08-27	\N	1、\t严格按照岗位要求，JD里边要求的学历是硬性指标，最好985、211毕业成功率更高；\r\n2、\t候选人一般不超过35周岁，高级经理以上的岗位可放宽到40岁； \r\n3、\t候选人稳定性要好，近三年来全职工作单位不超过两个； \r\n4、\t所有岗位以男性为主，或者已婚已育且无二胎打算的女性； \r\n5、\t所有候选人都需要上海户籍，优秀的可以考虑有上海居住证者，不考虑外地户口，暂住证，在推荐简历的同时需要在附件中上传候选人的户籍证明，以及上传候选人目前工作单位的劳动合同（因为之前发生过所有流程走完发现候选人是和第三方签的合同，总部流程无法走通）； \r\n6、\t所有岗位均同中国银行上海分行签署正规合同（除自贸区分行外，自贸区分行2个岗位会和自贸区分行签约），为期3年，试用期6个月（试用期=保证期），中银会在满试用期2周前，无试用期延长； \r\n7、\t薪资：平台上公布的薪资基本无参考价值，需要根据候选人目前薪资，面试表现最终定级定系数后再确定；\r\n8、\t猎头费：基本月薪*12*费率（高级岗费率25%，初级岗费率20%，根据最终定级来进行猎头费用计算）； \r\n9、 无免费贷款，但是有五险（正常交）二金（补充公积金+补充医疗保险）。	上海是中国银行的发源地。百余年来，中国银行上海市分行作为中国银行重要的分支机构，屹立于浦江两岸，不断拓展业务领域，持续创新金融产品，至诚服务社 会、经济和民生。上海中行外币存款、进出口结算、跨境人民币和结售汇等多项业务领先同业，在上海地区形成了由营业网点、自助银行、网上银行、电话银行和理 财中心等组成的立体化金融服务网络，现已拥有营业网点261家、理财中心247家、财富管理中心12家以及私人银行1家，员工总数8000余人。\r\n 近年来，随着上海“四个中心”和自贸区战略的推进实施，上海中行牢固树立金融服务实体经济的理念，积极担当社会责任，为基础设施、轨道交通、飞机船舶、电 力电气、国家开发区、自贸区等重大项目建设提供助力。不断推进金融产品创新，成功叙做跨境人民币贷款、双向资金池、第三方支付机构支付业务、大宗商品衍生 品交易、个人跨境人民币结算、利率放开后的小额外币存款等自贸区金融改革政策后的多项首笔金融业务；率先试点跨国公司总部外汇资金集中运营管理，完成全球 首笔跨境贸易人民币结算业务，跨境人民币业务领先市场，连续三年获得央行上海总部授予的“上海市跨境人民币业务推进突出贡献奖”；创新推出服务科技型中小 企业的“张江模式”，荣获“上海金融创新成果奖”一等奖，为银行业第一家；积极履行企业社会责任，大力支持助学贷款，深入银警合作构建安全屏障，倡导绿色 金融理念，加大对重点绿色金融项目的支持力度。 \r\n面对新的历史机遇，上海中行将一如既往地传承百年中行的悠久历史和良好文化，面对全球经济金融形势和客户需求的变化，坚持“以客户为中心”的经营管理转 型，以上海自贸区建设为契机，稳步推进战略业务发展，着力提升全行的核心竞争力，全面打造最好的银行。	\N	2015-08-27 09:06:13.694892	2015-08-27 09:37:38.233507	中国银行	active	30001	f	Screen_Shot_2015-08-27_at_17.02.19.png	image/png	235474	2015-08-27 09:06:13.452658
26	PHP高级开发工程师	广州市 荔湾区	广州	互联网	12000	1、B2C电子商务网站的接口开发及维护； \r\n2、后台数据处理应用的开发及维护； \r\n3、上级安排的其他相关工作。	1、计算机或信息管理专业，国家统招本科以上学历； \r\n2、具有扎实的计算机基础理论知识；3年以上互联网工作经验； \r\n3、能熟练使用PHP, MYSQL, Redis/Memcache/MongoDB等Nosql； \r\n4、能熟练使用Codeigniter/Cakephp/ThinkPhp/ZendFramework等mvc框架，并且懂得这些框架的核心原理；\r\n5、能熟练使用phpunit/simpletest进行单元测试； \r\n6、能熟练使用xdebug/xhprof进行性能调优； \r\n7、懂得mysql的优化； \r\n8、逻辑思维能力强，做事有条理，具备较强的分析问题和解决问题的能力； \r\n9、思维敏捷，性格开朗，责任感强，工作积极主动，具备学习意识，有良好的团队协作意识； \r\n10、有开发过大中型互联网站经验者优先； \r\n11、有百万流量经验者优先；	24000	13		\N	期权	0	\N	\N	当天给回复		3	2015-08-29 10:12:02.747027	2015-08-29 10:16:01.37967	唯品会	active	10000	f	20130809043957472.jpg	image/jpeg	39162	2015-08-29 10:12:02.608837
29	IT技术部负责人（征信）		北京	保险	100000	具有丰富管理技术团队经验，具体职位相关信息见职业调研 今年年底要带10人左右团队 	至少熟练掌握一种代码JAVA，python,php 代码开发经验至少5年以上 管理团队经验至少5年以上	50000	12		\N	股票	\N	\N	\N		阳光保险集团股份有限公司是中国500强企业、中国服务业100强企业，集团注册资本金67.1059亿元人民币，目前拥有阳光财产保险股份有限公司、阳光人寿保险股份有限公司、阳光资产管理股份有限公司等多家专业子公司。	10	2015-09-01 01:20:56.460452	2015-09-01 01:22:44.075494	阳光保险	active	10000	f	阳光保险.jpg	image/jpeg	46127	2015-09-01 01:20:56.289996
30	Java架构师	金桥佳桥路199号	上海	传统软件	38000	负责SGM应用系统框架基础模块的开发，配合项目进行相关系统架构规划设计等。	1、\t本科及以上学历，计算机相关专业\r\n2、\t5年以上Java开发经验，有IO，socket相关开发经验尤佳；\r\n3、\t有weblogic、was、tomcat、jetty等常见服务器的使用经验；\r\n4、\t有maven、git、hudson等开发管理工具的使用经验；\r\n5、\t熟悉ssh等常见框架（hibernate可以换成mybitis）；\r\n6、\t了解html5以及配套前端技术（angularjs、nodejs等）；\r\n7、\t理解soa，有webservice，rest相关开发经验者尤佳；\r\n8、\t对云服务（Pass、Saas）等新技术有一定了解的尤佳；\r\n9、\t使用过http服务器（nginx、apache），对域名、SSL、证书、跨域等理解以及实际项目使用经验\r\n10、\t熟悉数据模型设计，了解数据库分库及分表，掌握mysql、oracle等数据库；\r\n11、\t了解大数据量的处理方案（如查询优化、数据迁移等）；\r\n	25000	12		\N	股票	\N	\N		不是互联网方向的Java,是传统软件的Java方向	用友（集团）成立于1988年，是亚太地区领先的企业管理软件、企业互联网服务和企业金融服务提供商，是中国最大的ERP、CRM、人力资源管理、商业分析、内审、小微企业管理软件和财政、汽车、烟草等行业应用解决方案提供商。用友iUAP平台是中国大型企业和组织应用最广泛的企业互联网开放平台，畅捷通平台是支持千万级小微企业的公有云服务。用友在金融、医疗卫生、电信、能源等行业应用以及数字营销、企业社交与协同、企业通信、企业支付、P2P、培训教育、管理咨询等服务领域快速发展。	5	2015-09-01 06:45:10.658876	2015-09-01 07:47:30.211777	用友汽车信息科技有限公司	active	10000	f	用友.gif	image/gif	16549	2015-09-01 06:45:10.442986
31	Java高级开发工程师	金桥佳桥路199号	上海	传统软件	38000	负责系统核心业务模块开发，为1-2名团队成员提供技术指导，保证开发质量。	1、\t本科及以上学历，计算机相关专业，5年以上JAVA开发经验；\r\n2、\t熟练掌握SPRING MVC框架，至少拥有2个使用SPRING MVC框架的项目经验\r\n3、\t熟练掌握MYBATIS框架，至少有2个使用HIBERNATE或者MYBITIS的项目经验\r\n4、\t掌握使用ORACLE数据库，SQL语句娴熟\r\n5、\t了解html5以及配套前端技术（angularjs、nodejs等）\r\n6、\t在team leader指导下，能完成负责模块概要设计工作\r\n7、\t能带领1-2人小团队，为其提供技术指导，共同完成开发任务\r\n8、\t熟悉MAVEN的使用方法\r\n	25000	12		\N	股票	\N	\N	\N		用友（集团）成立于1988年，是亚太地区领先的企业管理软件、企业互联网服务和企业金融服务提供商，是中国最大的ERP、CRM、人力资源管理、商业分析、内审、小微企业管理软件和财政、汽车、烟草等行业应用解决方案提供商。用友iUAP平台是中国大型企业和组织应用最广泛的企业互联网开放平台，畅捷通平台是支持千万级小微企业的公有云服务。用友在金融、医疗卫生、电信、能源等行业应用以及数字营销、企业社交与协同、企业通信、企业支付、P2P、培训教育、管理咨询等服务领域快速发展。	5	2015-09-01 07:55:21.388071	2015-09-01 07:56:28.935767	用友汽车信息科技有限公司	active	10000	f	用友.gif	image/gif	16549	2015-09-01 07:55:21.166083
32	PHP开发总监	海淀区上地东路9号上地七街得实大厦	北京	互联网	45000	1.\t负责公司的技术方向、技术规划与运筹实施，为公司业务发展提供全面的技术保障； \r\n2.\t研究决策公司技术发展路线，规划公司产品的技术构架； \r\n3.\t使用PHP语言开发高效能数据，应用服务； \r\n4.\t完成系统架构设计、数据库结构设计、业务逻辑抽象、组件封装等编码工作； \r\n5.\t在开发过程中发现存在问题，制定团队开发规范； \r\n6.\t数据库设计文档、系统架构设计文档、数据接口文档的编写； \r\n7.\t指定并遵守团队的代码格式、结构的规定、编写易读、易维护、高质量、高效率的代码； \r\n8.\t具备卓越的抽象能力、架构分析能力与设计能力，积极参与前期设计、审核开发的设计方案。	1.\t10年以上PHP开发工作经验，5年以上PHP开发10团队管理经验； \r\n2.\t对Mysql有十分深入的认识，具有索引优化、查询优化和存储优化经验、熟练掌握关系数据库理论； \r\n3.\t深入理解BS/PHP架构、MVC设计模式，大型PHP架构设计和开发经验，PHP缓存技术，静态化设计方面的经验； \r\n4.\t喜欢前沿技术、具备良好的学习能力和独立解决问题的能力，能承受一定的工作压力； \r\n5.\t思路清晰，具备良好的沟通能力、理解能力和数据分析能力，善于分享； \r\n6.\t带领技术团队完成项目和部门工作目标； \r\n7.\t在大型互联网公司有过接口团队管理经验者优先。	40000	12		\N	期权	0	\N	\N		51Talk无忧英语，成立于2011年，总部位于中国北京，是专门从事在线英语培训的教育机构。自成立之初，我们就受到业内人士的广泛关注，并获得新东方创始人之一、真格基金合伙人徐小平老师的鼎力支持，2012年初又得到美国顶级风险投资机构DCM的投资, 2013年12月，我们更获得由小米的创始人雷军先生旗下的顺为创投基金领投， A 轮投资方 DCM 同时参与投资的1200 万美元的 B 轮融资，为下一轮业务爆发增长提供最充足保障！ 2014年10月，红杉资本5500万美元的C轮高调融资，让我们的极致用户体验可以得到满足。经过历年来的发展，我们现在已经成为一家拥有数千多名外教，在线学员达数十万之多的业界领军品牌！ 团队情况：目前有10个技术经理左右，30-40个PHP技术人员，公司技术以PHP为主	10	2015-09-02 01:59:14.641497	2015-09-02 02:08:46.571126	51talk	active	10000	f	51talk-logo.png	image/png	49165	2015-09-02 01:59:14.506398
33	Java高级开发工程师	祖冲之路899号	上海	互联网	30000	1. 深入发掘业务需求为软件开发提供技术方案设计； \r\n2. 从事核心部分代码的编写； \r\n3. 进行业务需求分析和软件设计，并编码实现；	1. 本科及以上学历，计算机相关专业；良好的英文读写能力；\r\n2. 3年以上大型互联网电子商务系统或者其他大型企业应用系统开发相关经验；精通Java EE相关技术和框架（包括Java语言基础/多线程Velocity/FreeMaker,Spring,Hibernate /iBatis,Cache,Messaging,Workflow 等）； \r\n3. 有Web及前端技术开发经验（包括Javascript，ajax，json，HTML，XML，MVC 类Web开发框架）； \r\n4. 熟悉MySQL或Oracle的数据库设计和开发； \r\n5. 熟悉Redis，Memcached，Hbase，Mongodb等一种或多种NOSQL的设计和开发 \r\n6. 有消息中间件开发经验，如activemq，rabbitmq或kafka等 \r\n 7. 熟悉大容量、高性能的数据库系统的应用开发，对各种开源的软件有深入的了解，有大规模高并发访问的Web应用开发经验； \r\n8. 熟悉企业应用设计模式、面向对象的分析和设计技术，包括设计模式、UML建模等； \r\n9. 熟练掌握数据结构、常用算法； \r\n10. 思路清晰，善于思考，能独立分析和解决问题； \r\n11. 热衷于互联网技术的研究和创新； \r\n12. 责任心强，具备良好的团队合作精神； \r\n13. 符合如下条件者优先： · 具有高并发开发经验； · 有SNS应用开发经验； · 有移动互联网开发经验 · 有ROR开发经验，会使用ruby语言 · 有key-value分布式DB经验；	17000	13		\N	股票	\N	\N	\N		国内最大音频分享平台，2013年3月手机客户端上线，一年半时间手机用户规模已突破8000万，成为国内发展最快、规模最大的在线移动音频分享平台。	\N	2015-09-03 02:59:02.630365	2015-09-03 03:02:12.465459	正大喜马拉雅FM	active	10000	f	喜马拉雅.png	image/png	120679	2015-09-03 02:59:02.405364
34	Senior Asset & Lease Manager Senior Asset & Lease Manager		上海	快速消费品	20000	Reporting: - Prepare presentations and monthly reports to Board, Steering Group, Project & Leasing Committee. - Collect input regarding rents/service charges/management fees/utilities costs/turn over from tenants and property/facility management teams. Leasing: - Negotiate commercial & legal terms of Tenancy Agreement & Tenant Manual in coordination with leasing, legal & construction teams (new TA or TA renewal). - Lead production and monitor development and implementation of tenant mix and commercial plan to maximize the profitability of each shopping center asset in coordination with leasing team. - Execute signature of TA/TM, follow up and report frames and goals agreed with Carrefour Shopping Mall & Property Division Directors. - Implement the rent/management fees/utilities fee invoicing software to collect tenant’s payment in liaison with finance & accounting team. Assist Finance in recovering monies payable under TA provisions. Rental Budget Objectives: - Monitor and follow-up rental budget and actual out fall for projected rental income and other revenues (specialty leasing) in the Rental Budget Objectives. - Secure that the commercial plan is reflected in the Rental Budget Objectives. - Plan follow-up and enforce project leasing time schedule aligned with Rental Budget Objectives. - Support package deals with tenants in other projects. - Monitor the on-site team responsible for revenue generation from specialty leasing programs which may include: Retail Merchandising Units (RMU), Long-term and Short term Kiosks (LTK/STK), Temporary In-Line Stores (TILS) point of sales (POS) and Vending. - Supervise and monitor Specialty Leasing, and coordinate with Marketing and sponsorship staff or consultants as appropriate to optimize results and develop new revenue opportunities. Retailers & Tenant Management: - Secure implementation and usage of Carrefour Property leasing templates (Tenancy Agreement-TA/Tenant Manual-TM) as well as tenant compliance to all clauses of TA/TM. - Keep open dialogue with tenants in a problem solver attitude. - Understanding tenants and their sales initiatives, and providing Retail support.	- Good organizational skills, attention to detail. Listening skills and customer friendly attitude. Problem solver and open mind attitude. - University degree in real estate, finance, legal, business or marketing is preferred - 6-8 years experience from working with shopping centre lease administration, leasing negotiation within development/real estate companies, experience from working in international organizations - Experience from daily managing a sales team/lease administration team of 5 – 10 persons. - Language: Fluent in Mandarin and English, French is a plus - Good understanding of commercial concepts, clustering, tenant mix and positioning. - Sound skills in Microsoft Office software (Word, Excel, and PowerPoint) & real estate-accounting software.	8	13		\N	股票	\N	\N	\N	负责北京自有地产项目的招商、资产管理、租赁 向法国总监汇报（base在上海），不带人		\N	2015-09-05 03:43:14.017543	2015-09-05 03:44:58.606832	家乐福	active	30001	f	家乐福.jpg	image/jpeg	71909	2015-09-05 03:43:13.767913
35	RubyOnRails工程师		上海		\N	1 网站后端RubyOnRails开发\r\n2 前端CSS和Javascript开发	1 RubyonRails2年以上经验\r\n2 熟悉至少一种Javascript框架,如Jquery, AnglarJS等	\N	\N		\N	股票	\N	\N	\N			2	2015-09-05 09:39:07.759317	2015-09-05 09:41:44.529949	猎了么	active	10000	f	\N	\N	\N	\N
\.


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('jobs_id_seq', 35, true);


--
-- Data for Name: line_items; Type: TABLE DATA; Schema: public; Owner: George
--

COPY line_items (id, mobile, email, name, status, user_id, job_id, created_at, updated_at, comment, feedback, sender_id, recipient_id, interviewed) FROM stdin;
64	13916310001	aaronqin@test.com	Aaron Qin	等待面试	\N	10001	2015-08-18 14:14:23.605935	2015-08-18 14:14:23.605935	duke干得不错	\N	20002	10001	\N
65	13916310002	mgy@test.com	马贵耀	等待应聘	\N	10001	2015-08-18 14:14:23.620236	2015-08-18 14:14:23.620236	符合我们的要求	\N	20001	10002	\N
66	13916310003	chc@test.com	储海春	offer	\N	10001	2015-08-18 14:14:23.626116	2015-08-18 14:14:23.626116	正好缺人	\N	20001	10003	\N
67	13916310004	zm@test.com	朱明	offer	\N	10002	2015-08-18 14:14:23.635769	2015-08-18 14:14:23.635769	还不错	\N	20002	10004	t
68	13916310006	ytz@test.com	佘俊芝	offer	\N	10003	2015-08-18 14:14:23.64279	2015-08-18 14:14:23.64279	候选人的英语把关需要更严格一些,其他方面把握的还是比较准确的.	\N	20003	10005	t
69	13916310007	ytz@test.com	余婷章	offer	\N	10004	2015-08-18 14:14:23.650407	2015-08-18 14:14:23.650407	大同对我们的要求了解的非常充分,我非常欣赏他的工作态度!	\N	20004	10006	\N
70	13916310008	lhj@test.com	刘海健	offer	\N	10005	2015-08-18 14:14:23.65651	2015-08-18 14:14:23.65651	Raymond这次的服务非常好,如果对候选人的沟通能力了解的更深一点就跟好了	\N	20005	10007	\N
71	13916310009	dhb@test.com	代洪彪	offer	\N	10006	2015-08-18 14:14:23.667487	2015-08-18 14:14:23.667487	千寻这次送的人质量非常高,相对于其他猎头,我更愿意下次和他合作	\N	20006	10009	\N
72	13916310010	huayijob@aliyun.com	待定	等待应聘	\N	10007	2015-08-18 14:14:23.673564	2015-08-18 14:14:23.673564	\N	\N	20002	\N	\N
\.


--
-- Name: line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('line_items_id_seq', 72, true);


--
-- Data for Name: microposts; Type: TABLE DATA; Schema: public; Owner: George
--

COPY microposts (id, content, user_id, created_at, updated_at, job_id) FROM stdin;
4	我发布了Ruby开发工程师职位	2	2015-08-25 02:46:37.049733	2015-08-25 02:46:37.049733	2
5	我发布了首席财务官职位	2	2015-08-25 06:44:39.711031	2015-08-25 06:44:39.711031	4
6	我发布了游乐设备维护经理职位	2	2015-08-25 07:01:28.427716	2015-08-25 07:01:28.427716	5
7	我发布了CS工程师职位	30001	2015-08-25 10:04:09.513042	2015-08-25 10:04:09.513042	6
8	我发布了CS职位	30001	2015-08-25 11:24:11.493554	2015-08-25 11:24:11.493554	7
9	我发布了客户经理--投融资与并购职位	30001	2015-08-27 09:09:41.660268	2015-08-27 09:09:41.660268	21
10	我发布了Java工程师职位	2	2015-08-28 03:34:36.854422	2015-08-28 03:34:36.854422	22
11	我发布了XL9-web前端开发工程师职位	2	2015-08-28 14:15:42.559598	2015-08-28 14:15:42.559598	23
12	我发布了PHP高级开发工程师职位	10000	2015-08-29 10:15:48.889355	2015-08-29 10:15:48.889355	26
14	我发布了七宝购物中心项目总经理职位	10000	2015-08-30 14:16:13.504193	2015-08-30 14:16:13.504193	27
15	我发布了供应商质量工程师(马达)职位	10000	2015-08-31 01:30:31.737045	2015-08-31 01:30:31.737045	28
16	我发布了IT技术部负责人（征信）职位	10000	2015-09-01 01:22:44.155855	2015-09-01 01:22:44.155855	29
17	我发布了Java架构师职位	10000	2015-09-01 06:57:03.837235	2015-09-01 06:57:03.837235	30
18	我发布了Java高级开发工程师职位	10000	2015-09-01 07:56:29.034707	2015-09-01 07:56:29.034707	31
19	我发布了PHP开发总监职位	10000	2015-09-02 02:08:46.654405	2015-09-02 02:08:46.654405	32
20	我发布了Java高级开发工程师职位	10000	2015-09-03 03:02:12.59342	2015-09-03 03:02:12.59342	33
21	我发布了Senior Asset & Lease Manager Senior Asset & Lease Manager职位	30001	2015-09-05 03:44:58.715285	2015-09-05 03:44:58.715285	34
22	我发布了RubyOnRails工程师职位	10000	2015-09-05 09:41:44.616681	2015-09-05 09:41:44.616681	35
\.


--
-- Name: microposts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('microposts_id_seq', 22, true);


--
-- Data for Name: overall_averages; Type: TABLE DATA; Schema: public; Owner: George
--

COPY overall_averages (id, rateable_id, rateable_type, overall_avg, created_at, updated_at) FROM stdin;
\.


--
-- Name: overall_averages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('overall_averages_id_seq', 1, false);


--
-- Data for Name: rates; Type: TABLE DATA; Schema: public; Owner: George
--

COPY rates (id, rater_id, rateable_id, rateable_type, stars, dimension, created_at, updated_at) FROM stdin;
1	20002	52	JobRate	0	job_general	2015-08-25 07:15:40.778073	2015-08-25 07:15:40.778073
2	20002	51	JobRate	0	job_general	2015-08-25 07:15:42.181094	2015-08-25 07:15:42.181094
3	20002	61	JobRate	2	job_general	2015-08-27 13:35:58.935254	2015-08-27 13:35:58.935254
4	20002	77	JobRate	3	job_general	2015-08-27 13:36:02.593923	2015-08-27 13:36:02.593923
5	2	78	JobRate	5	job_general	2015-08-28 03:35:18.056208	2015-08-28 03:35:18.056208
6	2	78	JobRate	5	speed	2015-08-28 03:35:18.901673	2015-08-28 03:35:18.901673
8	10000	83	JobRate	5	speed	2015-08-30 14:16:33.015215	2015-08-30 14:16:33.015215
7	10000	83	JobRate	5	job_general	2015-08-30 14:16:31.928642	2015-08-30 14:16:34.224316
9	8	79	JobRate	0	job_general	2015-09-02 06:29:04.456828	2015-09-02 06:29:04.456828
10	8	86	JobRate	0	job_general	2015-09-02 06:29:06.538129	2015-09-02 06:29:06.538129
11	8	87	JobRate	4	job_general	2015-09-02 06:29:08.320777	2015-09-02 06:29:08.320777
\.


--
-- Name: rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('rates_id_seq', 11, true);


--
-- Data for Name: rating_caches; Type: TABLE DATA; Schema: public; Owner: George
--

COPY rating_caches (id, cacheable_id, cacheable_type, avg, qty, dimension, created_at, updated_at) FROM stdin;
1	52	JobRate	0	1	job_general	2015-08-25 07:15:40.790151	2015-08-25 07:15:40.790151
2	51	JobRate	0	1	job_general	2015-08-25 07:15:42.186806	2015-08-25 07:15:42.186806
3	61	JobRate	2	1	job_general	2015-08-27 13:35:58.953526	2015-08-27 13:35:58.953526
4	77	JobRate	3	1	job_general	2015-08-27 13:36:02.598764	2015-08-27 13:36:02.598764
5	78	JobRate	5	1	job_general	2015-08-28 03:35:18.061234	2015-08-28 03:35:18.061234
6	78	JobRate	5	1	speed	2015-08-28 03:35:18.906786	2015-08-28 03:35:18.906786
8	83	JobRate	5	1	speed	2015-08-30 14:16:33.022197	2015-08-30 14:16:33.022197
7	83	JobRate	5	1	job_general	2015-08-30 14:16:31.951831	2015-08-30 14:16:34.230398
9	79	JobRate	0	1	job_general	2015-09-02 06:29:04.462832	2015-09-02 06:29:04.462832
10	86	JobRate	0	1	job_general	2015-09-02 06:29:06.544276	2015-09-02 06:29:06.544276
11	87	JobRate	4	1	job_general	2015-09-02 06:29:08.334298	2015-09-02 06:29:08.334298
\.


--
-- Name: rating_caches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('rating_caches_id_seq', 11, true);


--
-- Data for Name: read_marks; Type: TABLE DATA; Schema: public; Owner: George
--

COPY read_marks (id, readable_id, readable_type, user_id, "timestamp") FROM stdin;
609	\N	LineItem	2	2015-08-25 01:22:56.011553
610	\N	User	2	2015-08-25 01:22:56.01461
611	\N	Interview	2	2015-08-25 01:22:56.016574
612	\N	TalentPool	2	2015-08-25 01:22:56.019701
613	71	LineItem	30001	2015-08-18 14:14:23.667487
614	\N	LineItem	3	2015-08-31 01:21:36.940683
615	\N	User	3	2015-08-31 01:21:36.944996
616	\N	Interview	3	2015-08-31 01:21:36.9472
617	\N	TalentPool	3	2015-08-31 01:21:36.949263
618	\N	LineItem	4	2015-09-01 03:15:16.094508
619	\N	User	4	2015-09-01 03:15:16.099153
620	\N	Interview	4	2015-09-01 03:15:16.101196
621	\N	TalentPool	4	2015-09-01 03:15:16.103644
622	\N	LineItem	5	2015-09-01 06:25:55.830144
623	\N	User	5	2015-09-01 06:25:55.833897
624	\N	Interview	5	2015-09-01 06:25:55.835924
625	\N	TalentPool	5	2015-09-01 06:25:55.838039
626	\N	LineItem	6	2015-09-01 10:11:27.741152
627	\N	User	6	2015-09-01 10:11:27.746541
628	\N	Interview	6	2015-09-01 10:11:27.74898
629	\N	TalentPool	6	2015-09-01 10:11:27.750973
630	\N	LineItem	7	2015-09-02 01:04:26.932694
631	\N	User	7	2015-09-02 01:04:26.937406
632	\N	Interview	7	2015-09-02 01:04:26.939575
633	\N	TalentPool	7	2015-09-02 01:04:26.942313
634	\N	LineItem	8	2015-09-02 06:27:12.97324
635	\N	User	8	2015-09-02 06:27:12.978195
636	\N	Interview	8	2015-09-02 06:27:12.98148
637	\N	TalentPool	8	2015-09-02 06:27:12.984209
638	69	LineItem	30001	2015-08-18 14:14:23.650407
639	68	LineItem	30001	2015-08-18 14:14:23.64279
640	67	LineItem	30001	2015-08-18 14:14:23.635769
641	64	LineItem	30001	2015-08-18 14:14:23.605935
642	65	LineItem	30001	2015-08-18 14:14:23.620236
643	66	LineItem	30001	2015-08-18 14:14:23.626116
529	\N	LineItem	1	2015-08-18 12:57:40.270636
530	\N	User	1	2015-08-18 12:57:40.275358
531	\N	Interview	1	2015-08-18 12:57:40.277394
532	\N	TalentPool	1	2015-08-18 12:57:40.279301
533	\N	LineItem	30001	2015-08-18 14:14:18.340173
534	\N	User	30001	2015-08-18 14:14:18.343258
535	\N	Interview	30001	2015-08-18 14:14:18.346203
536	\N	TalentPool	30001	2015-08-18 14:14:18.348227
537	\N	LineItem	10000	2015-08-18 14:14:21.057289
538	\N	User	10000	2015-08-18 14:14:21.059579
539	\N	Interview	10000	2015-08-18 14:14:21.061674
540	\N	TalentPool	10000	2015-08-18 14:14:21.063815
541	\N	LineItem	10001	2015-08-18 14:14:21.104983
542	\N	User	10001	2015-08-18 14:14:21.107013
543	\N	Interview	10001	2015-08-18 14:14:21.108951
544	\N	TalentPool	10001	2015-08-18 14:14:21.110881
545	\N	LineItem	10002	2015-08-18 14:14:21.13921
546	\N	User	10002	2015-08-18 14:14:21.141839
547	\N	Interview	10002	2015-08-18 14:14:21.144764
548	\N	TalentPool	10002	2015-08-18 14:14:21.146948
549	\N	LineItem	10003	2015-08-18 14:14:21.177347
550	\N	User	10003	2015-08-18 14:14:21.180538
551	\N	Interview	10003	2015-08-18 14:14:21.183593
552	\N	TalentPool	10003	2015-08-18 14:14:21.207943
553	\N	LineItem	10004	2015-08-18 14:14:21.253511
554	\N	User	10004	2015-08-18 14:14:21.257855
555	\N	Interview	10004	2015-08-18 14:14:21.261198
556	\N	TalentPool	10004	2015-08-18 14:14:21.263764
557	\N	LineItem	10005	2015-08-18 14:14:21.292089
558	\N	User	10005	2015-08-18 14:14:21.294601
559	\N	Interview	10005	2015-08-18 14:14:21.29726
560	\N	TalentPool	10005	2015-08-18 14:14:21.299188
561	\N	LineItem	10006	2015-08-18 14:14:21.324823
562	\N	User	10006	2015-08-18 14:14:21.326996
563	\N	Interview	10006	2015-08-18 14:14:21.328875
564	\N	TalentPool	10006	2015-08-18 14:14:21.330794
565	\N	LineItem	10007	2015-08-18 14:14:21.363421
566	\N	User	10007	2015-08-18 14:14:21.365987
567	\N	Interview	10007	2015-08-18 14:14:21.36819
568	\N	TalentPool	10007	2015-08-18 14:14:21.370156
569	\N	LineItem	10008	2015-08-18 14:14:21.402436
570	\N	User	10008	2015-08-18 14:14:21.404671
571	\N	Interview	10008	2015-08-18 14:14:21.406576
572	\N	TalentPool	10008	2015-08-18 14:14:21.40848
573	\N	LineItem	10009	2015-08-18 14:14:21.443415
574	\N	User	10009	2015-08-18 14:14:21.4457
575	\N	Interview	10009	2015-08-18 14:14:21.447564
576	\N	TalentPool	10009	2015-08-18 14:14:21.449499
577	\N	LineItem	10010	2015-08-18 14:14:21.489289
578	\N	User	10010	2015-08-18 14:14:21.491311
579	\N	Interview	10010	2015-08-18 14:14:21.493259
580	\N	TalentPool	10010	2015-08-18 14:14:21.49513
581	\N	LineItem	20001	2015-08-18 14:14:23.143297
582	\N	User	20001	2015-08-18 14:14:23.145508
583	\N	Interview	20001	2015-08-18 14:14:23.147403
584	\N	TalentPool	20001	2015-08-18 14:14:23.14935
585	\N	LineItem	20002	2015-08-18 14:14:23.179134
586	\N	User	20002	2015-08-18 14:14:23.181266
587	\N	Interview	20002	2015-08-18 14:14:23.183133
588	\N	TalentPool	20002	2015-08-18 14:14:23.185022
589	\N	LineItem	20003	2015-08-18 14:14:23.214874
590	\N	User	20003	2015-08-18 14:14:23.217954
591	\N	Interview	20003	2015-08-18 14:14:23.220744
592	\N	TalentPool	20003	2015-08-18 14:14:23.223363
593	\N	LineItem	20004	2015-08-18 14:14:23.258395
594	\N	User	20004	2015-08-18 14:14:23.261658
595	\N	Interview	20004	2015-08-18 14:14:23.264689
596	\N	TalentPool	20004	2015-08-18 14:14:23.267911
597	\N	LineItem	20005	2015-08-18 14:14:23.303791
598	\N	User	20005	2015-08-18 14:14:23.30649
599	\N	Interview	20005	2015-08-18 14:14:23.309638
600	\N	TalentPool	20005	2015-08-18 14:14:23.31214
601	\N	LineItem	20006	2015-08-18 14:14:23.339297
602	\N	User	20006	2015-08-18 14:14:23.341353
603	\N	Interview	20006	2015-08-18 14:14:23.343209
604	\N	TalentPool	20006	2015-08-18 14:14:23.345105
605	\N	LineItem	20007	2015-08-18 14:14:23.370575
606	\N	User	20007	2015-08-18 14:14:23.37264
607	\N	Interview	20007	2015-08-18 14:14:23.374551
608	\N	TalentPool	20007	2015-08-18 14:14:23.3764
\.


--
-- Name: read_marks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('read_marks_id_seq', 643, true);


--
-- Data for Name: relationships; Type: TABLE DATA; Schema: public; Owner: George
--

COPY relationships (id, follower_id, followed_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: relationships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('relationships_id_seq', 1, false);


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: George
--

COPY reviews (id, author, author_id, top, body, rating, user_id, created_at, updated_at, employer, title) FROM stdin;
22	\N	10001	\N	优优是一个非常好的猎头	3	20001	2015-08-18 14:14:23.691523	2015-08-18 14:14:23.691523	\N	\N
23	\N	10001	\N	他的服务很专业	3	20002	2015-08-18 14:14:23.696035	2015-08-18 14:14:23.696035	\N	\N
24	\N	10001	\N	他的服务很专业	5	20003	2015-08-18 14:14:23.69876	2015-08-18 14:14:23.69876	\N	\N
\.


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('reviews_id_seq', 24, true);


--
-- Data for Name: saving_lists; Type: TABLE DATA; Schema: public; Owner: George
--

COPY saving_lists (id, user_id, job_id, created_at, updated_at) FROM stdin;
8	10001	10001	2015-08-18 14:14:23.758849	2015-08-18 14:14:23.758849
\.


--
-- Name: saving_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('saving_lists_id_seq', 8, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: George
--

COPY schema_migrations (version) FROM stdin;
20141210133919
20141210142114
20141211122744
20141211130135
20141213124051
20141215072319
20141215084512
20141222034419
20141226022926
20141226025847
20141231021339
20141231125726
20150104032807
20150106071443
20150106072935
20150106073345
20150108055007
20150112052409
20150113031837
20150201124635
20150204022506
20150204030153
20150204145515
20150204145519
20150205050552
20150209020546
20150215004604
20150215115322
20150415025714
20150418125611
20150424015729
20150424095955
20150426000740
20150426001717
20150427021144
20150501064310
20150501071358
20150501073934
20150503041205
20150509023646
20150524134317
20150525070033
20150526062213
20150615031117
20150615100325
20150616084203
20150617055738
20150617074743
20150618024906
20150625021529
20150626084400
20150626102544
20150703020100
20150703020101
20150703020102
20150703020103
20150703065849
20150703080127
20150704011704
20150704133957
20150728115410
20150817062824
20150825091112
20150829020338
\.


--
-- Data for Name: searches; Type: TABLE DATA; Schema: public; Owner: George
--

COPY searches (id, created_at, updated_at) FROM stdin;
\.


--
-- Name: searches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('searches_id_seq', 1, false);


--
-- Data for Name: service_rates; Type: TABLE DATA; Schema: public; Owner: George
--

COPY service_rates (id, line_item_id, created_at, updated_at) FROM stdin;
64	64	2015-08-18 14:14:23.616478	2015-08-18 14:14:23.616478
65	65	2015-08-18 14:14:23.622955	2015-08-18 14:14:23.622955
66	66	2015-08-18 14:14:23.63005	2015-08-18 14:14:23.63005
67	67	2015-08-18 14:14:23.639342	2015-08-18 14:14:23.639342
68	68	2015-08-18 14:14:23.646657	2015-08-18 14:14:23.646657
69	69	2015-08-18 14:14:23.653313	2015-08-18 14:14:23.653313
70	70	2015-08-18 14:14:23.6591	2015-08-18 14:14:23.6591
71	71	2015-08-18 14:14:23.670343	2015-08-18 14:14:23.670343
72	72	2015-08-18 14:14:23.676259	2015-08-18 14:14:23.676259
\.


--
-- Name: service_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('service_rates_id_seq', 72, true);


--
-- Data for Name: subordinates; Type: TABLE DATA; Schema: public; Owner: George
--

COPY subordinates (id, title, num, job_id, created_at, updated_at) FROM stdin;
51		\N	10001	2015-08-18 14:14:23.47469	2015-08-18 14:14:23.47469
52		\N	10002	2015-08-18 14:14:23.492123	2015-08-18 14:14:23.492123
53		\N	10003	2015-08-18 14:14:23.509024	2015-08-18 14:14:23.509024
54	工程师	30	10004	2015-08-18 14:14:23.530007	2015-08-18 14:14:23.530007
55	质量工程师	2	10005	2015-08-18 14:14:23.552595	2015-08-18 14:14:23.552595
56	销售员	10	10006	2015-08-18 14:14:23.568399	2015-08-18 14:14:23.568399
57	司机	1	10007	2015-08-18 14:14:23.587393	2015-08-18 14:14:23.587393
58		\N	2	2015-08-25 02:46:06.101988	2015-08-25 02:46:06.101988
59		\N	4	2015-08-25 06:39:19.85486	2015-08-25 06:39:19.85486
60	14	\N	5	2015-08-25 07:00:51.464562	2015-08-25 07:02:24.181163
61		\N	6	2015-08-25 10:04:06.849587	2015-08-25 10:04:06.849587
63		\N	21	2015-08-27 09:07:58.53275	2015-08-27 09:07:58.53275
64		\N	22	2015-08-28 03:33:53.459084	2015-08-28 03:33:53.459084
65		\N	23	2015-08-28 14:15:19.851234	2015-08-28 14:15:19.851234
66		\N	26	2015-08-29 10:14:23.463914	2015-08-29 10:14:23.463914
67		\N	27	2015-08-30 14:15:43.114157	2015-08-30 14:15:43.114157
68		\N	28	2015-08-31 01:28:55.4225	2015-08-31 01:28:55.4225
69	10人	\N	29	2015-09-01 01:22:18.734191	2015-09-01 01:22:18.734191
70		\N	30	2015-09-01 06:52:38.585927	2015-09-01 06:52:38.585927
71		\N	31	2015-09-01 07:56:18.698113	2015-09-01 07:56:18.698113
72		\N	32	2015-09-02 02:08:12.916415	2015-09-02 02:08:12.916415
73	50	\N	32	2015-09-02 02:08:12.918778	2015-09-02 02:08:12.918778
74		\N	33	2015-09-03 03:01:23.512865	2015-09-03 03:01:23.512865
75		\N	34	2015-09-05 03:43:59.877146	2015-09-05 03:43:59.877146
76		\N	35	2015-09-05 09:41:40.542271	2015-09-05 09:41:40.542271
\.


--
-- Name: subordinates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('subordinates_id_seq', 76, true);


--
-- Data for Name: summaries; Type: TABLE DATA; Schema: public; Owner: George
--

COPY summaries (id, content, user_id, created_at, updated_at) FROM stdin;
300	负责公司的招聘，培训，薪资福利和绩效考核	30001	2015-08-18 14:14:18.350341	2015-08-18 14:14:18.350341
301	制定公司的工资福利架构	30001	2015-08-18 14:14:18.352113	2015-08-18 14:14:18.352113
302	与CEO一起完成年度的招聘计划	30001	2015-08-18 14:14:18.353413	2015-08-18 14:14:18.353413
303	负责产品规格的制定和开发中的项目管理	10000	2015-08-18 14:14:21.066674	2015-08-18 14:14:21.066674
304	负责产品的coding,包括网页前端和后端的开发	10000	2015-08-18 14:14:21.068566	2015-08-18 14:14:21.068566
305	公司的日常管理	10000	2015-08-18 14:14:21.069964	2015-08-18 14:14:21.069964
306	熟悉SAP EDI和portable	10001	2015-08-18 14:14:21.11248	2015-08-18 14:14:21.11248
307	在博士力士乐多年的工作经验，多次荣膺AA Excellent Employee大奖	10001	2015-08-18 14:14:21.113922	2015-08-18 14:14:21.113922
308	良好的沟通技巧，热情的工作态度和开放的心态	10001	2015-08-18 14:14:21.115199	2015-08-18 14:14:21.115199
309	本人在13年的工作中积累了丰富的企业管理经验。特别是在公司运营管理和工厂制造管理等方面拥有较为先进且有效的实践经验。	10002	2015-08-18 14:14:21.148762	2015-08-18 14:14:21.148762
310	有较强的精益生产和6sigma推行实践经验.对现场控制能力较强.能够熟练运用ERP、MRP�=C8。能够独立管理和领导整个工厂或公司的全面经营	10002	2015-08-18 14:14:21.150627	2015-08-18 14:14:21.150627
311	具备较好的团队精神。英语应用熟练，可完全作为工作语言。略懂德语。	10002	2015-08-18 14:14:21.152104	2015-08-18 14:14:21.152104
312	* 具软硬电路板(FPC/PCB), SMT组装, 连接器及消费品产品开发经验，熟悉电镀，注塑，机械及电子组装，影像及蚀刻等生产过程并具有项目质量改善的经验；	10003	2015-08-18 14:14:21.211103	2015-08-18 14:14:21.211103
313	具有若干大中型（包括汽车电子、快速消费电子及多品种小产量类型）的项目立案、价格分析、新产品开发的跨功能、跨国协调的经验；	10003	2015-08-18 14:14:21.213359	2015-08-18 14:14:21.213359
314	上海财经大学全日制工商管理硕士。南京大学国际金融学士，十五年工作经验，精通电子商务物流仓储配送运作管理，擅长物流运营体系规划与仓库规划，WMS/ERP/CRM系统规划,拥有丰富的电子商务物流体系拓展,开仓,规划等经验.熟悉人员招募,培训,管理. 优秀的团队管理能力，团队培养建设能力，很强的流程优化与设计能力，责任心强,独立工作能力极强，有承担与解决问题的能力.	10004	2015-08-18 14:14:21.265854	2015-08-18 14:14:21.265854
315	本人性格热忱开朗,善于与人沟通,工作认真负责,不怕吃苦,具有很强的团队精神,协调和沟通能力,有强烈的集体荣誉感。 	10005	2015-08-18 14:14:21.301275	2015-08-18 14:14:21.301275
316	工作细心负责，适应能力强，能尽快从订单跟踪的初级角色转变为需要与供应商沟通更敏感的价格的角色。能及时处理各类紧急事件，如库存盘亏时产生的突然需求，如项目即将结束前突然的增量。\n\t  能有效与人沟通，与同事相处融洽，对待供应商更是以真诚的态度获取他们的信任与支持。\n\t  	10006	2015-08-18 14:14:21.332388	2015-08-18 14:14:21.332388
317	生活中我喜欢参加游泳、瑜伽、跳舞等活动。	10006	2015-08-18 14:14:21.333805	2015-08-18 14:14:21.333805
318	我相信只有不断的学习才能不断成长，曾为了解更多的采购知识信息主动参加2009年ISM China年会	10006	2015-08-18 14:14:21.335087	2015-08-18 14:14:21.335087
319	目前正积极自学CPSM教程。希望有一个更高的平台发挥我的能力。	10006	2015-08-18 14:14:21.336332	2015-08-18 14:14:21.336332
320	丰富的制造业跨国公司和制造业解决方案工作经验，15年的项目管理和营运经验	10007	2015-08-18 14:14:21.371773	2015-08-18 14:14:21.371773
321	丰富的计划和战略能力，领导多文化团队工作经验	10007	2015-08-18 14:14:21.373179	2015-08-18 14:14:21.373179
322	推动活动，优秀的分析问题和解决问题的能力	10007	2015-08-18 14:14:21.374407	2015-08-18 14:14:21.374407
323	熟悉PHP、Perl、编程，熟悉mysql， 是公司产品的网页部分开发的主要人员	10008	2015-08-18 14:14:21.410488	2015-08-18 14:14:21.410488
324	熟悉Javascript、Jqeury和前端MVC框架Backbone.js	10008	2015-08-18 14:14:21.411854	2015-08-18 14:14:21.411854
325	使用过Mustache、Seajs、Bootstrap和MVC框架CI	10008	2015-08-18 14:14:21.413136	2015-08-18 14:14:21.413136
326	参加过ISO9001,ISO14000,TS16949，6SIGMA培训并获得内审证书。 能熟练运用MEA,8D,QA,6SIGMA等统计手法解决生产品质异常。	10009	2015-08-18 14:14:21.451303	2015-08-18 14:14:21.451303
327	熟练植入精益生产于公司（在诺普信植入吨桶--CELL生产方式降低成品库存51%	10009	2015-08-18 14:14:21.453265	2015-08-18 14:14:21.453265
328	本人工业工程专业，从事IE/精益生产方面工作已经10多年，在流畅制造，丰田生产积累大量的工作经验，有较强的团队领导协作能力和项目推行能力	10009	2015-08-18 14:14:21.454557	2015-08-18 14:14:21.454557
329	掌握精益生产的推动，包括：5S,TPM,QCC,CELL线架设，TOC.均衡化生产，TPM，JIT，自动化和工业工程以及企业信息化专业知识；	10009	2015-08-18 14:14:21.455834	2015-08-18 14:14:21.455834
330	对LP系统规划及改善有极强的项目推动能力。熟悉日常IE,规划IE组织，品质系统手法，厂房规划，成本核算以及效率评估分析，设备嫁动率提高，设备管理等，对6SIGM项目有一定的推动能力，熟悉ERP，ERP2，SAP等系统；	10009	2015-08-18 14:14:21.457218	2015-08-18 14:14:21.457218
331	熟悉工厂生产运作流程，如电五金塑胶行业（五金冲压、注塑成型、吹塑成型、喷涂印刷、机加工组装等工艺）、化工行业（制药反应流程及工艺、灌装包装流程及工艺、包装设备的引进以及改善等）、汽车行业，汽车零配件行业流程改善；	10009	2015-08-18 14:14:21.459198	2015-08-18 14:14:21.459198
332	能够灵活与各部门进行良好的沟通，对公司质量与生产效率进行PDCA的方式改善，共同提高公司的效益	10009	2015-08-18 14:14:21.461361	2015-08-18 14:14:21.461361
333	擅长发现、思考、挑战生活中的新事物，具有对产品在制程中与设计上的改善的能力；具有较强的思考技巧，能够快速敏捷找到解决方案的方法。	10009	2015-08-18 14:14:21.462643	2015-08-18 14:14:21.462643
334	对生物发酵技术、药业GMP有一定的基础和掌握； \n\t  熟悉质量管理体系ISO9001、ISO22000、HACCP、BRC、IFS、AIB标准，熟悉GMP、SSOP；\n\t  熟悉QS和出口食品卫生注册申请要求，能够帮助企业办理QS和卫生注册申请工作。\n\t  能够独立指导企业进行质量体系认证，帮助企业建立、制定和维护质量管理体系。\n\t  	10010	2015-08-18 14:14:21.496726	2015-08-18 14:14:21.496726
335	主要负责store & retail的招聘,维护和发展客户关系	20001	2015-08-18 14:14:23.150978	2015-08-18 14:14:23.150978
336	选择和推荐合适的候选人并进行面试	20001	2015-08-18 14:14:23.152355	2015-08-18 14:14:23.152355
337	流程管理,工资商议以及候选人的follow-up	20001	2015-08-18 14:14:23.153639	2015-08-18 14:14:23.153639
338	A results-driven professional, I am passionate about bringing a positive experience to my clients and value to my organization through: Accountable Execution and Passionate Delivery. With predominant experience in sales and business development in Asia, I have worked with clients ranging from MNCs to SMEs and government organizations throughout the region. I commit to providing a focussed, targeted and personal approach to my clients, operating with transparency, accountability and passion.	20002	2015-08-18 14:14:23.186615	2015-08-18 14:14:23.186615
339	擅长工业销售，化工，医疗器械，包装电子，通讯等行业的人才推荐	20003	2015-08-18 14:14:23.225559	2015-08-18 14:14:23.225559
340	擅长工业销售，化工，医疗器械，包装电子，通讯等行业的人才推荐	20004	2015-08-18 14:14:23.270328	2015-08-18 14:14:23.270328
341	擅长工业销售，化工，医疗器械，包装电子，通讯等行业的人才推荐	20005	2015-08-18 14:14:23.314003	2015-08-18 14:14:23.314003
342	擅长工业销售，化工，医疗器械，包装电子，通讯等行业的人才推荐	20006	2015-08-18 14:14:23.346795	2015-08-18 14:14:23.346795
343	擅长工业销售，化工，医疗器械，包装电子，通讯等行业的人才推荐	20007	2015-08-18 14:14:23.378055	2015-08-18 14:14:23.378055
344	一个靠谱的人	2	2015-08-25 01:25:10.453292	2015-08-25 01:25:10.453292
\.


--
-- Name: summaries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('summaries_id_seq', 344, true);


--
-- Data for Name: talent_pools; Type: TABLE DATA; Schema: public; Owner: George
--

COPY talent_pools (id, hunter_id, talent_id, created_at, updated_at) FROM stdin;
29	20002	10001	2015-08-18 14:14:23.76753	2015-08-18 14:14:23.76753
30	20002	10003	2015-08-18 14:14:23.770711	2015-08-18 14:14:23.770711
31	20002	10004	2015-08-18 14:14:23.773162	2015-08-18 14:14:23.773162
32	20002	10005	2015-08-18 14:14:23.776655	2015-08-18 14:14:23.776655
\.


--
-- Name: talent_pools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('talent_pools_id_seq', 32, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: George
--

COPY users (id, mobile, user_name, true_name, user_type, base_salary, month_num, bonus, housing, transport, stock, stock_num, retention_bonus, expect_package, expect_month_salary, birthday, city, title, created_at, updated_at, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, industry, focus_job1, focus_job2, focus_job3, bank_id, verify) FROM stdin;
10001	13916310001	Aaron Qin	秦义寿	求职者	10000	13	50000	10200	56000	股票	1000	\N	\N	\N	1978-09-11	上海	顾问	2015-08-18 14:14:21.101834	2015-08-18 14:14:21.101834	aaronqin@test.com	$2a$10$V1vtFPUJe9DdJAiTBAgvDez92XyXMW6Reqm3kpY93hKIDg.H2.vpu	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-18 14:14:21.04246	\N	\N	Aaron_Qin.png	image/png	124734	2015-08-18 14:14:18.620014	\N	\N	\N	\N	\N	\N
10002	13916310002	马贵耀	马贵耀	求职者	10000	13	50000	10200	56000	股票	1000	\N	\N	\N	1978-09-11	苏州	营运经理	2015-08-18 14:14:21.135858	2015-08-18 14:14:21.135858	mgy@test.com	$2a$10$KIEPiMKx92U/3riTn7z5puqlZq6ErcGTj/Yc/c.p7.SfKmemrCyci	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-18 14:14:21.042562	\N	\N	马贵耀.png	image/png	188818	2015-08-18 14:14:18.825872	\N	\N	\N	\N	20002	\N
10003	13916310003	储海春	储海春	求职者	10000	13	50000	10200	56000	股票	1000	\N	\N	\N	1978-09-11	南京	运营经理	2015-08-18 14:14:21.173902	2015-08-18 14:14:21.173902	743278938@139.com	$2a$10$EMD9BF2ayibvQxmsoU.oYuZkxknPAAFR9vE26VZz1L2OaS7Y48nym	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-18 14:14:21.042672	\N	\N	储海春.png	image/png	259443	2015-08-18 14:14:19.058183	\N	\N	\N	\N	\N	\N
10004	13916310004	朱明	Ming	求职者	23000	13	52000	10200	56000	股票	1000	\N	\N	\N	1978-09-11	南京	物流总监	2015-08-18 14:14:21.246177	2015-08-18 14:14:21.246177	zm@test.com	$2a$10$KbAScxzXr5HIJc7G61IFLOphtQreRN.Q6R72BTAl1GRbvVu7EAoEG	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-18 14:14:21.042769	\N	\N	Ming.png	image/png	149329	2015-08-18 14:14:19.322429	\N	\N	\N	\N	\N	\N
10005	13916310005	Minnie She	佘俊芝	求职者	10000	13	50000	10200	56000	股票	1000	\N	\N	\N	1978-09-11	宁波	软件工程师	2015-08-18 14:14:21.289275	2015-08-18 14:14:21.289275	minnieshe@test.com	$2a$10$wjO4aeUS0C2R0h3fHzdWuenXLUt/W/yOfEwDebn7A8.Ogkv3ffBU2	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-18 14:14:21.042871	\N	\N	MinnieShe.png	image/png	131208	2015-08-18 14:14:19.533202	\N	\N	\N	\N	\N	\N
10006	13916310006	余婷章	余婷章	求职者	10000	13	50000	10200	56000	股票	1000	\N	\N	\N	1978-09-11	洛阳	采购经理	2015-08-18 14:14:21.322083	2015-08-18 14:14:21.322083	ytz@test.com	$2a$10$lUA7vM5hnmCzFc48L94N0eBBq9XZNcH42O8FJjzzDLQkJz55pg1vG	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-18 14:14:21.042976	\N	\N	余婷章.png	image/png	112438	2015-08-18 14:14:19.743545	\N	\N	\N	\N	\N	\N
10007	13916310007	刘海健	刘海健	求职者	10000	13	50000	10200	56000	股票	1000	\N	\N	\N	1978-09-11	上海	生产经理	2015-08-18 14:14:21.359073	2015-08-18 14:14:21.359073	lhj@test.com	$2a$10$9NUB8G11.7PTXKnHYYMof.a3xQd4PtmJa3AmseTrcW3YWYX1QYC2e	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-18 14:14:21.043072	\N	\N	刘海建.png	image/png	273237	2015-08-18 14:14:19.945081	\N	\N	\N	\N	\N	\N
10008	13916310008	刘栋	Liu Dong	求职者	10000	13	50000	10200	56000	股票	1000	\N	\N	\N	1978-09-11	上海	开发工程师	2015-08-18 14:14:21.398175	2015-08-18 14:14:21.398175	ld@test.com	$2a$10$5ofIq91ERdVh6Lhl606gCeIUtn2sfnIbk1InKd59F4yZjrvkNHGjW	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-18 14:14:21.043175	\N	\N	刘栋.png	image/png	247959	2015-08-18 14:14:20.190689	\N	\N	\N	\N	\N	\N
10009	13916310009	代洪彪	Dai	求职者	10000	13	50000	10200	56000	股票	1000	\N	\N	\N	1978-09-11	嘉兴	\N	2015-08-18 14:14:21.4396	2015-08-18 14:14:21.4396	dhb@test.com	$2a$10$xxnvPfQUsggCmBbUYi9wUeWXdF2znC88xmIBb2IGtFH2dUCiVqqwi	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-18 14:14:21.043264	\N	\N	代洪彪.png	image/png	725080	2015-08-18 14:14:20.452514	\N	\N	\N	\N	\N	\N
10010	13916310010	吴先生	吴先生	求职者	10000	13	50000	10200	56000	股票	1000	\N	\N	\N	1978-09-11	上海	品保经理	2015-08-18 14:14:21.486553	2015-08-18 14:14:21.486553	wxs@test.com	$2a$10$pRwc4GLNVks4LoCJ2JhSFOb2G5szISsw0GHmhUxP4M2GEL7/RNR2W	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-18 14:14:21.043364	\N	\N	wxs.png	image/png	193756	2015-08-18 14:14:20.826825	\N	\N	\N	\N	\N	\N
20001	13916320001	Sophy Song	宋优优	猎头	10000	13	50000	10200	56000		\N	\N	\N	\N	1982-09-11	上海	高级猎头顾问	2015-08-18 14:14:23.139845	2015-08-18 14:14:23.139845	syy@test.com	$2a$10$6V9gydv2OoahtlKucueSEO.EGeavpJahnl8DMSJ08RUSw3C12vmbe	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-18 14:14:23.132053	\N	\N	宋优优.png	image/png	42792	2015-08-18 14:14:21.517186	快消	采购经理	\N	\N	\N	\N
20003	13916320003	沈丽君	沈傲君	猎头	10000	13	50000	10200	56000		\N	\N	\N	\N	1982-09-11	广州	猎头顾问	2015-08-18 14:14:23.209629	2015-08-18 14:14:23.209629	slj@test.com	$2a$10$zOMcwKoxyVUyiRY/RjYkxeuw87mb1mpFfnocUGgOLssAXDkJejWMS	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-18 14:14:23.132357	\N	\N	slj.png	image/png	56171	2015-08-18 14:14:22.091191	工业	销售经理	部门总监	财务总监	\N	\N
20004	13916320004	天使之翼	天使之翼	猎头	10000	13	50000	10200	56000		\N	\N	\N	\N	1982-09-11	上海	猎头顾问	2015-08-18 14:14:23.254166	2015-08-18 14:14:23.254166	tszy@test.com	$2a$10$sOFsNzmAND/3EjixjBQR4u0hwGJYtAA.t2/GWqF.qzsoeiyl0KB1i	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-18 14:14:23.132471	\N	\N	天使之翼.png	image/png	149124	2015-08-18 14:14:22.285073	快消	销售经理	部门总监	财务总监	\N	\N
20005	13916320005	陈大同	陈大同	猎头	10000	13	50000	10200	56000		\N	\N	\N	\N	1982-09-11	上海	猎头顾问	2015-08-18 14:14:23.299326	2015-08-18 14:14:23.299326	cdt@test.com	$2a$10$kec57REXjPEOtUuzHoLKcuM7pdA5P/763pHPqcF1VaH1/O5XvTRn.	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-18 14:14:23.132565	\N	\N	陈大同.png	image/png	93250	2015-08-18 14:14:22.499399	快消	销售经理	部门总监	财务总监	\N	\N
20006	13916320006	Ramond	Ramond	猎头	10000	13	50000	10200	56000		\N	\N	\N	\N	1982-09-11	上海	猎头顾问	2015-08-18 14:14:23.336235	2015-08-18 14:14:23.336235	r@test.com	$2a$10$oWXPaSHHC5bdcNR6HxJ5Y.Rq3v5cADj6oW3Y9SZjUsAlwBTr5MiWy	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-18 14:14:23.132661	\N	\N	Ramond.png	image/png	85379	2015-08-18 14:14:22.694747	奢侈品	销售经理	部门总监	财务总监	\N	\N
20007	13916320007	千寻	千寻	猎头	10000	13	50000	10200	56000		\N	\N	\N	\N	1982-09-11	上海	猎头顾问	2015-08-18 14:14:23.367581	2015-08-18 14:14:23.367581	qx@test.com	$2a$10$XA9CMC5ps6R/tAKLyV3UL.aWHZEql0HBVGHe.9NXZJ3IBl4GG1Igm	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-18 14:14:23.132749	\N	\N	千寻.png	image/png	219230	2015-08-18 14:14:22.898265	复合肥料	销售经理	部门总监	财务总监	\N	\N
3	18817556322	subwitch	雷霄	猎头	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1988-12-16	上海	\N	2015-08-31 01:21:34.498298	2015-08-31 01:32:48.865772	634939115@qq.com	$2a$10$zLh/LAXbZ5xJCKO6MpPpEejiDTTsQf8jem5BglXMZ310QtHmirPRa	\N	\N	\N	1	2015-08-31 01:32:48.864648	2015-08-31 01:32:48.864648	58.246.241.214	58.246.241.214	Whw46BvRkDqNJZP2sv8p	2015-08-31 01:32:48.856221	2015-08-31 01:21:34.81179	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	13810318004	猎头邢宝杰	邢宝杰	猎头	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1985-04-21	北京		2015-09-01 03:15:11.516425	2015-09-01 03:18:43.904119	1226289191@qq.com	$2a$10$UA4HlEbTLyJq9fFZtLuWH.IDj2aiGtos.UIHeNOCZ3.KB1JDzAfiS	\N	\N	\N	1	2015-09-01 03:18:29.129516	2015-09-01 03:18:29.129516	120.131.251.139	120.131.251.139	Dhyocd3nTVdNt-N4Ewdj	2015-09-01 03:18:29.121215	2015-09-01 03:15:11.829596	\N	1.png	image/png	576	2015-09-01 03:15:11.429124	\N	\N	\N	\N	\N	\N
2	13900000001	Jack	陆明	人事	20000	1	500000	0	3000	股票	10000	\N	1000000	30000	1980-08-25	上海	HR Manager	2015-08-25 01:22:53.258277	2015-08-28 03:24:37.089209	support@lieleme.com	$2a$10$Oj1uG/Esx21n2lqbYDZWLuZYSdaLCFSRrEiy/UFp8yTttoQ.0Vyd2	\N	\N	\N	8	2015-08-28 03:24:37.087602	2015-08-25 03:44:46.424463	112.64.209.103	112.64.209.103	nCsUwViqAysjHsGh9cLS	2015-08-25 01:24:39.54562	2015-08-25 01:22:53.541308	\N	Screen_Shot_2015-08-25_at_09.22.07.png	image/png	133390	2015-08-25 01:22:53.076688	\N	\N	\N	\N	\N	hr
30001	13916330001	潘其多	潘其多	人事	10000	13	50000	10200	56000		\N	\N	\N	\N	1982-09-11	上海	人事经理	2015-08-18 14:14:18.324531	2015-09-05 03:31:22.979748	pqd@test.com	$2a$10$S6gnzTpk0sNi0nuo11K7xut960qq8dKJl1gRI5ku3EXXfNrvjS0h2	\N	\N	\N	5	2015-09-05 03:31:22.978081	2015-08-29 09:46:46.675849	112.64.209.103	112.64.209.103	\N	2015-08-18 14:14:18.311121	\N	\N	潘其多.png	image/png	401396	2015-08-18 14:14:17.951577	快消	\N	\N	\N	10000	hr
5	13601623178	Thomas	傅涛	猎头	\N	\N	\N	\N	\N	股票	\N	\N	\N	\N	1983-11-10	上海	Partner	2015-09-01 06:25:53.355096	2015-09-01 06:27:50.835926	14119085@qq.com	$2a$10$jA7atOAahMFxvcI42poeNex/VBtsSJ1OS9Ngrqd9WVTU/STnw/a5C	\N	\N	\N	1	2015-09-01 06:26:03.238064	2015-09-01 06:26:03.238064	180.173.84.255	180.173.84.255	pRz3dFyHtMu-GMiN-Laz	2015-09-01 06:26:03.23095	2015-09-01 06:25:53.643802	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	15021691873	dannysuen	DS	求职者	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-01	Shanghai	\N	2015-09-01 10:11:24.931477	2015-09-01 10:12:00.530903	sunnyhust2005@qq.com	$2a$10$YEyNGjJmmMpiARajJz7QZeStl.2XKZ0ker7cmUlgW6COEMtb4naEm	\N	\N	\N	2	2015-09-01 10:12:00.528673	2015-09-01 10:11:47.865259	180.168.34.146	180.168.34.146	vLK_C5suRNBN1XfrwHTJ	2015-09-01 10:11:47.856037	2015-09-01 10:11:25.237443	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20002	13916382071	Duke	Guan	猎头	10000	13	50000	10200	56000		\N	\N	\N	\N	1982-09-11	北京	猎头顾问	2015-08-18 14:14:23.175553	2015-09-01 13:54:24.601745	13916382071@139.com	$2a$10$fo7tilwLlf6m2jDdKkhLe.tb5LRp5vxT4Rh84UDFnCiewEPdo.ZfO	\N	\N	\N	8	2015-09-01 13:54:24.599535	2015-08-27 09:11:04.843767	112.64.209.103	112.64.209.103	\N	2015-08-18 14:14:23.132253	\N	\N	Duke.png	image/png	790556	2015-08-18 14:14:21.706577	管理岗位	CEO	Sales Director	HR Director	\N	\N
7	15902133380	harmon	施宜	求职者	\N	\N	\N	\N	\N	股票	\N	\N	\N	\N	1972-02-16	上海	Merchandiser Manager	2015-09-02 01:04:23.474334	2015-09-02 01:18:22.376338	roverharmon@hotmail.com	$2a$10$4ELJXggztGLwM1QEIqPvQOswbS2bvIRra3YGERclJ/03eqEbI4zba	\N	\N	\N	1	2015-09-02 01:05:21.645948	2015-09-02 01:05:21.645948	180.157.5.222	180.157.5.222	eyX22ybL-5zLdBvhG6rn	2015-09-02 01:05:21.640035	2015-09-02 01:04:23.778625	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	13180277751	Jack	赵杰	猎头	\N	\N	\N	\N	\N	股票	\N	\N	\N	\N	1987-09-02	上海	高级顾问	2015-09-02 06:27:08.547765	2015-09-02 06:28:18.343487	77591404@qq.com	$2a$10$XHgC.xP6bJ1RtI6IhsgPEeNfTvYW4lxFphftfRZwhPo./Bg7aT2Cu	\N	\N	\N	1	2015-09-02 06:27:27.162611	2015-09-02 06:27:27.162611	121.22.194.203	121.22.194.203	V7RevjXucd6n5xCNyP7h	2015-09-02 06:27:27.157147	2015-09-02 06:27:08.833645	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10000	13916382071	乔吉	乔吉	人事	10000	13	50000	10200	56000		\N	\N	\N	\N	1982-09-11	上海	招聘经理	2015-08-18 14:14:21.052888	2015-09-05 09:36:28.932952	cvsend@139.com	$2a$10$OL7KL4tsg/0OVpJnDscmbuvmrY2Ez6d9PUTm1OYSvfE.JkooyAzzu	\N	\N	\N	14	2015-09-05 09:36:28.929853	2015-09-05 03:31:08.589652	112.64.209.103	112.64.209.103	\N	2015-08-18 14:14:21.042188	\N	\N	george.jpeg	image/png	230981	2015-08-18 14:14:18.377329	快消	人事	\N	\N	\N	hr
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('users_id_seq', 8, true);


--
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: George
--

COPY votes (id, votable_id, votable_type, voter_id, voter_type, vote_flag, vote_scope, vote_weight, created_at, updated_at) FROM stdin;
1	1	Comment	2	User	t	\N	1	2015-08-28 03:35:26.581786	2015-08-28 03:35:26.581786
2	4	Comment	10000	User	t	\N	1	2015-08-31 01:32:00.893913	2015-08-31 01:32:00.893913
\.


--
-- Name: votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('votes_id_seq', 2, true);


--
-- Data for Name: works; Type: TABLE DATA; Schema: public; Owner: George
--

COPY works (id, title, employer, industry, join_date, leave_date, job_scope, user_id, created_at, updated_at, uptonow) FROM stdin;
145	HR Manager	某公司	信息技术和人力资源	2012-09-03	2014-10-31	领导20个人的人力资源部门	30001	2015-08-18 14:14:18.357642	2015-08-18 14:14:18.357642	\N
147	经理	万宝盛华(Manpower)	人力资源	2012-09-01	2014-10-31	开发猎头业务,带领猎头团队进行人才搜寻	10000	2015-08-18 14:14:21.075126	2015-08-18 14:14:21.075126	\N
149	SAP顾问	博世力士乐	汽车电子	2007-09-01	2010-08-31	负责SAP MM模块的日常管理	10001	2015-08-18 14:14:21.118406	2015-08-18 14:14:21.118406	\N
150	运营经理	伊顿液压	工业	2000-09-01	2010-08-31	负责伊顿宁波工厂生产部，包括金工车间，装配车间和总成车间以及生产计划，制造工程和工艺管理，设备维修部门的各项管理工作。\n\t\t\t\t1.建立和完善工厂运营团队的组织架构和管理体系。\n\t\t\t\t2.组织落实、监督、调控生产过程各项安全、质量、交期、成本、效率等各项BSC指标。\n\t\t\t\t3.组织实施和推进精益生产文化。\n\t\t\t\t4.确保ISO质量管理体系在生产运营方面得到良好的运行。\n\t\t\t\t5.组织制定公司运营年度总预算和每季度预算调整。\n\t\t\t\t6.根据公司绩效管理体系为运营部门和个人设定合理的年度KPI和绩效目标。\n\t\t\t\t7.根据销售订单要求制订和调整生产部门月度和每周生产计划以确保完成交货要求。\n\t\t\t\t8.固定资产和关键重要设备的申购评估，审批和过程管控。\n\t\t\t\t9.根据年度VSM和VSA进行车间生产布局和规划，并持续发现改进点，有效改进和完善。\n\t\t\t\t10.通过领导和推进RIE, KAIZEN, 全员合理化建议等持续改进和降低内部全面生产成本。\n\t\t\t\t11.与技术部门密切合作进行新产品开发、技术和工艺流程革新及产品质量改进，提高材料利用率。\n\t\t\t\t12.生产营运体系的人员优化配置和组织管理，通过培训和评估体系建立、发展和完善工厂运营团队。\n\t\t\t\t13.与销售、人力资源、供应链，财务等部门的跨部门沟通协调。\n\t\t\t\t14.参与工厂Eaton亚太和大中华区各个级别的优秀运营评估和各类内部管理审核。\n\t\t\t\t15.参与工厂的年度战略规划。\n\t\t\t\t16.新产品项目及生产运营过程中的新项目推进。\n\t\t\t\t	10002	2015-08-18 14:14:21.155615	2015-08-18 14:14:21.155615	\N
151	运营经理	XP Power	工业	2000-09-01	2010-08-31	根据公司中长期目标，发展和实施相应策略和措施，管理和控制营运部门包括生产、计划、项目、工程、物料及物流以达成工厂营运成本、产品交期和质量的目标	10003	2015-08-18 14:14:21.2188	2015-08-18 14:14:21.2188	\N
152	物流总监	俏物悄语	电商	2000-09-01	2010-08-31	负责仓储运营的管理，包括：计划,收货,上架,拣货,包装,盘点,下架,退货,QC,辑核客退，防损等部门操作的管理、协调与控制，以及耗材使用的物料计划及库存管理; 	10004	2015-08-18 14:14:21.269696	2015-08-18 14:14:21.269696	\N
153	软件工程师	讯孚软件	软件开发	2000-09-01	2010-08-31	我们为耀庭国际物流公司开发的库存管理系统,主要方便管理仓库的货物出入,以及记录货物的详细信息.\n\t\t\t\t【系统界面】 \n\t\t\t\t系统的UI界面,为客户提供友好的操作界面. \n\t\t\t\t1)货物管理:搭建货物管理的前台界面,提供货物出入库的添加操作.\n\t\t\t\t2)档案设置:搭建档案设置的前台界面,提供档案的添加、删除、修改操作.\n\t\t\t\t3)查询统计:搭建查询统计的前台界面,提供所有数据的查询操作.\n\t\t\t\t4)系统维护:搭建系统维护的前台界面,提供数据管理的操作. \n\t\t\t\t【货物管理】 \n\t\t\t\t货物管理的后台管理，为客户提供货物的出入库操作.\n\t\t\t\t1)入库管理:为货物的入库提供 货物编号、名称、数量 等 一些操作. \n\t\t\t\t2)出库管理:为货物的出库提供 货物编号、名称、数量 等 一些操作. \n\t\t\t\t3)借货还货管理:添加货物的借出的记录信息.\n\t\t\t\t4)还货管理:添加货物的归还的记录信息.\n\t\t\t\t	10005	2015-08-18 14:14:21.304601	2015-08-18 14:14:21.304601	\N
154	采购经理	联想(上海)电子科技有限公司	电子	2000-09-01	2010-08-31	先期作为原材料采购，主要负责1）每日查看SAP系统，根据公司内部用料需求制作采购订单。 \n\t\t\t\t2）监督供应商按时、保质、保量出货。\n\t\t\t\t3）根据公司对供应商战略、及供应商生产能力分配物料采购。\n\t\t\t\t4）根据生产计划部、客户跟单部的特殊要求，对紧急物料的跟催。\n\t\t\t\t5）处理供应商来料时因材料或包装不合格引起的退换货问题。\n\t\t\t\t6）定期向供应商提供物料需求计划，以便供应商备库。\n\t\t\t\t7）维护物料编号及价格。\n\t\t\t\t8）定期评估供应商送货准时率、服务水平、供应能力、社会责任等各方面指标，并督促其持续改进。 \n\t\t\t\t9）对主要供应商进行年度审核，保证其发展符合公司战略需要。 \n\t\t\t\t	10006	2015-08-18 14:14:21.339399	2015-08-18 14:14:21.339399	\N
155	生产经理	江阴万奇内饰系统有限公司	汽车零部件	2013-01-01	2015-01-01	•\t重新建立高效的公司组织架构，建立规划制造设施和对所有资源的有效使用的规划.\n\t\t\t\t•\t直接管理包括生产，质量，工程，采购，财务，人力资源和物流等部门.\n\t\t\t\t•\t全面负责本地业务的操作和执行，开发和提交计划及定期目标.\n\t\t\t\t•\t带领一组高度积极的管理团队来定义和执行计划，以达成财务目标及结果\n\t\t\t\t•\t执行公司的策略和指导方针，倡导良好的公司文化和团队合作.\n\t\t\t\t•\t开发节约成本和高质量合格的供应商，保持产品高标准的质量要求，领导ISO9001/TS16949质量体系的实施.\n\t\t\t\t	10007	2015-08-18 14:14:21.378049	2015-08-18 14:14:21.378049	\N
156	开发工程师	上海优刻得云计算技术有限公司	计算机	2000-09-01	2010-08-31	cdn控制台的开发包括html+css+js+php的前后端开发,公司主营产品云主机控制台（富客户端）的开发，主要负责html+css+js+php的前后端开发以及参与需求讨论和产品发布	10008	2015-08-18 14:14:21.416807	2015-08-18 14:14:21.416807	\N
157	生产经理	北汽模塑科技有限公司	汽车零部件	2000-09-01	2010-08-31	•\t保证生产绩效指标：生产总合格率：95%；一次合格率：85%；计划完成率100%；\n\t\t\t\t•\t工艺管理：现行产品工艺批量事故为0；新产品工艺验证确立：组织试生产工艺文件编审批，下发试生产工艺文件；\n\t\t\t\t•\t注塑工艺，喷涂工艺，组装装配工艺的监控与优化\n\t\t\t\t•\t生产成本的标准制定，监控管理，cost down等\n\t\t\t\t•\t设备快速换线，换模（SEMD）\n\t\t\t\t•\t整个生产流程优化，采用一个流以及看板管理，降低库存。\n\t\t\t\t	10009	2015-08-18 14:14:21.467281	2015-08-18 14:14:21.467281	\N
158	品保经理	上海小南国餐饮管理有限公司	餐饮	2000-09-01	2010-08-31	1、负责中央工厂（厨房）年度工作计划的制定和组织实施；\n\t\t\t\t2、负责中央厨房质量体系的建立、维护、更新工作，定期报告质量体系的运行情况；\n\t\t\t\t3、负责部门内部人员的工作安排及监督部门人员的工作；\n\t\t\t\t	10010	2015-08-18 14:14:21.500065	2015-08-18 14:14:21.500065	\N
159	高级猎头顾问	华德士	猎头	2001-09-03	2014-10-31	开发猎头业务,带领猎头团队进行人才搜寻	20001	2015-08-18 14:14:23.156978	2015-08-18 14:14:23.156978	\N
146	高级招聘经理	又招了电子商务	招聘经理	2012-09-01	2014-10-01	开发猎头业务,带领猎头团队进行人才搜寻	10000	2015-08-18 14:14:21.07339	2015-09-01 01:17:33.475214	\N
148	人力资源经理	猎了么	信息技术和人力资源	2012-09-01	2014-10-01	开发猎头业务,带领猎头团队进行人才搜寻	10000	2015-08-18 14:14:21.077218	2015-09-01 01:18:52.995082	\N
160	Executive Search Consultant	华德士	猎头	2007-09-01	2014-12-01	Executive Search	20002	2015-08-18 14:14:23.190229	2015-08-18 14:14:23.190229	\N
161	猎头顾问	华德士	猎头	2007-09-01	2014-12-01	Executive Search	20003	2015-08-18 14:14:23.229715	2015-08-18 14:14:23.229715	\N
162	猎头顾问	Adecco	猎头	2007-09-01	2014-12-01	Executive Search	20004	2015-08-18 14:14:23.275128	2015-08-18 14:14:23.275128	\N
163	猎头顾问	光辉国际	猎头	2007-09-01	2014-12-01	Executive Search	20005	2015-08-18 14:14:23.317868	2015-08-18 14:14:23.317868	\N
164	猎头顾问	海德思哲	猎头	2007-09-01	2014-12-01	Executive Search	20006	2015-08-18 14:14:23.350036	2015-08-18 14:14:23.350036	\N
165	猎头顾问	海德思哲	猎头	2007-09-01	2014-12-01	Executive Search	20007	2015-08-18 14:14:23.381296	2015-08-18 14:14:23.381296	\N
166	项目经理	猎了么	招聘	2015-08-01	2015-08-01	运营100多家企业的招聘活动，起到HR和猎头的桥梁,完成每年400万的业绩指标。	2	2015-08-25 01:29:18.426303	2015-08-25 01:29:18.426303	t
167	合伙人	信领人才	咨询	2007-01-01	2015-09-01		5	2015-09-01 06:27:41.122376	2015-09-01 06:27:41.122376	t
168	Commercial & Operating Coordinator 	Sinotrans Jinling Co.,Ltd	logistic	1993-07-01	1995-03-01	-Marketing Research, Analysis and Report;\r\n-Coordinating with operation, Sales & Documents Dept; \r\n-Equipment Controlling;	7	2015-09-02 01:18:13.521309	2015-09-02 01:18:13.521309	f
169	 Assistant Manager	China Jin Mao (Group) Co., Ltd.	foreign trade	1995-04-01	2000-03-01	-Source new vendors with good price, terms, quality and delivery\r\n-Issuing PO per price, quantity , delivery agreement made, order follow-up.  Supervising and coordinating process of trading;\r\n-Expanding business scope, in both category and territory;\r\nLeading the whole sales team, responsible for team appearance, achievements & doing sales report, etc.	7	2015-09-02 01:18:13.524686	2015-09-02 01:18:13.524686	f
170	Deputy Manager 	Shanghai New Star Imp. & Exp. Co., Ltd.	foreign trade	2000-04-01	2009-04-01	-Establishing good business relationship with overseas accounts and local manufacturers:\r\n-Negotiating price and terms with domestic vendors and overseas buyers. Sourcing proper products in China to ensure company margin is maximized. \r\n-Placing /follow-up orders.  Supervising and coordinating the whole production schedule( product development, sample making, etc.), quality assurance, shipping arrangement, payment collection process, etc. \r\n-Expanding business scope in both category and territory;\r\n-Leading the whole sales team, provide necessary help to team members to solve problems occurred in their daily operation, responsible for team appearance, and achievements. 	7	2015-09-02 01:18:13.526543	2015-09-02 01:18:13.526543	f
171	Chief Representative 	Lanitis & Associates Inc. Shanghai Office	foreign trading	2009-05-01	2014-02-01	In  charge of export of bedding sets and curtains, blanket, throw, home textiles fabric and finished products, etc.\r\n- maintaining  good relationship with current vendors to ensure all projects run smoothly\r\n- sourcing good manufacturers for our products as per requests from overseas clients; sourcing new products to help customer expand their business category. \r\n- developing new articles with factories per Customer’s requirement\r\n- visiting/initial evaluating new supplier to ensure the right selection of new supplier\r\n- getting the quotation from factories, preparing cost breakdown and comparing and analysis the cost and submit to GM\r\n- negotiating  price and delivery terms with our vendors.\r\n- issuing orders per customers PO\r\n- following up orders with vendors, customers, suppliers and internal parties to ensure customer satisfaction and on-time delivery\r\n- arranging shipment when goods ready\r\n- Leading the whole sales team, provide necessary help to team members to solve problems occurred in their daily operation, responsible for team appearance, and achievements	7	2015-09-02 01:18:13.528144	2015-09-02 01:18:13.528144	f
172	Project Development Manager	Shanghai Guan Feng Yuan Trading Co., Ltd	foreign trade	2014-02-01	2015-09-01	 Focusing on home textile new project development, have accomplished five new projects from on board till now.  \r\n                                    - In charge of QC, QA and merchandiser work\r\n- make/update BOM sheet for new products per quotations from vendors with price breakdown and send to customer after GM approves it; write QC booklets and commodity booklets\r\n- visiting/initial evaluating/audit new suppliers to ensure the right selection of new supplier\r\n- negotiating  price, payment terms and delivery terms with our vendors.\r\n- following up orders with vendors, customers, suppliers and internal parties to ensure customer satisfaction and on-time delivery\r\n- providing necessary help to team members to grow, and to solve problems occurred in their daily operation, being responsible for team appearance and achievements	7	2015-09-02 01:18:13.52989	2015-09-02 01:18:13.52989	f
\.


--
-- Name: works_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('works_id_seq', 172, true);


--
-- Name: active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: average_caches_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY average_caches
    ADD CONSTRAINT average_caches_pkey PRIMARY KEY (id);


--
-- Name: bosses_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY bosses
    ADD CONSTRAINT bosses_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: educations_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY educations
    ADD CONSTRAINT educations_pkey PRIMARY KEY (id);


--
-- Name: emails_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY emails
    ADD CONSTRAINT emails_pkey PRIMARY KEY (id);


--
-- Name: experiences_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY experiences
    ADD CONSTRAINT experiences_pkey PRIMARY KEY (id);


--
-- Name: inquiries_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY inquiries
    ADD CONSTRAINT inquiries_pkey PRIMARY KEY (id);


--
-- Name: interviews_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY interviews
    ADD CONSTRAINT interviews_pkey PRIMARY KEY (id);


--
-- Name: invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY invitations
    ADD CONSTRAINT invitations_pkey PRIMARY KEY (id);


--
-- Name: job_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY job_rates
    ADD CONSTRAINT job_rates_pkey PRIMARY KEY (id);


--
-- Name: jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY line_items
    ADD CONSTRAINT line_items_pkey PRIMARY KEY (id);


--
-- Name: microposts_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY microposts
    ADD CONSTRAINT microposts_pkey PRIMARY KEY (id);


--
-- Name: overall_averages_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY overall_averages
    ADD CONSTRAINT overall_averages_pkey PRIMARY KEY (id);


--
-- Name: rates_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY rates
    ADD CONSTRAINT rates_pkey PRIMARY KEY (id);


--
-- Name: rating_caches_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY rating_caches
    ADD CONSTRAINT rating_caches_pkey PRIMARY KEY (id);


--
-- Name: read_marks_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY read_marks
    ADD CONSTRAINT read_marks_pkey PRIMARY KEY (id);


--
-- Name: relationships_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY relationships
    ADD CONSTRAINT relationships_pkey PRIMARY KEY (id);


--
-- Name: reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: saving_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY saving_lists
    ADD CONSTRAINT saving_lists_pkey PRIMARY KEY (id);


--
-- Name: searches_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY searches
    ADD CONSTRAINT searches_pkey PRIMARY KEY (id);


--
-- Name: service_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY service_rates
    ADD CONSTRAINT service_rates_pkey PRIMARY KEY (id);


--
-- Name: subordinates_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY subordinates
    ADD CONSTRAINT subordinates_pkey PRIMARY KEY (id);


--
-- Name: summaries_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY summaries
    ADD CONSTRAINT summaries_pkey PRIMARY KEY (id);


--
-- Name: talent_pools_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY talent_pools
    ADD CONSTRAINT talent_pools_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: votes_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- Name: works_pkey; Type: CONSTRAINT; Schema: public; Owner: George; Tablespace: 
--

ALTER TABLE ONLY works
    ADD CONSTRAINT works_pkey PRIMARY KEY (id);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_namespace ON active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_email ON admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON admin_users USING btree (reset_password_token);


--
-- Name: index_bosses_on_job_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_bosses_on_job_id ON bosses USING btree (job_id);


--
-- Name: index_comments_on_job_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_comments_on_job_id ON comments USING btree (job_id);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_comments_on_user_id ON comments USING btree (user_id);


--
-- Name: index_educations_on_user_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_educations_on_user_id ON educations USING btree (user_id);


--
-- Name: index_experiences_on_job_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_experiences_on_job_id ON experiences USING btree (job_id);


--
-- Name: index_job_rates_on_job_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_job_rates_on_job_id ON job_rates USING btree (job_id);


--
-- Name: index_line_items_on_job_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_line_items_on_job_id ON line_items USING btree (job_id);


--
-- Name: index_line_items_on_user_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_line_items_on_user_id ON line_items USING btree (user_id);


--
-- Name: index_microposts_on_user_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_microposts_on_user_id ON microposts USING btree (user_id);


--
-- Name: index_microposts_on_user_id_and_created_at; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_microposts_on_user_id_and_created_at ON microposts USING btree (user_id, created_at);


--
-- Name: index_rates_on_rateable_id_and_rateable_type; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_rates_on_rateable_id_and_rateable_type ON rates USING btree (rateable_id, rateable_type);


--
-- Name: index_rates_on_rater_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_rates_on_rater_id ON rates USING btree (rater_id);


--
-- Name: index_rating_caches_on_cacheable_id_and_cacheable_type; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_rating_caches_on_cacheable_id_and_cacheable_type ON rating_caches USING btree (cacheable_id, cacheable_type);


--
-- Name: index_read_marks_on_user_id_and_readable_type_and_readable_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_read_marks_on_user_id_and_readable_type_and_readable_id ON read_marks USING btree (user_id, readable_type, readable_id);


--
-- Name: index_relationships_on_followed_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_relationships_on_followed_id ON relationships USING btree (followed_id);


--
-- Name: index_relationships_on_follower_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_relationships_on_follower_id ON relationships USING btree (follower_id);


--
-- Name: index_relationships_on_follower_id_and_followed_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE UNIQUE INDEX index_relationships_on_follower_id_and_followed_id ON relationships USING btree (follower_id, followed_id);


--
-- Name: index_reviews_on_user_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_reviews_on_user_id ON reviews USING btree (user_id);


--
-- Name: index_saving_lists_on_user_id_and_job_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE UNIQUE INDEX index_saving_lists_on_user_id_and_job_id ON saving_lists USING btree (user_id, job_id);


--
-- Name: index_service_rates_on_line_item_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_service_rates_on_line_item_id ON service_rates USING btree (line_item_id);


--
-- Name: index_subordinates_on_job_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_subordinates_on_job_id ON subordinates USING btree (job_id);


--
-- Name: index_summaries_on_user_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_summaries_on_user_id ON summaries USING btree (user_id);


--
-- Name: index_talent_pools_on_hunter_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_talent_pools_on_hunter_id ON talent_pools USING btree (hunter_id);


--
-- Name: index_talent_pools_on_talent_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_talent_pools_on_talent_id ON talent_pools USING btree (talent_id);


--
-- Name: index_talent_pools_on_talent_id_and_hunter_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE UNIQUE INDEX index_talent_pools_on_talent_id_and_hunter_id ON talent_pools USING btree (talent_id, hunter_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_votes_on_votable_id_and_votable_type_and_vote_scope; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_votes_on_votable_id_and_votable_type_and_vote_scope ON votes USING btree (votable_id, votable_type, vote_scope);


--
-- Name: index_votes_on_voter_id_and_voter_type_and_vote_scope; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_votes_on_voter_id_and_voter_type_and_vote_scope ON votes USING btree (voter_id, voter_type, vote_scope);


--
-- Name: index_works_on_user_id; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE INDEX index_works_on_user_id ON works USING btree (user_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: George; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_558c81314b; Type: FK CONSTRAINT; Schema: public; Owner: George
--

ALTER TABLE ONLY microposts
    ADD CONSTRAINT fk_rails_558c81314b FOREIGN KEY (user_id) REFERENCES users(id);


--
-- PostgreSQL database dump complete
--

