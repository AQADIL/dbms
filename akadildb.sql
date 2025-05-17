--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-05-18 03:48:59

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 232 (class 1259 OID 16772)
-- Name: answer_difficult; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.answer_difficult (
    answer_id integer NOT NULL,
    question_id integer NOT NULL,
    answer_text text NOT NULL,
    is_correct boolean DEFAULT false,
    explanation text,
    submission_count integer DEFAULT 0
);


ALTER TABLE public.answer_difficult OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16771)
-- Name: answer_difficult_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.answer_difficult_answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.answer_difficult_answer_id_seq OWNER TO postgres;

--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 231
-- Name: answer_difficult_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.answer_difficult_answer_id_seq OWNED BY public.answer_difficult.answer_id;


--
-- TOC entry 228 (class 1259 OID 16729)
-- Name: answer_easy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.answer_easy (
    answer_id integer NOT NULL,
    question_id integer NOT NULL,
    answer_text text NOT NULL,
    is_correct boolean DEFAULT false,
    explanation text,
    submission_count integer DEFAULT 0
);


ALTER TABLE public.answer_easy OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16728)
-- Name: answer_easy_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.answer_easy_answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.answer_easy_answer_id_seq OWNER TO postgres;

--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 227
-- Name: answer_easy_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.answer_easy_answer_id_seq OWNED BY public.answer_easy.answer_id;


--
-- TOC entry 230 (class 1259 OID 16756)
-- Name: answer_medium; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.answer_medium (
    answer_id integer NOT NULL,
    question_id integer NOT NULL,
    answer_text text NOT NULL,
    is_correct boolean DEFAULT false,
    explanation text,
    submission_count integer DEFAULT 0
);


ALTER TABLE public.answer_medium OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16755)
-- Name: answer_medium_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.answer_medium_answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.answer_medium_answer_id_seq OWNER TO postgres;

--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 229
-- Name: answer_medium_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.answer_medium_answer_id_seq OWNED BY public.answer_medium.answer_id;


--
-- TOC entry 238 (class 1259 OID 16821)
-- Name: feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feedback (
    feedback_id integer NOT NULL,
    user_id integer NOT NULL,
    quiz_id integer NOT NULL,
    rating integer,
    comment text,
    submitted_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    response_from_admin text,
    feedback_category character varying(50),
    CONSTRAINT feedback_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.feedback OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16820)
-- Name: feedback_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.feedback_feedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.feedback_feedback_id_seq OWNER TO postgres;

--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 237
-- Name: feedback_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.feedback_feedback_id_seq OWNED BY public.feedback.feedback_id;


--
-- TOC entry 226 (class 1259 OID 16703)
-- Name: question_difficult; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question_difficult (
    question_id integer NOT NULL,
    quiz_id integer NOT NULL,
    question_text text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    points integer,
    explanation text,
    image_url text,
    hint text,
    question_type character varying(50)
);


ALTER TABLE public.question_difficult OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16673)
-- Name: question_easy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question_easy (
    question_id integer NOT NULL,
    quiz_id integer NOT NULL,
    question_text text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    points integer,
    explanation text,
    image_url text,
    hint text,
    question_type character varying(50)
);


ALTER TABLE public.question_easy OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16672)
-- Name: question_easy_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_easy_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.question_easy_question_id_seq OWNER TO postgres;

--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 221
-- Name: question_easy_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.question_easy_question_id_seq OWNED BY public.question_easy.question_id;


--
-- TOC entry 224 (class 1259 OID 16688)
-- Name: question_medium; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question_medium (
    question_id integer NOT NULL,
    quiz_id integer NOT NULL,
    question_text text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    points integer,
    explanation text,
    image_url text,
    hint text,
    question_type character varying(50)
);


ALTER TABLE public.question_medium OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16702)
-- Name: questions_difficult_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questions_difficult_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.questions_difficult_question_id_seq OWNER TO postgres;

--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 225
-- Name: questions_difficult_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questions_difficult_question_id_seq OWNED BY public.question_difficult.question_id;


--
-- TOC entry 223 (class 1259 OID 16687)
-- Name: questions_medium_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questions_medium_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.questions_medium_question_id_seq OWNER TO postgres;

--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 223
-- Name: questions_medium_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questions_medium_question_id_seq OWNED BY public.question_medium.question_id;


--
-- TOC entry 220 (class 1259 OID 16658)
-- Name: quiz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz (
    quiz_id integer NOT NULL,
    creator_id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    category character varying(100),
    difficulty_level character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    time_limit integer,
    max_score integer,
    visibility character varying(50)
);


ALTER TABLE public.quiz OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16657)
-- Name: quizzes_quiz_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quizzes_quiz_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quizzes_quiz_id_seq OWNER TO postgres;

--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 219
-- Name: quizzes_quiz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quizzes_quiz_id_seq OWNED BY public.quiz.quiz_id;


--
-- TOC entry 234 (class 1259 OID 16788)
-- Name: result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.result (
    result_id integer NOT NULL,
    user_id integer NOT NULL,
    quiz_id integer NOT NULL,
    score integer,
    attempt_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    time_taken integer,
    correct_answers integer,
    incorrect_answers integer,
    highest_streak integer,
    quiz_feedback text
);


ALTER TABLE public.result OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16787)
-- Name: result_result_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.result_result_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.result_result_id_seq OWNER TO postgres;

--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 233
-- Name: result_result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.result_result_id_seq OWNED BY public.result.result_id;


--
-- TOC entry 236 (class 1259 OID 16808)
-- Name: reward; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reward (
    reward_id integer NOT NULL,
    user_id integer NOT NULL,
    reward_name character varying(100),
    points_required integer,
    granted_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    reward_type character varying(50),
    status character varying(50)
);


ALTER TABLE public.reward OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16807)
-- Name: reward_reward_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reward_reward_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reward_reward_id_seq OWNER TO postgres;

--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 235
-- Name: reward_reward_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reward_reward_id_seq OWNED BY public.reward.reward_id;


--
-- TOC entry 218 (class 1259 OID 16644)
-- Name: userr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userr (
    user_id integer NOT NULL,
    username character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    password_hash text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    role character varying(50) NOT NULL,
    status character varying(50),
    profile_picture text,
    last_login timestamp without time zone
);


ALTER TABLE public.userr OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16643)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.userr.user_id;


--
-- TOC entry 4808 (class 2604 OID 16775)
-- Name: answer_difficult answer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer_difficult ALTER COLUMN answer_id SET DEFAULT nextval('public.answer_difficult_answer_id_seq'::regclass);


--
-- TOC entry 4802 (class 2604 OID 16732)
-- Name: answer_easy answer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer_easy ALTER COLUMN answer_id SET DEFAULT nextval('public.answer_easy_answer_id_seq'::regclass);


--
-- TOC entry 4805 (class 2604 OID 16759)
-- Name: answer_medium answer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer_medium ALTER COLUMN answer_id SET DEFAULT nextval('public.answer_medium_answer_id_seq'::regclass);


--
-- TOC entry 4815 (class 2604 OID 16824)
-- Name: feedback feedback_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback ALTER COLUMN feedback_id SET DEFAULT nextval('public.feedback_feedback_id_seq'::regclass);


--
-- TOC entry 4800 (class 2604 OID 16706)
-- Name: question_difficult question_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_difficult ALTER COLUMN question_id SET DEFAULT nextval('public.questions_difficult_question_id_seq'::regclass);


--
-- TOC entry 4796 (class 2604 OID 16676)
-- Name: question_easy question_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_easy ALTER COLUMN question_id SET DEFAULT nextval('public.question_easy_question_id_seq'::regclass);


--
-- TOC entry 4798 (class 2604 OID 16691)
-- Name: question_medium question_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_medium ALTER COLUMN question_id SET DEFAULT nextval('public.questions_medium_question_id_seq'::regclass);


--
-- TOC entry 4794 (class 2604 OID 16661)
-- Name: quiz quiz_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz ALTER COLUMN quiz_id SET DEFAULT nextval('public.quizzes_quiz_id_seq'::regclass);


--
-- TOC entry 4811 (class 2604 OID 16791)
-- Name: result result_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.result ALTER COLUMN result_id SET DEFAULT nextval('public.result_result_id_seq'::regclass);


--
-- TOC entry 4813 (class 2604 OID 16811)
-- Name: reward reward_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reward ALTER COLUMN reward_id SET DEFAULT nextval('public.reward_reward_id_seq'::regclass);


--
-- TOC entry 4792 (class 2604 OID 16647)
-- Name: userr user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userr ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 5016 (class 0 OID 16772)
-- Dependencies: 232
-- Data for Name: answer_difficult; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.answer_difficult (answer_id, question_id, answer_text, is_correct, explanation, submission_count) FROM stdin;
21	11	Because farms have too many animals to keep secrets	t	A funny, complex joke about farm animals and secrets.	0
22	11	Because it’s hard to whisper on a farm	f	Another potential explanation, but not the correct punchline.	0
23	11	Because cows can’t keep secrets	f	A humorous take, but not the main meme punchline.	0
24	11	Because the rooster always crows	f	A variation on the farm meme, but not the core joke.	0
25	12	Because fake spaghetti is an impasta	t	This meme punchline is a pun combining "fake spaghetti" and "impasta."	0
26	12	Because fake spaghetti is made of noodles	f	A reasonable guess, but not the meme punchline.	0
27	12	Because fake spaghetti is overcooked	f	A plausible explanation but not the main joke.	0
28	12	Because fake spaghetti is always soggy	f	A fun take, but not the meme punchline.	0
29	13	Because the bicycle was two-tired	t	A classic joke playing on the word "tired" as in exhaustion and bike tires.	0
30	13	Because the bicycle was too complicated to ride	f	A twist, but not the meme punchline.	0
31	13	Because the bicycle was lonely	f	Another plausible joke but not the meme punchline.	0
32	13	Because the bicycle needed repairs	f	A twist, but not the actual meme punchline.	0
33	14	Because the ocean waved at the beach	t	A fun pun about the ocean and beach with a wave of humor.	0
34	14	Because the ocean was calm	f	A nice idea but not the meme punchline.	0
35	14	Because the ocean was cold	f	A plausible explanation, but not the meme punchline.	0
36	14	Because the ocean has secrets	f	A spooky take but not the right punchline.	0
37	15	Because stairs are always up to something	t	A pun about stairs, playing on the idea of them "being up to something."	0
38	15	Because stairs are always down	f	A good twist, but not the meme punchline.	0
39	15	Because stairs are unreliable	f	A fun variation, but not the main meme joke.	0
40	15	Because stairs are sneaky	f	A plausible take but not the punchline.	0
\.


--
-- TOC entry 5012 (class 0 OID 16729)
-- Dependencies: 228
-- Data for Name: answer_easy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.answer_easy (answer_id, question_id, answer_text, is_correct, explanation, submission_count) FROM stdin;
81	2	The internet has no capital city	t	The internet is decentralized and doesn’t have a single capital.	0
82	2	London is the capital of the internet	f	London is a real-world capital, not of the internet.	0
83	2	New York is the capital of the internet	f	New York is a famous city, but not the capital of the internet.	0
84	2	Paris is the capital of the internet	f	Paris is an important city but not the capital of the internet.	0
85	3	Because it had too many problems	t	A meme joke playing on the word "problems" as in math problems.	0
86	3	Because it couldn’t solve its own issues	f	Another variation on the "math problems" joke, but not the best punchline.	0
87	3	Because it didn’t have a good solution	f	A math-related joke, but not quite the same.	0
88	3	Because math books are boring	f	This is not the meme punchline, but a typical reaction.	0
89	4	Because the airplane food is too dry	f	The joke is based on the classic humor about airplane food being bad.	0
90	4	Because the food is small and packed in plastic	t	This is a classic reference to the humor about airplane food.	0
91	4	Because the airplane food is overpriced	f	A variation of the airplane food joke but not the main meme.	0
92	4	Because the airplane food is cold	f	Another common joke about airplane food.	0
93	5	Because it was too scary	f	A funny setup, but not quite right.	0
94	5	Because paranoia is a funny topic for a joke	t	This joke plays on the idea of paranoia and library secrecy.	0
95	5	Because it was haunted	f	A spooky twist, but not the meme punchline.	0
96	5	Because libraries are creepy	f	The librarian’s whisper creates a suspenseful situation.	0
97	6	Because it only listens to memes	t	This is a meme joke about how cats can be stubborn and only listen to memes.	0
98	6	Because it has selective hearing	f	This is a plausible explanation but not the meme punchline.	0
99	6	Because cats are hard to train	f	A plausible answer, but not the meme punchline.	0
100	6	Because it likes to ignore you	f	Another valid theory, but not the meme punchline.	0
\.


--
-- TOC entry 5014 (class 0 OID 16756)
-- Dependencies: 230
-- Data for Name: answer_medium; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.answer_medium (answer_id, question_id, answer_text, is_correct, explanation, submission_count) FROM stdin;
1	7	Because the math book had too many problems	t	A classic meme that plays on the word "problems" referring to math problems.	0
2	7	Because it was sad to be about math	f	This could be a reason, but it’s not the meme punchline.	0
3	7	Because it had no friends	f	A humorous idea but not the right punchline of the joke.	0
4	7	Because it didn’t understand the problems	f	A twist, but not the meme punchline of the joke.	0
5	8	Because airplane food is typically terrible	t	A widely accepted meme punchline about airplane food.	0
6	8	Because airplane food is too expensive	f	A variant of the meme, but not the central punchline.	0
7	8	Because airplane food is served cold	f	A commonly used joke about airplane food.	0
8	8	Because airplane food is too salty	f	Another take on the airplane food joke.	0
9	9	Because the librarian was a bit paranoid	f	A playful interpretation but not the correct punchline.	0
10	9	Because the librarian knew everything	f	An interesting variation, but not the actual joke.	0
11	9	Because the librarian made a scary joke	t	A classic example of dark humor involving the librarian and paranoia.	0
12	9	Because the library was haunted	f	A spooky variation of the joke.	0
13	10	Because cats don’t respond to commands	t	A meme explaining how cats only listen to memes or specific behaviors.	0
14	10	Because cats are rude	f	A relatable but not the correct meme punchline.	0
15	10	Because cats are independent	f	A good explanation, but not the meme punchline.	0
16	10	Because cats ignore everything	f	A good variation but not the punchline of this meme.	0
\.


--
-- TOC entry 5022 (class 0 OID 16821)
-- Dependencies: 238
-- Data for Name: feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feedback (feedback_id, user_id, quiz_id, rating, comment, submitted_at, response_from_admin, feedback_category) FROM stdin;
1	1	1	5	Great quiz, very informative and fun!	2025-04-07 00:58:27.258974	\N	General
2	2	2	4	It was a good experience, but I would prefer more challenging questions.	2025-04-07 00:58:27.258974	\N	General
3	3	3	3	Some questions were too easy, would appreciate more variety.	2025-04-07 00:58:27.258974	\N	General
4	4	4	5	Loved the quiz, especially the questions about memes!	2025-04-07 00:58:27.258974	\N	General
5	5	5	4	Nice quiz, but I think the timing was a bit too tight.	2025-04-07 00:58:27.258974	\N	Timing
7	7	7	5	I enjoyed it thoroughly, would recommend to my friends!	2025-04-07 00:58:27.258974	\N	General
8	8	8	3	The interface was a bit confusing, could be improved.	2025-04-07 00:58:27.258974	\N	Interface
9	9	9	4	Good quiz, but some of the questions seemed a bit unclear.	2025-04-07 00:58:27.258974	\N	Content
10	10	10	5	Excellent experience, definitely coming back for more!	2025-04-07 00:58:27.258974	\N	General
12	12	12	4	The variety of questions was good, but the explanations could be better.	2025-04-07 00:58:27.258974	\N	Content
13	13	13	5	Absolutely loved it! Very engaging and fun!	2025-04-07 00:58:27.258974	\N	General
14	14	14	3	It was an average quiz, not too exciting but decent.	2025-04-07 00:58:27.258974	\N	General
15	15	15	4	Very good, but please add more time for each question.	2025-04-07 00:58:27.258974	\N	Timing
\.


--
-- TOC entry 5010 (class 0 OID 16703)
-- Dependencies: 226
-- Data for Name: question_difficult; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question_difficult (question_id, quiz_id, question_text, created_at, points, explanation, image_url, hint, question_type) FROM stdin;
1	1	Why don’t we ever tell secrets on a farm?	2025-04-07 00:31:44.268299	3	A very high-level meme joke	image_url_placeholder	What makes farm memes so good?	multiple-choice
2	1	What do you call fake spaghetti?	2025-04-07 00:31:44.268299	3	This meme has a unique flavor	image_url_placeholder	Why do food memes work so well?	multiple-choice
3	1	Why couldn’t the bicycle stand up by itself?	2025-04-07 00:31:44.268299	3	Meme humor at its finest	image_url_placeholder	What is the most absurd meme you’ve ever seen?	multiple-choice
4	1	What did the ocean say to the beach?	2025-04-07 00:31:44.268299	3	A classic beach meme with waves of humor	image_url_placeholder	Why do ocean and beach memes hit differently?	multiple-choice
5	1	Why don’t we trust stairs?	2025-04-07 00:31:44.268299	3	Another classic pun meme	image_url_placeholder	What are your favorite types of pun memes?	multiple-choice
6	1	Why don’t we ever tell secrets on a farm?	2025-04-07 00:42:13.706267	3	A very high-level meme joke	image_url_placeholder	What makes farm memes so good?	multiple-choice
7	2	What do you call fake spaghetti?	2025-04-07 00:42:13.706267	3	This meme has a unique flavor	image_url_placeholder	Why do food memes work so well?	multiple-choice
8	3	Why couldn’t the bicycle stand up by itself?	2025-04-07 00:42:13.706267	3	Meme humor at its finest	image_url_placeholder	What is the most absurd meme you’ve ever seen?	multiple-choice
9	4	What did the ocean say to the beach?	2025-04-07 00:42:13.706267	3	A classic beach meme with waves of humor	image_url_placeholder	Why do ocean and beach memes hit differently?	multiple-choice
10	5	Why don’t we trust stairs?	2025-04-07 00:42:13.706267	3	Another classic pun meme	image_url_placeholder	What are your favorite types of pun memes?	multiple-choice
11	1	Why don’t we ever tell secrets on a farm?	2025-04-07 00:52:46.812403	3	A very high-level meme joke	image_url_placeholder	What makes farm memes so good?	multiple-choice
12	2	What do you call fake spaghetti?	2025-04-07 00:52:46.812403	3	This meme has a unique flavor	image_url_placeholder	Why do food memes work so well?	multiple-choice
13	3	Why couldn’t the bicycle stand up by itself?	2025-04-07 00:52:46.812403	3	Meme humor at its finest	image_url_placeholder	What is the most absurd meme you’ve ever seen?	multiple-choice
14	4	What did the ocean say to the beach?	2025-04-07 00:52:46.812403	3	A classic beach meme with waves of humor	image_url_placeholder	Why do ocean and beach memes hit differently?	multiple-choice
15	5	Why don’t we trust stairs?	2025-04-07 00:52:46.812403	3	Another classic pun meme	image_url_placeholder	What are your favorite types of pun memes?	multiple-choice
\.


--
-- TOC entry 5006 (class 0 OID 16673)
-- Dependencies: 222
-- Data for Name: question_easy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question_easy (question_id, quiz_id, question_text, created_at, points, explanation, image_url, hint, question_type) FROM stdin;
2	1	What is the capital of the internet?	2025-04-07 00:27:24.551139	1	The internet has a lot of memes, but no real capital!	image_url_placeholder	How did the meme become the internet's mascot?	multiple-choice
3	1	Why did the chicken cross the road?	2025-04-07 00:27:24.551139	1	This meme was born in the early 2000s and it's still funny!	image_url_placeholder	What’s your favorite meme?	multiple-choice
4	1	Why don’t skeletons fight each other?	2025-04-07 00:27:24.551139	1	A classic pun meme that never dies	image_url_placeholder	What do you think makes skeleton jokes so popular?	multiple-choice
5	1	What did the grape do when it got stepped on?	2025-04-07 00:27:24.551139	1	This meme never gets old, it’s grape!	image_url_placeholder	What’s the best way to make a meme unforgettable?	multiple-choice
6	1	How does a penguin build its house?	2025-04-07 00:27:24.551139	1	A cool meme for animal lovers	image_url_placeholder	What animals would make the best memes?	multiple-choice
7	1	What is the capital of the internet?	2025-04-07 00:38:47.1288	1	The internet has a lot of memes, but no real capital!	image_url_placeholder	How did the meme become the internets mascot?	multiple-choice
8	2	Why was the math book sad?	2025-04-07 00:38:47.1288	2	A timeless meme among students	image_url_placeholder	What’s your favorite subject to meme about?	multiple-choice
9	3	What’s the deal with airplane food?	2025-04-07 00:38:47.1288	2	This one’s been used in many stand-up routines	image_url_placeholder	Why do we joke about airplane food?	multiple-choice
10	4	I asked the librarian if the library had any books on paranoia. She whispered, "Theyre right behind you."	2025-04-07 00:38:47.1288	2	Perfect for library lovers	image_url_placeholder	Do you enjoy dark humor memes?	multiple-choice
11	5	What’s the best way to get a cat to listen to you?	2025-04-07 00:38:47.1288	2	Talk to them in memes	image_url_placeholder	Which animal memes make you laugh the most?	multiple-choice
\.


--
-- TOC entry 5008 (class 0 OID 16688)
-- Dependencies: 224
-- Data for Name: question_medium; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question_medium (question_id, quiz_id, question_text, created_at, points, explanation, image_url, hint, question_type) FROM stdin;
1	1	Why was the math book sad?	2025-04-07 00:30:13.287829	2	A timeless meme among students	image_url_placeholder	What’s your favorite subject to meme about?	multiple-choice
2	1	What’s the deal with airplane food?	2025-04-07 00:30:13.287829	2	This one’s been used in many stand-up routines	image_url_placeholder	Why do we joke about airplane food?	multiple-choice
3	1	I asked the librarian if the library had any books on paranoia. She whispered, 'They're right behind you.'	2025-04-07 00:30:13.287829	2	Perfect for library lovers	image_url_placeholder	Do you enjoy dark humor memes?	multiple-choice
4	1	What’s the best way to get a cat to listen to you?	2025-04-07 00:30:13.287829	2	Talk to them in memes	image_url_placeholder	Which animal memes make you laugh the most?	multiple-choice
5	1	I’m on a seafood diet. I see food and I eat it.	2025-04-07 00:30:13.287829	2	A meme that never gets old	image_url_placeholder	What are your favorite food memes?	multiple-choice
6	1	Why was the math book sad?	2025-04-07 00:41:56.201306	2	A timeless meme among students	image_url_placeholder	What’s your favorite subject to meme about?	multiple-choice
7	2	What’s the deal with airplane food?	2025-04-07 00:41:56.201306	2	This one’s been used in many stand-up routines	image_url_placeholder	Why do we joke about airplane food?	multiple-choice
8	3	I asked the librarian if the library had any books on paranoia. She whispered, "Theyre right behind you."	2025-04-07 00:41:56.201306	2	Perfect for library lovers	image_url_placeholder	Do you enjoy dark humor memes?	multiple-choice
9	4	What’s the best way to get a cat to listen to you?	2025-04-07 00:41:56.201306	2	Talk to them in memes	image_url_placeholder	Which animal memes make you laugh the most?	multiple-choice
10	5	I’m on a seafood diet. I see food and I eat it.	2025-04-07 00:41:56.201306	2	A meme that never gets old	image_url_placeholder	What are your favorite food memes?	multiple-choice
\.


--
-- TOC entry 5004 (class 0 OID 16658)
-- Dependencies: 220
-- Data for Name: quiz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quiz (quiz_id, creator_id, title, description, category, difficulty_level, created_at, time_limit, max_score, visibility) FROM stdin;
1	1	Квиз про картошку	Проверь, насколько ты картошечный эксперт!	Еда	easy	2025-04-07 00:18:15.468764	10	100	public
2	2	Какой ты овощ?	Выясним, ты огурец или кабачок?	Юмор	easy	2025-04-07 00:18:15.468764	8	80	public
3	3	Философия Пельменей	Глубокий квиз о смысле начинки.	Философия	medium	2025-04-07 00:18:15.468764	15	120	private
4	1	Мемология 101	Квиз по мемам XXI века.	Интернет	medium	2025-04-07 00:18:15.468764	12	90	public
5	4	Кошачьи загадки	Только для тех, кто был выбран котами.	Животные	hard	2025-04-07 00:18:15.468764	20	150	private
6	5	Где логика?	Логика, но с элементами абсурда.	Логика	medium	2025-04-07 00:18:15.468764	14	100	public
7	3	История носков	Носки с древности до наших дней.	История	easy	2025-04-07 00:18:15.468764	9	85	public
8	2	Чай или кофе?	Настоящая битва вкусов.	Еда	easy	2025-04-07 00:18:15.468764	6	50	public
9	6	Квиз по квизам	Метаквиз для квизмастеров.	Метагейминг	hard	2025-04-07 00:18:15.468764	25	200	private
10	1	География глупостей	О странах, которых не существует.	Юмор	medium	2025-04-07 00:18:15.468764	10	100	public
11	4	Магия магглов	Чем живут обычные люди без магии?	Фантастика	easy	2025-04-07 00:18:15.468764	7	60	private
12	5	Разговор с холодильником	Что он может рассказать о тебе?	Юмор	easy	2025-04-07 00:18:15.468764	5	40	public
13	3	Числа и чувства	Математика с элементами драмы.	Математика	hard	2025-04-07 00:18:15.468764	18	130	public
14	6	Кто съел моё мороженое?	Найди предателя среди друзей!	Детектив	medium	2025-04-07 00:18:15.468764	15	100	private
15	2	Рандомный квиз	Никакой логики — только флекс.	Разное	easy	2025-04-07 00:18:15.468764	9	70	public
\.


--
-- TOC entry 5018 (class 0 OID 16788)
-- Dependencies: 234
-- Data for Name: result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.result (result_id, user_id, quiz_id, score, attempt_date, time_taken, correct_answers, incorrect_answers, highest_streak, quiz_feedback) FROM stdin;
1	1	1	80	2025-04-07 00:55:30.909853	120	8	2	4	Great quiz, but a bit challenging
2	2	2	90	2025-04-07 00:55:30.909853	150	9	1	5	Very engaging questions, loved it!
3	3	3	70	2025-04-07 00:55:30.909853	110	7	3	3	The time limit was a bit tight, but good questions!
4	4	1	85	2025-04-07 00:55:30.909853	130	8	2	5	Well-designed quiz, I enjoyed it!
5	5	2	95	2025-04-07 00:55:30.909853	140	9	0	6	Great quiz, would love to see more!
6	6	3	60	2025-04-07 00:55:30.909853	100	6	4	2	Questions were too hard for me, but I tried my best!
7	7	1	92	2025-04-07 00:55:30.909853	135	9	1	5	Awesome quiz, I nailed it!
8	8	2	75	2025-04-07 00:55:30.909853	120	7	3	4	Good quiz, but the difficulty was inconsistent.
9	9	3	80	2025-04-07 00:55:30.909853	110	8	2	4	Interesting quiz, but some questions were tricky.
10	10	1	88	2025-04-07 00:55:30.909853	125	8	2	5	Nice challenge, felt balanced overall!
11	11	2	77	2025-04-07 00:55:30.909853	115	7	3	3	Fun quiz, though a bit repetitive at times.
12	12	3	90	2025-04-07 00:55:30.909853	130	9	1	6	Very well done, I enjoyed the difficulty!
13	13	1	82	2025-04-07 00:55:30.909853	120	8	2	4	Good quiz, would love a little more variety in questions.
14	14	2	91	2025-04-07 00:55:30.909853	140	9	0	6	Really liked it, challenging but fair.
15	15	3	79	2025-04-07 00:55:30.909853	125	8	2	5	Nice mix of easy and tough questions!
\.


--
-- TOC entry 5020 (class 0 OID 16808)
-- Dependencies: 236
-- Data for Name: reward; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reward (reward_id, user_id, reward_name, points_required, granted_at, reward_type, status) FROM stdin;
1	1	Gold Badge	1000	2025-04-07 00:57:01.032462	Achievement	Granted
2	2	Silver Badge	750	2025-04-07 00:57:01.032462	Achievement	Granted
3	3	Bronze Badge	500	2025-04-07 00:57:01.032462	Achievement	Granted
4	4	Top Performer	1500	2025-04-07 00:57:01.032462	Achievement	Granted
6	6	Exclusive Content	300	2025-04-07 00:57:01.032462	Access	Granted
7	7	VIP Access	500	2025-04-07 00:57:01.032462	Access	Pending
8	8	Early Bird	200	2025-04-07 00:57:01.032462	Access	Granted
9	9	Perfect Score	1000	2025-04-07 00:57:01.032462	Achievement	Granted
10	10	Super User	800	2025-04-07 00:57:01.032462	Achievement	Pending
11	11	Leaderboard Champion	1300	2025-04-07 00:57:01.032462	Achievement	Granted
12	12	Bonus Points	400	2025-04-07 00:57:01.032462	Access	Granted
13	13	Gold Membership	1500	2025-04-07 00:57:01.032462	Subscription	Pending
14	14	Expert Status	600	2025-04-07 00:57:01.032462	Achievement	Granted
15	15	Exclusive Badge	900	2025-04-07 00:57:01.032462	Achievement	Pending
5	5	Winner of March	1200	2025-04-07 00:57:01.032462	Achievement	Pending
\.


--
-- TOC entry 5002 (class 0 OID 16644)
-- Dependencies: 218
-- Data for Name: userr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.userr (user_id, username, email, password_hash, created_at, role, status, profile_picture, last_login) FROM stdin;
1	alish_akadil	alish@example.com	hash1	2024-04-01 10:00:00	admin	active	profile1.png	2025-04-01 08:30:00
2	beka_user	beka@example.com	hash2	2024-04-02 12:15:00	student	active	profile2.png	2025-04-02 09:00:00
3	akbope_22	akbope@example.com	hash3	2024-04-03 15:00:00	student	active	profile3.jpg	2025-04-03 10:00:00
4	nuris_88	nuris@example.com	hash4	2024-04-04 09:20:00	student	active	profile4.jpg	2025-04-04 11:30:00
5	teacher01	teach1@example.com	hash5	2024-04-05 11:11:00	teacher	active	profile5.png	2025-04-05 08:00:00
6	guest_user1	guest1@example.com	hash6	2024-04-06 13:30:00	guest	inactive	profile6.jpg	\N
7	admin2	admin2@example.com	hash7	2024-04-07 14:00:00	admin	active	profile7.png	2025-04-06 07:00:00
8	zhanibek_kz	zhanibek@example.com	hash8	2024-04-08 08:45:00	student	banned	profile8.png	2025-01-10 10:30:00
9	samira_mn	samira@example.com	hash9	2024-04-09 16:10:00	student	active	profile9.jpg	2025-03-15 17:20:00
10	lecturer02	lecturer2@example.com	hash10	2024-04-10 17:00:00	teacher	active	profile10.png	2025-04-02 12:00:00
11	bot_user	bot@example.com	hash11	2024-04-11 18:20:00	bot	active	profile11.jpg	\N
12	nurlybek_kk	nurlybek@example.com	hash12	2024-04-12 09:05:00	student	active	profile12.png	2025-04-01 10:45:00
13	aliya_tt	aliya@example.com	hash13	2024-04-13 14:40:00	student	inactive	profile13.png	2024-12-25 09:15:00
14	moderator1	mod1@example.com	hash14	2024-04-14 11:30:00	moderator	active	profile14.jpg	2025-03-01 13:45:00
15	trial_user	trial@example.com	hash15	2024-04-15 10:10:00	trial	inactive	profile15.jpg	\N
\.


--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 231
-- Name: answer_difficult_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.answer_difficult_answer_id_seq', 40, true);


--
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 227
-- Name: answer_easy_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.answer_easy_answer_id_seq', 100, true);


--
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 229
-- Name: answer_medium_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.answer_medium_answer_id_seq', 16, true);


--
-- TOC entry 5042 (class 0 OID 0)
-- Dependencies: 237
-- Name: feedback_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feedback_feedback_id_seq', 15, true);


--
-- TOC entry 5043 (class 0 OID 0)
-- Dependencies: 221
-- Name: question_easy_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_easy_question_id_seq', 11, true);


--
-- TOC entry 5044 (class 0 OID 0)
-- Dependencies: 225
-- Name: questions_difficult_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questions_difficult_question_id_seq', 15, true);


--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 223
-- Name: questions_medium_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questions_medium_question_id_seq', 10, true);


--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 219
-- Name: quizzes_quiz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quizzes_quiz_id_seq', 15, true);


--
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 233
-- Name: result_result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.result_result_id_seq', 15, true);


--
-- TOC entry 5048 (class 0 OID 0)
-- Dependencies: 235
-- Name: reward_reward_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reward_reward_id_seq', 15, true);


--
-- TOC entry 5049 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 15, true);


--
-- TOC entry 4837 (class 2606 OID 16781)
-- Name: answer_difficult answer_difficult_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer_difficult
    ADD CONSTRAINT answer_difficult_pkey PRIMARY KEY (answer_id);


--
-- TOC entry 4833 (class 2606 OID 16738)
-- Name: answer_easy answer_easy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer_easy
    ADD CONSTRAINT answer_easy_pkey PRIMARY KEY (answer_id);


--
-- TOC entry 4835 (class 2606 OID 16765)
-- Name: answer_medium answer_medium_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer_medium
    ADD CONSTRAINT answer_medium_pkey PRIMARY KEY (answer_id);


--
-- TOC entry 4843 (class 2606 OID 16830)
-- Name: feedback feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (feedback_id);


--
-- TOC entry 4827 (class 2606 OID 16681)
-- Name: question_easy question_easy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_easy
    ADD CONSTRAINT question_easy_pkey PRIMARY KEY (question_id);


--
-- TOC entry 4831 (class 2606 OID 16711)
-- Name: question_difficult questions_difficult_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_difficult
    ADD CONSTRAINT questions_difficult_pkey PRIMARY KEY (question_id);


--
-- TOC entry 4829 (class 2606 OID 16696)
-- Name: question_medium questions_medium_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_medium
    ADD CONSTRAINT questions_medium_pkey PRIMARY KEY (question_id);


--
-- TOC entry 4825 (class 2606 OID 16666)
-- Name: quiz quizzes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz
    ADD CONSTRAINT quizzes_pkey PRIMARY KEY (quiz_id);


--
-- TOC entry 4839 (class 2606 OID 16796)
-- Name: result result_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.result
    ADD CONSTRAINT result_pkey PRIMARY KEY (result_id);


--
-- TOC entry 4841 (class 2606 OID 16814)
-- Name: reward reward_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reward
    ADD CONSTRAINT reward_pkey PRIMARY KEY (reward_id);


--
-- TOC entry 4819 (class 2606 OID 16656)
-- Name: userr users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userr
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4821 (class 2606 OID 16652)
-- Name: userr users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userr
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 4823 (class 2606 OID 16654)
-- Name: userr users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userr
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4850 (class 2606 OID 16782)
-- Name: answer_difficult answer_difficult_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer_difficult
    ADD CONSTRAINT answer_difficult_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question_difficult(question_id);


--
-- TOC entry 4848 (class 2606 OID 16739)
-- Name: answer_easy answer_easy_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer_easy
    ADD CONSTRAINT answer_easy_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question_easy(question_id);


--
-- TOC entry 4849 (class 2606 OID 16766)
-- Name: answer_medium answer_medium_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer_medium
    ADD CONSTRAINT answer_medium_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question_medium(question_id);


--
-- TOC entry 4854 (class 2606 OID 16836)
-- Name: feedback feedback_quiz_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_quiz_id_fkey FOREIGN KEY (quiz_id) REFERENCES public.quiz(quiz_id);


--
-- TOC entry 4855 (class 2606 OID 16831)
-- Name: feedback feedback_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.userr(user_id);


--
-- TOC entry 4845 (class 2606 OID 16682)
-- Name: question_easy question_easy_quiz_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_easy
    ADD CONSTRAINT question_easy_quiz_id_fkey FOREIGN KEY (quiz_id) REFERENCES public.quiz(quiz_id);


--
-- TOC entry 4847 (class 2606 OID 16712)
-- Name: question_difficult questions_difficult_quiz_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_difficult
    ADD CONSTRAINT questions_difficult_quiz_id_fkey FOREIGN KEY (quiz_id) REFERENCES public.quiz(quiz_id);


--
-- TOC entry 4846 (class 2606 OID 16697)
-- Name: question_medium questions_medium_quiz_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_medium
    ADD CONSTRAINT questions_medium_quiz_id_fkey FOREIGN KEY (quiz_id) REFERENCES public.quiz(quiz_id);


--
-- TOC entry 4844 (class 2606 OID 16667)
-- Name: quiz quizzes_creator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz
    ADD CONSTRAINT quizzes_creator_id_fkey FOREIGN KEY (creator_id) REFERENCES public.userr(user_id);


--
-- TOC entry 4851 (class 2606 OID 16802)
-- Name: result result_quiz_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.result
    ADD CONSTRAINT result_quiz_id_fkey FOREIGN KEY (quiz_id) REFERENCES public.quiz(quiz_id);


--
-- TOC entry 4852 (class 2606 OID 16797)
-- Name: result result_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.result
    ADD CONSTRAINT result_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.userr(user_id);


--
-- TOC entry 4853 (class 2606 OID 16815)
-- Name: reward reward_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reward
    ADD CONSTRAINT reward_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.userr(user_id);


-- Completed on 2025-05-18 03:48:59

--
-- PostgreSQL database dump complete
--

