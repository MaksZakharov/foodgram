--
-- PostgreSQL database dump
--

\restrict oDLvLo9r90aCi3L2J8TbucySzbOmXadG2ROmRMMnLDBfgIsx5l8SqogNmaXtGSO

-- Dumped from database version 13.22 (Debian 13.22-1.pgdg13+1)
-- Dumped by pg_dump version 13.22 (Debian 13.22-1.pgdg13+1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: foodgram_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO foodgram_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram_user
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO foodgram_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram_user
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: foodgram_user
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO foodgram_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram_user
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO foodgram_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram_user
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: foodgram_user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO foodgram_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram_user
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO foodgram_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram_user
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: foodgram_user
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO foodgram_user;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: foodgram_user
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO foodgram_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram_user
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO foodgram_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram_user
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: foodgram_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO foodgram_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram_user
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO foodgram_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram_user
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: foodgram_user
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO foodgram_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram_user
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO foodgram_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram_user
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: foodgram_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO foodgram_user;

--
-- Name: recipes_favorite; Type: TABLE; Schema: public; Owner: foodgram_user
--

CREATE TABLE public.recipes_favorite (
    id bigint NOT NULL,
    recipe_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.recipes_favorite OWNER TO foodgram_user;

--
-- Name: recipes_favorite_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram_user
--

CREATE SEQUENCE public.recipes_favorite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_favorite_id_seq OWNER TO foodgram_user;

--
-- Name: recipes_favorite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram_user
--

ALTER SEQUENCE public.recipes_favorite_id_seq OWNED BY public.recipes_favorite.id;


--
-- Name: recipes_ingredient; Type: TABLE; Schema: public; Owner: foodgram_user
--

CREATE TABLE public.recipes_ingredient (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    measurement_unit character varying(200) NOT NULL
);


ALTER TABLE public.recipes_ingredient OWNER TO foodgram_user;

--
-- Name: recipes_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram_user
--

CREATE SEQUENCE public.recipes_ingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_ingredient_id_seq OWNER TO foodgram_user;

--
-- Name: recipes_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram_user
--

ALTER SEQUENCE public.recipes_ingredient_id_seq OWNED BY public.recipes_ingredient.id;


--
-- Name: recipes_ingredientamount; Type: TABLE; Schema: public; Owner: foodgram_user
--

CREATE TABLE public.recipes_ingredientamount (
    id bigint NOT NULL,
    amount integer NOT NULL,
    ingredient_id bigint NOT NULL,
    recipe_id bigint NOT NULL,
    CONSTRAINT recipes_ingredientamount_amount_check CHECK ((amount >= 0))
);


ALTER TABLE public.recipes_ingredientamount OWNER TO foodgram_user;

--
-- Name: recipes_ingredientamount_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram_user
--

CREATE SEQUENCE public.recipes_ingredientamount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_ingredientamount_id_seq OWNER TO foodgram_user;

--
-- Name: recipes_ingredientamount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram_user
--

ALTER SEQUENCE public.recipes_ingredientamount_id_seq OWNED BY public.recipes_ingredientamount.id;


--
-- Name: recipes_recipe; Type: TABLE; Schema: public; Owner: foodgram_user
--

CREATE TABLE public.recipes_recipe (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    image character varying(100) NOT NULL,
    text text NOT NULL,
    cooking_time integer NOT NULL,
    pub_date timestamp with time zone NOT NULL,
    author_id bigint NOT NULL,
    CONSTRAINT recipes_recipe_cooking_time_check CHECK ((cooking_time >= 0))
);


ALTER TABLE public.recipes_recipe OWNER TO foodgram_user;

--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram_user
--

CREATE SEQUENCE public.recipes_recipe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_recipe_id_seq OWNER TO foodgram_user;

--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram_user
--

ALTER SEQUENCE public.recipes_recipe_id_seq OWNED BY public.recipes_recipe.id;


--
-- Name: recipes_recipe_tags; Type: TABLE; Schema: public; Owner: foodgram_user
--

CREATE TABLE public.recipes_recipe_tags (
    id bigint NOT NULL,
    recipe_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.recipes_recipe_tags OWNER TO foodgram_user;

--
-- Name: recipes_recipe_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram_user
--

CREATE SEQUENCE public.recipes_recipe_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_recipe_tags_id_seq OWNER TO foodgram_user;

--
-- Name: recipes_recipe_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram_user
--

ALTER SEQUENCE public.recipes_recipe_tags_id_seq OWNED BY public.recipes_recipe_tags.id;


--
-- Name: recipes_shoppingcart; Type: TABLE; Schema: public; Owner: foodgram_user
--

CREATE TABLE public.recipes_shoppingcart (
    id bigint NOT NULL,
    recipe_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.recipes_shoppingcart OWNER TO foodgram_user;

--
-- Name: recipes_shoppingcart_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram_user
--

CREATE SEQUENCE public.recipes_shoppingcart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_shoppingcart_id_seq OWNER TO foodgram_user;

--
-- Name: recipes_shoppingcart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram_user
--

ALTER SEQUENCE public.recipes_shoppingcart_id_seq OWNED BY public.recipes_shoppingcart.id;


--
-- Name: recipes_tag; Type: TABLE; Schema: public; Owner: foodgram_user
--

CREATE TABLE public.recipes_tag (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    color character varying(7) NOT NULL,
    slug character varying(200) NOT NULL
);


ALTER TABLE public.recipes_tag OWNER TO foodgram_user;

--
-- Name: recipes_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram_user
--

CREATE SEQUENCE public.recipes_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_tag_id_seq OWNER TO foodgram_user;

--
-- Name: recipes_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram_user
--

ALTER SEQUENCE public.recipes_tag_id_seq OWNED BY public.recipes_tag.id;


--
-- Name: users_follow; Type: TABLE; Schema: public; Owner: foodgram_user
--

CREATE TABLE public.users_follow (
    id bigint NOT NULL,
    author_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.users_follow OWNER TO foodgram_user;

--
-- Name: users_follow_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram_user
--

CREATE SEQUENCE public.users_follow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_follow_id_seq OWNER TO foodgram_user;

--
-- Name: users_follow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram_user
--

ALTER SEQUENCE public.users_follow_id_seq OWNED BY public.users_follow.id;


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: foodgram_user
--

CREATE TABLE public.users_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL,
    avatar character varying(100)
);


ALTER TABLE public.users_user OWNER TO foodgram_user;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: foodgram_user
--

CREATE TABLE public.users_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO foodgram_user;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram_user
--

CREATE SEQUENCE public.users_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO foodgram_user;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram_user
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram_user
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO foodgram_user;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram_user
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: foodgram_user
--

CREATE TABLE public.users_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO foodgram_user;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram_user
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO foodgram_user;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram_user
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: recipes_favorite id; Type: DEFAULT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_favorite ALTER COLUMN id SET DEFAULT nextval('public.recipes_favorite_id_seq'::regclass);


--
-- Name: recipes_ingredient id; Type: DEFAULT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_ingredient ALTER COLUMN id SET DEFAULT nextval('public.recipes_ingredient_id_seq'::regclass);


--
-- Name: recipes_ingredientamount id; Type: DEFAULT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_ingredientamount ALTER COLUMN id SET DEFAULT nextval('public.recipes_ingredientamount_id_seq'::regclass);


--
-- Name: recipes_recipe id; Type: DEFAULT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_recipe ALTER COLUMN id SET DEFAULT nextval('public.recipes_recipe_id_seq'::regclass);


--
-- Name: recipes_recipe_tags id; Type: DEFAULT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_recipe_tags ALTER COLUMN id SET DEFAULT nextval('public.recipes_recipe_tags_id_seq'::regclass);


--
-- Name: recipes_shoppingcart id; Type: DEFAULT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_shoppingcart ALTER COLUMN id SET DEFAULT nextval('public.recipes_shoppingcart_id_seq'::regclass);


--
-- Name: recipes_tag id; Type: DEFAULT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_tag ALTER COLUMN id SET DEFAULT nextval('public.recipes_tag_id_seq'::regclass);


--
-- Name: users_follow id; Type: DEFAULT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.users_follow ALTER COLUMN id SET DEFAULT nextval('public.users_follow_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: foodgram_user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: foodgram_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: foodgram_user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add Подписка	7	add_follow
26	Can change Подписка	7	change_follow
27	Can delete Подписка	7	delete_follow
28	Can view Подписка	7	view_follow
29	Can add Избранное	8	add_favorite
30	Can change Избранное	8	change_favorite
31	Can delete Избранное	8	delete_favorite
32	Can view Избранное	8	view_favorite
33	Can add Ингредиент	9	add_ingredient
34	Can change Ингредиент	9	change_ingredient
35	Can delete Ингредиент	9	delete_ingredient
36	Can view Ингредиент	9	view_ingredient
37	Can add Ингредиент в рецепте	10	add_ingredientamount
38	Can change Ингредиент в рецепте	10	change_ingredientamount
39	Can delete Ингредиент в рецепте	10	delete_ingredientamount
40	Can view Ингредиент в рецепте	10	view_ingredientamount
41	Can add Рецепт	11	add_recipe
42	Can change Рецепт	11	change_recipe
43	Can delete Рецепт	11	delete_recipe
44	Can view Рецепт	11	view_recipe
45	Can add Тег	12	add_tag
46	Can change Тег	12	change_tag
47	Can delete Тег	12	delete_tag
48	Can view Тег	12	view_tag
49	Can add Список покупок	13	add_shoppingcart
50	Can change Список покупок	13	change_shoppingcart
51	Can delete Список покупок	13	delete_shoppingcart
52	Can view Список покупок	13	view_shoppingcart
53	Can add Token	14	add_token
54	Can change Token	14	change_token
55	Can delete Token	14	delete_token
56	Can view Token	14	view_token
57	Can add token	15	add_tokenproxy
58	Can change token	15	change_tokenproxy
59	Can delete token	15	delete_tokenproxy
60	Can view token	15	view_tokenproxy
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: foodgram_user
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
4df96680d2e6a0a3baa49c1b39c5743effe5b3f5	2025-09-12 13:10:14.973093+00	14
be0e582175365d03d47112708eeb16aff0ca168b	2025-09-12 15:14:11.883601+00	1
b7a2ef3953140e6da29adbea120f68139740309e	2025-09-13 11:28:12.45985+00	13
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: foodgram_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2025-09-10 16:49:29.935669+00	2	User1@gmail.com	1	[{"added": {}}]	6	1
2	2025-09-10 16:50:21.099697+00	3	user2@example.com	1	[{"added": {}}]	6	1
3	2025-09-10 17:59:15.523624+00	1	Завтрак	1	[{"added": {}}]	12	1
4	2025-09-10 17:59:56.001729+00	2	Обед	1	[{"added": {}}]	12	1
5	2025-09-10 18:00:20.434923+00	3	Ужин	1	[{"added": {}}]	12	1
6	2025-09-10 18:02:31.494324+00	1	Салат с сухариками "Королевский"	1	[{"added": {}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u043a\\u0440\\u0430\\u0431\\u043e\\u0432\\u044b\\u0435 \\u043f\\u0430\\u043b\\u043e\\u0447\\u043a\\u0438, \\u0433 \\u2014 240"}}]	11	1
7	2025-09-10 18:08:14.871208+00	1	Салат с сухариками "Королевский"	2	[{"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0441\\u044b\\u0440 \\u0442\\u0432\\u0435\\u0440\\u0434\\u044b\\u0439, \\u0433 \\u2014 300"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u044f\\u0439\\u0446\\u0430 \\u043a\\u0443\\u0440\\u0438\\u043d\\u044b\\u0435, \\u0433 \\u2014 4"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0441\\u0443\\u0445\\u0430\\u0440\\u0438 \\u0431\\u0435\\u043b\\u044b\\u0435, \\u0433 \\u2014 100"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0447\\u0435\\u0441\\u043d\\u043e\\u043a, \\u0433 \\u2014 10"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u043b\\u0438\\u043c\\u043e\\u043d\\u044b, \\u0433 \\u2014 60"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u043c\\u0430\\u0439\\u043e\\u043d\\u0435\\u0437, \\u0433 \\u2014 10"}}]	11	1
8	2025-09-10 18:09:27.639299+00	1	test@gmail.com → Салат с сухариками "Королевский"	1	[{"added": {}}]	8	1
9	2025-09-11 13:10:35.044542+00	4	vivanov@yandex.ru	3		6	1
10	2025-09-11 13:21:52.006268+00	2	User1@gmail.com	3		6	1
11	2025-09-11 13:21:52.03079+00	3	user2@example.com	3		6	1
12	2025-09-11 16:35:50.755956+00	5	vivanov@yandex.ru	3		6	1
13	2025-09-11 16:35:50.795163+00	6	second_user@email.org	3		6	1
14	2025-09-11 16:35:50.801298+00	7	third-user@user.ru	3		6	1
15	2025-09-11 16:35:50.804869+00	8	no-first-name@user.ru	3		6	1
16	2025-09-11 16:35:50.80841+00	9	no-last-name@user.ru	3		6	1
17	2025-09-12 12:14:48.730137+00	83	Варёное нечто	3		11	1
18	2025-09-12 12:14:48.820011+00	82	Нечто жареное	3		11	1
19	2025-09-12 12:14:48.824136+00	81	Еда без дополнительной обработки	3		11	1
20	2025-09-12 12:14:48.82951+00	80	Еще одна попытка приготовить еду	3		11	1
21	2025-09-12 12:14:48.833296+00	79	Нечто съедобное (пробовать на свой страх и риск)	3		11	1
22	2025-09-12 12:14:48.837068+00	78	Варёное нечто	3		11	1
23	2025-09-12 12:14:48.840814+00	77	Нечто жареное	3		11	1
24	2025-09-12 12:14:48.844421+00	76	Еда без дополнительной обработки	3		11	1
25	2025-09-12 12:14:48.848218+00	75	Еще одна попытка приготовить еду	3		11	1
26	2025-09-12 12:14:48.851993+00	74	Нечто съедобное (пробовать на свой страх и риск)	3		11	1
27	2025-09-12 12:14:48.855544+00	73	А фотку я не покажу	3		11	1
28	2025-09-12 12:14:48.858678+00	72	Надеюсь, это еда	3		11	1
29	2025-09-12 12:14:48.862062+00	71	Варёное нечто	3		11	1
30	2025-09-12 12:14:48.865445+00	70	Нечто жареное	3		11	1
31	2025-09-12 12:14:48.868468+00	69	Еда без дополнительной обработки	3		11	1
32	2025-09-12 12:14:48.871731+00	68	Рецепт без картинки	3		11	1
33	2025-09-12 12:14:48.874775+00	67	Нечто съедобное (пробовать на свой страх и риск)	3		11	1
34	2025-09-12 12:14:48.878768+00	66	А фотку я не покажу	3		11	1
35	2025-09-12 12:14:48.881892+00	65	Надеюсь, это еда	3		11	1
36	2025-09-12 12:14:48.885147+00	64	Варёное нечто	3		11	1
37	2025-09-12 12:14:48.888176+00	63	Нечто жареное	3		11	1
38	2025-09-12 12:14:48.891117+00	62	Еда без дополнительной обработки	3		11	1
39	2025-09-12 12:14:48.893953+00	61	Рецепт без картинки	3		11	1
40	2025-09-12 12:14:48.896822+00	60	Нечто съедобное (пробовать на свой страх и риск)	3		11	1
41	2025-09-12 12:14:48.899697+00	59	Варёное нечто	3		11	1
42	2025-09-12 12:14:48.902488+00	58	Нечто жареное	3		11	1
43	2025-09-12 12:14:48.9053+00	57	Еда без дополнительной обработки	3		11	1
44	2025-09-12 12:14:48.908037+00	56	Еще одна попытка приготовить еду	3		11	1
45	2025-09-12 12:14:48.911071+00	55	Нечто съедобное (пробовать на свой страх и риск)	3		11	1
46	2025-09-12 12:14:48.913884+00	54	Варёное нечто	3		11	1
47	2025-09-12 12:14:48.916711+00	53	Нечто жареное	3		11	1
48	2025-09-12 12:14:48.919796+00	52	Еда без дополнительной обработки	3		11	1
49	2025-09-12 12:14:48.922474+00	51	Еще одна попытка приготовить еду	3		11	1
50	2025-09-12 12:14:48.925448+00	50	Нечто съедобное (пробовать на свой страх и риск)	3		11	1
51	2025-09-12 12:14:48.929295+00	49	Варёное нечто	3		11	1
52	2025-09-12 12:14:48.932201+00	48	Нечто жареное	3		11	1
53	2025-09-12 12:14:48.93474+00	47	Еда без дополнительной обработки	3		11	1
54	2025-09-12 12:14:48.937321+00	46	Еще одна попытка приготовить еду	3		11	1
55	2025-09-12 12:14:48.939937+00	45	Нечто съедобное (пробовать на свой страх и риск)	3		11	1
56	2025-09-12 12:14:48.942529+00	44	Варёное нечто	3		11	1
57	2025-09-12 12:14:48.945138+00	43	Нечто жареное	3		11	1
58	2025-09-12 12:14:48.947828+00	42	Еда без дополнительной обработки	3		11	1
59	2025-09-12 12:14:48.950379+00	41	Еще одна попытка приготовить еду	3		11	1
60	2025-09-12 12:14:48.952963+00	40	Нечто съедобное (пробовать на свой страх и риск)	3		11	1
61	2025-09-12 12:14:48.964852+00	39	А фотку я не покажу	3		11	1
62	2025-09-12 12:14:48.967489+00	38	А фотку я не покажу	3		11	1
63	2025-09-12 12:14:48.970078+00	37	А фотку я не покажу	3		11	1
64	2025-09-12 12:14:48.9726+00	36	Повторяющиеся теги	3		11	1
65	2025-09-12 12:14:48.975271+00	35	Попробуй съесть	3		11	1
66	2025-09-12 12:14:48.978723+00	34	Повторяющиеся ингредиенты	3		11	1
67	2025-09-12 12:14:48.981455+00	33	Неправильный рецепт	3		11	1
68	2025-09-12 12:14:48.984102+00	32	А фотку я не покажу	3		11	1
69	2025-09-12 12:14:48.987072+00	31	Повторяющиеся теги	3		11	1
70	2025-09-12 12:14:48.990021+00	30	Попробуй съесть	3		11	1
71	2025-09-12 12:14:48.992677+00	29	Повторяющиеся ингредиенты	3		11	1
72	2025-09-12 12:14:48.995348+00	28	Неправильный рецепт	3		11	1
73	2025-09-12 12:14:48.998188+00	27	Варёное нечто	3		11	1
74	2025-09-12 12:14:49.00082+00	26	Нечто жареное	3		11	1
75	2025-09-12 12:14:49.003359+00	25	Еда без дополнительной обработки	3		11	1
76	2025-09-12 12:14:49.006327+00	24	Обновление чужого рецепта	3		11	1
77	2025-09-12 12:14:49.008967+00	23	Нечто съедобное (пробовать на свой страх и риск)	3		11	1
78	2025-09-12 12:14:49.011947+00	22	Варёное нечто	3		11	1
79	2025-09-12 12:14:49.014938+00	21	Нечто жареное	3		11	1
80	2025-09-12 12:14:49.017648+00	20	Еда без дополнительной обработки	3		11	1
81	2025-09-12 12:14:49.020488+00	19	Еще одна попытка приготовить еду	3		11	1
82	2025-09-12 12:14:49.023183+00	18	Нечто съедобное (это не точно)	3		11	1
83	2025-09-12 12:14:49.025822+00	17	Варёное нечто	3		11	1
84	2025-09-12 12:14:49.028989+00	16	Нечто жареное	3		11	1
85	2025-09-12 12:14:49.031909+00	15	Еда без дополнительной обработки	3		11	1
86	2025-09-12 12:14:49.034824+00	14	Еще одна попытка приготовить еду	3		11	1
87	2025-09-12 12:14:49.037533+00	13	Нечто съедобное (это не точно)	3		11	1
88	2025-09-12 12:14:49.040398+00	12	Варёное нечто	3		11	1
89	2025-09-12 12:14:49.043692+00	11	Нечто жареное	3		11	1
90	2025-09-12 12:14:49.046532+00	10	Еда без дополнительной обработки	3		11	1
91	2025-09-12 12:14:49.049217+00	9	Еще одна попытка приготовить еду	3		11	1
92	2025-09-12 12:14:49.051944+00	8	Нечто съедобное (это не точно)	3		11	1
93	2025-09-12 12:14:49.054658+00	7	Нечто съедобное (это не точно)	3		11	1
94	2025-09-12 12:14:49.057369+00	6	Нечто съедобное (это не точно)	3		11	1
95	2025-09-12 12:14:49.060116+00	5	Нечто съедобное (это не точно)	3		11	1
96	2025-09-12 12:14:49.062667+00	4	Нечто съедобное (это не точно)	3		11	1
97	2025-09-12 12:14:49.065207+00	3	Нечто съедобное (это не точно)	3		11	1
98	2025-09-12 12:14:49.067982+00	2	Нечто съедобное (это не точно)	3		11	1
99	2025-09-12 13:09:53.438685+00	10	vivanov@yandex.ru	3		6	1
100	2025-09-12 13:09:53.457968+00	11	second_user@email.org	3		6	1
101	2025-09-12 13:09:53.461637+00	12	third-user@user.ru	3		6	1
102	2025-09-12 14:33:07.76311+00	4	Десерт	1	[{"added": {}}]	12	1
103	2025-09-12 14:35:48.803487+00	1	Салат с сухариками "Королевский"	2	[{"changed": {"fields": ["\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435"]}}]	11	1
104	2025-09-12 14:38:37.052985+00	1	Салат с сухариками "Королевский"	2	[{"changed": {"fields": ["\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435", "\\u0422\\u0435\\u0433\\u0438"]}}]	11	1
105	2025-09-12 14:39:56.186283+00	1	Салат с сухариками "Королевский"	2	[{"changed": {"fields": ["\\u0422\\u0435\\u0433\\u0438"]}}]	11	1
106	2025-09-12 14:44:15.827709+00	99	Абрикосовый творожный торт-десерт	1	[{"added": {}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0430\\u0431\\u0440\\u0438\\u043a\\u043e\\u0441\\u044b, \\u0433 \\u2014 450"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0442\\u0432\\u043e\\u0440\\u043e\\u0433, \\u0433 \\u2014 400"}}]	11	1
107	2025-09-12 14:44:37.572685+00	99	Абрикосовый творожный торт-десерт	2	[{"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0441\\u043c\\u0435\\u0442\\u0430\\u043d\\u0430, \\u0433 \\u2014 150"}}]	11	1
108	2025-09-12 14:45:26.21022+00	99	Абрикосовый творожный торт-десерт	2	[{"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u043c\\u043e\\u043b\\u043e\\u043a\\u043e, \\u043c\\u043b \\u2014 150"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0436\\u0435\\u043b\\u0430\\u0442\\u0438\\u043d, \\u0433 \\u2014 20"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0441\\u0430\\u0445\\u0430\\u0440, \\u0433 \\u2014 10"}}]	11	1
109	2025-09-12 14:45:49.979669+00	99	Абрикосовый творожный торт-десерт	2	[{"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0432\\u0430\\u043d\\u0438\\u043b\\u0438\\u043d, \\u0433 \\u2014 5"}}]	11	1
110	2025-09-12 14:47:59.262569+00	13	vivanov@yandex.ru	2	[{"changed": {"fields": ["\\u0410\\u0432\\u0430\\u0442\\u0430\\u0440"]}}]	6	1
111	2025-09-12 14:48:34.608444+00	1	test@gmail.com	2	[{"changed": {"fields": ["\\u0410\\u0432\\u0430\\u0442\\u0430\\u0440"]}}]	6	1
112	2025-09-12 14:49:45.550446+00	1	test@gmail.com	2	[{"changed": {"fields": ["\\u0410\\u0432\\u0430\\u0442\\u0430\\u0440"]}}]	6	1
113	2025-09-12 14:50:40.053426+00	14	second_user@email.org	2	[{"changed": {"fields": ["\\u0410\\u0432\\u0430\\u0442\\u0430\\u0440"]}}]	6	1
114	2025-09-12 14:51:05.207869+00	15	third-user@user.ru	2	[{"changed": {"fields": ["\\u0410\\u0432\\u0430\\u0442\\u0430\\u0440"]}}]	6	1
115	2025-09-12 14:51:39.842536+00	1	Салат с сухариками "Королевский"	2	[{"changed": {"fields": ["\\u0422\\u0435\\u0433\\u0438"]}}]	11	1
116	2025-09-12 14:57:05.78466+00	100	Буберт (десерт из манной крупы с ягодами)	1	[{"added": {}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u043c\\u0430\\u043d\\u043d\\u0430\\u044f \\u043a\\u0440\\u0443\\u043f\\u0430, \\u0433 \\u2014 10"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u043c\\u043e\\u043b\\u043e\\u043a\\u043e, \\u043c\\u043b \\u2014 500"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u044f\\u0439\\u0446\\u0430 \\u043a\\u0443\\u0440\\u0438\\u043d\\u044b\\u0435, \\u0433 \\u2014 50"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0441\\u0430\\u0445\\u0430\\u0440, \\u0433 \\u2014 40"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0441\\u0430\\u0445\\u0430\\u0440\\u043d\\u0430\\u044f \\u043f\\u0443\\u0434\\u0440\\u0430, \\u0433 \\u2014 5"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0441\\u043e\\u043b\\u044c, \\u0433 \\u2014 5"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0432\\u0430\\u043d\\u0438\\u043b\\u0438\\u043d, \\u0433 \\u2014 5"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u043a\\u0435\\u0448\\u044c\\u044e, \\u0433 \\u2014 100"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u043a\\u043b\\u044e\\u043a\\u0432\\u0430, \\u0433 \\u2014 100"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u043a\\u0440\\u0430\\u0445\\u043c\\u0430\\u043b, \\u0433 \\u2014 5"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0432\\u043e\\u0434\\u0430, \\u043c\\u043b \\u2014 200"}}]	11	1
117	2025-09-12 15:02:32.150722+00	101	Куриное филе по-венгерски	1	[{"added": {}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u043a\\u0443\\u0440\\u0438\\u043d\\u044b\\u0435 \\u0433\\u0440\\u0443\\u0434\\u043a\\u0438, \\u0433 \\u2014 500"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u043f\\u0440\\u0438\\u043f\\u0440\\u0430\\u0432\\u0430 \\u0434\\u043b\\u044f \\u043a\\u0443\\u0440\\u0438\\u0446\\u044b, \\u0433 \\u2014 5"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0441\\u043e\\u043b\\u044c, \\u0433 \\u2014 5"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0432\\u0438\\u043d\\u043e \\u0431\\u0435\\u043b\\u043e\\u0435 \\u043f\\u043e\\u043b\\u0443\\u0441\\u043b\\u0430\\u0434\\u043a\\u043e\\u0435, \\u043c\\u043b \\u2014 50"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0441\\u043b\\u0438\\u0432\\u043e\\u0447\\u043d\\u043e\\u0435 \\u043c\\u0430\\u0441\\u043b\\u043e, \\u0433 \\u2014 10"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0432\\u0438\\u043d\\u043e\\u0433\\u0440\\u0430\\u0434 \\u0431\\u0435\\u043b\\u044b\\u0439, \\u0433 \\u2014 100"}}]	11	1
118	2025-09-12 15:07:41.008429+00	102	Рагу «Летний обед»	1	[{"added": {}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0431\\u0430\\u0440\\u0430\\u043d\\u0438\\u043d\\u0430, \\u0433 \\u2014 300"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u043b\\u0443\\u043a \\u0431\\u0435\\u043b\\u044b\\u0439, \\u0433 \\u2014 50"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u043c\\u043e\\u0440\\u043a\\u043e\\u0432\\u044c, \\u0433 \\u2014 100"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u043f\\u043e\\u043c\\u0438\\u0434\\u043e\\u0440\\u044b, \\u0433 \\u2014 100"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u043a\\u0430\\u0440\\u0442\\u043e\\u0444\\u0435\\u043b\\u044c, \\u0433 \\u2014 400"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0433\\u043e\\u0440\\u043e\\u0448\\u0435\\u043a \\u0437\\u0435\\u043b\\u0435\\u043d\\u044b\\u0439, \\u0433 \\u2014 100"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0444\\u0430\\u0441\\u043e\\u043b\\u044c, \\u0433 \\u2014 10"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u043a\\u0430\\u0431\\u0430\\u0447\\u043a\\u0438, \\u0433 \\u2014 200"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u043a\\u0430\\u043f\\u0443\\u0441\\u0442\\u0430 \\u0446\\u0432\\u0435\\u0442\\u043d\\u0430\\u044f, \\u0433 \\u2014 200"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0440\\u0430\\u0441\\u0442\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0435 \\u043c\\u0430\\u0441\\u043b\\u043e, \\u043c\\u043b \\u2014 10"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u043b\\u0430\\u0432\\u0440\\u043e\\u0432\\u044b\\u0439 \\u043b\\u0438\\u0441\\u0442, \\u0433 \\u2014 5"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0441\\u043e\\u043b\\u044c, \\u0433 \\u2014 5"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u043f\\u0435\\u0440\\u0435\\u0446, \\u0433 \\u2014 5"}}]	11	1
119	2025-09-12 15:11:52.056373+00	103	Шашлык из скумбрии (в духовке)	1	[{"added": {}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0441\\u043a\\u0443\\u043c\\u0431\\u0440\\u0438\\u044f, \\u0433 \\u2014 1200"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0442\\u043e\\u043c\\u0430\\u0442\\u043d\\u043e\\u0435 \\u043f\\u044e\\u0440\\u0435, \\u0433 \\u2014 80"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0430\\u043f\\u0435\\u043b\\u044c\\u0441\\u0438\\u043d\\u043e\\u0432\\u0430\\u044f \\u0446\\u0435\\u0434\\u0440\\u0430, \\u0433 \\u2014 3"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0430\\u043f\\u0435\\u043b\\u044c\\u0441\\u0438\\u043d\\u043e\\u0432\\u044b\\u0439 \\u0441\\u043e\\u043a, \\u043c\\u043b \\u2014 10"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0447\\u0435\\u0441\\u043d\\u043e\\u043a \\u0441\\u0443\\u0448\\u0435\\u043d\\u044b\\u0439, \\u0433 \\u2014 2"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u043a\\u043e\\u0440\\u0438\\u0430\\u043d\\u0434\\u0440, \\u0433 \\u2014 2"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u043f\\u0435\\u0440\\u0435\\u0446 \\u0447\\u0435\\u0440\\u043d\\u044b\\u0439, \\u0433 \\u2014 1"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u043f\\u0440\\u043e\\u0432\\u0430\\u043d\\u0441\\u043a\\u0438\\u0435 \\u0442\\u0440\\u0430\\u0432\\u044b, \\u0433 \\u2014 1"}}, {"added": {"name": "\\u0418\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442 \\u0432 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0435", "object": "\\u0441\\u043e\\u043b\\u044c, \\u0433 \\u2014 5"}}]	11	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: foodgram_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	users	user
7	users	follow
8	recipes	favorite
9	recipes	ingredient
10	recipes	ingredientamount
11	recipes	recipe
12	recipes	tag
13	recipes	shoppingcart
14	authtoken	token
15	authtoken	tokenproxy
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: foodgram_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2025-09-09 16:26:44.899627+00
2	contenttypes	0002_remove_content_type_name	2025-09-09 16:26:44.921485+00
3	auth	0001_initial	2025-09-09 16:26:45.08384+00
4	auth	0002_alter_permission_name_max_length	2025-09-09 16:26:45.093266+00
5	auth	0003_alter_user_email_max_length	2025-09-09 16:26:45.103336+00
6	auth	0004_alter_user_username_opts	2025-09-09 16:26:45.112565+00
7	auth	0005_alter_user_last_login_null	2025-09-09 16:26:45.129566+00
8	auth	0006_require_contenttypes_0002	2025-09-09 16:26:45.134927+00
9	auth	0007_alter_validators_add_error_messages	2025-09-09 16:26:45.145427+00
10	auth	0008_alter_user_username_max_length	2025-09-09 16:26:45.153899+00
11	auth	0009_alter_user_last_name_max_length	2025-09-09 16:26:45.162535+00
12	auth	0010_alter_group_name_max_length	2025-09-09 16:26:45.174958+00
13	auth	0011_update_proxy_permissions	2025-09-09 16:26:45.18363+00
14	auth	0012_alter_user_first_name_max_length	2025-09-09 16:26:45.193692+00
15	users	0001_initial	2025-09-09 16:26:45.46255+00
16	admin	0001_initial	2025-09-09 16:26:45.57587+00
17	admin	0002_logentry_remove_auto_add	2025-09-09 16:26:45.587438+00
18	admin	0003_logentry_add_action_flag_choices	2025-09-09 16:26:45.599272+00
19	sessions	0001_initial	2025-09-09 16:26:45.644578+00
20	recipes	0001_initial	2025-09-09 16:43:13.118504+00
21	authtoken	0001_initial	2025-09-11 13:08:24.562138+00
22	authtoken	0002_auto_20160226_1747	2025-09-11 13:08:24.648757+00
23	authtoken	0003_tokenproxy	2025-09-11 13:08:24.658537+00
24	users	0002_auto_20250911_1702	2025-09-11 17:02:38.103044+00
25	users	0003_auto_20250912_1912	2025-09-12 19:12:44.088219+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: foodgram_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
93e626sfqfenqf0bjl0kv2ric2tsi3nt	.eJxVjM0OwiAQhN-FsyEs_QE8evcZyLK7SNW0SWlPxndXkh40mdN838xLRdy3Evcqa5xYnRWo02-XkB4yN8B3nG-LpmXe1inppuiDVn1dWJ6Xw_07KFjLd92T7UG8OBDq2FqXAsrggzUjYuiTywIE3g3YwgZYsh-ZED2QyZ16fwDogjhf:1uw1FT:YPhUu9SL5PKEhju6PZIkjozQEdkCyHJxjeS165FqBN0	2025-09-23 16:31:15.475219+00
laph6xewjuea8ddzrsrh2o3m2umbbfwl	.eJxVjM0OwiAQhN-FsyEs_QE8evcZyLK7SNW0SWlPxndXkh40mdN838xLRdy3Evcqa5xYnRWo02-XkB4yN8B3nG-LpmXe1inppuiDVn1dWJ6Xw_07KFjLd92T7UG8OBDq2FqXAsrggzUjYuiTywIE3g3YwgZYsh-ZED2QyZ16fwDogjhf:1uxp0g:ad2ookZXaBnG0FyfOjwRljKNliyONn1gV0pI5dQCa9w	2025-09-28 15:51:26.262967+00
n4j3js8vyjnxh1r1omwvbnyxsxq5w3ze	.eJxVjM0OwiAQhN-FsyEs_QE8evcZyLK7SNW0SWlPxndXkh40mdN838xLRdy3Evcqa5xYnRWo02-XkB4yN8B3nG-LpmXe1inppuiDVn1dWJ6Xw_07KFjLd92T7UG8OBDq2FqXAsrggzUjYuiTywIE3g3YwgZYsh-ZED2QyZ16fwDogjhf:1v0F04:9fbr2wfEItzVzkM77b-0U3qDLj1hBrE8eeSOckd4soQ	2025-10-05 08:00:48.057935+00
\.


--
-- Data for Name: recipes_favorite; Type: TABLE DATA; Schema: public; Owner: foodgram_user
--

COPY public.recipes_favorite (id, recipe_id, user_id) FROM stdin;
7	102	1
\.


--
-- Data for Name: recipes_ingredient; Type: TABLE DATA; Schema: public; Owner: foodgram_user
--

COPY public.recipes_ingredient (id, name, measurement_unit) FROM stdin;
1	абрикосовое варенье	г
2	абрикосовое пюре	г
3	абрикосовый джем	г
4	абрикосовый сок	мл
5	абрикосы	г
6	абрикосы консервированные	г
7	авокадо	г
8	агава сироп	мл
9	агар-агар	г
10	аграм	г
11	аджика	г
12	аджика зеленая	г
13	айва	г
14	айвовое пюре	г
15	айран	г
16	айсинг	г
17	акула стейки	г
18	алкоголь	мл
19	алкоголь крепкий	мл
20	алыча	г
21	альбухара	шт.
22	альмехи	г
23	амарантовая мука	г
24	ананасовый сироп	мл
25	ананасовый сок	мл
26	ананасы	г
27	ананасы вяленые	г
28	ананасы консервированные	г
29	анис	г
30	анис звездочки	г
31	анисовый ликер	мл
32	анис семена	г
33	анчоусы	г
34	апельсиновая вода	мл
35	апельсиновая цедра	г
36	апельсиновая эссенция	ч. л.
37	апельсиновое варенье	г
38	апельсиновые цукаты	г
39	апельсиновый джем	г
40	апельсиновый джем с имбирем	г
41	апельсиновый ликер	мл
42	апельсиновый сироп	мл
43	апельсиновый сок	мл
44	апельсиновый сок свежевыжатый	мл
45	апельсиновый уксус	мл
46	апельсиновый экстракт	ч. л.
47	апельсины	г
48	апельсины красные	шт.
49	апельсины крупные	шт.
50	арахис	г
51	арахис жареный	г
52	арахисовая паста	г
53	арахисовое масло	г
54	арахис соленый	г
55	арбузная мякоть	г
56	арбузы	г
57	аргановое масло	г
58	аришта	г
59	ароматизатор	г
60	ароматизатор "ананас"	капля
61	ароматизатор "вишня"	капля
62	ароматизатор "малина"	капля
63	ароматизатор "ром"	капля
64	артишоки	г
65	артишоки в масле	г
66	артишоки маринованные	г
67	аспирин	шт.
68	ассорти мясное	г
69	ассорти овощное	г
70	ассорти фруктовое	г
71	ассорти ягодное	г
72	аши	г
73	багет	г
74	багет вчерашний	г
75	багет мини	г
76	бадан	г
77	бадьян	г
78	базилик лимонный	г
79	базилик свежий	г
80	базилик сушеный	г
81	базилик тайский	г
82	базилик фиолетовый	г
83	баклажаны	г
84	баклажаны мини	г
85	баклажаны тайские	г
86	балык	г
87	бальзам	г
88	бальзамический крем	г
89	бальзамический соус	мл
90	бальзамический уксус	мл
91	бальзам рижский черный	мл
92	бамия	г
93	банановое пюре	г
94	банановые чипсы	г
95	банановый зеленый сироп	мл
96	банановый ликер	мл
97	бананы	г
98	бананы мини	г
99	барабулька	г
100	бараний ливер	г
101	бараний окорок на косточке	г
102	бараний фарш	г
103	баранина	г
104	баранки	г
105	бараньи антрекоты	г
106	бараньи голяшки	шт.
107	бараньи потроха	г
108	бараньи ребрышки	шт.
109	баранья лопатка	г
110	баранья нога	г
111	баранья печень	г
112	барбарис	г
113	барбарис вяленый	ст. л.
114	барбарис молотый	г
115	бастурма	г
116	батат	г
117	батон	г
118	батончики шоколадные	г
119	безе	г
120	бекон	г
121	бекон варено-копченый	г
122	бекон сырокопченый	г
123	белорыбица	г
124	бирнель	мл
125	бисквик смесь готовая	г
126	бисквит	г
127	бисквитная крошка	г
128	бисквитный корж	г
129	бисквитный рулет	г
130	бисквит шоколадный	г
131	бифштекс	шт.
132	блинная мука	г
133	блины готовые	г
134	блины овсяные	шт.
135	бобовые ростки	г
136	бобы	г
137	бобы мунг пророщенные	г
138	бобы тонка	шт.
139	ботарга	г
140	брезаола	г
141	бренди	г
142	брокколи замороженная	г
143	брокколи свежая	г
144	брусника замороженная	г
145	брусника свежая	г
146	брусника сушеная	г
147	брусничное варенье	г
148	брусничный соус	г
149	брынза	г
150	брынза сербская	г
151	брюква	г
152	буженина	г
153	бузина сироп	мл
154	букет гарни	г
155	булгур	г
156	булка	г
157	булка белая	г
158	булка сдобная	г
159	булочки	г
160	булочки белые черствые	г
161	булочки бриошь	шт.
162	булочки вчерашние	шт.
163	булочки для гамбургеров	шт.
164	булочки зерновые	шт.
165	булочки ржаные	кусок
166	булочки с кунжутом	шт.
167	бульон	мл
168	бульонные кубики	г
169	бурбон	мл
170	Буррата	г
171	буряк	г
172	бусинки кондитерские	ч. л.
173	бусинки кондитерские серебряные	г
174	бычий хвост	г
175	ванилин	г
176	ваниль в стручках	г
177	ванильная настойка	мл
178	ванильная эссенция	г
179	ванильный порошок	г
180	ванильный сироп	мл
181	ванильный экстракт	г
182	варенье	г
183	васаби	г
184	вафельная крошка	г
185	вафельные коржи	г
186	вафельные трубочки	г
187	вафли	г
188	вафли шоколадные	г
189	вермишель	г
190	вермишель яичная	г
191	вермут	мл
192	вермут белый	мл
193	вермут сухой	мл
194	ветчина	г
195	ветчина вареная	г
196	ветчина варено-копченая	г
197	ветчина копченая	г
198	ветчина пармская	г
199	ветчина сырокопченая	г
200	вешенки	г
201	винегрет	г
202	винный камень	г
203	винный уксус	мл
204	винный уксус белый	мл
205	винный уксус красный	мл
206	винный уксус на чесноке	мл
207	винный уксус на эстрагоне	мл
208	вино белое	мл
209	вино белое полусладкое	мл
210	вино белое полусухое	мл
211	вино белое сладкое	мл
212	вино белое столовое	мл
213	вино белое сухое	мл
214	виноград	г
215	виноград без косточек	г
216	виноград белый	г
217	виноград изабелла	г
218	виноградное желе	г
219	виноградные листья	г
220	виноградные листья маринованные	г
221	виноградные листья молодые	шт.
222	виноградный сок	мл
223	виноградный сок осветленный	мл
224	виноград синий	г
225	виноград черный	г
226	вино десертное	мл
227	вино игристое сухое	мл
228	вино красное	мл
229	вино красное полусладкое	мл
230	вино красное полусухое	мл
231	вино красное сладкое	мл
232	вино красное сухое	мл
233	вино крепленое	мл
234	вино розовое полусладкое	мл
235	вино розовое полусухое	мл
236	виски	мл
237	витамин C в порошке	г
238	вишневая настойка	мл
239	вишневое варенье	г
240	вишневые листья	г
241	вишневый джем	г
242	вишневый ликер	мл
243	вишневый сироп	мл
244	вишневый сок	мл
245	вишня	г
246	вишня вяленая	г
247	вишня замороженная	г
248	вишня засахаренная кондитерская	шт.
249	вишня коктейльная	г
250	вишня мараскино	г
251	вишня, протертая с сахаром	г
252	вода	мл
253	вода минеральная без газа	мл
254	вода минеральная газированная	мл
255	водка	мл
256	водка анисовая	мл
257	водоросли	г
258	вустерширский соус	мл
259	галангал корень	г
260	галеты	г
261	гамбургер	г
262	ганаш	г
263	гарам масала	г
264	гарнир	г
265	гаспачо	г
266	гвоздика	г
267	гвоздика молотая	г
268	герань листья	г
269	геркулес	г
270	глазурь	г
271	глазурь белая	г
272	глазурь готовая	г
273	глазурь черная	г
274	глазурь шоколадная белая	г
275	глутамат натрия	г
276	глюкоза	г
277	глюкоза сироп	мл
278	говядина	г
279	говядина на кости	г
280	говяжий фарш	г
281	говяжий язык	г
282	говяжье сердце	г
283	говяжьи бифштексы	г
284	говяжьи голяшки	г
285	говяжьи легкие	г
286	говяжьи ребра	г
287	говяжьи стейки рибай	г
288	говяжья вырезка	шт.
289	говяжья грудинка	г
290	говяжья лопатка	г
291	говяжья мозговая кость	шт.
292	говяжья мякоть	г
293	говяжья печень	г
294	говяжья черева	г
295	говяжья шейка	г
296	годжи	г
297	голец филе	г
298	голубика	г
299	голубика замороженная	г
300	голубь	г
301	горбуша	г
302	горбуша в собственном соку	банка
303	горбуша филе	г
304	горгонзола	г
305	горгонзола пиканте	г
306	горох	г
307	горох колотый	г
308	гороховые ростки	г
309	гороховый суп	мл
310	горошек зеленый	г
311	горошек зеленый замороженный	г
312	горошек зеленый консервированный	г
313	горошек стручковый свежий	г
314	горчица	г
315	горчица дижонская	г
316	горчица дижонская с медом	г
317	горчица желтая семена	г
318	горчица острая	г
319	горчица русская	г
320	горчица семена	г
321	горчица с зернами	г
322	горчица сухая	г
323	горчица французская	г
324	горчица цитрусовая	г
325	горчичное масло	мл
326	горчичный порошок	г
327	грана падано	г
328	гранатные зерна	г
329	гранатовая паста	г
330	гранатовый сироп	мл
331	гранатовый сок	мл
332	гранатовый сок свежевыжатый	мл
333	гранатовый соус	мл
334	гранаты	г
335	гранита	г
336	гранола с орехами	г
337	граппа	г
338	гратен	г
339	грейпфрутовая цедра	г
340	грейпфрутовый сок	г
341	грейпфруты	г
342	грейпфруты розовые	г
343	гренадин	г
344	гренки	г
345	грецкие орехи	г
346	грецкие орехи рубленые	г
347	гречневая крупа	г
348	гречневая крупа зеленая	г
349	гречневая лапша соба	г
350	гречневая мука	г
351	гречневое молоко	мл
352	гречневые хлопья	г
353	грибы	г
354	грибы белые	г
355	грибы белые замороженные	г
356	грибы белые маринованные	г
357	грибы белые сухие	г
358	грибы замороженные	г
359	грибы замороженные (опята и маслята)	г
360	грибы лесные	г
361	грибы маринованные	г
362	грибы свежие	г
363	грибы соленые	г
364	грибы соломенные консервированные	г
365	грибы сухие	г
366	грибы шиитаке	г
367	грибы шиитаке сухие	г
368	гриль	г
369	гриссини	г
370	грудинка	г
371	грудинка варено-копченая	г
372	грудинка копченая	г
373	грушевое пюре	г
374	грушевый ликер	мл
375	грушевый сироп	мл
376	грушевый сок	мл
377	грушевый уксус	мл
378	груши	г
379	груши вяленые	г
380	грюйер	г
381	гуава	г
382	гуанчиале	г
383	гурьевская каша	г
384	гусиная грудка копченая	г
385	гусиная печень	г
386	гусиный жир	ст. л.
387	гусь	г
388	гусь тушка	г
389	дайкон	г
390	детское питание	г
391	джем	г
392	джин	мл
393	джусай	г
394	диоксид титана	г
395	долма	г
396	дорада	г
397	дорада потрошеная с головой	г
398	дорада с головой	г
399	дорада тушка	г
400	драже	г
401	дрожжи домашние	г
402	дрожжи свежие	г
403	дрожжи сухие	г
404	дубовая кора	г
405	душица	г
406	дыня	г
407	ежевика	г
408	ежевика замороженная	г
409	ёрш	г
410	ёрш-носарь	г
411	желатин	г
412	желатин листовой	г
413	желе	г
414	желе для торта	г
415	желирующее вещество	г
416	желирующий сахар	г
417	женьшень	г
418	жидкий дым	мл
419	жимолость	г
420	жир	г
421	жир вытопленный	г
422	жир кулинарный	г
423	жир растительный	г
424	заатар	г
425	завтрак сухой	г
426	завтрак сухой подушечки	г
427	загуститель для сливок	г
428	зайчатина	г
429	закваска	г
430	закваска вечная	г
431	заменитель сахара	г
432	заменитель сахара стевия	г
433	заправка для салатов готовая	г
434	зверобой	г
435	зелень	г
436	зелень рубленая	г
437	земляника	г
438	земляника замороженная	г
439	зефир	г
440	зира	г
441	злаковые хлопья	г
442	зубатка	г
443	зубатка филе	г
444	изолят соевого протеина	г
445	изюм	г
446	изюм без косточек	г
447	изюм белый	г
448	изюм черный	г
449	икра	г
450	икра вяленой рыбы	г
451	икра горбуши зернистая	г
452	икра красная	г
453	икра красной рыбы мелкая	г
454	икра летучей рыбы	г
455	икра лосося	г
456	икра мойвы	г
457	икра палтуса	г
458	икра судака	г
459	икра черная	г
460	имбирное варенье	г
461	имбирное печенье	г
462	имбирные цукаты	г
463	имбирь	г
464	имбирь засахаренный	г
465	имбирь корень	г
466	имбирь маринованный	г
467	имбирь молотый	г
468	индейка	г
469	индейка голень	г
470	индейка грудка	г
471	индейка копченая	г
472	индейка тушка	шт.
473	индейка фарш	г
474	индейка филе	г
475	индоутка	шт.
476	индюшачья печень	г
477	инжир	г
478	инжир свежий	г
479	инжир сушеный	г
480	ирга	г
481	ириски	г
482	итальянские травы	г
483	йогурт	г
484	йогурт греческий	г
485	йогурт жирный	г
486	йогурт козий	г
487	йогурт натуральный	г
488	йогурт нежирный	г
489	йогурт обезжиренный	г
490	йогурт фруктовый	г
491	кабачки	г
492	кабачки замороженные	г
493	кабачки молодые	г
494	каджунская смесь специй	г
495	какао	г
496	какао-бобы	г
497	какао-масло	г
498	какао-порошок	г
499	какао-порошок обезжиренный	г
500	какао сгущенное	г
501	калина	г
502	калина протертая	г
503	калинджи семена	ч. л.
504	кальвадос	г
505	кальмары	г
506	кальмары вареные	г
507	кальмары замороженные	г
508	кальмары консервированные	г
509	кальмары филе	г
510	камамбер	г
511	камбала	г
512	камбала филе	г
513	кампари	мл
514	кандурин золотой	ч. л.
515	каннеллони	г
516	капеллини	г
517	каперсы	г
518	каперсы в винном уксусе	г
519	каперсы маринованные	г
520	капуста белокочанная	г
521	капуста брюссельская	г
522	капуста брюссельская замороженная	г
523	капуста кале	г
524	капуста квашеная	г
525	капуста кольраби	г
526	капуста краснокочанная	г
527	капуста морская	г
528	капуста морская замороженная	г
529	капуста морская сушеная	г
530	капуста пекинская	г
531	капуста савойская	г
532	капуста цветная	г
533	капуста цветная замороженная	г
534	капустный рассол	г
535	капучино	г
536	каракатица	г
537	каракатица очищенная	г
538	карамбола	г
539	карамель	г
540	карамельный соус	г
541	карамель с начинкой	г
542	карамель соленая	г
543	карась	г
544	карбонад	г
545	кардамон	г
546	кардамон зерна	г
547	кардамон молотый	г
548	кардамон стручки	г
549	каркаде	г
550	карп	г
551	карп зеркальный	г
552	карп филе	г
553	карри	г
554	карри листья	г
555	карри паста	г
556	картофель	г
557	картофель вареный	г
558	картофель вареный в мундире	г
559	картофель молодой	г
560	картофельное пюре	г
561	картофельные ньокки	г
562	картофельные хлопья	г
563	картофельные чипсы	г
564	картофельный крахмал	г
565	картофельный отвар	г
566	картофельный хэш замороженный	г
567	картофель печеный	г
568	катык	г
569	каффир-лайм листья	г
570	каша	г
571	каша для детского питания	г
572	каштановая мука	г
573	каштановый крем	г
574	каштаны	г
575	каштаны вареные	г
576	каштаны консервированные	г
577	каштаны очищенные	г
578	квас	г
579	квасное сусло	г
580	квасной концентрат сухой	г
581	квас хлебный	г
582	кедровая мука	г
583	кедровые орехи	г
584	кедровые орехи жареные	г
585	кета	г
586	кетчуп острый	г
587	кетчуп томатный	г
588	кетчуп тосканский	г
589	кетчуп шашлычный	г
590	кефаль	г
591	кефир	мл
592	кефир 1%	мл
593	кефир 2,5%	мл
594	кефир 3,2%	мл
595	кефир обезжиренный	мл
596	кешью	г
597	кивано	г
598	киви	г
599	киви желе	г
600	кижуч	г
601	кижуч горячего копчения филе	г
602	кизил	г
603	килька	г
604	кимчи	г
605	кинза свежая	г
606	кинза сушеная	г
607	киноа	г
608	киноа молотая	г
609	кипяток	мл
610	кирш	г
611	кисель	г
612	кисель сухой	г
613	кисломолочный напиток Тан	мл
614	кишки	г
615	клейковина	г
616	клементины	г
617	кленовый сироп	мл
618	клубника	г
619	клубника в сиропе	г
620	клубника замороженная	г
621	клубника, протертая с сахаром	г
622	клубника сушеная	г
623	клубничное варенье	г
624	клубничное желе	г
625	клубничное пюре	г
626	клубничный джем	г
627	клубничный джем густой	г
628	клубничный компот	мл
629	клубничный ликер	мл
630	клубничный сироп	мл
631	клюква	г
632	клюква вяленая	г
633	клюква замороженная	г
634	клюква, протертая с сахаром	г
635	клюквенное варенье	г
636	клюквенный джем	г
637	клюквенный морс	мл
638	клюквенный сироп	мл
639	клюквенный соус	г
640	козлиная печень	г
641	козлятина молодая	г
642	кока-кола	мл
643	кокосовая вода	мл
644	кокосовая мука	г
645	кокосовая стружка	г
646	кокосовая стружка цветная	г
647	кокосовое масло	мл
648	кокосовое молоко	мл
649	кокосовые сливки	мл
650	кокосовый ликер	мл
651	кокосовый экстракт	мл
652	кокосы	г
653	кола	мл
654	колбаса	г
655	колбаса вареная	г
656	колбаса варено-копченая	г
657	колбаса копченая	г
658	колбаса кровяная	г
659	колбаса полукопченая	г
660	колбаса сырокопченая	г
661	колбаска свиная свежая (salsiccia)	г
662	колбаски	г
663	колбаски для жарки	г
664	колбаски домашние	г
665	колбаски охотничьи	г
666	колбаски сырокопченые	г
667	компот	г
668	конопляное масло	мл
669	конопля семена	г
670	конфеты	г
671	конфеты M&M’s	г
672	конфеты жевательные лакричные	г
673	конфеты Коровка	г
674	конфеты Трюфель	г
675	конфитюр	г
676	конфитюрка	г
677	коньяк	мл
678	копчености	г
679	коренья	г
680	кориандр	г
681	кориандр зелень	г
682	кориандр молотый	г
683	кориандр семена	г
684	коринка	г
685	корица	г
686	корица молотая	г
687	корнишоны	г
688	корнишоны маринованые	г
689	корюшка	г
690	корюшка горячего копчения	г
691	кости	г
692	кости мозговые	г
693	кость сахарная	г
694	кофе в зернах	г
695	кофе зеленый	г
696	кофейные зерна в шоколаде	г
697	кофейный ликер	мл
698	кофейный ликер Kahlua	мл
699	кофейный напиток	мл
700	кофейный сироп	мл
701	кофейный экстракт	мл
702	кофе молотый	г
703	кофе растворимый	г
704	кофе свежесваренный	мл
705	кофе черный	мл
706	кофе эспрессо	мл
707	крабовое мясо	г
708	крабовые палочки	г
709	краб снежный	г
710	крабы	г
711	крапива	г
712	краситель-гель пищевой	г
713	краситель пищевой	г
714	краситель пищевой вишневый	г
715	краситель пищевой желтый	г
716	краситель пищевой зеленый	г
717	краситель пищевой красный	г
718	краситель пищевой оранжевый	г
719	краситель пищевой фиолетовый	г
720	краситель пищевой черный	г
721	красная смородина	г
722	красная смородина, протертая с сахаром	г
723	красноперка	г
724	красносмородиновое варенье	г
725	красный винный соус	г
726	крахмал	г
727	креветки	г
728	креветки замороженные	г
729	креветки королевские	г
730	креветки очищенные	г
731	креветки очищенные в рассоле	г
732	креветки салатные	г
733	креветки сушеные	г
734	креветки тигровые	г
735	крекер	г
736	крекер соленый	г
737	крем заварной	г
738	крем заварной порошковый	г
739	крем-фреш	г
740	кресс-салат	г
741	кровь	мл
742	кролик	г
743	кролик тушка	г
744	кролик филе	г
745	кроличья печень	г
746	круассаны	шт.
747	крутоны мелкие	г
748	крыжовник	г
749	крыжовниковое варенье	г
750	кукуруза	г
751	кукуруза замороженная	г
752	кукуруза консервированная	г
753	кукуруза обжаренная кикос	г
754	кукурузная крупа	г
755	кукурузная мука	г
756	кукурузное масло	г
757	кукурузные лепешки	шт.
758	кукурузные палочки	г
759	кукурузные хлопья	г
760	кукурузные хлопья глазированные	г
761	кукурузные чипсы	г
762	кукурузный (золотой) сироп	мл
763	кукурузный крахмал	г
764	кумин	г
765	кумкваты	г
766	кунжут	г
767	кунжутная мука	г
768	кунжутная паста	г
769	кунжутное масло	г
770	кунжутные семечки	г
771	кунжут черный	г
772	купаты	шт.
773	курага	г
774	курдючное сало	г
775	курдючный жир	г
776	куриная ветчина	г
777	куриная кожа	г
778	куриная печень	г
779	куриное карпаччо	г
780	куриное филе	г
781	куриные бедра	г
782	куриные голени	г
783	куриные голени копченые	шт.
784	куриные грудки	г
785	куриные грудки вареные	г
786	куриные грудки копченые	г
787	куриные желудочки	г
788	куриные кости	г
789	куриные крылья	г
790	куриные окорочка	г
791	куриные окорочка копченые	г
792	куриные потрошки	г
793	куриные сердечки	г
794	куриный бульон	мл
795	куриный паштет	г
796	куриный суповой набор	г
797	куриный фарш	г
798	курица	г
799	курица вареная	г
800	курица для жарки	г
801	курица копченая	г
802	курица тушка	г
803	куркума	г
804	куропатки	г
805	кускус	г
806	кускус жемчужный	стакан
807	кэроб	г
808	лаванда	г
809	лаванда сушеная	щепотка
810	лавандовый краситель	ч. л.
811	лаваш	г
812	лаваш армянский	г
813	лаваш персидский круглый	г
814	лаваш тонкий	г
815	лавровые листья свежие	шт.
816	лавровый лист	г
817	лайм	г
818	лайм листья	шт.
819	лаймовая цедра	г
820	лаймовый сок	мл
821	лангустины	шт.
822	лапша	г
823	лапша для лагмана	г
824	лапша ширатаки	г
825	лапша яичная в гнездах	г
826	латук	г
827	легкие	г
828	лед	г
829	леди-фиш тушка	г
830	лемонграсс (лимонное сорго)	г
831	лен семена	г
832	лепешки	г
833	лепешки арабские	шт.
834	лесные орехи	г
835	лечо	г
836	ливер	г
837	ликер	мл
838	ликер Alchermes	мл
839	ликер Amaretto	мл
840	ликер Baileys	мл
841	ликер Cointreau	мл
842	ликер кремовый	мл
843	ликер сливочный	мл
844	лимонад	мл
845	лимонная кислота	мл
846	лимонная цедра	г
847	лимонник стебель	г
848	лимонник ягоды	г
849	лимонные корочки засахаренные	г
850	лимонные цукаты	г
851	лимонный сок	мл
852	лимонный уксус	мл
853	лимонный экстракт	мл
854	лимончелло	г
855	лимоны	г
856	лингвине	шт.
857	лисички	г
858	лисички сушеные	г
859	личи	шт.
860	личи компот	мл
861	лобстер	г
862	лонган	г
863	лонгконг	шт.
864	лососевые молоки	г
865	лососевый фарш	г
866	лосось	г
867	лосось горячего копчения	г
868	лосось копченый	г
869	лосось свежесоленый	г
870	лосось свежий	г
871	лосось свежий филе	г
872	лосось слабосоленый	г
873	лосось стейки	г
874	лосось филе	г
875	лосось филе на коже	г
876	лосось холодного копчения	г
877	лосятина	г
878	лук белый	г
879	лук зеленый	г
880	лук красный	г
881	лук маринованный	г
882	луковая шелуха	г
883	луковый порошок	г
884	лук-порей	горсть
885	лук-резанец	г
886	лук репчатый	г
887	лук репчатый мелкий	г
888	лук салатный	г
889	лук сушеный	г
890	лук-шалот	г
891	лук-шалот красный	г
892	льняная мука	г
893	льняное масло	мл
894	льняное семя	г
895	льняное семя молотое	г
896	любисток	г
897	маасдам	г
898	мадера	г
899	майонез	г
900	майонез домашний	г
901	майонез легкий	г
902	майонезный соус «Слобода» Постный	г
903	майонез оливковый	г
904	майонез «Слобода» Легкий	г
905	майонез «Слобода» На перепелиных яйцах	г
906	майонез «Слобода» Оливковый	г
907	майонез «Слобода» Провансаль	г
908	майонез «Слобода» С лимонным соком	г
909	майонез «Слобода» Сметанный	г
910	майоран	г
911	майоран свежий	г
912	майоран сушеный	г
913	мак	г
914	макаронные изделия	г
915	макаронные изделия мелкие	г
916	макароны	г
917	макароны-бабочки (farfalle)	г
918	макароны-бабочки (farfalle) мини	г
919	макароны баветте	г
920	макароны-бантики	г
921	макароны букатини	г
922	макароны джильи	г
923	макароны диталони	г
924	макароны-звездочки	г
925	макароны орзо	г
926	макароны-ракушки (conchiglie)	г
927	макароны-ракушки (conchiglie rigate)	г
928	макароны-ракушки крупные	г
929	макароны рисони	г
930	макароны-рожки (pipe rigate)	г
931	макароны-спиральки (fusilli)	г
932	макароны-ушки (orecchiette)	г
933	маккерончини	г
934	мак молотый	г
935	маковая масса	г
936	малина	г
937	малина замороженная	г
938	малина, протертая с сахаром	г
939	малина сушеная	г
940	малиновое варенье	г
941	малиновое желе	г
942	малиновое пюре	г
943	малиновый джем	г
944	малиновый крем	г
945	малиновый сироп	мл
946	малиновый соус	г
947	малиновый уксус	мл
948	малиновый чай	г
949	манго	г
950	манговый сироп	мл
951	манго консервированное	г
952	мангольд	г
953	мангустин	г
954	мандариновое пюре	г
955	мандариновые цукаты	г
956	мандариновый сок	мл
957	мандарины	г
958	мандарины в собственном соку	г
959	манная крупа	г
960	маракуйя	г
961	маргарин	г
962	маргарин сливочный	г
963	мармелад	г
964	мармелад бутербродный	г
965	марсала	г
966	мартини	мл
967	мартини красный	мл
968	марципан	г
969	марципан зеленый	г
970	марципан розовый	г
971	маршмеллоу	г
972	маршмеллоу крем	г
973	маршмеллоу мини	г
974	маскарпоне	г
975	маслины	г
976	маслины без косточек	г
977	масло авокадо	мл
978	масло виноградных косточек	мл
979	масло грецкого ореха	мл
980	масло для фритюра	мл
981	масло кедрового ореха	мл
982	маслята	г
983	мастика	г
984	мастика желатиновая	г
985	мастика шоколадная	г
986	матча	г
987	мафальдине	г
988	маца	г
989	мацони	г
990	маш	г
991	мед	г
992	мед акации	г
993	мед гречишный	г
994	мед жидкий	г
995	мед лавандовый	г
996	мелисса	г
997	меренги	г
998	мидии	г
999	мидии в раковинах	г
1000	мидии в раковинах крупные черные	г
1001	мидии в раковинах мелкие зеленые	г
1002	мидии замороженные	г
1003	мидии копченые в масле	г
1004	микрозелень	г
1005	миндаль	г
1006	миндаль жареный	г
1007	миндаль измельченный	г
1008	миндальная масса	г
1009	миндальная мука	г
1010	миндальная паста	г
1011	миндальная эссенция	г
1012	миндальное масло	г
1013	миндальное молоко	мл
1014	миндальное печенье	г
1015	миндальное пралине	г
1016	миндальные лепестки	г
1017	миндальный ликер	мл
1018	миндальный сироп	мл
1019	миндальный экстракт	мл
1020	миндаль очищенный	г
1021	миндаль рубленый	г
1022	мини-кукуруза	г
1023	минога	г
1024	минтай	г
1025	минтай печень	г
1026	минтай филе	г
1027	мисо-паста	г
1028	мисо-суп	мл
1029	можжевельник ягоды	г
1030	мойва	г
1031	моллюски	г
1032	молоко	мл
1033	молоко 0,5%	мл
1034	молоко 1,5%	мл
1035	молоко 2,5%	мл
1036	молоко 3,2%	мл
1037	молоко 3,6%	мл
1038	молоко 4%	мл
1039	молоко 6%	мл
1040	молоко козье	мл
1041	молоко концентрированное	мл
1042	молоко рисовое	мл
1043	молоко сгущенное	г
1044	молоко сгущенное вареное	г
1045	молоко сгущенное с какао	г
1046	молоко сухое	г
1047	молоко сухое обезжиренное	г
1048	молоко топленое	мл
1049	молочная смесь	г
1050	молочные продукты	г
1051	морепродукты	г
1052	морковное пюре	г
1053	морковь	г
1054	морковь вареная	г
1055	морковь крупная	г
1056	морковь молодая	г
1057	морковь по-корейски	г
1058	морковь тертая	г
1059	мороженое	г
1060	мороженое ванильное	г
1061	мороженое клубничное	г
1062	мороженое лимонное	г
1063	мороженое малиновое	г
1064	мороженое пломбир	г
1065	мороженое шоколадное	г
1066	морошка	г
1067	морские гребешки	г
1068	морской коктейль	г
1069	морской коктейль в масле	г
1070	морской коктейль замороженный	г
1071	морской черт	г
1072	морской язык	г
1073	морской язык филе	г
1074	мортаделла	г
1075	моцарелла	г
1076	моцарелла для запекания	г
1077	моцарелла для пиццы	г
1078	моцарелла мини	г
1079	моцарелла с травами	г
1080	моцарелла шарик большой	г
1081	мука	г
1082	мука 1 сорт	г
1083	мука 2 сорт	г
1084	мука «Аладушкин»	г
1085	мука грубого помола	г
1086	мука для темпуры	г
1087	мука из пророщенной пшеницы	г
1088	мука манитоба	г
1089	мука самоподнимающаяся	г
1090	мука с отрубями	г
1091	мука с семечками	г
1092	мука хлебопекарная	г
1093	мука цельнозерновая	г
1094	мускат белый	мл
1095	мускатное вино	мл
1096	мускатный орех	г
1097	мускатный орех молотый	г
1098	мюсли	г
1099	мягкий творог	г
1100	мясной бульон	мл
1101	мясной фарш	г
1102	мясо	г
1103	мясо дикого кабана	г
1104	мясо криля	г
1105	мясо на косточке	г
1106	мята	г
1107	мята сушеная	г
1108	мятный сироп	мл
1109	мятный шнапс	мл
1110	нардек	г
1111	нектарины	г
1112	нога ягненка без кости	г
1113	нори	г
1114	нуга	г
1115	нуга с орехами	г
1116	нут	г
1117	нутелла	г
1118	нут консервированный	г
1119	нутовая мука	г
1120	облепиха	г
1121	облепиха замороженная	г
1122	облепиховый сироп	мл
1123	овощи	г
1124	овощная смесь	г
1125	овощная смесь замороженная	г
1126	овощная смесь замороженная для wok	г
1127	овощная смесь по-китайски	г
1128	овощной бульон	мл
1129	овсяная мука	г
1130	овсяное молоко	мл
1131	овсяное печенье	г
1132	овсяное толокно	г
1133	овсяные зерна	г
1134	овсяные отруби	г
1135	овсяные хлопья	г
1136	овсяные хлопья быстрого приготовления	г
1137	огуречный рассол	мл
1138	огурцы	г
1139	огурцы консервированные	г
1140	огурцы малосольные	г
1141	огурцы маринованные	г
1142	огурцы свежие	г
1143	огурцы соленые	г
1144	одуванчики	г
1145	окорок	г
1146	окорок варено-копченый	г
1147	окунь	г
1148	окунь красный филе	г
1149	окунь морской	г
1150	окунь морской филе	г
1151	окунь филе	г
1152	оленина	г
1153	оливки	г
1154	оливки без косточек	г
1155	оливки зеленые	г
1156	оливки зеленые консервированные	банка
1157	оливки каламата	г
1158	оливки консервированные	г
1159	оливки, фаршированные анчоусами	г
1160	оливки черные	г
1161	оливковая паста	г
1162	оливковое масло	г
1163	оливковое масло Extra Virgin	г
1164	опунция плоды	г
1165	опята	г
1166	опята замороженные	г
1167	опята маринованные	г
1168	орегано	г
1169	орегано свежий	г
1170	орегано сушеный	г
1171	орехи	г
1172	орехи бразильские	г
1173	орехи макадамия	г
1174	орехи пекан	г
1175	орехи пинии	г
1176	ореховая крошка	г
1177	ореховая паста	г
1178	ореховое масло	мл
1179	ореховый ликер	мл
1180	ореховый соус	г
1181	осетр	г
1182	осетрина холодного копчения	г
1183	осьминог	г
1184	осьминоги консервированные	г
1185	осьминоги мини	г
1186	отруби	г
1187	ошеек	г
1188	пагр	г
1189	пажитник	г
1190	пажитник семена	г
1191	палтус	г
1192	пальмовое масло	мл
1193	пангасиус	г
1194	панеттоне	г
1195	Панифарин	г
1196	панчетта	г
1197	папайя	г
1198	папайя консервированная в собственном соку	г
1199	папоротник	г
1200	папоротник соленый	г
1201	паппарделле	г
1202	паприка	г
1203	паприка копченая	г
1204	паприка красная	г
1205	паприка красная молотая	г
1206	паприка острая копченая	г
1207	паприка сладкая	г
1208	паприка сладкая копченая	г
1209	паприка сладкая хлопьями	г
1210	пармезан	г
1211	паста	г
1212	паста веджимайт	г
1213	паста тахини	г
1214	паста хариса	г
1215	пастернак	г
1216	пастила	г
1217	пастила виноградная	г
1218	патиссоны	г
1219	патока	г
1220	патока крахмальная	г
1221	патока черная (меласса)	г
1222	пахта	г
1223	паштет	г
1224	пекарский порошок	г
1225	пекорино	г
1226	пектин	г
1227	пеленгас	г
1228	пельмени	г
1229	пенне	г
1230	пенне ригате	г
1231	пеперончино	г
1232	пеперончино молотый	г
1233	переводной лист для шоколада	шт.
1234	перепелки	г
1235	перец	г
1236	перец белый	г
1237	перец белый горошком	г
1238	перец белый молотый	г
1239	перец белый свежемолотый	ч. л.
1240	перец болгарский	г
1241	перец болгарский желтый	г
1242	перец болгарский зеленый	г
1243	перец болгарский красный	г
1244	перец горошком	г
1245	перец горошком смесь	г
1246	перец душистый	г
1247	перец душистый горошком	г
1248	перец душистый молотый	г
1249	перец испанский острый	г
1250	перец кайенский	г
1251	перец кайенский красный	г
1252	перец кайенский молотый	г
1253	перец красный	г
1254	перец красный горошком	г
1255	перец красный жгучий	г
1256	перец красный молотый	г
1257	перец красный острый	г
1258	перец красный острый молотый	г
1259	перец красный хлопьями	г
1260	перец лимонный	г
1261	перец маринованный	г
1262	перец острый	г
1263	перец острый зеленый	г
1264	перец острый молотый	г
1265	перец падрон	г
1266	перец пеперони	г
1267	перец пеперони красный	г
1268	перец розовый горошком	г
1269	перец свежемолотый смесь	г
1270	перец сенегальский	г
1271	перец сладкий	г
1272	перец сладкий желтый	г
1273	перец сладкий зеленый	г
1274	перец сладкий красный	г
1275	перец сладкий красный маринованный	г
1276	перец сладкий красный молотый	г
1277	перец сладкий оранжевый	г
1278	перец сладкий сушеный	г
1279	перец сычуаньский	г
1280	перец халапеньо	г
1281	перец халапеньо маринованный	г
1282	перец черный	г
1283	перец черный горошком	г
1284	перец черный молотый	г
1285	перец черный свежемолотый	г
1286	перец чили	г
1287	перец чили зеленый	г
1288	перец чили красный	г
1289	перец чили маринованный	г
1290	перец чили молотый	г
1291	перец чили сухой	г
1292	перец чили хлопьями	г
1293	перец ямайский	г
1294	перловая крупа	г
1295	перловая мука	г
1296	персики	г
1297	персики консервированные	г
1298	персики сушеные	горсть
1299	персиковое пюре	г
1300	персиковый джем	г
1301	персиковый мармелад	г
1302	персиковый сироп	мл
1303	персиковый сок	мл
1304	перцовая паста	г
1305	петрушка	г
1306	петрушка зелень	г
1307	петрушка итальянская	г
1308	петрушка корень	г
1309	петрушка рубленая	г
1310	петрушка сушеная	г
1311	печень	г
1312	печенье	г
1313	печенье Oreo	г
1314	печенье Амаретти	г
1315	печенье бисквитное	г
1316	печенье галетное	шт.
1317	печенье «Дамские пальчики»	г
1318	печенье песочное	г
1319	печенье рассыпчатое	г
1320	печенье Савоярди	г
1321	печенье сахарное	г
1322	печенье сладкое	г
1323	печенье сухое	г
1324	печенье шоколадное	г
1325	печенье Юбилейное молочное	г
1326	пиво	мл
1327	пиво имбирное	мл
1328	пиво нефильтрованное	мл
1329	пиво светлое	мл
1330	пиво темное	мл
1331	пикша	шт.
1332	питы	г
1333	повидло	г
1334	подсолнечное масло	мл
1335	подсолнечные семечки	г
1336	полба	г
1337	полба недозрелая	г
1338	полента	г
1339	полента быстрого приготовления	г
1340	помело	г
1341	помидоры	г
1342	помидоры бурые	г
1343	помидоры вяленые	мл
1344	помидоры вяленые в масле	г
1345	помидоры желтые	г
1346	помидоры зеленые	г
1347	помидоры консервированные	г
1348	помидоры консервированные в собственном соку	г
1349	помидоры консервированные в собственном соку с базиликом	г
1350	помидоры протертые пассата	г
1351	помидоры соленые	г
1352	помидоры сушеные хлопьями	г
1353	помидоры черри	г
1354	помидоры черри желтые	г
1355	попкорн	г
1356	поросенок	г
1357	портвейн	мл
1358	портобелло	г
1359	портулак	г
1360	посыпка кондитерская	г
1361	почки	г
1362	приправа 4 перца	г
1363	приправа 5 специй (five spice)	ч. л.
1364	приправа для баранины	ст. л.
1365	приправа для картофеля	г
1366	приправа для курицы	г
1367	приправа для макарон	г
1368	приправа для маринования свинины	г
1369	приправа для морепродуктов	г
1370	приправа для мяса	г
1371	приправа для паэльи	г
1372	приправа для пиццы	г
1373	приправа для плова	г
1374	приправа для птицы	г
1375	приправа для рыбы	г
1376	приправа для салатов	г
1377	приправа заатар	г
1378	приправа креольская	г
1379	приправа с сушеными грибами	г
1380	приправы	г
1381	прованские травы	г
1382	проволоне	г
1383	просекко	мл
1384	простокваша	мл
1385	протеин сывороточный	г
1386	прошутто	г
1387	пряники	г
1388	пряничные специи	г
1389	пряности	г
1390	псиллиум	г
1391	птитим	г
1392	пудинг	г
1393	пудинг ванильный	г
1394	пудинг ванильный инстант	г
1395	пудинг карамельный	г
1396	пшеница	г
1397	пшеничная крупа	г
1398	пшеничная мука	г
1399	пшеничная мука цельнозерновая	г
1400	пшеничные зародыши	г
1401	пшеничные отруби	г
1402	пшеничные ростки	г
1403	пшеничные хлопья	г
1404	пшенные хлопья	г
1405	пшено	г
1406	пыльца цветочная	г
1407	пюре	г
1408	радиккио	шт.
1409	разрыхлитель	г
1410	раки	г
1411	раковые шейки	г
1412	раковые шейки в рассоле	г
1413	рамбутан	г
1414	рапаны	г
1415	рапсовое масло	мл
1416	рассол	мл
1417	рассол от каперсов	мл
1418	рассол от оливок	мл
1419	растительное масло	мл
1420	растительное масло для жарки	мл
1421	растительное масло нерафинированное	мл
1422	растительное масло рафинированное	мл
1423	растительное молоко	мл
1424	ревень	г
1425	реган	веточка
1426	редис	г
1427	редька	г
1428	редька белая	г
1429	редька зеленая	г
1430	редька черная	г
1431	репа	г
1432	репа белая	г
1433	ржаная закваска	г
1434	ржаная закваска густая	г
1435	ржаная мука	г
1436	ржаные отруби	г
1437	ригатони	г
1438	рикотта	г
1439	рикотта твердая	г
1440	рис	г
1441	рис арборио	г
1442	рис басмати	г
1443	рис бурый	г
1444	рис бурый и дикий смесь	г
1445	рис вареный	г
1446	рис виола	г
1447	рис девзира	г
1448	рис дикий	г
1449	рис дикий и золотистый смесь	г
1450	рис длиннозерный	г
1451	рис длиннозерный золотистый	г
1452	рис для плова	г
1453	рис для пудинга	г
1454	рис для ризотто	г
1455	рис для суши	г
1456	рис жасминовый	г
1457	рис золотистый	г
1458	рис индика	г
1459	рис италика	г
1460	рис карнароли	г
1461	рис красный	г
1462	рис круглозерный	г
1463	рис кубанский	г
1464	рисовая бумага	г
1465	рисовая лапша	г
1466	рисовая мука	г
1467	рисовое вино	мл
1468	рисовые хлопья	г
1469	рисовые шарики воздушные	г
1470	рисовый крахмал	г
1471	рисовый уксус	мл
1472	рис пропаренный	г
1473	рис пропаренный и дикий смесь	г
1474	рис японика	г
1475	рожь	г
1476	розмарин	г
1477	розмарин сушеный	г
1478	розовая вода	мл
1479	розовые бутоны сушеные	г
1480	розовые лепестки	г
1481	розы	г
1482	рокфор	г
1483	ром	мл
1484	ромашка сушеная	г
1485	ромовый экстракт	ч. л.
1486	ром темный	мл
1487	ростбиф	г
1488	рукола	г
1489	рулька	г
1490	рыба	г
1491	рыба белая	г
1492	рыба белая филе	г
1493	рыба консервированная	г
1494	рыба копченая	г
1495	рыба копченая филе	г
1496	рыба красная	г
1497	рыба красная соленая	г
1498	рыба красная филе	г
1499	рыба-меч	г
1500	рыба морская	г
1501	рыба солнечник филе	г
1502	рыба-соль	г
1503	рыбное филе	г
1504	рыбные консервы	г
1505	рыбные кости	г
1506	рыбные обрезки, головы, плавники	г
1507	рыбный бульон	г
1508	рыбный соус	г
1509	рыбный соус Nam Pla	г
1510	рыбный соус тайский	г
1511	рыбный фарш	г
1512	рябина черноплодная	г
1513	рябчик	г
1514	ряженка	мл
1515	ряженка 4%	мл
1516	сайда	г
1517	сайда филе	г
1518	сайра	г
1519	сайра консервированная	г
1520	саке	мл
1521	салака	г
1522	салат	г
1523	салат айсберг	г
1524	салат китайский	г
1525	салат корн	г
1526	салат кочанный	г
1527	салат кучерявый	г
1528	салат листовой	г
1529	салатный микс	г
1530	салат романо	г
1531	салат фриссе	г
1532	сало	г
1533	сало копченое в перце	г
1534	сало копченое с мясными прослойками	г
1535	сало с мясными прослойками	г
1536	сальник	г
1537	сальса	г
1538	сальса верде	ч. л.
1539	салями	г
1540	салями итальянская	г
1541	сардельки	г
1542	сардельки копченые	г
1543	сардинки маленькие	г
1544	сардины	г
1545	сардины в масле	г
1546	сахар	г
1547	сахар ванильный	г
1548	сахар демерара	г
1549	сахар жемчужный	г
1550	сахар коричневый	г
1551	сахар коричневый крупнокристаллический	г
1552	сахар мусковадо	г
1553	сахарная пудра	г
1554	сахарная пудра апельсиновая	г
1555	сахарная пудра ванильная	г
1556	сахарные жемчужинки	г
1557	сахарные кондитерские украшения	г
1558	сахарный песок	г
1559	сахарный песок крупный	г
1560	сахарный песок мелкий	г
1561	сахарный сироп	г
1562	сахар пальмовый	г
1563	сахар-рафинад	г
1564	сахар-рафинад с корицей	г
1565	сахар тростниковый	г
1566	сванская соль	г
1567	свекла	г
1568	свекла вареная	г
1569	свекольная ботва	г
1570	свекольные листья	г
1571	свиная вырезка	г
1572	свиная голова	г
1573	свиная грудинка	г
1574	свиная корейка	г
1575	свиная корейка копченая	г
1576	свиная корейка на кости	г
1577	свиная лопатка варено-копченая	г
1578	свиная мякоть	г
1579	свиная пашина	г
1580	свиная печень	г
1581	свиная рулька	г
1582	свиная рулька варено-копченая	г
1583	свиная рулька копченая	г
1584	свиная шейка	кусок
1585	свинина	г
1939	фетаки	г
1586	свинина вареная	г
1587	свинина нежирная	г
1588	свинина с жирком	г
1589	свиное сердце	г
1590	свиное филе	г
1591	свиной подчеревок	г
1592	свиной фарш	г
1593	свиной язык	г
1594	свиные котлеты на косточке	шт.
1595	свиные легкие	г
1596	свиные ножки	г
1597	свиные отбивные	г
1598	свиные отбивные на косточке	г
1599	свиные ребра	г
1600	свиные уши	шт.
1601	свиные щечки	шт.
1602	свити	г
1603	сельдерей	г
1604	сельдерей зелень	г
1605	сельдерей корень	г
1606	сельдерей корень сушеный	г
1607	сельдерейная соль	г
1608	сельдерей семена	г
1609	сельдерей стебли	г
1610	сельдь	г
1611	сельдь слабосоленая	г
1612	сельдь соленая	шт.
1613	сельдь филе	г
1614	семга	г
1615	семга копченая	г
1616	семга свежая	г
1617	семга соленая	г
1618	семга филе на коже	г
1619	семечки	г
1620	семечки смесь	г
1621	семолина	г
1622	сервелат варено-копченый	г
1623	сибас	г
1624	сидр	мл
1625	сироп	мл
1626	сироп от консервированных груш	мл
1627	сироп от консервированных персиков	мл
1628	сироп топинамбура	мл
1629	скумбрия	г
1630	скумбрия свежая	г
1631	скумбрия филе	г
1632	скумбрия холодного копчения	г
1633	сливки	мл
1634	сливки 10-20%	мл
1635	сливки 15%	мл
1636	сливки 20%	мл
1637	сливки 33-35%	мл
1638	сливки жирные	мл
1639	сливки кондитерские	мл
1640	сливовая паста	г
1641	сливовое варенье	г
1642	сливовое вино	мл
1643	сливовый джем	г
1644	сливовый ликер	мл
1645	сливовый соус	г
1646	сливочное масло	г
1647	сливы	г
1648	сливы замороженные	г
1649	смалец	г
1650	смесь для кекса	г
1651	смесь для оладий	г
1652	смесь для хлеба 8 злаков	г
1653	сметана	г
1654	сметана 10%	г
1655	сметана 15%	г
1656	сметана 18%	г
1657	сметана 20%	г
1658	сметана 25%	г
1659	сметана 30%	г
1660	сметана 35%	г
1661	сметана жирная	г
1662	сметана нежирная	г
1663	сметана некислая	г
1664	смородина сушеная	г
1665	смородиновые листья	г
1666	сморчки сухие	г
1667	снежок	мл
1668	сныть	г
1669	сода	г
1670	соевая мука	г
1671	соевое масло	г
1672	соевое молоко	мл
1673	соевые ростки	г
1674	соевый соус	г
1675	сок	мл
1676	сок из красных апельсинов	мл
1677	сок мультивитаминный	мл
1678	сок юзу	мл
1679	солод	г
1680	солод жидкий	мл
1681	солодовый экстракт	г
1682	солод темный	г
1683	соломка	г
1684	соль	г
1685	соль гималайская	г
1686	соль крупного помола	г
1687	соль морская	г
1688	сом филе	г
1689	сосиски	г
1690	сосиски из куриного фарша	г
1691	сосиски копченые	г
1692	соус	г
1693	соус black bean	г
1694	соус sambal oelek	г
1695	соус барбекю	г
1696	соус краснодарский	г
1697	соус красный острый	г
1698	соус мирин	г
1699	соус наршараб	г
1700	соус острый	г
1701	соус песто	г
1702	соус сацебели	г
1940	фетакса	г
1703	соус табаско	капля
1704	соус терияки	г
1705	соус ткемали	г
1706	соус ткемали благородный	г
1707	соус ткемали ранний	г
1708	соус устричный	г
1709	соус чили	г
1710	соус чили сладкий	г
1711	соус экзотический	г
1712	соя	г
1713	спагетти	г
1714	спагетти № 3	г
1715	спагетти № 5	г
1716	спагетти лунги	г
1717	спаржа	г
1718	спаржа белая	г
1719	спаржа зеленая	г
1720	спаржа молодая	г
1721	спек	г
1722	спельта	г
1723	спельтовая (полбяная) мука	г
1724	специи	г
1725	спирт	мл
1726	спирулина порошок	г
1727	спред	г
1728	ставрида	г
1729	стейк семги	г
1730	стеклянная лапша	г
1731	страчателла	г
1732	судак	г
1733	судак филе	г
1734	судак филе на коже	г
1735	сулугуни	г
1736	сулугуни копченый	г
1737	сумах	г
1738	суповой набор	г
1739	сухари	г
1740	сухари белые	г
1741	сухари молотые	г
1742	сухари панировочные	г
1743	сухари ржаные	г
1744	сухарная крошка	г
1745	сухофрукты	г
1746	сухофрукты тропические	г
1747	сушки	г
1748	сыворотка	г
1749	сыр	г
1750	сыр tete de moine	г
1751	сыр Австрия блю	г
1752	сыр адыгейский	г
1753	сыр бри	г
1754	сыр буко	г
1755	сыр гауда	г
1756	сыр гойя	г
1757	сыр голландский	г
1758	сыр голубой	г
1759	сыр гравьера	г
1760	сыр джугас	г
1761	сыр домашний	г
1762	сыр дорблю	г
1763	сыр имеретинский	г
1764	сыр кефалотири	г
1765	сырки творожные	г
1766	сыр козий мягкий	г
1767	сыр козий твердый	г
1768	сыр колбасный	г
1769	сыр копченый	г
1770	сыр коттедж	г
1771	сыр Маскарпоне	г
1772	сыр мраморный	г
1773	сыр мягкий	г
1774	сыр овечий	г
1775	сыр панир	г
1776	сыр пеше миньон	г
1777	сыр плавленый	г
1778	сыр плавленый шоколадный	г
1779	сыр пластинками	г
1780	сыр полутвердый	г
1781	сыр провола	г
1782	сыр российский	г
1783	сыр скаморца	г
1784	сыр скаморца копченый	г
1785	сыр сливочный	г
1786	сыр с плесенью	г
1787	сыр с плесенью мягкий	г
1788	сыр твердый	г
1789	сыр филадельфия	г
1790	сыр фонтина	г
1791	сыр хаварти	г
1792	сыр швейцарский	г
1793	сычужный фермент	ч. л.
1794	таледжо	г
1795	тальолини	г
1796	тальятелле	г
1797	тальятелле-гнезда	г
1798	тамаринд	г
1799	тамариндовая паста	г
1800	тапиока	г
1801	тарталетки	г
1802	тартар	г
1803	тархун	г
1804	творог	г
1805	творог 18%	г
1806	творог 2%	г
1807	творог 5%	г
1808	творог 9%	г
1809	творог жирный	г
1810	творог зерненый	г
1811	творог обезжиренный	г
1812	творожная масса	г
1813	творожная паста	г
1814	творожный сыр	г
1815	творожный сыр соленый	г
1816	творожок клубничный	г
1817	текила	мл
1818	телятина	г
1819	телятина вареная	г
1820	телячий фарш	г
1821	телячьи отбивные на косточке	шт.
1822	телячьи шницели	г
1823	телячьи эскалопы	г
1824	телячья вырезка	г
1825	телячья печень	г
1826	телячья щека	г
1827	тесто бездрожжевое	г
1828	тесто готовое	г
1829	тесто для вонтонов	г
1830	тесто для пиццы	г
1831	тесто дрожжевое	г
1832	тесто катаифи	г
1833	тесто макаронное	г
1834	тесто макаронное для лазаньи	г
1835	тесто пельменное	г
1836	тесто песочное	г
1837	тесто пресное	г
1838	тесто пряничное	г
1839	тесто слоеное	г
1840	тесто слоеное бездрожжевое	г
1841	тесто слоеное дрожжевое	г
1842	тесто фило	г
1843	тилапия	г
1844	тилапия филе	г
1845	тильзитер	г
1846	тимьян	г
1847	тимьян лимонный	г
1848	тимьян свежий	г
1849	тимьян сушеный	г
1850	ткемали	г
1851	тмин	г
1852	тмин молотый	г
1853	томатная паста	г
1854	томатное пюре	г
1855	томатный концентрат	г
1856	томатный порошок	г
1857	томатный сок	мл
1858	томатный соус	г
1859	томатный соус итальянский	г
1860	томатный соус острый	г
1861	томатный соус с базиликом	г
1862	тоник	мл
1863	топинамбур	г
1864	топленое масло	г
1865	тортильи	шт.
1866	тортильони	г
1867	тофу	г
1868	травы ароматные	г
1869	травы пряные с перцем	г
1870	травы сухие	г
1871	треска	г
1872	треска печень	г
1873	треска филе	г
1874	трюфель	г
1875	трюфельная крошка	г
1876	трюфельное масло	г
1877	трюфель черный	г
1878	тунец	г
1879	тунец консервированный	г
1880	тунец филе	г
1881	тушенка	г
1882	тыква	г
1883	тыквенное масло	г
1884	тыквенное пюре	г
1885	тыквенные семечки	г
1886	тюлька свежая	г
1887	угорь	г
1888	угорь копченый	г
1889	угурт	г
1890	укроп	г
1891	укропное семя	г
1892	укроп свежий	г
1893	укроп сушеный	г
1894	уксус	мл
1895	уксус 9%	мл
1896	уксус из сидра	мл
1897	уксусная эссенция	мл
1898	уксус столовый	мл
1899	улитки	г
1900	улитки виноградные	г
1901	урюк	г
1902	устрицы	г
1903	утиная грудка	г
1904	утиная печень	г
1905	утиное филе	г
1906	утиные бедрышки	г
1907	утиные ножки	г
1908	утка	г
1909	утка печеная	г
1910	утка тушка	г
1911	уцхо-сунели	г
1912	фазан	г
1913	фарш (баранина и говядина)	г
1914	фарш (свинина и курица)	г
1915	фасоль	г
1916	фасоль белая	г
1917	фасоль белая консервированная	г
1918	фасоль белая лима	г
1919	фасоль зеленая стручковая	г
1920	фасоль кенийская	г
1921	фасоль кидни красная	г
1922	фасоль консервированная	г
1923	фасоль красная	г
1924	фасоль красная вареная	г
1925	фасоль красная консервированная	г
1926	фасоль молодая замороженная	г
1927	фасоль пинто	г
1928	фасоль спаржевая вареная	г
1929	фасоль стручковая	г
1930	фасоль стручковая замороженная	г
1931	фасоль стручковая консервированная	г
1932	фасоль черный глаз	г
1933	фейхоа	г
1934	фенхель	г
1935	фенхель семена	г
1936	фенхель семена молотые	г
1937	фестонате	г
1938	фета	г
1941	феттучине	г
1942	фиалки засахаренные	г
1943	фиалковый сироп	мл
1944	физалис	г
1945	филе красного окуня	г
1946	филе лосося	г
1947	филе палтуса	г
1948	финики	г
1949	финики без косточек	г
1950	финики иранские	г
1951	финики иранские без косточек	г
1952	фисташки	г
1953	фисташки очищенные	г
1954	фисташки очищенные несоленые	г
1955	фисташки рубленые	г
1956	фисташковая мука	г
1957	фисташковая паста	г
1958	фисташковое масло	г
1959	фокачча	г
1960	форель	г
1961	форель вареная	г
1962	форель горячего копчения	г
1963	форель озерная свежая	г
1964	форель слабосоленая	г
1965	форель стейки	г
1966	форель филе	г
1967	форель холодного копчения	г
1968	фрикадельки	г
1969	фрукт дракона	г
1970	фруктовый сироп	мл
1971	фруктовый сок	мл
1972	фруктовый сок без сахара	мл
1973	фруктоза	г
1974	фрукты	г
1975	фрукты консервированные	г
1976	фундук	г
1977	фундучная мука	г
1978	фунчоза	г
1979	халва	г
1980	халва ванильная	г
1981	халва подсолнечная	г
1982	халуми	г
1983	хамон	г
1984	хек	г
1985	хек филе	г
1986	херес	мл
1987	хересный уксус	мл
1988	хлеб	г
1989	хлеб 7 злаков	батон
1990	хлеб белый	г
1991	хлеб белый сухой	г
1992	хлеб бородинский	г
1993	хлеб датский ржаной	г
1994	хлеб для сэндвичей	г
1995	хлебная крошка	г
1996	хлеб ржаной	г
1997	хлеб серый	г
1998	хлеб с кунжутом	г
1999	хлеб цельнозерновой	г
2000	хлебцы пшенично-ржаные цельнозерновые	г
2001	хлопья 4 злака	г
2002	хлопья 5 злаков	г
2003	хлопья 7 злаков	ст. л.
2004	хлопья быстрого приготовления	г
2005	хлорид кальция	г
2006	хмели-сунели	г
2007	хмель	г
2008	хрен	г
2009	хрен протертый	г
2010	хрен со сливками	г
2011	хурма	г
2012	хурма спелая	г
2013	цесарка тушка	г
2014	цикорий	г
2015	цитроновые цукаты	г
2016	цитрусовые цукаты	г
2017	цитрусовый свежевыжатый сок	мл
2018	цукаты	г
2019	цукини	г
2020	цукини цветы	г
2021	цыплята	г
2022	цыплята-корнишоны	шт.
2023	чабер	г
2024	чабрец	г
2025	чабрец сушеный	г
2026	чай дарджилинг	г
2027	чай жасминовый	г
2028	чай зеленый	г
2029	чай копченый лапсанг сушонг	г
2030	чай красный	г
2031	чай ройбуш	г
2032	чай черный	г
2033	чай черный крупнолистовой	г
2034	чай черный со специями	г
2035	чай эрл грей	г
2036	чатни манго	г
2037	чеддер	г
2038	черемуха	г
2039	черемуховая мука	г
2040	черемша	г
2041	черешневый джем	г
2042	черешня	г
2043	черешня консервированная без косточек	г
2044	черная смородина	г
2045	черника	г
2046	черника замороженная	г
2047	чернила каракатицы	г
2048	черничный джем	г
2049	чернослив	г
2050	чернослив без косточек	г
2051	чернослив вяленый	г
2052	чернослив копченый без косточек	г
2053	черносмородиновое варенье	г
2054	черносмородиновый джем	г
2055	чеснок	г
2056	чеснок молодой	г
2057	чеснок сушеный	г
2058	чесночная соль	г
2059	чесночное масло	мл
2060	чесночный порошок	г
2061	чечевица	г
2062	чечевица вареная	г
2063	чечевица зеленая	г
2064	чечевица красная	г
2065	чечил спагетти	г
2066	чиабатта	г
2067	чиа семена	г
2068	чипотле молотый	г
2069	чипсы	г
2070	чоризо	г
2071	шалфей	г
2072	шалфей свежий	г
2073	шалфей сушеный	г
2074	шампанское	г
2075	шампанское советское	мл
2076	шампанское сухое	мл
2077	шампиньоны	г
2078	шампиньоны замороженные	г
2079	шампиньоны консервированные	г
2080	шампиньоны маринованные	г
2081	шампиньоны свежие	г
2082	шафран	г
2083	шафран имеретинский	г
2084	шафран молотый	ч. л.
2085	шафран нити	шт.
2086	шелковица	г
2087	шелковица сушеная	г
2088	шиповник	г
2089	шиповниковый сироп	мл
2090	шнапс	мл
2091	шнитт-лук	г
2092	шоколад	г
2093	шоколад белый	г
2094	шоколад горький с апельсиновой цедрой	г
2095	шоколад молочный	г
2096	шоколад мятный	г
2097	шоколадная паста	г
2098	шоколадная стружка	г
2099	шоколадное масло	г
2100	шоколадно-ореховая паста	г
2101	шоколадные горошины	г
2102	шоколадные капли	г
2103	шоколадные капли белые	г
2104	шоколадные конфеты	г
2105	шоколадные хлопья	г
2106	шоколадные шарики из готовых завтраков	г
2107	шоколадный ликер	мл
2108	шоколадный сироп	мл
2109	шоколадный соус	г
2110	шоколад полусладкий	г
2111	шоколад с орехами	г
2112	шоколад черный горький	г
2113	шоколад черный горький 70%	г
2114	шоколад черный горький 75%	ч. л.
2115	шоколад черный горький 85%	г
2116	шортенинг	г
2117	шпик	г
2118	шпик копченый	г
2119	шпинат	г
2120	шпинат замороженный	г
2121	шпинат молодой	г
2122	шпинат свежий	г
2123	шпроты	г
2124	шпроты в масле	г
2125	шрот	г
2126	щавель замороженный	г
2127	щавель свежий	г
2128	щука	г
2129	щука филе	г
2130	эгг-ног	г
2131	эдам	г
2132	эль	мл
2133	эмменталь	г
2134	эскалоп	г
2135	эстрагон	г
2136	эстрагон сушеный	г
2137	яблоки	г
2138	яблоки антоновка	г
2139	яблоки гала	г
2140	яблоки голден	г
2141	яблоки гренни смит	г
2142	яблоки зеленые	г
2143	яблоки красные	г
2144	яблоки моченые	г
2145	яблоки нетвердых сортов	г
2146	яблоки сладкие	г
2147	яблоки сушеные	г
2148	яблочная эссенция	г
2149	яблочное варенье	г
2150	яблочное повидло	г
2151	яблочное пюре	г
2152	яблочные чипсы	г
2153	яблочный джем	г
2154	яблочный сироп	мл
2155	яблочный сок	мл
2156	яблочный соус	г
2157	яблочный уксус	мл
2158	ягнятина	г
2159	ягнятина кострец	г
2160	ягнятина фарш	г
2161	ягнячьи отбивные на косточке	г
2162	ягнячья голень нарубленная	г
2163	ягнячья корейка	г
2164	ягодное варенье	г
2165	ягодное желе	г
2166	ягодный сироп	мл
2167	ягодный сок	мл
2168	ягодный соус кислый	г
2169	ягоды	г
2170	ягоды вяленые	г
2171	ягоды замороженные	г
2172	ягоды лесные	г
2173	ягоды лесные замороженные	г
2174	яичные белки	г
2175	яичные желтки	г
2176	яичные желтки вареные	шт.
2177	яичные желтки крупные	г
2178	яичный меланж	г
2179	яичный порошок	г
2180	яйца куриные	г
2181	яйца куриные крупные	г
2182	яйца перепелиные	г
2183	японская крошка панко	г
2184	ячменные хлопья	г
2185	ячмень	г
2186	ячневая крупа	г
\.


--
-- Data for Name: recipes_ingredientamount; Type: TABLE DATA; Schema: public; Owner: foodgram_user
--

COPY public.recipes_ingredientamount (id, amount, ingredient_id, recipe_id) FROM stdin;
1	240	708	1
2	300	1788	1
3	4	2180	1
4	100	1740	1
5	10	2055	1
6	60	855	1
7	10	899	1
164	450	5	99
165	400	1804	99
166	150	1653	99
167	150	1032	99
168	20	411	99
169	10	1546	99
170	5	175	99
171	10	959	100
172	500	1032	100
173	50	2180	100
174	40	1546	100
175	5	1553	100
176	5	1684	100
177	5	175	100
178	100	596	100
179	100	631	100
180	5	726	100
181	200	252	100
182	500	784	101
183	5	1366	101
184	5	1684	101
185	50	209	101
186	10	1646	101
187	100	216	101
188	300	103	102
189	50	878	102
190	100	1053	102
191	100	1341	102
192	400	556	102
193	100	310	102
194	10	1915	102
195	200	491	102
196	200	532	102
197	10	1419	102
198	5	816	102
199	5	1684	102
200	5	1235	102
201	1200	1629	103
202	80	1854	103
203	3	35	103
204	10	43	103
205	2	2057	103
206	2	680	103
207	1	1282	103
208	1	1381	103
209	5	1684	103
282	600	83	149
283	600	491	149
284	1000	1341	149
285	150	878	149
286	400	1240	149
287	10	2055	149
288	100	1162	149
289	5	1202	149
290	5	1381	149
291	5	1306	149
292	600	1637	150
293	50	2174	150
294	50	1976	150
295	5	703	150
296	100	1546	150
297	500	2169	150
298	150	2092	150
\.


--
-- Data for Name: recipes_recipe; Type: TABLE DATA; Schema: public; Owner: foodgram_user
--

COPY public.recipes_recipe (id, name, image, text, cooking_time, pub_date, author_id) FROM stdin;
1	Салат с сухариками "Королевский"	recipes/images/salat_korol.jpg	Крабовые палочки нарезать небольшими кусочками.\r\n\r\nЯйца отварить вкрутую, остудить, очистить и нарезать кубиками.\r\n\r\nСыр натереть на крупной тёрке.\r\n\r\nЧеснок очистить и пропустить через пресс.\r\n\r\nСухарики высыпать в салатницу, добавить крабовые палочки, яйца, сыр и чеснок.\r\n\r\nПолить лимонным соком, заправить майонезом и тщательно перемешать.\r\n\r\nСалат готов. Подавать сразу, чтобы сухарики оставались хрустящими.	15	2025-09-10 18:02:31.355396+00	1
149	Рататуй	recipes/images/36df7b99-f645-4516-8de4-461982171491.jpg	1. Мелко нарезанный лук обжарить до прозрачности на 2 ст. ложках оливкового масла, посолить.\nС 3-х помидоров снять кожицу.\nУ болгарского перца удалить плодоножки и семена. Помидоры и перец нарезать кубиками и добавить к луку. Обжаривать овощи в течение 10-ти минут. Затем измельчить обжаренные овощи блендером до желаемой консистенции.\nГотовый соус ровным слоем выложить на дно формы для запекания.\n\n2. Включить духовку и разогреть до 180°С.\nВымытые и очищенные от кожицы кабачки и баклажаны, а также оставшиеся помидоры нарезать кружочками толщиной 5 мм и выложить сверху на соус, чередуя. Посолить.\n\n3. Сверху смазать оливковым маслом, смешанным с измельчённым чесноком, молотой паприкой и прованскими травами.\n\n4. Накрыть форму фольгой и отправить в духовку, нагретую до 180°С, на 30 минут. Затем фольгу снять, запекать ещё 20 минут.\n\n5. Готовый рататуй посыпать мелко нарезанной свежей зеленью.\nПриятного аппетита!	90	2025-09-12 19:24:26.220915+00	1
102	Рагу «Летний обед»	recipes/images/ragu.jpg	Мясо порежьте на кусочки, обжарьте на сковороде. \r\n\r\nОвощи очистите, нарежьте небольшими кусочками, выложите их с мясом в котелок, добавьте горошек, фасоль, соль, специи и немного воды, потушите. \r\n\r\nПодавайте в горячем виде.	70	2025-09-12 15:07:40.977492+00	13
103	Шашлык из скумбрии (в духовке)	recipes/images/shashlik.jpg	Скумбрию слегка разморозьте, промойте и обсушите. Обрежьте плавники, хвост и голову.\r\n\r\nНарежьте тушки на кусочки шириной 2–2,5 см. Удалите хребет, внутренности и косточки. Очистите чёрную плёнку.\r\n\r\nНанизайте кусочки рыбы на шпажки.\r\n\r\nПриготовьте маринад: соедините томатное пюре, апельсиновый сок и цедру, сушёный чеснок, кориандр, прованские травы, соль и перец. Хорошо перемешайте.\r\n\r\nСмажьте скумбрию маринадом со всех сторон.\r\n\r\nВыложите в форму для запекания и готовьте при 180 °C около 20 минут.\r\n\r\nПодавайте шашлык горячим.	50	2025-09-12 15:11:52.026354+00	1
99	Абрикосовый творожный торт-десерт	recipes/images/abrikostort.jpg	1. Заливаем желатин холодным молоком, перемешиваем и оставляем набухать (15 минут).\r\n\r\n2. Затем нагреваем молоко с желатином, но не кипятим (я ставила в микроволновку на 1,5 минуты). Желатин растворится.\r\n\r\n3. Творог, сметану, сахар, ванилин (если есть) и остывшее молоко с желатином взбиваем миксером. Буквально 1 минуту, чтобы творог стал гладким (я взбивала венчиком).\r\n\r\n4. Достаем форму (у меня силиконовая). Ничем форму не смазывать!\r\n\r\n5. Абрикосы моем, режем на 4 части. Высыпаем в форму и заливаем творожной массой.\r\n\r\n6. Помещаем творожный торт-десерт с абрикосами в холодильник на 2 часа.\r\n\r\n7. По истечении указанного времени вынимаем наш абрикосовый творожный десерт из холодильника, ставим форму в тазик с горячей водой на 20-30 секунд. Затем переворачиваем форму с творожным десертом на блюдо.\r\n\r\nПриятного аппетита!	120	2025-09-12 14:44:15.806935+00	13
100	Буберт (десерт из манной крупы с ягодами)	recipes/images/bubert.jpg	Орехи. Измельчите орехи до удобной для вас консистенции (крупные кусочки, мука или целиком).\r\n\r\nЯгодный соус. Разведите крахмал в 100 мл холодной воды. Ягоды разомните, залейте 100 мл горячей воды, доведите до кипения. Добавьте сахар или пудру по вкусу. Влейте тонкой струйкой воду с крахмалом, постоянно помешивая. Доведите соус до нужной густоты (разбавьте водой или выпарите лишнее). Соус можно подавать тёплым или охлаждённым.\r\n\r\nКаша. В кастрюлю влейте молоко и всыпьте манку, равномерно распределяя по поверхности. Варите, помешивая, до средней густоты. Снимите с огня и остудите до ~70 °C, чтобы яйца не свернулись.\r\n\r\nЖелтки. Смешайте желтки с сахаром, щепоткой соли, ванилином и орехами.\r\n\r\nБелки. Взбейте белки миксером в крепкую пену.\r\n\r\nСоединение. В остывшую кашу добавьте желтки с орехами, перемешайте. Затем аккуратно вмешайте взбитые белки.\r\n\r\nПодача. Разложите по тарелкам, полейте ягодным соусом и подавайте.	30	2025-09-12 14:57:05.755727+00	14
101	Куриное филе по-венгерски	recipes/images/fileveng.jpg	Куриную грудку вымойте, обсушите, посолите и приправьте. Оставьте на 30 минут в прохладном месте.\r\n\r\nОбжарьте филе на масле до золотистой корочки со всех сторон.\r\n\r\nПереложите мясо в огнеупорную форму, слегка полейте сверху жиром.\r\n\r\nВлейте в форму вино, смешанное с водой, накройте крышкой и тушите в духовке при 180 °C около 1–1 час 10 минут.\r\n\r\nВ конце добавьте виноград и потушите ещё 15 минут.\r\n\r\nВыложите куриное филе на блюдо, полейте соусом, украсьте виноградом и петрушкой.\r\n\r\nПодавайте с рисом и оставшимся соусом.	90	2025-09-12 15:02:32.118342+00	15
150	Ягодный торт-семифредо с теплым шоколадным соусом	recipes/images/cbfcdcb3-2e46-4c48-b8e3-6e74fd9bda96.png	1. Подготавливаем продукты для торта-семифредо.\n2. Обжариваем фундук 5 минут на сухой сковороде.\n3. Белки взбиваем миксером до легкой пены. К белкам добавляем кофе. Тщательно взбиваем.\n4. Добавляем сахар. Взбиваем до устойчивых пиков.\n5. Обжаренный фундук разрезаем ножом и добавляем его в белковую массу.\n6. Силиконовой лопаткой аккуратно перемешиваем взбитую массу с орехами снизу вверх.\n7. Выкладываем безе с орехами в огнеупорную форму, застеленную пергаментной бумагой. Слой должен быть высотой не более 2 см. Ставим форму в духовку и готовим кофейное безе-меренгу с орехами 3 часа при температуре 90 градусов.\n8. Через 3 часа достаем форму из духовки, остывшую меренгу ломаем на кусочки.\n9. Взбиваем сливки в плотную пену.\n10. Добавляем кусочки меренги во взбитые сливки и аккуратно перемешиваем.\n11. Разъемную форму застилаем пергаментной бумагой и пищевой пленкой.\n12. Выкладываем в форму треть взбитых сливок с меренгой.\n13. Кладем на сливки и распределяем половину вымытых и обсушенных ягод.\n14. Выкладываем еще треть сливок с меренгой и сверху оставшиеся ягоды.\n15. На ягоды выкладываем оставшиеся сливки с меренгой.\nНакрываем десерт пищевой пленкой, сверху кладем тарелку и слегка ее прижимаем. Ставим торт-мороженое на ночь в морозильную камеру.\n16. Перед подачей замороженного торта-семифредо готовим шоколадный соус. В сливки насыпаем сахар. Ставим сотейник на огонь и доводим сливки с сахаром до кипения.\n17. Натираем черный шоколад на терке.\n18. К сливкам добавляем шоколад и сливочное масло.\n19. Уменьшаем огонь и готовим соус, пока шоколад полностью не расплавится. Переливаем соус в соусник и даем ему немного остыть.\n20. Подаем ягодный торт-семифредо с теплым шоколадным соусом.	60	2025-09-12 19:33:30.378171+00	1
\.


--
-- Data for Name: recipes_recipe_tags; Type: TABLE DATA; Schema: public; Owner: foodgram_user
--

COPY public.recipes_recipe_tags (id, recipe_id, tag_id) FROM stdin;
142	1	1
145	99	4
146	100	4
147	101	3
148	102	2
149	103	3
213	149	3
214	150	4
\.


--
-- Data for Name: recipes_shoppingcart; Type: TABLE DATA; Schema: public; Owner: foodgram_user
--

COPY public.recipes_shoppingcart (id, recipe_id, user_id) FROM stdin;
5	102	1
6	101	1
\.


--
-- Data for Name: recipes_tag; Type: TABLE DATA; Schema: public; Owner: foodgram_user
--

COPY public.recipes_tag (id, name, color, slug) FROM stdin;
1	Завтрак	#FFA500	breakfast
2	Обед	#00FF00	lunch
3	Ужин	#0000FF	dinner
4	Десерт	#FF69B4	dessert
\.


--
-- Data for Name: users_follow; Type: TABLE DATA; Schema: public; Owner: foodgram_user
--

COPY public.users_follow (id, author_id, user_id) FROM stdin;
11	13	1
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: foodgram_user
--

COPY public.users_user (id, password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, email, avatar) FROM stdin;
15	pbkdf2_sha256$260000$LsWDBg9jLpxaPZIdj8aOZW$okxNyK7QTrQPm1HiOS31AlUdmdxUePtZq/S53s2LvgY=	\N	f	third-user-username	Гордон	Рамзиков	f	t	2025-09-12 13:10:13+00	third-user@user.ru	users/third.png
14	pbkdf2_sha256$260000$xdIbVxtUw2CvLvN4Xhs03l$Yc0ivR7ThkFyMzuqQNKfrZINhmXn2Ju73AvWbjSx52k=	2025-09-13 11:28:09.477952+00	f	second-user	Андрей	Макаревский	f	t	2025-09-12 13:10:13+00	second_user@email.org	users/second.jpg
13	pbkdf2_sha256$260000$Vz7MRgyYSzxYiQjue9Ub3E$Z6KxNQbIecfQg5hGWWflGVpNFv8VPD3FEM5mLhO8JdM=	2025-09-13 11:28:15.807139+00	f	vasya.ivanov	Вася	Иванов	f	t	2025-09-12 13:10:13+00	vivanov@yandex.ru	
1	pbkdf2_sha256$260000$Y72CxT4fqshpuFguvMVrjA$D3zc4Agzf1mBhSAQbPa7OBFK+kI+bDIlJrU5e5Kbawk=	2025-09-21 08:00:48.031377+00	t	max	max	zak	t	t	2025-09-09 16:30:05+00	test@gmail.com	users/max_7YYeDOt.png
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: foodgram_user
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: foodgram_user
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 119, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);


--
-- Name: recipes_favorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram_user
--

SELECT pg_catalog.setval('public.recipes_favorite_id_seq', 17, true);


--
-- Name: recipes_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram_user
--

SELECT pg_catalog.setval('public.recipes_ingredient_id_seq', 2186, true);


--
-- Name: recipes_ingredientamount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram_user
--

SELECT pg_catalog.setval('public.recipes_ingredientamount_id_seq', 306, true);


--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram_user
--

SELECT pg_catalog.setval('public.recipes_recipe_id_seq', 155, true);


--
-- Name: recipes_recipe_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram_user
--

SELECT pg_catalog.setval('public.recipes_recipe_tags_id_seq', 221, true);


--
-- Name: recipes_shoppingcart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram_user
--

SELECT pg_catalog.setval('public.recipes_shoppingcart_id_seq', 16, true);


--
-- Name: recipes_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram_user
--

SELECT pg_catalog.setval('public.recipes_tag_id_seq', 4, true);


--
-- Name: users_follow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram_user
--

SELECT pg_catalog.setval('public.users_follow_id_seq', 31, true);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram_user
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram_user
--

SELECT pg_catalog.setval('public.users_user_id_seq', 15, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram_user
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: recipes_favorite recipes_favorite_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_favorite
    ADD CONSTRAINT recipes_favorite_pkey PRIMARY KEY (id);


--
-- Name: recipes_ingredient recipes_ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_ingredient
    ADD CONSTRAINT recipes_ingredient_pkey PRIMARY KEY (id);


--
-- Name: recipes_ingredientamount recipes_ingredientamount_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_ingredientamount
    ADD CONSTRAINT recipes_ingredientamount_pkey PRIMARY KEY (id);


--
-- Name: recipes_recipe recipes_recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_recipe
    ADD CONSTRAINT recipes_recipe_pkey PRIMARY KEY (id);


--
-- Name: recipes_recipe_tags recipes_recipe_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_recipe_tags
    ADD CONSTRAINT recipes_recipe_tags_pkey PRIMARY KEY (id);


--
-- Name: recipes_recipe_tags recipes_recipe_tags_recipe_id_tag_id_233281ac_uniq; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_recipe_tags
    ADD CONSTRAINT recipes_recipe_tags_recipe_id_tag_id_233281ac_uniq UNIQUE (recipe_id, tag_id);


--
-- Name: recipes_shoppingcart recipes_shoppingcart_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_shoppingcart
    ADD CONSTRAINT recipes_shoppingcart_pkey PRIMARY KEY (id);


--
-- Name: recipes_tag recipes_tag_color_key; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_tag
    ADD CONSTRAINT recipes_tag_color_key UNIQUE (color);


--
-- Name: recipes_tag recipes_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_tag
    ADD CONSTRAINT recipes_tag_name_key UNIQUE (name);


--
-- Name: recipes_tag recipes_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_tag
    ADD CONSTRAINT recipes_tag_pkey PRIMARY KEY (id);


--
-- Name: recipes_tag recipes_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_tag
    ADD CONSTRAINT recipes_tag_slug_key UNIQUE (slug);


--
-- Name: recipes_favorite unique_favorite; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_favorite
    ADD CONSTRAINT unique_favorite UNIQUE (user_id, recipe_id);


--
-- Name: users_follow unique_follow; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.users_follow
    ADD CONSTRAINT unique_follow UNIQUE (user_id, author_id);


--
-- Name: recipes_ingredient unique_ingredient; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_ingredient
    ADD CONSTRAINT unique_ingredient UNIQUE (name, measurement_unit);


--
-- Name: recipes_ingredientamount unique_ingredient_in_recipe; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_ingredientamount
    ADD CONSTRAINT unique_ingredient_in_recipe UNIQUE (recipe_id, ingredient_id);


--
-- Name: recipes_shoppingcart unique_shopping_cart; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_shoppingcart
    ADD CONSTRAINT unique_shopping_cart UNIQUE (user_id, recipe_id);


--
-- Name: users_follow users_follow_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.users_follow
    ADD CONSTRAINT users_follow_pkey PRIMARY KEY (id);


--
-- Name: users_user users_user_email_key; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_email_key UNIQUE (email);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: recipes_favorite_recipe_id_288529df; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX recipes_favorite_recipe_id_288529df ON public.recipes_favorite USING btree (recipe_id);


--
-- Name: recipes_favorite_user_id_dd4f6854; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX recipes_favorite_user_id_dd4f6854 ON public.recipes_favorite USING btree (user_id);


--
-- Name: recipes_ingredientamount_ingredient_id_9da06ae0; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX recipes_ingredientamount_ingredient_id_9da06ae0 ON public.recipes_ingredientamount USING btree (ingredient_id);


--
-- Name: recipes_ingredientamount_recipe_id_1d9da795; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX recipes_ingredientamount_recipe_id_1d9da795 ON public.recipes_ingredientamount USING btree (recipe_id);


--
-- Name: recipes_recipe_author_id_7274f74b; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX recipes_recipe_author_id_7274f74b ON public.recipes_recipe USING btree (author_id);


--
-- Name: recipes_recipe_tags_recipe_id_e15a4132; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX recipes_recipe_tags_recipe_id_e15a4132 ON public.recipes_recipe_tags USING btree (recipe_id);


--
-- Name: recipes_recipe_tags_tag_id_6fe328c4; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX recipes_recipe_tags_tag_id_6fe328c4 ON public.recipes_recipe_tags USING btree (tag_id);


--
-- Name: recipes_shoppingcart_recipe_id_7b01d980; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX recipes_shoppingcart_recipe_id_7b01d980 ON public.recipes_shoppingcart USING btree (recipe_id);


--
-- Name: recipes_shoppingcart_user_id_9cf94f11; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX recipes_shoppingcart_user_id_9cf94f11 ON public.recipes_shoppingcart USING btree (user_id);


--
-- Name: recipes_tag_color_80798f0a_like; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX recipes_tag_color_80798f0a_like ON public.recipes_tag USING btree (color varchar_pattern_ops);


--
-- Name: recipes_tag_name_fdbc724f_like; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX recipes_tag_name_fdbc724f_like ON public.recipes_tag USING btree (name varchar_pattern_ops);


--
-- Name: recipes_tag_slug_baa21000_like; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX recipes_tag_slug_baa21000_like ON public.recipes_tag USING btree (slug varchar_pattern_ops);


--
-- Name: users_follow_author_id_c48003a4; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX users_follow_author_id_c48003a4 ON public.users_follow USING btree (author_id);


--
-- Name: users_follow_user_id_e66dc3cf; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX users_follow_user_id_e66dc3cf ON public.users_follow USING btree (user_id);


--
-- Name: users_user_email_243f6e77_like; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX users_user_email_243f6e77_like ON public.users_user USING btree (email varchar_pattern_ops);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: foodgram_user
--

CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipes_favorite recipes_favorite_recipe_id_288529df_fk_recipes_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_favorite
    ADD CONSTRAINT recipes_favorite_recipe_id_288529df_fk_recipes_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.recipes_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipes_favorite recipes_favorite_user_id_dd4f6854_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_favorite
    ADD CONSTRAINT recipes_favorite_user_id_dd4f6854_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipes_ingredientamount recipes_ingredientam_ingredient_id_9da06ae0_fk_recipes_i; Type: FK CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_ingredientamount
    ADD CONSTRAINT recipes_ingredientam_ingredient_id_9da06ae0_fk_recipes_i FOREIGN KEY (ingredient_id) REFERENCES public.recipes_ingredient(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipes_ingredientamount recipes_ingredientam_recipe_id_1d9da795_fk_recipes_r; Type: FK CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_ingredientamount
    ADD CONSTRAINT recipes_ingredientam_recipe_id_1d9da795_fk_recipes_r FOREIGN KEY (recipe_id) REFERENCES public.recipes_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipes_recipe recipes_recipe_author_id_7274f74b_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_recipe
    ADD CONSTRAINT recipes_recipe_author_id_7274f74b_fk_users_user_id FOREIGN KEY (author_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipes_recipe_tags recipes_recipe_tags_recipe_id_e15a4132_fk_recipes_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_recipe_tags
    ADD CONSTRAINT recipes_recipe_tags_recipe_id_e15a4132_fk_recipes_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.recipes_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipes_recipe_tags recipes_recipe_tags_tag_id_6fe328c4_fk_recipes_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_recipe_tags
    ADD CONSTRAINT recipes_recipe_tags_tag_id_6fe328c4_fk_recipes_tag_id FOREIGN KEY (tag_id) REFERENCES public.recipes_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipes_shoppingcart recipes_shoppingcart_recipe_id_7b01d980_fk_recipes_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_shoppingcart
    ADD CONSTRAINT recipes_shoppingcart_recipe_id_7b01d980_fk_recipes_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.recipes_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipes_shoppingcart recipes_shoppingcart_user_id_9cf94f11_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.recipes_shoppingcart
    ADD CONSTRAINT recipes_shoppingcart_user_id_9cf94f11_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_follow users_follow_author_id_c48003a4_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.users_follow
    ADD CONSTRAINT users_follow_author_id_c48003a4_fk_users_user_id FOREIGN KEY (author_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_follow users_follow_user_id_e66dc3cf_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.users_follow
    ADD CONSTRAINT users_follow_user_id_e66dc3cf_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram_user
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\unrestrict oDLvLo9r90aCi3L2J8TbucySzbOmXadG2ROmRMMnLDBfgIsx5l8SqogNmaXtGSO

