--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
    datetime text,
    feedback text
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
    interview boolean
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
1	admin@example.com	$2a$10$LFHtR2iTuxvlK62QUHM8AeeXGvass9SxGsvI1d/nxLsm/3dD.35f.	\N	\N	\N	1	2015-08-10 05:43:12.115938	2015-08-10 05:43:12.115938	::1	::1	2015-08-06 12:37:01.03254	2015-08-10 05:43:12.11741
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
15		10001	2015-08-09 06:46:50.85744	2015-08-09 06:46:50.85744
16		10002	2015-08-09 06:46:50.871074	2015-08-09 06:46:50.871074
17		10003	2015-08-09 06:46:50.885832	2015-08-09 06:46:50.885832
18	CEO	10004	2015-08-09 06:46:50.905542	2015-08-09 06:46:50.905542
19	采购总监	10005	2015-08-09 06:46:50.924858	2015-08-09 06:46:50.924858
20	首席代表	10006	2015-08-09 06:46:50.941395	2015-08-09 06:46:50.941395
21	部门经理	10007	2015-08-09 06:46:50.962658	2015-08-09 06:46:50.962658
\.


--
-- Name: bosses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('bosses_id_seq', 21, true);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: George
--

COPY comments (id, body, author, top, job_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('comments_id_seq', 1, false);


--
-- Data for Name: educations; Type: TABLE DATA; Schema: public; Owner: George
--

COPY educations (id, school, enter_school, leave_school, major, degree, user_id, created_at, updated_at, uptonow) FROM stdin;
39	复旦大学	1999-09-01	2003-09-01	计算机	本科	30001	2015-08-09 06:46:44.139681	2015-08-09 06:46:44.139681	\N
40	浙江大学	1997-09-01	2001-09-01	计算机	本科	10000	2015-08-09 06:46:47.82192	2015-08-09 06:46:47.82192	\N
41	上海交通大学	2003-09-01	2007-09-01	计算机	本科	10001	2015-08-09 06:46:47.884042	2015-08-09 06:46:47.884042	\N
42	河海大学	1997-09-01	2001-09-01	法学硕士	本科	10002	2015-08-09 06:46:47.947202	2015-08-09 06:46:47.947202	\N
43	江西工业大学	1997-09-01	2001-09-01	法学硕士	本科	10003	2015-08-09 06:46:47.988755	2015-08-09 06:46:47.988755	\N
44	上海大学	1997-09-01	2001-09-01	物流专业	本科	10004	2015-08-09 06:46:48.02847	2015-08-09 06:46:48.02847	\N
45	厦门大学	1997-09-01	2001-09-01	计算机	本科	10005	2015-08-09 06:46:48.070491	2015-08-09 06:46:48.070491	\N
46	南京大学	1997-09-01	2001-09-01	电子信息	本科	10006	2015-08-09 06:46:48.119241	2015-08-09 06:46:48.119241	\N
47	山东建筑大学	1993-09-01	1997-07-01	机械电子专业	本科	10007	2015-08-09 06:46:48.164607	2015-08-09 06:46:48.164607	\N
48	山东科技大学	1997-09-01	2001-09-01	软件工程	本科	10008	2015-08-09 06:46:48.208877	2015-08-09 06:46:48.208877	\N
49	西安交通大学	1997-09-01	2001-09-01	工业工程	本科	10009	2015-08-09 06:46:48.260662	2015-08-09 06:46:48.260662	\N
50	南京大学	1997-09-01	2001-09-01	法学硕士	本科	10010	2015-08-09 06:46:48.304449	2015-08-09 06:46:48.304449	\N
51	复旦大学大学	1997-09-01	2001-09-01	人力资源管理	本科	20001	2015-08-09 06:46:50.514115	2015-08-09 06:46:50.514115	\N
52	London University	2001-09-01	2007-07-31	history	master	20002	2015-08-09 06:46:50.568911	2015-08-09 06:46:50.568911	\N
53	Nankai University	2001-09-01	2007-07-31	chemistry	bachelor	20003	2015-08-09 06:46:50.621851	2015-08-09 06:46:50.621851	\N
54	Nankai University	2001-09-01	2007-07-31	chemistry	bachelor	20004	2015-08-09 06:46:50.660735	2015-08-09 06:46:50.660735	\N
55	Nankai University	2001-09-01	2007-07-31	chemistry	bachelor	20005	2015-08-09 06:46:50.699249	2015-08-09 06:46:50.699249	\N
56	Nankai University	2001-09-01	2007-07-31	chemistry	bachelor	20006	2015-08-09 06:46:50.739915	2015-08-09 06:46:50.739915	\N
57	Nankai University	2001-09-01	2007-07-31	chemistry	bachelor	20007	2015-08-09 06:46:50.780287	2015-08-09 06:46:50.780287	\N
\.


--
-- Name: educations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('educations_id_seq', 57, true);


--
-- Data for Name: experiences; Type: TABLE DATA; Schema: public; Owner: George
--

COPY experiences (id, skill, year, job_id, created_at, updated_at) FROM stdin;
39	海上齿轮箱传动系统研发	3	10001	2015-08-09 06:46:50.86076	2015-08-09 06:46:50.86076
40	电梯现场工作经验	5	10002	2015-08-09 06:46:50.874046	2015-08-09 06:46:50.874046
41	券商资管	3	10003	2015-08-09 06:46:50.888933	2015-08-09 06:46:50.888933
42	券商机构	4	10003	2015-08-09 06:46:50.8905	2015-08-09 06:46:50.8905
43	基金公司专户	5	10003	2015-08-09 06:46:50.891815	2015-08-09 06:46:50.891815
44	银行投行	5	10003	2015-08-09 06:46:50.893054	2015-08-09 06:46:50.893054
45	金融市场部	5	10003	2015-08-09 06:46:50.894505	2015-08-09 06:46:50.894505
46	Python	3	10004	2015-08-09 06:46:50.908361	2015-08-09 06:46:50.908361
47	Java	4	10004	2015-08-09 06:46:50.909697	2015-08-09 06:46:50.909697
48	P2P网站技术开发	5	10004	2015-08-09 06:46:50.911066	2015-08-09 06:46:50.911066
49	面向对象分析设计能力	5	10004	2015-08-09 06:46:50.912365	2015-08-09 06:46:50.912365
50	eclipse	5	10004	2015-08-09 06:46:50.91369	2015-08-09 06:46:50.91369
51	供应链	3	10005	2015-08-09 06:46:50.927735	2015-08-09 06:46:50.927735
52	销售管理	3	10006	2015-08-09 06:46:50.944442	2015-08-09 06:46:50.944442
53	采购	4	10006	2015-08-09 06:46:50.94579	2015-08-09 06:46:50.94579
54	质量	5	10006	2015-08-09 06:46:50.947307	2015-08-09 06:46:50.947307
55	客户开发	5	10006	2015-08-09 06:46:50.948808	2015-08-09 06:46:50.948808
56	市场计划	5	10006	2015-08-09 06:46:50.950184	2015-08-09 06:46:50.950184
57	物流	3	10007	2015-08-09 06:46:50.966071	2015-08-09 06:46:50.966071
\.


--
-- Name: experiences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('experiences_id_seq', 57, true);


--
-- Data for Name: inquiries; Type: TABLE DATA; Schema: public; Owner: George
--

COPY inquiries (id, name, employer, title, mobile, email, content, created_at, updated_at, inquiry_type) FROM stdin;
\.


--
-- Name: inquiries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('inquiries_id_seq', 1, false);


--
-- Data for Name: interviews; Type: TABLE DATA; Schema: public; Owner: George
--

COPY interviews (id, recipient_id, sender_id, job_id, accept, address, content, created_at, updated_at, datetime, feedback) FROM stdin;
\.


--
-- Name: interviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('interviews_id_seq', 1, false);


--
-- Data for Name: invitations; Type: TABLE DATA; Schema: public; Owner: George
--

COPY invitations (id, recipient_id, sender_id, job_id, created_at, updated_at, accept, job_title, job_employer, status) FROM stdin;
15	20002	10000	10001	2015-08-09 06:46:51.088325	2015-08-09 06:46:51.088325	t	维塔斯_海上风机工程师	猎友会	active
16	20001	10000	10002	2015-08-09 06:46:51.091815	2015-08-09 06:46:51.091815	t	宝钢_区域EHS经理	猎友会	active
17	20002	10000	10003	2015-08-09 06:46:51.094622	2015-08-09 06:46:51.094622	\N	高盛_投资项目经理	猎友会	active
18	20002	10000	10004	2015-08-09 06:46:51.108453	2015-08-09 06:46:51.108453	\N	点融网_P2P项目总监	猎友会	active
19	20002	10000	10005	2015-08-09 06:46:51.111242	2015-08-09 06:46:51.111242	\N	斯伯丁_品牌合规主管	\N	active
20	20002	10000	10006	2015-08-09 06:46:51.113809	2015-08-09 06:46:51.113809	\N	宝时厨卫_销售经理	\N	active
21	20002	10000	10007	2015-08-09 06:46:51.116241	2015-08-09 06:46:51.116241	\N	世仓物流_大客户经理	\N	active
\.


--
-- Name: invitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('invitations_id_seq', 21, true);


--
-- Data for Name: job_rates; Type: TABLE DATA; Schema: public; Owner: George
--

COPY job_rates (id, job_id, created_at, updated_at) FROM stdin;
15	10001	2015-08-09 06:46:50.855697	2015-08-09 06:46:50.855697
16	10002	2015-08-09 06:46:50.869371	2015-08-09 06:46:50.869371
17	10003	2015-08-09 06:46:50.883394	2015-08-09 06:46:50.883394
18	10004	2015-08-09 06:46:50.903926	2015-08-09 06:46:50.903926
19	10005	2015-08-09 06:46:50.923054	2015-08-09 06:46:50.923054
20	10006	2015-08-09 06:46:50.939617	2015-08-09 06:46:50.939617
21	10007	2015-08-09 06:46:50.960731	2015-08-09 06:46:50.960731
\.


--
-- Name: job_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('job_rates_id_seq', 21, true);


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: George
--

COPY jobs (id, title, addr, city, industry, commission, role, requirement, base_pay, month, bonus, allowance, stock, stock_num, concall_date, peer, memo, company_info, work_year, created_at, updated_at, employer, status, poster_id, interview) FROM stdin;
10001	海上风机工程师	罗湖区	深圳	工业	10000	1、负责海上风机齿轮箱技术进行调研、研究。\n  2、对海上风机齿轮箱及零部件（含电气元件）的防护进行前瞻性技术研究。\n  3、负责与产品性能提升相关的技术研究（例如海上防锈、防腐、电气防护等）。\n  4、组织协调技术投入和实施。\n  5、跟踪技术使用情况并提出改进建议。	1、工科专业背景。本科以上学历\n  2、具备海上风机、海上设备防护等行业背景。\n  3、具备良好的学习钻研能力和创新意识，沟通协调能力和团队合作能力。	30000	13	50000	15000	\N	\N	2014-10-23	\N	更有惊喜哦	国内领先的齿轮生产企业	3	2015-08-09 06:46:50.837412	2015-08-09 06:46:50.837412	维塔斯	active	30001	\N
10002	区域EHS经理	罗湖区	深圳	工业	10000	在总部EH&S部的指导之下，为区域/分公司的EH&S活动提供政策性指导。\n  参加区域/分公司的安委会\n  对一线部门的组织架构提供EHS方面的技术支持。协助并配合一线部门实施有效的EHS管理体系。\n  协助建立区域的环境、健康与安全战略、目标并支持此战略、目标的实施\n  协助建立各级人员的安全责任体系\n  协助分公司进行适用的EHS法律法规的合规性评估。\n  培训一线管理人员能够识别危险和风险。指导一线管理层识别、控制和预防危险/风险\n  协调和控制在商业活动和交易中对于环境、健康与安全的评估\n  建立区域的EH&S培训计划；提供EH&S培训；参加EH&S方面的培训\n  支持和评估交流程序的有效性\n  贯彻和执行环境、健康与安全规则和程序\n  制定检查、审查计划。识别发生问题的根本原因。进行环境、健康与安全检查、审查。识别并且确保整改行动方案的完成\n  向一线管理人员提供如何进行事故调查和预防、整改行动方案的技术支持\n  协调和组织程序评估，做趋势分析。指导区域管理层如何改进-包括程序评估结果及计划、指标/目标的进度情况\n  向区域管理层提出奖励/处罚建议，享有独立处罚权。\n  参与新项目的招标、审批流程，负责开工报告的审核和审批。\n  配合工地运营部门进行合作方的年度评估。   	学历： 本科\n  工作经验：5年以上电梯现场工作经验或者建筑或者工程类工作经验，三年以上安全管理工作经验\n  语言能力：英语熟练，能满足工作要，CET-4\n  计算机水平：能熟练操作OFFICE软件\n  有一定的机电专业技能\n  其它主要资质：符合国家法律法规要求的从事该岗位工作的相关资质	30000	13	50000	15000	\N	\N	2014-10-23	\N	更有惊喜哦	著名的垂直升降电梯、自动扶梯和自动人行道制造商和服务提供商现在华北（北京）和东北区域（沈阳）范围内寻访高级EHS管理人员，坚持以客户为导向，为客户提供金牌服务。	5	2015-08-09 06:46:50.865866	2015-08-09 06:46:50.865866	宝钢	active	30001	\N
10003	投资项目经理	南京西路188号	上海		19000	1.      参与项目拓展及开发，前期项目谈判，信息收集及反馈，项目考察以及可行性分析；\n\n  2.      能独立进行项目经济测算以及市场研究，起草及准备项目投资推介文件；\n\n  3.      能独立开展资本类项目投资交易结构及基金方案设计，项目投资实施及投后监管等工作；\n\n  4.      负责项目启动时具体工作的对接管理，并监控项目运作过程中的关键控制点。	1.      3-5年以上券商资管、券商机构、基金公司专户、银行投行或金融市场部等行业工作经验；\n\n  2.      金融投资，房产投资、经济、财务、等相关专业硕士以上学历；\n\n  3.      有良好的职业操守，无不良工作记录；具有优秀的沟通协调能力、高度的责任心和事业心；\n\n  4.      精通资本项目投资分析、财务分析及基金方案设计能力，具备相关法律知识；\n\n  5.      至少有1-2个资本类投资项目全程运作经验及成功案例；\n\n  6.      具有良好的人际交往、团队协作及执行力；\n\n  7.      具有丰富的项目和社会资源者优先。	0	\N	500000	\N	\N	\N	\N	\N			3	2015-08-09 06:46:50.880104	2015-08-09 06:46:50.880104	高盛	active	30001	\N
10004	P2P项目总监		上海	金融	19000	1.负责公司P2P平台的技术架构、技术规划与实施，负责交易系统安全防护，为公司提供全面的技术保障； \n  2.制定信息化管理制度、信息化标准、网络安全、信息安全措施并组织实施 ； \n  3.负责技术团队的梯队化建设及管理；\n  4.负责公司内部协调，全面主持技术部门的日常工作。	\N	0	13	32000	50000	\N	\N	2015-05-18	\N	公司即将上市	“融佳金融”是一个集财富管理、投融资服务、信用风险评估与小微借贷咨询服务于一体的综合性互联网金融服务平台。总部位于上海黄浦江南畔岸——绿地海外滩办公楼。我们致力于满足政府、国内/外机构及中、小型企业、高新创新项目与个人投融资及互联网金融的服务、咨询、项目管理及评估等需求。我们拥有完善、严谨的风控评估模型，规范、专业的外部融资担保合作机构（“上海中资融资担保有限公司”）。利用透彻、独到的研究分析，确保获得长期稳定安全增长的投资业绩。	5	2015-08-09 06:46:50.900556	2015-08-09 06:46:50.900556	点融网	active	30001	\N
10005	品牌合规主管	浦东陆家嘴	上海	体育用品	19000	1.负责给公司的产品编制物料编码，并在官方网站及公司系统上维护更新相关信息。\n  2.在物品编码会员到期前做好续办工作。\n  3. 在产品进行大货生产前安排样品检测，协调好供应商与质检中心两方面，同时要确保产品能够准时生产。\n  4. 原材料的审核确认，以确保大货使用的原材料符合产品的要求。\n  5. 在产品生产过程中、或交付前和产品经理前往工厂检视，以确保产品质量达标。\n  6.质检中心确定标签内容无误后，联系相关供应商印刷产品标签，并确保相关标签在产品交货前就绪，并告知供应商标签放置的要求。\n  7. 定期安排篮球/服饰/包类等样品的检测。\n  8. 收集并归档各类检测报告。\n  9.将编码信息及检测报告定期更新给相关部门。\n  10.企业质量标准的撰写安排及申报工作。\n  11. 处理日常退货相关事宜并做好数据统计。\n  12. 与天猫客服及库房沟通协调退货事宜。\n  13. 退货以及产品质量方面的相关报告统计与分析。	\N	0	13	89000	3000	\N	\N	2015-06-02	\N	有出国机会	1876年，拿下职棒场上250胜的A.G.Spalding先生创立斯伯丁公司，多年来不断并致力于开发最好的“球类”，提供给世界上所有的球类爱好者。\n     1891年，在Drames发明篮球运动的同时，斯伯丁公司制造出专属这项运动的第一颗篮球。历经百年，斯伯丁篮球以精湛的工艺、优异的品质被美国NBA等各大篮球比赛选定为比赛用球。\n     斯伯丁体育用品(中国)有限公司隶属于斯伯丁体育用品集团有限公司，成立于2013年10月23日。斯伯丁体育用品集团有限公司由美国Fruit of the Loom集团与台湾元吉集团合资所组成。\n     斯伯丁体育用品(中国)有限公司主要经营在中国大陆地区的斯伯丁品牌业务；现面向社会，诚聘英才。\n  \n     2014年，是Spalding与NBA合作30周年。斯伯丁比赛用球完成了38500多场NBA比赛，完成了近7百万的得分，并与NBA一起，在世界范围内展开各类篮球推广活动。“三十年”如此长期稳定的合作也成为了世界上最令人难以置信的品牌合作之一。\n  \n     2014年，斯伯丁体育用品（中国）有限公司将致力于斯伯丁篮球产品以及篮球文化在中国大陆地区的推广。除了在原有产品基础上带来全新创新，更将引入更多篮球相关产品，从篮球，篮球架，篮球鞋，运动服装，背包以及篮球配件等全方面满足中国篮球市场的需求，为中国消费者量身打造最完美的篮球产品。 	5	2015-08-09 06:46:50.918672	2015-08-09 06:46:50.918672	斯伯丁	active	30001	t
10006	销售经理	浦东龙阳路	上海	厨房家电	19000	如果你有远大的志向，并勤奋好学，通过自身的努力和坚持完成公司赋予的使命，我们将提供快速晋升的通道和远高于市场的薪酬待遇！\n  工作职责：\n  1.负责室内设计师渠道的开拓和销售，完成公司制定的月度和年度销售目标。\n  2.建立和维护和设计师的关系，提供很好的服务。\n  3.作为公司品牌的代表，向设计师介绍和推荐品牌和产品，提供厨房卫浴空间的解决方案。\n  4.针对销售过程中出现的问题，提供解决方案。\n  5.收集和反馈竞品和其他同类产品的市场信息和表现。\n  任职要求：\n  1. 气质形象佳，有很好的品味和鉴赏力。\n  2. 大专以上学历，具有洁具橱柜销售工作1-3年经验、丰富的客户资源者优先；\n  3. 室内设计专业，或熟悉上海地区的洁具橱柜市场和设计院者优先；\n  4. 具有较强的沟通和亲和能力；\n  5. 为人诚实守信，工作踏实具备良好的职业道德。\n  \n  薪资福利：五险一金的缴纳+带薪年假+商业保险， 丰富的员工活动和生日会	\N	0	13	43000	3000	\N	\N	2015-05-19	\N	急招,1周内close	Poshliving –宝时厨房卫浴设备（上海）有限公司是一家定位于高端市场，专营进口橱柜和卫浴产品，专注为高端客户提供厨房和浴室解决方案的优质企业。宝时厨卫拥有一批高端客户群体，通过给到客户精益求精的空间设计方案，和专业的私人订制化服务，目前已在行业内建立了非常好的口碑，立足于行业最前端。\n  公司旗下品牌主要有意大利第一品牌Fendi，Scic和高端卫浴品牌Devon&Devon等。Fendi芬迪，世界顶级时尚大牌中的翘楚，全球十大奢侈品家居品牌。奢华，时尚，更是引领3.0厨房时代，在做工和时尚细节上的演绎，精巧不凡。Scic喜客，意大利顶级厨房制造商，以卓越的创新能力，和接触的制造工艺享誉全。其为Fendi制造和整合的整体厨房，集时尚和奢华感于大成。出色的意大利的设计和精湛的工艺在全球高端物业享有盛誉。Devon&Devon, 意大利新古典风格的领跑者，是皇家，贵族和时尚界人士的不二之选。按照设计美学所展示的完整生活空间的一站式解决方案，非凡品味恒久远。\n  我们拥有强大的设计和产品服务团队，通过深入了解客户需求， 追求卓越，以服务取胜，塑造了良好的品牌形象 。鉴于公司业务的快速拓展，我们诚邀对自己有明确的奋斗目标，有梦想，有闯劲，并愿意通过勤奋和智慧获得成功的有贤人士加入我们的团队 ，与宝时厨卫共同打造辉煌！	8	2015-08-09 06:46:50.933754	2015-08-09 06:46:50.933754	宝时厨卫	active	30001	\N
10007	大客户经理	嘉定江桥	上海	物流	19000	1.根据公司市场营销目标，制定销售策略及销售计划，完成销售任务；\n  2.负责公司主力产品在食品、饮料、快消品、电子商务等市场销售、并做好客户管理工作，与主要客户保持良好的沟通，及时有效地为大客户提供高品质服务，以保证客户满意度；\n  3.负责发掘目标的行业大客户资源，与新客户建立前期的联系，获取需求信息、收集并了解客户需求材料、组织技术交流，并提供解决方案，争取订单成交；\n  4.针对客户提出的合同（交易条件、生产流程、产品要求、售后服务）作初步评估，并合同细节的沟通，保证合同正常实施；\n  5.及时回款及做好售后服务；\n  6.熟悉食品、饮料、外资、快消、电商行业者优先考虑。\n  职位要求：\n  1.本科以上学历，具有汽车驾照，熟悉CAD,office软件应用，精通英文听说读写；\n  2.有三年以上的大客户销售及管理经验；\n  3.具备良好的简报能力及商务谈判技巧；\n  4.长期派驻上海，能配合不定期出差；\n  5.形象气质佳，较强的人际交往能力与较好的人脉关系，具有良好的人际沟通能力；\n  6.市场敏锐的分析能力及判断能力，工作作风严谨，责任心强，具备解决问题能力及较强的职业素养及团队凝聚力、项目洽谈技巧、较强组织管控能力；\n  7.具备自动化设备、输送带等销售经验者尤佳；	\N	0	13	6500	4300	\N	\N	2015-06-01	\N	公司有班车接送	世仓物流设备（上海）有限公司创建于2001年，总部位于上海，是来自台湾的外商独资企业，致力于仓储货架的设计、制造、安装及售后服务。\n  2003年设立第一条生产线，2007年成立集团生产基地世仓货架制造（上海）有限公司，占地面积40,000㎡，厂房面积25,000㎡。生产基地拥有自动化生产线21条，以及多台数控机床等主要设备，采用瑞士Gema自动化涂装设备，运用科学、环保的方式，严格控管产品质量。基地年产能超过6万吨，是国内最大的专业仓储货架厂之一。公司通过ISO9001:2008质量认证体系认证、拥有多项国家实用新型专利，并获得上海市高新技术企业、上海市名牌产品、上海市三优企业、AAA级企业资信等级等多项荣誉，2006年起至今一直被评为为『守信用、重合同』单位。世仓现已在上海、北京、青岛、西安、苏州、广州、台湾等地均设有分公司或办事处，方便为全国客户服务。\n  公司成立以来，业务收入年增长率达30%以上，在中国站稳业界前三名，并计划在2015年大陆中小板上市。下步将朝世界一流货架生产企业努力。\n  中国地大人稠，密集存储将是发展的必然趋势；近年人工成本上涨及不易取得，更验证我们设定的「高效自动化密集存储」是正确的方向。世仓共有11个职级，晋升和职业发展路径清晰，培训体系完善，希望与所有高水平、肯吃苦、具高度企图心的优秀人才一起打拼成长。我们将提供一个公平、开放的平台，来到这里，您可以接受全面的培训和不同的挑战，更会和中国各地的客户一起共同解决仓储问题，欢迎一流的人才加入我们！	10	2015-08-09 06:46:50.956047	2015-08-09 06:46:50.956047	世仓物流	active	30001	\N
\.


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('jobs_id_seq', 1, false);


--
-- Data for Name: line_items; Type: TABLE DATA; Schema: public; Owner: George
--

COPY line_items (id, mobile, email, name, status, user_id, job_id, created_at, updated_at, comment, feedback, sender_id, recipient_id, interviewed) FROM stdin;
19	13916310001	aaronqin@test.com	Aaron Qin	等待面试	\N	10001	2015-08-09 06:46:50.981443	2015-08-09 06:46:50.981443	duke干得不错	\N	20002	10001	\N
20	13916310002	mgy@test.com	马贵耀	等待应聘	\N	10001	2015-08-09 06:46:50.995951	2015-08-09 06:46:50.995951	符合我们的要求	\N	20001	10002	\N
21	13916310003	chc@test.com	储海春	offer	\N	10001	2015-08-09 06:46:51.003137	2015-08-09 06:46:51.003137	正好缺人	\N	20001	10003	\N
22	13916310004	zm@test.com	朱明	offer	\N	10002	2015-08-09 06:46:51.010128	2015-08-09 06:46:51.010128	还不错	\N	20002	10004	t
23	13916310006	ytz@test.com	佘俊芝	offer	\N	10003	2015-08-09 06:46:51.017649	2015-08-09 06:46:51.017649	候选人的英语把关需要更严格一些,其他方面把握的还是比较准确的.	\N	20003	10005	t
24	13916310007	ytz@test.com	余婷章	offer	\N	10004	2015-08-09 06:46:51.02422	2015-08-09 06:46:51.02422	大同对我们的要求了解的非常充分,我非常欣赏他的工作态度!	\N	20004	10006	\N
25	13916310008	lhj@test.com	刘海健	offer	\N	10005	2015-08-09 06:46:51.030611	2015-08-09 06:46:51.030611	Raymond这次的服务非常好,如果对候选人的沟通能力了解的更深一点就跟好了	\N	20005	10007	\N
26	13916310009	dhb@test.com	代洪彪	offer	\N	10006	2015-08-09 06:46:51.03618	2015-08-09 06:46:51.03618	千寻这次送的人质量非常高,相对于其他猎头,我更愿意下次和他合作	\N	20006	10009	\N
27	13916310010	huayijob@aliyun.com	待定	等待应聘	\N	10007	2015-08-09 06:46:51.041831	2015-08-09 06:46:51.041831	\N	\N	20002	\N	\N
\.


--
-- Name: line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('line_items_id_seq', 27, true);


--
-- Data for Name: microposts; Type: TABLE DATA; Schema: public; Owner: George
--

COPY microposts (id, content, user_id, created_at, updated_at, job_id) FROM stdin;
\.


--
-- Name: microposts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('microposts_id_seq', 1, false);


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
\.


--
-- Name: rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('rates_id_seq', 1, false);


--
-- Data for Name: rating_caches; Type: TABLE DATA; Schema: public; Owner: George
--

COPY rating_caches (id, cacheable_id, cacheable_type, avg, qty, dimension, created_at, updated_at) FROM stdin;
\.


--
-- Name: rating_caches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('rating_caches_id_seq', 1, false);


--
-- Data for Name: read_marks; Type: TABLE DATA; Schema: public; Owner: George
--

COPY read_marks (id, readable_id, readable_type, user_id, "timestamp") FROM stdin;
157	\N	LineItem	30001	2015-08-09 06:46:44.124615
158	\N	User	30001	2015-08-09 06:46:44.127866
159	\N	Interview	30001	2015-08-09 06:46:44.130435
160	\N	TalentPool	30001	2015-08-09 06:46:44.132796
161	\N	LineItem	10000	2015-08-09 06:46:47.809485
162	\N	User	10000	2015-08-09 06:46:47.811836
163	\N	Interview	10000	2015-08-09 06:46:47.814237
164	\N	TalentPool	10000	2015-08-09 06:46:47.816441
165	\N	LineItem	10001	2015-08-09 06:46:47.869728
166	\N	User	10001	2015-08-09 06:46:47.872643
167	\N	Interview	10001	2015-08-09 06:46:47.875192
168	\N	TalentPool	10001	2015-08-09 06:46:47.877741
169	\N	LineItem	10002	2015-08-09 06:46:47.910093
170	\N	User	10002	2015-08-09 06:46:47.913291
171	\N	Interview	10002	2015-08-09 06:46:47.938285
172	\N	TalentPool	10002	2015-08-09 06:46:47.940986
173	\N	LineItem	10003	2015-08-09 06:46:47.975327
174	\N	User	10003	2015-08-09 06:46:47.978389
175	\N	Interview	10003	2015-08-09 06:46:47.980662
176	\N	TalentPool	10003	2015-08-09 06:46:47.983117
177	\N	LineItem	10004	2015-08-09 06:46:48.01562
178	\N	User	10004	2015-08-09 06:46:48.018713
179	\N	Interview	10004	2015-08-09 06:46:48.021588
180	\N	TalentPool	10004	2015-08-09 06:46:48.024446
181	\N	LineItem	10005	2015-08-09 06:46:48.057787
182	\N	User	10005	2015-08-09 06:46:48.0607
183	\N	Interview	10005	2015-08-09 06:46:48.063423
184	\N	TalentPool	10005	2015-08-09 06:46:48.066314
185	\N	LineItem	10006	2015-08-09 06:46:48.103004
186	\N	User	10006	2015-08-09 06:46:48.106198
187	\N	Interview	10006	2015-08-09 06:46:48.109104
188	\N	TalentPool	10006	2015-08-09 06:46:48.111963
189	\N	LineItem	10007	2015-08-09 06:46:48.149165
190	\N	User	10007	2015-08-09 06:46:48.152334
191	\N	Interview	10007	2015-08-09 06:46:48.155084
192	\N	TalentPool	10007	2015-08-09 06:46:48.157686
193	\N	LineItem	10008	2015-08-09 06:46:48.193719
194	\N	User	10008	2015-08-09 06:46:48.196709
195	\N	Interview	10008	2015-08-09 06:46:48.19932
196	\N	TalentPool	10008	2015-08-09 06:46:48.201982
197	\N	LineItem	10009	2015-08-09 06:46:48.237301
198	\N	User	10009	2015-08-09 06:46:48.240516
199	\N	Interview	10009	2015-08-09 06:46:48.243384
200	\N	TalentPool	10009	2015-08-09 06:46:48.245989
201	\N	LineItem	10010	2015-08-09 06:46:48.292265
202	\N	User	10010	2015-08-09 06:46:48.296026
203	\N	Interview	10010	2015-08-09 06:46:48.298362
204	\N	TalentPool	10010	2015-08-09 06:46:48.300963
205	\N	LineItem	20001	2015-08-09 06:46:50.499895
206	\N	User	20001	2015-08-09 06:46:50.502701
207	\N	Interview	20001	2015-08-09 06:46:50.505202
208	\N	TalentPool	20001	2015-08-09 06:46:50.507634
209	\N	LineItem	20002	2015-08-09 06:46:50.557929
210	\N	User	20002	2015-08-09 06:46:50.560637
211	\N	Interview	20002	2015-08-09 06:46:50.56317
212	\N	TalentPool	20002	2015-08-09 06:46:50.565494
213	\N	LineItem	20003	2015-08-09 06:46:50.610853
214	\N	User	20003	2015-08-09 06:46:50.613384
215	\N	Interview	20003	2015-08-09 06:46:50.61598
216	\N	TalentPool	20003	2015-08-09 06:46:50.618426
217	\N	LineItem	20004	2015-08-09 06:46:50.649626
218	\N	User	20004	2015-08-09 06:46:50.652702
219	\N	Interview	20004	2015-08-09 06:46:50.655059
220	\N	TalentPool	20004	2015-08-09 06:46:50.657526
221	\N	LineItem	20005	2015-08-09 06:46:50.687576
222	\N	User	20005	2015-08-09 06:46:50.690622
223	\N	Interview	20005	2015-08-09 06:46:50.693119
224	\N	TalentPool	20005	2015-08-09 06:46:50.695655
225	\N	LineItem	20006	2015-08-09 06:46:50.728495
226	\N	User	20006	2015-08-09 06:46:50.73119
227	\N	Interview	20006	2015-08-09 06:46:50.733699
228	\N	TalentPool	20006	2015-08-09 06:46:50.736226
229	\N	LineItem	20007	2015-08-09 06:46:50.769267
230	\N	User	20007	2015-08-09 06:46:50.77211
231	\N	Interview	20007	2015-08-09 06:46:50.774567
232	\N	TalentPool	20007	2015-08-09 06:46:50.776995
\.


--
-- Name: read_marks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('read_marks_id_seq', 232, true);


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
7	\N	10001	\N	优优是一个非常好的猎头	3	20001	2015-08-09 06:46:51.064894	2015-08-09 06:46:51.064894	\N	\N
8	\N	10001	\N	他的服务很专业	3	20002	2015-08-09 06:46:51.067473	2015-08-09 06:46:51.067473	\N	\N
9	\N	10001	\N	他的服务很专业	5	20003	2015-08-09 06:46:51.069892	2015-08-09 06:46:51.069892	\N	\N
\.


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('reviews_id_seq', 9, true);


--
-- Data for Name: saving_lists; Type: TABLE DATA; Schema: public; Owner: George
--

COPY saving_lists (id, user_id, job_id, created_at, updated_at) FROM stdin;
3	10001	10001	2015-08-09 06:46:51.123481	2015-08-09 06:46:51.123481
\.


--
-- Name: saving_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('saving_lists_id_seq', 3, true);


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
19	19	2015-08-09 06:46:50.992445	2015-08-09 06:46:50.992445
20	20	2015-08-09 06:46:50.99975	2015-08-09 06:46:50.99975
21	21	2015-08-09 06:46:51.006733	2015-08-09 06:46:51.006733
22	22	2015-08-09 06:46:51.013626	2015-08-09 06:46:51.013626
23	23	2015-08-09 06:46:51.021128	2015-08-09 06:46:51.021128
24	24	2015-08-09 06:46:51.027411	2015-08-09 06:46:51.027411
25	25	2015-08-09 06:46:51.033492	2015-08-09 06:46:51.033492
26	26	2015-08-09 06:46:51.039148	2015-08-09 06:46:51.039148
27	27	2015-08-09 06:46:51.044756	2015-08-09 06:46:51.044756
\.


--
-- Name: service_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('service_rates_id_seq', 27, true);


--
-- Data for Name: subordinates; Type: TABLE DATA; Schema: public; Owner: George
--

COPY subordinates (id, title, num, job_id, created_at, updated_at) FROM stdin;
15		\N	10001	2015-08-09 06:46:50.859107	2015-08-09 06:46:50.859107
16		\N	10002	2015-08-09 06:46:50.872486	2015-08-09 06:46:50.872486
17		\N	10003	2015-08-09 06:46:50.887528	2015-08-09 06:46:50.887528
18	工程师	30	10004	2015-08-09 06:46:50.906974	2015-08-09 06:46:50.906974
19	质量工程师	2	10005	2015-08-09 06:46:50.926311	2015-08-09 06:46:50.926311
20	销售员	10	10006	2015-08-09 06:46:50.942714	2015-08-09 06:46:50.942714
21	司机	1	10007	2015-08-09 06:46:50.964383	2015-08-09 06:46:50.964383
\.


--
-- Name: subordinates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('subordinates_id_seq', 21, true);


--
-- Data for Name: summaries; Type: TABLE DATA; Schema: public; Owner: George
--

COPY summaries (id, content, user_id, created_at, updated_at) FROM stdin;
89	负责公司的招聘，培训，薪资福利和绩效考核	30001	2015-08-09 06:46:44.134777	2015-08-09 06:46:44.134777
90	制定公司的工资福利架构	30001	2015-08-09 06:46:44.1364	2015-08-09 06:46:44.1364
91	与CEO一起完成年度的招聘计划	30001	2015-08-09 06:46:44.137824	2015-08-09 06:46:44.137824
92	负责产品规格的制定和开发中的项目管理	10000	2015-08-09 06:46:47.818084	2015-08-09 06:46:47.818084
93	负责产品的coding,包括网页前端和后端的开发	10000	2015-08-09 06:46:47.819385	2015-08-09 06:46:47.819385
94	公司的日常管理	10000	2015-08-09 06:46:47.820597	2015-08-09 06:46:47.820597
95	熟悉SAP EDI和portable	10001	2015-08-09 06:46:47.879741	2015-08-09 06:46:47.879741
96	在博士力士乐多年的工作经验，多次荣膺AA Excellent Employee大奖	10001	2015-08-09 06:46:47.88111	2015-08-09 06:46:47.88111
97	良好的沟通技巧，热情的工作态度和开放的心态	10001	2015-08-09 06:46:47.882595	2015-08-09 06:46:47.882595
98	本人在13年的工作中积累了丰富的企业管理经验。特别是在公司运营管理和工厂制造管理等方面拥有较为先进且有效的实践经验。	10002	2015-08-09 06:46:47.942938	2015-08-09 06:46:47.942938
99	有较强的精益生产和6sigma推行实践经验.对现场控制能力较强.能够熟练运用ERP、MRP�=C8。能够独立管理和领导整个工厂或公司的全面经营	10002	2015-08-09 06:46:47.944416	2015-08-09 06:46:47.944416
100	具备较好的团队精神。英语应用熟练，可完全作为工作语言。略懂德语。	10002	2015-08-09 06:46:47.945729	2015-08-09 06:46:47.945729
101	* 具软硬电路板(FPC/PCB), SMT组装, 连接器及消费品产品开发经验，熟悉电镀，注塑，机械及电子组装，影像及蚀刻等生产过程并具有项目质量改善的经验；	10003	2015-08-09 06:46:47.98538	2015-08-09 06:46:47.98538
102	具有若干大中型（包括汽车电子、快速消费电子及多品种小产量类型）的项目立案、价格分析、新产品开发的跨功能、跨国协调的经验；	10003	2015-08-09 06:46:47.987098	2015-08-09 06:46:47.987098
103	上海财经大学全日制工商管理硕士。南京大学国际金融学士，十五年工作经验，精通电子商务物流仓储配送运作管理，擅长物流运营体系规划与仓库规划，WMS/ERP/CRM系统规划,拥有丰富的电子商务物流体系拓展,开仓,规划等经验.熟悉人员招募,培训,管理. 优秀的团队管理能力，团队培养建设能力，很强的流程优化与设计能力，责任心强,独立工作能力极强，有承担与解决问题的能力.	10004	2015-08-09 06:46:48.026756	2015-08-09 06:46:48.026756
104	本人性格热忱开朗,善于与人沟通,工作认真负责,不怕吃苦,具有很强的团队精神,协调和沟通能力,有强烈的集体荣誉感。 	10005	2015-08-09 06:46:48.068495	2015-08-09 06:46:48.068495
105	工作细心负责，适应能力强，能尽快从订单跟踪的初级角色转变为需要与供应商沟通更敏感的价格的角色。能及时处理各类紧急事件，如库存盘亏时产生的突然需求，如项目即将结束前突然的增量。\n\t  能有效与人沟通，与同事相处融洽，对待供应商更是以真诚的态度获取他们的信任与支持。\n\t  	10006	2015-08-09 06:46:48.113747	2015-08-09 06:46:48.113747
106	生活中我喜欢参加游泳、瑜伽、跳舞等活动。	10006	2015-08-09 06:46:48.11527	2015-08-09 06:46:48.11527
107	我相信只有不断的学习才能不断成长，曾为了解更多的采购知识信息主动参加2009年ISM China年会	10006	2015-08-09 06:46:48.116488	2015-08-09 06:46:48.116488
108	目前正积极自学CPSM教程。希望有一个更高的平台发挥我的能力。	10006	2015-08-09 06:46:48.117767	2015-08-09 06:46:48.117767
109	丰富的制造业跨国公司和制造业解决方案工作经验，15年的项目管理和营运经验	10007	2015-08-09 06:46:48.159833	2015-08-09 06:46:48.159833
110	丰富的计划和战略能力，领导多文化团队工作经验	10007	2015-08-09 06:46:48.161389	2015-08-09 06:46:48.161389
111	推动活动，优秀的分析问题和解决问题的能力	10007	2015-08-09 06:46:48.16302	2015-08-09 06:46:48.16302
112	熟悉PHP、Perl、编程，熟悉mysql， 是公司产品的网页部分开发的主要人员	10008	2015-08-09 06:46:48.204151	2015-08-09 06:46:48.204151
113	熟悉Javascript、Jqeury和前端MVC框架Backbone.js	10008	2015-08-09 06:46:48.205797	2015-08-09 06:46:48.205797
114	使用过Mustache、Seajs、Bootstrap和MVC框架CI	10008	2015-08-09 06:46:48.207306	2015-08-09 06:46:48.207306
115	参加过ISO9001,ISO14000,TS16949，6SIGMA培训并获得内审证书。 能熟练运用MEA,8D,QA,6SIGMA等统计手法解决生产品质异常。	10009	2015-08-09 06:46:48.248024	2015-08-09 06:46:48.248024
116	熟练植入精益生产于公司（在诺普信植入吨桶--CELL生产方式降低成品库存51%	10009	2015-08-09 06:46:48.249527	2015-08-09 06:46:48.249527
117	本人工业工程专业，从事IE/精益生产方面工作已经10多年，在流畅制造，丰田生产积累大量的工作经验，有较强的团队领导协作能力和项目推行能力	10009	2015-08-09 06:46:48.250894	2015-08-09 06:46:48.250894
118	掌握精益生产的推动，包括：5S,TPM,QCC,CELL线架设，TOC.均衡化生产，TPM，JIT，自动化和工业工程以及企业信息化专业知识；	10009	2015-08-09 06:46:48.252288	2015-08-09 06:46:48.252288
119	对LP系统规划及改善有极强的项目推动能力。熟悉日常IE,规划IE组织，品质系统手法，厂房规划，成本核算以及效率评估分析，设备嫁动率提高，设备管理等，对6SIGM项目有一定的推动能力，熟悉ERP，ERP2，SAP等系统；	10009	2015-08-09 06:46:48.253704	2015-08-09 06:46:48.253704
120	熟悉工厂生产运作流程，如电五金塑胶行业（五金冲压、注塑成型、吹塑成型、喷涂印刷、机加工组装等工艺）、化工行业（制药反应流程及工艺、灌装包装流程及工艺、包装设备的引进以及改善等）、汽车行业，汽车零配件行业流程改善；	10009	2015-08-09 06:46:48.255964	2015-08-09 06:46:48.255964
121	能够灵活与各部门进行良好的沟通，对公司质量与生产效率进行PDCA的方式改善，共同提高公司的效益	10009	2015-08-09 06:46:48.257656	2015-08-09 06:46:48.257656
122	擅长发现、思考、挑战生活中的新事物，具有对产品在制程中与设计上的改善的能力；具有较强的思考技巧，能够快速敏捷找到解决方案的方法。	10009	2015-08-09 06:46:48.259005	2015-08-09 06:46:48.259005
123	对生物发酵技术、药业GMP有一定的基础和掌握； \n\t  熟悉质量管理体系ISO9001、ISO22000、HACCP、BRC、IFS、AIB标准，熟悉GMP、SSOP；\n\t  熟悉QS和出口食品卫生注册申请要求，能够帮助企业办理QS和卫生注册申请工作。\n\t  能够独立指导企业进行质量体系认证，帮助企业建立、制定和维护质量管理体系。\n\t  	10010	2015-08-09 06:46:48.302753	2015-08-09 06:46:48.302753
124	主要负责store & retail的招聘,维护和发展客户关系	20001	2015-08-09 06:46:50.509714	2015-08-09 06:46:50.509714
125	选择和推荐合适的候选人并进行面试	20001	2015-08-09 06:46:50.51117	2015-08-09 06:46:50.51117
126	流程管理,工资商议以及候选人的follow-up	20001	2015-08-09 06:46:50.512583	2015-08-09 06:46:50.512583
127	A results-driven professional, I am passionate about bringing a positive experience to my clients and value to my organization through: Accountable Execution and Passionate Delivery. With predominant experience in sales and business development in Asia, I have worked with clients ranging from MNCs to SMEs and government organizations throughout the region. I commit to providing a focussed, targeted and personal approach to my clients, operating with transparency, accountability and passion.	20002	2015-08-09 06:46:50.567366	2015-08-09 06:46:50.567366
128	擅长工业销售，化工，医疗器械，包装电子，通讯等行业的人才推荐	20003	2015-08-09 06:46:50.62027	2015-08-09 06:46:50.62027
129	擅长工业销售，化工，医疗器械，包装电子，通讯等行业的人才推荐	20004	2015-08-09 06:46:50.659291	2015-08-09 06:46:50.659291
130	擅长工业销售，化工，医疗器械，包装电子，通讯等行业的人才推荐	20005	2015-08-09 06:46:50.697649	2015-08-09 06:46:50.697649
131	擅长工业销售，化工，医疗器械，包装电子，通讯等行业的人才推荐	20006	2015-08-09 06:46:50.738145	2015-08-09 06:46:50.738145
132	擅长工业销售，化工，医疗器械，包装电子，通讯等行业的人才推荐	20007	2015-08-09 06:46:50.778732	2015-08-09 06:46:50.778732
\.


--
-- Name: summaries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('summaries_id_seq', 132, true);


--
-- Data for Name: talent_pools; Type: TABLE DATA; Schema: public; Owner: George
--

COPY talent_pools (id, hunter_id, talent_id, created_at, updated_at) FROM stdin;
9	20002	10001	2015-08-09 06:46:51.131386	2015-08-09 06:46:51.131386
10	20002	10003	2015-08-09 06:46:51.134085	2015-08-09 06:46:51.134085
11	20002	10004	2015-08-09 06:46:51.136253	2015-08-09 06:46:51.136253
12	20002	10005	2015-08-09 06:46:51.139537	2015-08-09 06:46:51.139537
\.


--
-- Name: talent_pools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('talent_pools_id_seq', 12, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: George
--

COPY users (id, mobile, user_name, true_name, user_type, base_salary, month_num, bonus, housing, transport, stock, stock_num, retention_bonus, expect_package, expect_month_salary, birthday, city, title, created_at, updated_at, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, industry, focus_job1, focus_job2, focus_job3, bank_id, verify) FROM stdin;
30001	13916330001	潘其多	潘其多	人事	10000	13	50000	10200	56000		\N	\N	\N	\N	1982-09-11	上海	人事经理	2015-08-09 06:46:44.108874	2015-08-09 06:46:44.108874	pqd@test.com	$2a$10$GMLpHUhgYxngdj568DjKkuoBGgSxLO3I2V2WMCfONX8iXPGusV4Ue	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-09 06:46:44.091766	\N	\N	潘其多.png	image/png	401396	2015-08-09 06:46:43.654231	快消	\N	\N	\N	10000	hr
10001	13916310001	Aaron Qin	秦义寿	求职者	10000	13	50000	10200	56000	股票	1000	\N	\N	\N	1978-09-11	上海	顾问	2015-08-09 06:46:47.86605	2015-08-09 06:46:47.86605	aaronqin@test.com	$2a$10$zwIDsNbncgKNH.QYebMen.4BmaO2e20nv2SQnkWF8bUV5wIIw55eK	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-09 06:46:47.793868	\N	\N	Aaron_Qin.png	image/png	124734	2015-08-09 06:46:44.515875	\N	\N	\N	\N	\N	\N
10002	13916310002	马贵耀	马贵耀	求职者	10000	13	50000	10200	56000	股票	1000	\N	\N	\N	1978-09-11	苏州	营运经理	2015-08-09 06:46:47.906164	2015-08-09 06:46:47.906164	mgy@test.com	$2a$10$IBr2M7b/0DTwhUpGRvVsTeHRT374e8nUHnkX0BKVdvinfRj2xjueu	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-09 06:46:47.793931	\N	\N	马贵耀.png	image/png	188818	2015-08-09 06:46:44.817553	\N	\N	\N	\N	20002	\N
10003	13916310003	储海春	储海春	求职者	10000	13	50000	10200	56000	股票	1000	\N	\N	\N	1978-09-11	南京	运营经理	2015-08-09 06:46:47.971205	2015-08-09 06:46:47.971205	743278938@139.com	$2a$10$/LY9ocpBW.Cbarjkn/vk6eATQTj5fDTP6CZeok0kMXVG70dFPwDc.	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-09 06:46:47.794009	\N	\N	储海春.png	image/png	259443	2015-08-09 06:46:45.139504	\N	\N	\N	\N	\N	\N
10004	13916310004	朱明	Ming	求职者	23000	13	52000	10200	56000	股票	1000	\N	\N	\N	1978-09-11	南京	物流总监	2015-08-09 06:46:48.01119	2015-08-09 06:46:48.01119	zm@test.com	$2a$10$quKUS0XECCRRTThnIVXBp.SmgiIb2QzbvZDad.LU8CGte0HF5Hyxe	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-09 06:46:47.794069	\N	\N	Ming.png	image/png	149329	2015-08-09 06:46:45.482876	\N	\N	\N	\N	\N	\N
10005	13916310005	Minnie She	佘俊芝	求职者	10000	13	50000	10200	56000	股票	1000	\N	\N	\N	1978-09-11	宁波	软件工程师	2015-08-09 06:46:48.05345	2015-08-09 06:46:48.05345	minnieshe@test.com	$2a$10$uYxMMD7d1NzW/J5DVz.TFe5vR30D28i6cc741SmfwqvqujE4U86uG	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-09 06:46:47.794127	\N	\N	MinnieShe.png	image/png	131208	2015-08-09 06:46:45.789939	\N	\N	\N	\N	\N	\N
10006	13916310006	余婷章	余婷章	求职者	10000	13	50000	10200	56000	股票	1000	\N	\N	\N	1978-09-11	洛阳	采购经理	2015-08-09 06:46:48.098987	2015-08-09 06:46:48.098987	ytz@test.com	$2a$10$VDNDNb58vj6osXAJ/A4D4eELUtiYgAtjt6YIEUYrhpab7S//qBBie	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-09 06:46:47.794174	\N	\N	余婷章.png	image/png	112438	2015-08-09 06:46:46.09304	\N	\N	\N	\N	\N	\N
10007	13916310007	刘海健	刘海健	求职者	10000	13	50000	10200	56000	股票	1000	\N	\N	\N	1978-09-11	上海	生产经理	2015-08-09 06:46:48.14462	2015-08-09 06:46:48.14462	lhj@test.com	$2a$10$H7e.m9PKWed2bYLzigelTexVcBlBEJ0gpOtJzZhz/t/le5E.ccp.u	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-09 06:46:47.794224	\N	\N	刘海建.png	image/png	273237	2015-08-09 06:46:46.388266	\N	\N	\N	\N	\N	\N
10008	13916310008	刘栋	Liu Dong	求职者	10000	13	50000	10200	56000	股票	1000	\N	\N	\N	1978-09-11	上海	开发工程师	2015-08-09 06:46:48.187703	2015-08-09 06:46:48.187703	ld@test.com	$2a$10$N7rhpqi8oI0AmEkXKOzVQOxLPWbn9fcEsGSHDjfewiY.UlQ3TlH9C	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-09 06:46:47.794278	\N	\N	刘栋.png	image/png	247959	2015-08-09 06:46:46.713038	\N	\N	\N	\N	\N	\N
10009	13916310009	代洪彪	Dai	求职者	10000	13	50000	10200	56000	股票	1000	\N	\N	\N	1978-09-11	嘉兴	\N	2015-08-09 06:46:48.232571	2015-08-09 06:46:48.232571	dhb@test.com	$2a$10$GtZNexXEZrcc9toJqql2HeaZG70az1vVe/Jbn8UlnqYwv7bRZhXli	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-09 06:46:47.794325	\N	\N	代洪彪.png	image/png	725080	2015-08-09 06:46:47.032862	\N	\N	\N	\N	\N	\N
10010	13916310010	吴先生	吴先生	求职者	10000	13	50000	10200	56000	股票	1000	\N	\N	\N	1978-09-11	上海	品保经理	2015-08-09 06:46:48.288016	2015-08-09 06:46:48.288016	wxs@test.com	$2a$10$h0qgtqwatMjvMK303ByHtOnTcoh2LmrDs.vDBIl9mmXmwkzQbiVPu	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-09 06:46:47.794406	\N	\N	wxs.png	image/png	193756	2015-08-09 06:46:47.496944	\N	\N	\N	\N	\N	\N
20001	13916320001	Sophy Song	宋优优	猎头	10000	13	50000	10200	56000		\N	\N	\N	\N	1982-09-11	上海	高级猎头顾问	2015-08-09 06:46:50.496147	2015-08-09 06:46:50.496147	syy@test.com	$2a$10$lvdkMhtNQd67n5c7ikHT2OoErfXPe//HvCgmRmc3GV/pkbF1tAgdW	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-09 06:46:50.484995	\N	\N	宋优优.png	image/png	42792	2015-08-09 06:46:48.322581	快消	采购经理	\N	\N	\N	\N
20003	13916320003	沈丽君	沈傲君	猎头	10000	13	50000	10200	56000		\N	\N	\N	\N	1982-09-11	广州	猎头顾问	2015-08-09 06:46:50.592539	2015-08-09 06:46:50.592539	slj@test.com	$2a$10$lp5GYjB/t9HZ/q9BP2BM.eVUwrUI62VFPjw3lrLbiEPiqkuZ.yr/W	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-09 06:46:50.485181	\N	\N	slj.png	image/png	56171	2015-08-09 06:46:49.068393	工业	销售经理	部门总监	财务总监	\N	\N
20004	13916320004	天使之翼	天使之翼	猎头	10000	13	50000	10200	56000		\N	\N	\N	\N	1982-09-11	上海	猎头顾问	2015-08-09 06:46:50.645491	2015-08-09 06:46:50.645491	tszy@test.com	$2a$10$4pSmTMsi/Np.vjPuuzmyvOavO.1g/QfS46moAUM.Eo9uR89EguKYG	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-09 06:46:50.485246	\N	\N	天使之翼.png	image/png	149124	2015-08-09 06:46:49.33694	快消	销售经理	部门总监	财务总监	\N	\N
20005	13916320005	陈大同	陈大同	猎头	10000	13	50000	10200	56000		\N	\N	\N	\N	1982-09-11	上海	猎头顾问	2015-08-09 06:46:50.683319	2015-08-09 06:46:50.683319	cdt@test.com	$2a$10$OcE79bzN8i8oHX0Lud9vAu.qqf41mcQRquZkYjfLNDjiBkqnnBRDS	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-09 06:46:50.48532	\N	\N	陈大同.png	image/png	93250	2015-08-09 06:46:49.627532	快消	销售经理	部门总监	财务总监	\N	\N
20006	13916320006	Ramond	Ramond	猎头	10000	13	50000	10200	56000		\N	\N	\N	\N	1982-09-11	上海	猎头顾问	2015-08-09 06:46:50.724364	2015-08-09 06:46:50.724364	r@test.com	$2a$10$GPWZF1PvzMMFjFDZJLNxIeEFkaLUdJjpNcourIGF0LnTd335/JEcS	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-09 06:46:50.485378	\N	\N	Ramond.png	image/png	85379	2015-08-09 06:46:49.916779	奢侈品	销售经理	部门总监	财务总监	\N	\N
20007	13916320007	千寻	千寻	猎头	10000	13	50000	10200	56000		\N	\N	\N	\N	1982-09-11	上海	猎头顾问	2015-08-09 06:46:50.764824	2015-08-09 06:46:50.764824	qx@test.com	$2a$10$NydORwZDMFbZ49uRtIBELuGefWE9gsK4gkkNCxDATMyapf7yDmbZy	\N	\N	\N	0	\N	\N	\N	\N	\N	2015-08-09 06:46:50.485431	\N	\N	千寻.png	image/png	219230	2015-08-09 06:46:50.189549	复合肥料	销售经理	部门总监	财务总监	\N	\N
10000	13916382071	乔吉	乔吉	人事	10000	13	50000	10200	56000		\N	\N	\N	\N	1982-09-11	上海	CEO	2015-08-09 06:46:47.805783	2015-08-10 05:42:29.018124	cvsend@139.com	$2a$10$xnpkJ7sC46WQn5SugIl91.HaHmZb8DaBZpsp4pZN60RUI0f0X2Cx2	\N	\N	\N	1	2015-08-10 05:42:29.015867	2015-08-10 05:42:29.015867	::1	::1	\N	2015-08-09 06:46:47.79375	\N	\N	george.jpeg	image/png	230981	2015-08-09 06:46:44.180362	快消	人事	\N	\N	\N	hr
20002	13916382071	Duke	Guan	猎头	10000	13	50000	10200	56000		\N	\N	\N	\N	1982-09-11	北京	猎头顾问	2015-08-09 06:46:50.554214	2015-08-10 07:53:02.277047	13916382071@139.com	$2a$10$bEJkDz.3NRxBFpe4M/s.RexXLdGxVwvpesZXyGV4ILS0MQTy7mqm.	\N	\N	\N	3	2015-08-10 07:53:02.276087	2015-08-10 07:35:37.622067	::1	::1	\N	2015-08-09 06:46:50.485118	\N	\N	Duke.png	image/png	790556	2015-08-09 06:46:48.580493	管理岗位	CEO	Sales Director	HR Director	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: George
--

COPY votes (id, votable_id, votable_type, voter_id, voter_type, vote_flag, vote_scope, vote_weight, created_at, updated_at) FROM stdin;
\.


--
-- Name: votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('votes_id_seq', 1, false);


--
-- Data for Name: works; Type: TABLE DATA; Schema: public; Owner: George
--

COPY works (id, title, employer, industry, join_date, leave_date, job_scope, user_id, created_at, updated_at, uptonow) FROM stdin;
43	HR Manager	某公司	信息技术和人力资源	2012-09-03	2014-10-31	领导20个人的人力资源部门	30001	2015-08-09 06:46:44.14168	2015-08-09 06:46:44.14168	\N
44	CEO	又招了电子商务	信息技术和人力资源	2012-09-03	2014-10-31	开发猎头业务,带领猎头团队进行人才搜寻	10000	2015-08-09 06:46:47.823771	2015-08-09 06:46:47.823771	\N
45	经理	万宝盛华(Manpower)	人力资源	2012-09-01	2014-10-31	开发猎头业务,带领猎头团队进行人才搜寻	10000	2015-08-09 06:46:47.825411	2015-08-09 06:46:47.825411	\N
46	CEO	又招了电子商务	信息技术和人力资源	2012-09-01	2014-10-31	开发猎头业务,带领猎头团队进行人才搜寻	10000	2015-08-09 06:46:47.827054	2015-08-09 06:46:47.827054	\N
47	SAP顾问	博世力士乐	汽车电子	2007-09-01	2010-08-31	负责SAP MM模块的日常管理	10001	2015-08-09 06:46:47.885595	2015-08-09 06:46:47.885595	\N
48	运营经理	伊顿液压	工业	2000-09-01	2010-08-31	负责伊顿宁波工厂生产部，包括金工车间，装配车间和总成车间以及生产计划，制造工程和工艺管理，设备维修部门的各项管理工作。\n\t\t\t\t1.建立和完善工厂运营团队的组织架构和管理体系。\n\t\t\t\t2.组织落实、监督、调控生产过程各项安全、质量、交期、成本、效率等各项BSC指标。\n\t\t\t\t3.组织实施和推进精益生产文化。\n\t\t\t\t4.确保ISO质量管理体系在生产运营方面得到良好的运行。\n\t\t\t\t5.组织制定公司运营年度总预算和每季度预算调整。\n\t\t\t\t6.根据公司绩效管理体系为运营部门和个人设定合理的年度KPI和绩效目标。\n\t\t\t\t7.根据销售订单要求制订和调整生产部门月度和每周生产计划以确保完成交货要求。\n\t\t\t\t8.固定资产和关键重要设备的申购评估，审批和过程管控。\n\t\t\t\t9.根据年度VSM和VSA进行车间生产布局和规划，并持续发现改进点，有效改进和完善。\n\t\t\t\t10.通过领导和推进RIE, KAIZEN, 全员合理化建议等持续改进和降低内部全面生产成本。\n\t\t\t\t11.与技术部门密切合作进行新产品开发、技术和工艺流程革新及产品质量改进，提高材料利用率。\n\t\t\t\t12.生产营运体系的人员优化配置和组织管理，通过培训和评估体系建立、发展和完善工厂运营团队。\n\t\t\t\t13.与销售、人力资源、供应链，财务等部门的跨部门沟通协调。\n\t\t\t\t14.参与工厂Eaton亚太和大中华区各个级别的优秀运营评估和各类内部管理审核。\n\t\t\t\t15.参与工厂的年度战略规划。\n\t\t\t\t16.新产品项目及生产运营过程中的新项目推进。\n\t\t\t\t	10002	2015-08-09 06:46:47.94887	2015-08-09 06:46:47.94887	\N
49	运营经理	XP Power	工业	2000-09-01	2010-08-31	根据公司中长期目标，发展和实施相应策略和措施，管理和控制营运部门包括生产、计划、项目、工程、物料及物流以达成工厂营运成本、产品交期和质量的目标	10003	2015-08-09 06:46:47.990545	2015-08-09 06:46:47.990545	\N
50	物流总监	俏物悄语	电商	2000-09-01	2010-08-31	负责仓储运营的管理，包括：计划,收货,上架,拣货,包装,盘点,下架,退货,QC,辑核客退，防损等部门操作的管理、协调与控制，以及耗材使用的物料计划及库存管理; 	10004	2015-08-09 06:46:48.030562	2015-08-09 06:46:48.030562	\N
51	软件工程师	讯孚软件	软件开发	2000-09-01	2010-08-31	我们为耀庭国际物流公司开发的库存管理系统,主要方便管理仓库的货物出入,以及记录货物的详细信息.\n\t\t\t\t【系统界面】 \n\t\t\t\t系统的UI界面,为客户提供友好的操作界面. \n\t\t\t\t1)货物管理:搭建货物管理的前台界面,提供货物出入库的添加操作.\n\t\t\t\t2)档案设置:搭建档案设置的前台界面,提供档案的添加、删除、修改操作.\n\t\t\t\t3)查询统计:搭建查询统计的前台界面,提供所有数据的查询操作.\n\t\t\t\t4)系统维护:搭建系统维护的前台界面,提供数据管理的操作. \n\t\t\t\t【货物管理】 \n\t\t\t\t货物管理的后台管理，为客户提供货物的出入库操作.\n\t\t\t\t1)入库管理:为货物的入库提供 货物编号、名称、数量 等 一些操作. \n\t\t\t\t2)出库管理:为货物的出库提供 货物编号、名称、数量 等 一些操作. \n\t\t\t\t3)借货还货管理:添加货物的借出的记录信息.\n\t\t\t\t4)还货管理:添加货物的归还的记录信息.\n\t\t\t\t	10005	2015-08-09 06:46:48.072583	2015-08-09 06:46:48.072583	\N
52	采购经理	联想(上海)电子科技有限公司	电子	2000-09-01	2010-08-31	先期作为原材料采购，主要负责1）每日查看SAP系统，根据公司内部用料需求制作采购订单。 \n\t\t\t\t2）监督供应商按时、保质、保量出货。\n\t\t\t\t3）根据公司对供应商战略、及供应商生产能力分配物料采购。\n\t\t\t\t4）根据生产计划部、客户跟单部的特殊要求，对紧急物料的跟催。\n\t\t\t\t5）处理供应商来料时因材料或包装不合格引起的退换货问题。\n\t\t\t\t6）定期向供应商提供物料需求计划，以便供应商备库。\n\t\t\t\t7）维护物料编号及价格。\n\t\t\t\t8）定期评估供应商送货准时率、服务水平、供应能力、社会责任等各方面指标，并督促其持续改进。 \n\t\t\t\t9）对主要供应商进行年度审核，保证其发展符合公司战略需要。 \n\t\t\t\t	10006	2015-08-09 06:46:48.120955	2015-08-09 06:46:48.120955	\N
53	生产经理	江阴万奇内饰系统有限公司	汽车零部件	2013-01-01	2015-01-01	•\t重新建立高效的公司组织架构，建立规划制造设施和对所有资源的有效使用的规划.\n\t\t\t\t•\t直接管理包括生产，质量，工程，采购，财务，人力资源和物流等部门.\n\t\t\t\t•\t全面负责本地业务的操作和执行，开发和提交计划及定期目标.\n\t\t\t\t•\t带领一组高度积极的管理团队来定义和执行计划，以达成财务目标及结果\n\t\t\t\t•\t执行公司的策略和指导方针，倡导良好的公司文化和团队合作.\n\t\t\t\t•\t开发节约成本和高质量合格的供应商，保持产品高标准的质量要求，领导ISO9001/TS16949质量体系的实施.\n\t\t\t\t	10007	2015-08-09 06:46:48.166266	2015-08-09 06:46:48.166266	\N
54	开发工程师	上海优刻得云计算技术有限公司	计算机	2000-09-01	2010-08-31	cdn控制台的开发包括html+css+js+php的前后端开发,公司主营产品云主机控制台（富客户端）的开发，主要负责html+css+js+php的前后端开发以及参与需求讨论和产品发布	10008	2015-08-09 06:46:48.210683	2015-08-09 06:46:48.210683	\N
55	生产经理	北汽模塑科技有限公司	汽车零部件	2000-09-01	2010-08-31	•\t保证生产绩效指标：生产总合格率：95%；一次合格率：85%；计划完成率100%；\n\t\t\t\t•\t工艺管理：现行产品工艺批量事故为0；新产品工艺验证确立：组织试生产工艺文件编审批，下发试生产工艺文件；\n\t\t\t\t•\t注塑工艺，喷涂工艺，组装装配工艺的监控与优化\n\t\t\t\t•\t生产成本的标准制定，监控管理，cost down等\n\t\t\t\t•\t设备快速换线，换模（SEMD）\n\t\t\t\t•\t整个生产流程优化，采用一个流以及看板管理，降低库存。\n\t\t\t\t	10009	2015-08-09 06:46:48.262409	2015-08-09 06:46:48.262409	\N
56	品保经理	上海小南国餐饮管理有限公司	餐饮	2000-09-01	2010-08-31	1、负责中央工厂（厨房）年度工作计划的制定和组织实施；\n\t\t\t\t2、负责中央厨房质量体系的建立、维护、更新工作，定期报告质量体系的运行情况；\n\t\t\t\t3、负责部门内部人员的工作安排及监督部门人员的工作；\n\t\t\t\t	10010	2015-08-09 06:46:48.306393	2015-08-09 06:46:48.306393	\N
57	高级猎头顾问	华德士	猎头	2001-09-03	2014-10-31	开发猎头业务,带领猎头团队进行人才搜寻	20001	2015-08-09 06:46:50.515934	2015-08-09 06:46:50.515934	\N
58	Executive Search Consultant	华德士	猎头	2007-09-01	2014-12-01	Executive Search	20002	2015-08-09 06:46:50.570645	2015-08-09 06:46:50.570645	\N
59	猎头顾问	华德士	猎头	2007-09-01	2014-12-01	Executive Search	20003	2015-08-09 06:46:50.623856	2015-08-09 06:46:50.623856	\N
60	猎头顾问	Adecco	猎头	2007-09-01	2014-12-01	Executive Search	20004	2015-08-09 06:46:50.66244	2015-08-09 06:46:50.66244	\N
61	猎头顾问	光辉国际	猎头	2007-09-01	2014-12-01	Executive Search	20005	2015-08-09 06:46:50.701336	2015-08-09 06:46:50.701336	\N
62	猎头顾问	海德思哲	猎头	2007-09-01	2014-12-01	Executive Search	20006	2015-08-09 06:46:50.741918	2015-08-09 06:46:50.741918	\N
63	猎头顾问	海德思哲	猎头	2007-09-01	2014-12-01	Executive Search	20007	2015-08-09 06:46:50.782097	2015-08-09 06:46:50.782097	\N
\.


--
-- Name: works_id_seq; Type: SEQUENCE SET; Schema: public; Owner: George
--

SELECT pg_catalog.setval('works_id_seq', 63, true);


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
-- Name: public; Type: ACL; Schema: -; Owner: George
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "George";
GRANT ALL ON SCHEMA public TO "George";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

