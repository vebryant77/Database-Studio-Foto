--
-- PostgreSQL database dump
--

\restrict k8eSrMxneQBLq6TxOjlUazul1KEmNqbKp7tqGeZFiYkwH1e4qSiE0hG62yBCS96

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

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
-- Name: det_penjualan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.det_penjualan (
    id_penjualan integer NOT NULL,
    id_produk integer NOT NULL,
    jumlah integer
);


ALTER TABLE public.det_penjualan OWNER TO postgres;

--
-- Name: detail_beli; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detail_beli (
    id_produk integer NOT NULL,
    id_pembelian integer NOT NULL,
    jumlah_pembelian integer,
    harga_beli numeric(12,2)
);


ALTER TABLE public.detail_beli OWNER TO postgres;

--
-- Name: detail_paket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detail_paket (
    id_paket integer NOT NULL,
    id_penjualan integer NOT NULL
);


ALTER TABLE public.detail_paket OWNER TO postgres;

--
-- Name: foto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.foto (
    id_penjualan integer NOT NULL,
    nama_file character varying(255) NOT NULL
);


ALTER TABLE public.foto OWNER TO postgres;

--
-- Name: jabatan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jabatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jabatan_id_seq OWNER TO postgres;

--
-- Name: jabatan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jabatan (
    id integer DEFAULT nextval('public.jabatan_id_seq'::regclass) NOT NULL,
    jb_code character varying(10) GENERATED ALWAYS AS (('JB'::text || lpad((id)::text, 3, '0'::text))) STORED,
    nama_jabatan character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.jabatan OWNER TO postgres;

--
-- Name: paket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.paket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.paket_id_seq OWNER TO postgres;

--
-- Name: paket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paket (
    id_paket integer DEFAULT nextval('public.paket_id_seq'::regclass) NOT NULL,
    pk_code character varying(10) GENERATED ALWAYS AS (('PKT'::text || lpad((id_paket)::text, 3, '0'::text))) STORED,
    nama_paket character varying(100),
    status_paket character varying(20),
    harga_paket numeric(12,2),
    keterangan_paket text,
    id_studio integer
);


ALTER TABLE public.paket OWNER TO postgres;

--
-- Name: paket_properti; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paket_properti (
    id_paket integer NOT NULL,
    id_properti integer NOT NULL
);


ALTER TABLE public.paket_properti OWNER TO postgres;

--
-- Name: pegawai_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pegawai_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pegawai_id_seq OWNER TO postgres;

--
-- Name: pegawai; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pegawai (
    id_pegawai integer DEFAULT nextval('public.pegawai_id_seq'::regclass) NOT NULL,
    peg_code character varying(10) GENERATED ALWAYS AS (('PEG'::text || lpad((id_pegawai)::text, 3, '0'::text))) STORED,
    nama_depan_peg character varying(50),
    nama_belakang_peg character varying(50),
    no_telp_pegawai character varying(20),
    email_pegawai character varying(100),
    alamat_pegawai text,
    id_jabatan integer
);


ALTER TABLE public.pegawai OWNER TO postgres;

--
-- Name: pelanggan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pelanggan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pelanggan_id_seq OWNER TO postgres;

--
-- Name: pelanggan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pelanggan (
    id_pelanggan integer DEFAULT nextval('public.pelanggan_id_seq'::regclass) NOT NULL,
    plg_code character varying(10) GENERATED ALWAYS AS (('PLG'::text || lpad((id_pelanggan)::text, 3, '0'::text))) STORED,
    nama_depan_pel character varying(50),
    nama_belakang_pel character varying(50),
    no_telp_pelanggan character varying(20),
    email_pelanggan character varying(100),
    alamat_pelanggan text
);


ALTER TABLE public.pelanggan OWNER TO postgres;

--
-- Name: pembelian_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pembelian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pembelian_id_seq OWNER TO postgres;

--
-- Name: pembelian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pembelian (
    id_pembelian integer DEFAULT nextval('public.pembelian_id_seq'::regclass) NOT NULL,
    pb_code character varying(10) GENERATED ALWAYS AS (('PB'::text || lpad((id_pembelian)::text, 3, '0'::text))) STORED,
    id_supplier integer,
    id_pegawai integer,
    tgl_beli date,
    tgl_datang date
);


ALTER TABLE public.pembelian OWNER TO postgres;

--
-- Name: penjualan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.penjualan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.penjualan_id_seq OWNER TO postgres;

--
-- Name: penjualan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.penjualan (
    id_penjualan integer DEFAULT nextval('public.penjualan_id_seq'::regclass) NOT NULL,
    pj_code character varying(10) GENERATED ALWAYS AS (('PJL'::text || lpad((id_penjualan)::text, 3, '0'::text))) STORED,
    tgl_jual date,
    id_pelanggan integer,
    id_pegawai integer,
    tgl_pengambilan date,
    status_konfirmasi character varying(20)
);


ALTER TABLE public.penjualan OWNER TO postgres;

--
-- Name: produk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produk_id_seq OWNER TO postgres;

--
-- Name: produk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produk (
    id_produk integer DEFAULT nextval('public.produk_id_seq'::regclass) NOT NULL,
    prd_code character varying(10) GENERATED ALWAYS AS (('PD'::text || lpad((id_produk)::text, 3, '0'::text))) STORED,
    nama_produk character varying(100),
    harga_produk numeric(12,2),
    stok_awal integer
);


ALTER TABLE public.produk OWNER TO postgres;

--
-- Name: properti_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.properti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.properti_id_seq OWNER TO postgres;

--
-- Name: properti; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.properti (
    id_properti integer DEFAULT nextval('public.properti_id_seq'::regclass) NOT NULL,
    pr_code character varying(10) GENERATED ALWAYS AS (('PR'::text || lpad((id_properti)::text, 3, '0'::text))) STORED,
    nama_properti character varying(50),
    jumlah_properti integer
);


ALTER TABLE public.properti OWNER TO postgres;

--
-- Name: studio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.studio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.studio_id_seq OWNER TO postgres;

--
-- Name: studio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.studio (
    id_studio integer DEFAULT nextval('public.studio_id_seq'::regclass) NOT NULL,
    st_code character varying(10) GENERATED ALWAYS AS (('STD'::text || lpad((id_studio)::text, 3, '0'::text))) STORED,
    nama_studio character varying(50),
    keterangan_studio text
);


ALTER TABLE public.studio OWNER TO postgres;

--
-- Name: supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.supplier_id_seq OWNER TO postgres;

--
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    id_supplier integer DEFAULT nextval('public.supplier_id_seq'::regclass) NOT NULL,
    sup_code character varying(10) GENERATED ALWAYS AS (('SUP'::text || lpad((id_supplier)::text, 3, '0'::text))) STORED,
    nama_supplier character varying(100),
    no_telp_supplier character varying(20),
    alamat_supplier text
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- Data for Name: det_penjualan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.det_penjualan (id_penjualan, id_produk, jumlah) FROM stdin;
403	1	2
404	2	8
405	3	4
406	4	6
407	5	5
408	6	7
409	7	5
410	8	6
411	9	2
412	10	4
413	11	5
414	12	2
415	13	2
416	14	1
417	15	8
418	16	5
419	17	3
420	18	3
421	19	6
422	20	8
423	21	8
424	22	10
425	23	6
426	24	4
427	25	5
428	26	2
429	27	4
430	28	9
431	29	9
432	30	10
433	31	10
434	32	8
435	33	2
436	34	7
437	35	8
438	36	2
439	37	2
440	38	4
441	39	4
442	40	2
443	41	7
444	42	1
445	43	1
446	44	4
447	45	3
448	46	10
449	47	10
450	48	6
451	49	1
452	50	1
453	51	5
454	52	7
455	53	7
456	54	10
457	55	7
458	56	10
459	57	10
460	58	1
461	59	3
462	60	5
463	61	8
464	62	2
465	63	4
466	64	1
467	65	4
468	66	1
469	67	9
470	68	7
471	69	7
472	70	9
473	71	5
474	72	6
475	73	10
476	74	6
477	75	7
478	76	9
479	77	6
480	78	8
481	79	4
482	80	2
483	81	3
484	82	8
485	83	10
486	84	1
487	85	7
488	86	1
489	87	8
490	88	2
491	89	8
492	90	6
493	91	4
494	92	10
495	93	9
496	94	6
497	95	1
498	96	1
499	97	3
500	98	9
501	99	10
502	100	9
503	1	2
\.


--
-- Data for Name: detail_beli; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detail_beli (id_produk, id_pembelian, jumlah_pembelian, harga_beli) FROM stdin;
1	101	16	443314.56
2	102	16	247187.22
3	103	29	36552.96
4	104	46	467811.40
5	105	5	222190.30
6	106	5	308371.18
7	107	13	210179.25
8	108	44	120475.18
9	109	49	262934.12
10	110	33	361722.24
11	111	46	22048.09
12	112	18	480042.60
13	113	31	181696.47
14	114	42	244599.56
15	115	4	312128.92
16	116	31	187922.26
17	117	3	116184.66
18	118	8	64342.30
19	119	15	468243.67
20	120	30	400315.68
21	121	44	231847.54
22	122	24	462445.48
23	123	48	428171.25
24	124	44	163481.44
25	125	48	303983.80
26	126	24	499686.08
27	127	38	445605.26
28	128	10	496500.43
29	129	1	218727.42
30	130	48	223008.18
31	131	19	439785.55
32	132	33	83278.19
33	133	48	101613.41
34	134	37	247485.17
35	135	30	47451.65
36	136	21	345245.49
37	137	40	426329.35
38	138	26	311576.15
39	139	30	433034.83
40	140	6	87003.50
41	141	47	11039.82
42	142	29	219975.34
43	143	17	448404.34
44	144	28	117115.91
45	145	50	30591.36
46	146	19	400664.74
47	147	13	301306.51
48	148	49	89345.11
49	149	31	206979.10
50	150	22	352677.63
51	151	21	311733.04
52	152	16	117108.11
53	153	4	402192.12
54	154	34	253875.14
55	155	6	138666.28
56	156	8	292943.47
57	157	5	172005.88
58	158	16	163913.61
59	159	38	444935.36
60	160	14	485468.06
61	161	12	393117.83
62	162	43	440135.04
63	163	18	122356.27
64	164	9	173527.68
65	165	26	63411.24
66	166	29	125790.16
67	167	9	307362.88
68	168	44	214100.43
69	169	29	478993.25
70	170	5	416262.03
71	171	44	478571.99
72	172	37	370321.19
73	173	28	258433.49
74	174	50	311833.34
75	175	15	280064.74
76	176	42	56941.94
77	177	30	205501.72
78	178	7	403715.08
79	179	10	311885.57
80	180	40	299469.12
81	181	12	168364.60
82	182	13	280460.03
83	183	6	427506.72
84	184	18	306286.27
85	185	22	326434.71
86	186	38	280731.22
87	187	6	429318.97
88	188	8	391104.74
89	189	21	29914.28
90	190	32	489721.59
91	191	7	362283.72
92	192	8	106685.03
93	193	33	447128.28
94	194	8	108369.79
95	195	18	396500.07
96	196	15	11384.32
97	197	47	119867.98
98	198	29	391680.22
99	199	39	404177.14
100	200	27	312365.16
\.


--
-- Data for Name: detail_paket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detail_paket (id_paket, id_penjualan) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
10	10
1	11
2	12
3	13
4	14
5	15
6	16
7	17
8	18
9	19
10	20
1	21
2	22
3	23
4	24
5	25
6	26
7	27
8	28
9	29
10	30
1	31
2	32
3	33
4	34
5	35
6	36
7	37
8	38
9	39
10	40
1	41
2	42
3	43
4	44
5	45
6	46
7	47
8	48
9	49
10	50
1	51
2	52
3	53
4	54
5	55
6	56
7	57
8	58
9	59
10	60
1	61
2	62
3	63
4	64
5	65
6	66
7	67
8	68
9	69
10	70
1	71
2	72
3	73
4	74
5	75
6	76
7	77
8	78
9	79
10	80
1	81
2	82
3	83
4	84
5	85
6	86
7	87
8	88
9	89
10	90
1	91
2	92
3	93
4	94
5	95
6	96
7	97
8	98
9	99
10	100
\.


--
-- Data for Name: foto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.foto (id_penjualan, nama_file) FROM stdin;
403	foto_403_2.jpg
404	foto_404_1.jpg
405	foto_405_1.jpg
406	foto_406_2.jpg
407	foto_407_1.jpg
408	foto_408_2.jpg
409	foto_409_3.jpg
410	foto_410_1.jpg
411	foto_411_1.jpg
412	foto_412_1.jpg
413	foto_413_2.jpg
414	foto_414_2.jpg
415	foto_415_2.jpg
416	foto_416_1.jpg
417	foto_417_3.jpg
418	foto_418_2.jpg
419	foto_419_3.jpg
420	foto_420_2.jpg
421	foto_421_3.jpg
422	foto_422_2.jpg
423	foto_423_3.jpg
424	foto_424_1.jpg
425	foto_425_1.jpg
426	foto_426_3.jpg
427	foto_427_2.jpg
428	foto_428_1.jpg
429	foto_429_3.jpg
430	foto_430_3.jpg
431	foto_431_1.jpg
432	foto_432_2.jpg
433	foto_433_1.jpg
434	foto_434_3.jpg
435	foto_435_1.jpg
436	foto_436_2.jpg
437	foto_437_2.jpg
438	foto_438_1.jpg
439	foto_439_3.jpg
440	foto_440_2.jpg
441	foto_441_1.jpg
442	foto_442_3.jpg
443	foto_443_3.jpg
444	foto_444_3.jpg
445	foto_445_2.jpg
446	foto_446_1.jpg
447	foto_447_3.jpg
448	foto_448_3.jpg
449	foto_449_2.jpg
450	foto_450_3.jpg
451	foto_451_3.jpg
452	foto_452_2.jpg
453	foto_453_1.jpg
454	foto_454_3.jpg
455	foto_455_1.jpg
456	foto_456_3.jpg
457	foto_457_2.jpg
458	foto_458_2.jpg
459	foto_459_2.jpg
460	foto_460_3.jpg
461	foto_461_2.jpg
462	foto_462_2.jpg
463	foto_463_2.jpg
464	foto_464_2.jpg
465	foto_465_1.jpg
466	foto_466_2.jpg
467	foto_467_2.jpg
468	foto_468_2.jpg
469	foto_469_1.jpg
470	foto_470_2.jpg
471	foto_471_2.jpg
472	foto_472_3.jpg
473	foto_473_2.jpg
474	foto_474_1.jpg
475	foto_475_2.jpg
476	foto_476_1.jpg
477	foto_477_2.jpg
478	foto_478_1.jpg
479	foto_479_3.jpg
480	foto_480_3.jpg
481	foto_481_3.jpg
482	foto_482_2.jpg
483	foto_483_3.jpg
484	foto_484_3.jpg
485	foto_485_3.jpg
486	foto_486_2.jpg
487	foto_487_3.jpg
488	foto_488_3.jpg
489	foto_489_3.jpg
490	foto_490_3.jpg
491	foto_491_2.jpg
492	foto_492_1.jpg
493	foto_493_2.jpg
494	foto_494_2.jpg
495	foto_495_3.jpg
496	foto_496_2.jpg
497	foto_497_2.jpg
498	foto_498_3.jpg
499	foto_499_2.jpg
500	foto_500_3.jpg
501	foto_501_3.jpg
502	foto_502_1.jpg
503	foto_503_2.jpg
\.


--
-- Data for Name: jabatan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jabatan (id, nama_jabatan, created_at, updated_at) FROM stdin;
1	Pemilik Studio	2025-10-23 18:08:54.319029	2025-10-23 18:08:54.319029
2	Manajer Studio	2025-10-23 18:08:54.319029	2025-10-23 18:08:54.319029
3	Fotografer Senior	2025-10-23 18:08:54.319029	2025-10-23 18:08:54.319029
4	Fotografer Junior	2025-10-23 18:08:54.319029	2025-10-23 18:08:54.319029
5	Asisten Fotografer	2025-10-23 18:08:54.319029	2025-10-23 18:08:54.319029
6	Videografer	2025-10-23 18:08:54.319029	2025-10-23 18:08:54.319029
7	Editor Foto/Retoucher	2025-10-23 18:08:54.319029	2025-10-23 18:08:54.319029
8	Desainer Grafis	2025-10-23 18:08:54.319029	2025-10-23 18:08:54.319029
9	Admin & Customer Service	2025-10-23 18:08:54.319029	2025-10-23 18:08:54.319029
10	Office Boy/Girl	2025-10-23 18:08:54.319029	2025-10-23 18:08:54.319029
\.


--
-- Data for Name: paket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paket (id_paket, nama_paket, status_paket, harga_paket, keterangan_paket, id_studio) FROM stdin;
1	Paket Prewedding Elegan	Aktif	2500000.00	Paket foto prewedding indoor dan outdoor dengan 2 sesi	1
2	Paket Wisuda Ceria	Aktif	750000.00	Foto wisuda individu dengan 5 file digital dan 1 cetak besar	2
3	Paket Keluarga Bahagia	Aktif	1500000.00	Paket foto keluarga hingga 6 orang, dengan dekorasi khusus	3
4	Paket Couple Romantic	Aktif	950000.00	Foto pasangan dengan 2 latar berbeda dan 10 hasil edit	4
5	Paket Produk Premium	Aktif	1250000.00	Foto produk profesional untuk katalog dan e-commerce	5
6	Paket Fashion Glamour	Aktif	1750000.00	Pemotretan fashion indoor dengan lighting profesional	6
7	Paket Bayi Lucu	Aktif	850000.00	Paket khusus foto bayi usia 1–12 bulan dengan properti lucu	7
8	Paket Event Spesial	Aktif	3000000.00	Paket dokumentasi acara seperti ulang tahun dan lamaran	8
9	Paket Wedding Gold	Aktif	4500000.00	Paket foto pernikahan full day dengan 2 fotografer	9
10	Paket Portrait Profesional	Aktif	1000000.00	Foto profil profesional untuk CV dan LinkedIn	10
\.


--
-- Data for Name: paket_properti; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paket_properti (id_paket, id_properti) FROM stdin;
1	1
1	10
1	100
1	11
1	12
1	13
1	14
1	15
1	16
1	17
1	18
1	19
1	2
1	20
1	21
1	22
1	23
1	24
1	25
1	26
1	27
1	28
1	29
1	3
1	30
1	31
1	32
1	33
1	34
1	35
1	36
1	37
1	38
1	39
1	4
1	40
1	41
1	42
1	43
1	44
1	45
1	46
1	47
1	48
1	49
1	5
1	50
1	51
1	52
1	53
1	54
1	55
1	56
1	57
1	58
1	59
1	6
1	60
1	61
1	62
1	63
1	64
1	65
1	66
1	67
1	68
1	69
1	7
1	70
1	71
1	72
1	73
1	74
1	75
1	76
1	77
1	78
1	79
1	8
1	80
1	81
1	82
1	83
1	84
1	85
1	86
1	87
1	88
1	89
1	9
1	90
1	91
1	92
1	93
1	94
1	95
1	96
1	97
1	98
\.


--
-- Data for Name: pegawai; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pegawai (id_pegawai, nama_depan_peg, nama_belakang_peg, no_telp_pegawai, email_pegawai, alamat_pegawai, id_jabatan) FROM stdin;
101	Janene	Gamlyn	+86 827 196 0078	jgamlyn0@wired.com	Apt 1380	2
102	Fonsie	Gaymar	+62 869 597 9959	fgaymar1@unblog.fr	1st Floor	4
103	Cecil	Lindstedt	+46 479 752 0416	clindstedt2@walmart.com	PO Box 56206	2
104	Kassandra	Haslehurst	+86 325 609 7704	khaslehurst3@ask.com	PO Box 59230	5
105	Iseabal	Francklin	+86 903 279 1436	ifrancklin4@lycos.com	Room 1766	5
106	Roderic	Debell	+55 271 995 8504	rdebell5@fda.gov	Room 1475	4
107	Kathleen	Viveash	+62 842 808 7482	kviveash6@blinklist.com	Apt 566	8
108	Nadean	Watkin	+86 500 257 3151	nwatkin7@hexun.com	Suite 49	4
109	Kyle	Stiff	+1 540 301 4417	kstiff8@tamu.edu	PO Box 27599	9
110	Daniela	Rozenbaum	+86 625 332 3896	drozenbaum9@techcrunch.com	Apt 600	5
111	Ada	Lahy	+86 231 871 9073	alahya@jiathis.com	Suite 86	1
112	Tammy	Austick	+62 949 972 1776	taustickb@mashable.com	Room 1633	7
113	Christyna	Gillard	+261 559 111 0350	cgillardc@about.me	Suite 58	4
114	Mirella	Megroff	+62 406 488 0196	mmegroffd@economist.com	Apt 656	4
115	Jodie	Bensusan	+55 168 423 1290	jbensusane@zdnet.com	Apt 1897	10
116	Madlin	Cholerton	+595 517 971 7108	mcholertonf@diigo.com	Suite 53	2
117	Vina	Dannehl	+63 373 875 9292	vdannehlg@deliciousdays.com	Suite 74	2
118	Nolana	Dagleas	+62 838 219 4155	ndagleash@sun.com	PO Box 52891	10
119	Joete	Vasnetsov	+351 745 745 7755	jvasnetsovi@google.com	Apt 77	3
120	Thornton	MacLure	+55 967 693 2756	tmaclurej@youku.com	Suite 9	10
121	Ingeberg	Whitesel	+86 494 717 8096	iwhiteselk@storify.com	9th Floor	8
122	Gusta	Atto	+81 502 702 3245	gattol@wiley.com	Room 1146	6
123	Phaidra	Pedgrift	+33 164 344 3645	ppedgriftm@youtu.be	9th Floor	5
124	Mair	Predohl	+98 366 571 4000	mpredohln@cafepress.com	Apt 422	2
125	Mattheus	Neath	+86 129 488 3538	mneatho@blogspot.com	Suite 42	6
126	Oates	Pretti	+7 515 309 7100	oprettip@prlog.org	PO Box 62014	7
127	Pearce	Holdren	+86 878 782 6755	pholdrenq@jalbum.net	16th Floor	6
128	Maura	Cullabine	+62 361 787 6457	mcullabiner@bandcamp.com	Suite 6	5
129	Reinold	Tivenan	+55 230 102 8099	rtivenans@google.com.au	2nd Floor	2
130	Thorstein	Touret	+7 932 654 4863	ttourett@chicagotribune.com	Apt 1917	6
131	Bathsheba	Litzmann	+86 578 705 4986	blitzmannu@census.gov	PO Box 23294	5
132	Herschel	Davie	+351 888 768 3503	hdaviev@umich.edu	Room 681	7
133	Beret	Errichelli	+86 900 219 0819	berrichelliw@mozilla.org	4th Floor	2
134	Lisabeth	Barrack	+62 751 246 9322	lbarrackx@1688.com	PO Box 85737	6
135	Athena	Meadowcroft	+62 264 931 4328	ameadowcrofty@skype.com	Apt 1048	8
136	Erek	Barnaby	+93 568 821 0614	ebarnabyz@npr.org	10th Floor	10
137	Jobina	Ebbetts	+374 547 174 2972	jebbetts10@telegraph.co.uk	12th Floor	10
138	Ramon	Rollin	+63 269 343 0538	rrollin11@va.gov	Suite 4	10
139	Edgar	Demaid	+33 155 444 2726	edemaid12@elpais.com	Apt 904	5
140	Tulley	Aloway	+62 563 737 3785	taloway13@cam.ac.uk	PO Box 28807	2
141	Morrie	Leindecker	+255 813 367 7535	mleindecker14@indiatimes.com	Apt 63	4
142	Anallese	Akehurst	+595 393 222 2102	aakehurst15@nymag.com	Room 520	5
143	Noellyn	McGaw	+62 199 126 6410	nmcgaw16@unesco.org	Suite 76	2
144	Will	Romagosa	+86 974 361 4827	wromagosa17@nytimes.com	Suite 60	10
145	Merwin	Enns	+49 818 609 2083	menns18@weibo.com	Apt 1491	2
146	Karlotte	Ugoni	+386 928 332 7136	kugoni19@goo.ne.jp	Apt 502	10
147	Cairistiona	Waddell	+504 751 115 3151	cwaddell1a@zimbio.com	Suite 32	9
148	Hans	Meric	+86 655 406 0812	hmeric1b@bandcamp.com	Room 897	10
149	Andrew	McGrotty	+227 542 659 2726	amcgrotty1c@taobao.com	Apt 1482	2
150	Irma	Stathers	+385 949 486 6218	istathers1d@miibeian.gov.cn	PO Box 49930	2
151	Derry	Gate	+380 441 763 9110	dgate1e@amazon.com	Room 1473	2
152	Shandra	Newall	+46 342 119 8802	snewall1f@sohu.com	Apt 943	1
153	Gav	Beville	+351 413 988 3760	gbeville1g@columbia.edu	PO Box 33730	7
154	Orran	Worgen	+63 961 891 3113	oworgen1h@hexun.com	5th Floor	3
155	Constantine	Spurway	+994 198 286 9294	cspurway1i@lulu.com	Suite 56	6
156	Collen	Wallen	+63 607 828 0012	cwallen1j@arstechnica.com	Suite 14	4
157	Veronica	Eagland	+62 618 333 2720	veagland1k@redcross.org	Suite 21	7
158	Garner	Pellington	+52 474 831 8058	gpellington1l@privacy.gov.au	Suite 24	2
159	Lon	Beaton	+62 914 784 5938	lbeaton1m@wordpress.org	Suite 11	8
160	Suki	Jeffery	+62 380 882 9304	sjeffery1n@abc.net.au	PO Box 2761	5
161	Skylar	Hakking	+57 664 754 9613	shakking1o@issuu.com	Suite 40	6
162	Dave	McCarrison	+62 235 612 6948	dmccarrison1p@mediafire.com	Room 1197	3
163	Tommie	Secombe	+33 472 921 0476	tsecombe1q@sciencedaily.com	PO Box 2077	9
164	Jacques	Bertenshaw	+358 810 831 0452	jbertenshaw1r@cyberchimps.com	13th Floor	9
165	Harmonia	Rozanski	+506 262 653 6224	hrozanski1s@nyu.edu	Apt 495	10
166	Alvira	Casado	+33 741 803 5861	acasado1t@bravesites.com	Suite 97	3
167	Tabina	Thornham	+62 676 216 6100	tthornham1u@webmd.com	Room 1433	3
168	Jere	Ludee	+62 929 953 0572	jludee1v@geocities.jp	8th Floor	9
169	Adaline	Huckell	+351 772 581 8491	ahuckell1w@eventbrite.com	Room 900	7
170	Dion	Roseblade	+420 856 329 0031	droseblade1x@wufoo.com	Apt 1123	2
171	Godard	Pellatt	+63 139 554 3432	gpellatt1y@reference.com	4th Floor	6
172	Arlin	Trubshaw	+62 356 917 1338	atrubshaw1z@wikia.com	Apt 346	9
173	Tally	Boulden	+46 912 186 2696	tboulden20@discovery.com	19th Floor	10
174	Leena	Wibrow	+264 415 803 1364	lwibrow21@si.edu	12th Floor	5
175	Robby	McCoole	+62 377 575 0136	rmccoole22@aboutads.info	Apt 1013	9
176	Devi	Presnell	+48 419 205 1539	dpresnell23@youtu.be	Suite 8	8
177	Becky	Skentelbery	+351 531 923 1863	bskentelbery24@issuu.com	Suite 55	8
178	Stefanie	Bassford	+504 556 495 7296	sbassford25@cnn.com	Suite 90	3
179	Katusha	Bamsey	+7 955 630 5636	kbamsey26@google.com.hk	PO Box 81289	5
180	Zacharia	McBay	+20 922 195 6328	zmcbay27@about.com	Apt 907	1
181	Lindie	Upham	+235 861 613 6667	lupham28@salon.com	Room 1431	2
182	Jerome	Idel	+66 194 224 8132	jidel29@unc.edu	18th Floor	10
183	Freeland	Marsy	+30 356 256 2631	fmarsy2a@jigsy.com	Suite 53	1
184	Hildegaard	Sands	+351 592 266 0229	hsands2b@shop-pro.jp	13th Floor	8
185	Boy	Kennady	+55 905 770 6666	bkennady2c@apache.org	PO Box 83255	8
186	Neala	Jacklin	+62 978 895 1744	njacklin2d@sakura.ne.jp	Room 589	8
187	Dani	Bellfield	+420 530 421 9450	dbellfield2e@indiatimes.com	19th Floor	5
188	Helyn	Stearn	+92 148 290 5096	hstearn2f@prweb.com	19th Floor	5
189	Barbabas	McCourtie	+1 254 151 1464	bmccourtie2g@blog.com	4th Floor	10
190	Uriah	Brandts	+504 226 490 7117	ubrandts2h@wisc.edu	Room 44	7
191	Kimbra	Hannis	+977 617 508 2991	khannis2i@nhs.uk	Room 179	4
192	Deena	MacPhaden	+268 997 748 7612	dmacphaden2j@sciencedaily.com	Suite 33	2
193	Dominique	Sleep	+86 709 500 8981	dsleep2k@i2i.jp	Apt 1959	5
194	Lisette	Hounsome	+81 959 418 4150	lhounsome2l@unicef.org	Suite 60	6
195	Tiler	Chellam	+1 210 545 3587	tchellam2m@shareasale.com	Room 186	9
196	Nance	Killingbeck	+92 806 215 5435	nkillingbeck2n@blogtalkradio.com	Apt 374	7
197	Tove	Meaton	+62 606 448 0159	tmeaton2o@typepad.com	Apt 1773	7
198	Gayel	Hambribe	+62 279 831 7071	ghambribe2p@japanpost.jp	11th Floor	4
199	Blinnie	Tolworth	+251 792 931 4195	btolworth2q@bigcartel.com	1st Floor	7
200	Shellie	Denness	+82 268 426 5007	sdenness2r@craigslist.org	11th Floor	6
\.


--
-- Data for Name: pelanggan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pelanggan (id_pelanggan, nama_depan_pel, nama_belakang_pel, no_telp_pelanggan, email_pelanggan, alamat_pelanggan) FROM stdin;
1	Andree	Murdy	(206) 5783959	amurdy0@aol.com	Suite 93
2	Guido	Boak	(515) 4581202	gboak1@de.vu	Room 940
3	Agna	Mackinder	(431) 2626730	amackinder2@microsoft.com	Room 928
4	Brandy	Plaster	(103) 3859870	bplaster3@t.co	2nd Floor
5	Ellswerth	Abramamovh	(344) 5748955	eabramamovh4@economist.com	Apt 889
6	Cori	Pieter	(269) 8424374	cpieter5@spotify.com	Room 1040
7	Edouard	Hane	(300) 9763485	ehane6@google.cn	Suite 26
8	Sharona	Mabb	(344) 9974264	smabb7@godaddy.com	PO Box 49405
9	Sadie	Betteriss	(620) 6852505	sbetteriss8@symantec.com	19th Floor
10	Charlotta	Brock	(889) 2050492	cbrock9@fastcompany.com	PO Box 6018
11	Lauretta	Ivan	(710) 9342421	livana@flickr.com	Room 1855
12	Gibby	Goves	(503) 9349867	ggovesb@imageshack.us	Suite 30
13	Allsun	Jobe	(916) 1238004	ajobec@home.pl	PO Box 63311
14	Astrix	Bains	(754) 6976537	abainsd@ted.com	18th Floor
15	Abagail	Stace	(867) 7276674	astacee@eventbrite.com	Suite 6
16	Jan	Souley	(759) 1690851	jsouleyf@canalblog.com	3rd Floor
17	Adara	Siddon	(775) 8891723	asiddong@telegraph.co.uk	Room 98
18	Shelli	Ragbourne	(902) 5570139	sragbourneh@google.ru	16th Floor
19	Ryun	Rude	(587) 8935336	rrudei@sina.com.cn	Apt 1800
20	Elka	Theobold	(998) 8936250	etheoboldj@youtu.be	Room 452
21	Malina	Adriaan	(459) 5868366	madriaank@theguardian.com	PO Box 82512
22	Janeen	Espley	(504) 9421489	jespleyl@gnu.org	Suite 90
23	Cull	Carslake	(455) 5753436	ccarslakem@aboutads.info	Suite 63
24	Gay	Akast	(340) 6626334	gakastn@google.ca	Apt 1513
25	Cordi	Rampage	(937) 5174346	crampageo@netlog.com	17th Floor
26	Rivy	Sheahan	(488) 1509429	rsheahanp@t-online.de	PO Box 92795
27	Holli	Saiz	(938) 3487240	hsaizq@mtv.com	PO Box 47443
28	Shirley	Plumbe	(164) 5622376	splumber@shutterfly.com	Apt 989
29	Zsa zsa	Ridsdale	(512) 1667749	zridsdales@oracle.com	Apt 507
30	Abby	McCahill	(884) 1724953	amccahillt@adobe.com	PO Box 24519
31	Esme	Dodgshun	(829) 1872431	edodgshunu@prlog.org	Apt 1920
32	Dedra	Hardware	(282) 6349761	dhardwarev@devhub.com	Suite 40
33	Eula	Leadley	(998) 3248617	eleadleyw@slashdot.org	Suite 48
34	Brandais	Pesic	(538) 1165572	bpesicx@ibm.com	6th Floor
35	Imojean	Acors	(325) 6138200	iacorsy@so-net.ne.jp	Suite 9
36	Lewiss	Delgua	(825) 8360156	ldelguaz@angelfire.com	PO Box 99749
37	Darda	Crunkhorn	(102) 4642253	dcrunkhorn10@pagesperso-orange.fr	Apt 221
38	Jacquette	Ost	(825) 3186950	jost11@hhs.gov	Apt 599
39	Jessee	Derges	(493) 8759221	jderges12@nyu.edu	Apt 130
40	Marlo	Mulryan	(192) 8737621	mmulryan13@psu.edu	Room 1509
41	Maitilde	Shuttle	(243) 8090871	mshuttle14@va.gov	Suite 88
42	Catha	Borg-Bartolo	(769) 6467051	cborgbartolo15@dailymail.co.uk	Apt 286
43	Janis	Ashbridge	(174) 4382956	jashbridge16@jalbum.net	3rd Floor
44	Lyndsie	Dumberell	(768) 4062899	ldumberell17@aboutads.info	11th Floor
45	Danny	McConigal	(433) 8172281	dmcconigal18@tiny.cc	Apt 848
46	Valentine	Esposita	(601) 5872388	vesposita19@facebook.com	Apt 1822
47	Carla	Ruf	(852) 5745362	cruf1a@mail.ru	18th Floor
48	Antin	Obern	(991) 8583543	aobern1b@joomla.org	Room 576
49	Vannie	Hlavac	(607) 6510780	vhlavac1c@ebay.com	Room 1599
50	Jaymee	Buckberry	(295) 3204860	jbuckberry1d@feedburner.com	Suite 68
51	Tybie	Dyas	(952) 5230147	tdyas1e@comsenz.com	PO Box 95820
52	Bruno	Northedge	(258) 5707796	bnorthedge1f@miibeian.gov.cn	Apt 1103
53	Arlan	Jaffrey	(186) 2262893	ajaffrey1g@ucsd.edu	Room 1063
54	Raynor	Hartness	(817) 6108120	rhartness1h@mashable.com	PO Box 14840
55	Kermit	Donegan	(476) 7323412	kdonegan1i@dailymail.co.uk	Suite 5
56	Josefa	Whewell	(959) 2437797	jwhewell1j@e-recht24.de	PO Box 4143
57	Luise	Downgate	(662) 6623022	ldowngate1k@purevolume.com	Room 1797
58	Luce	Tatlowe	(446) 1668571	ltatlowe1l@upenn.edu	Apt 1719
59	Etienne	Smales	(648) 6868647	esmales1m@businessinsider.com	Apt 712
60	Balduin	Craighill	(379) 4373454	bcraighill1n@amazon.co.jp	PO Box 65016
61	Daune	Mettricke	(983) 3573370	dmettricke1o@vkontakte.ru	PO Box 33447
62	Darryl	Serot	(981) 4531114	dserot1p@wsj.com	3rd Floor
63	Marlow	Endrici	(600) 5743591	mendrici1q@epa.gov	Room 610
64	Ronalda	Edgson	(809) 9741853	redgson1r@opensource.org	Apt 316
65	Cahra	Drever	(813) 1846911	cdrever1s@salon.com	Suite 82
66	Roby	Peplaw	(628) 8877617	rpeplaw1t@nifty.com	Suite 32
67	Constantin	Geffen	(589) 7499136	cgeffen1u@wikimedia.org	Suite 5
68	Joelle	Sharply	(729) 4920013	jsharply1v@nymag.com	3rd Floor
69	Truda	Boal	(939) 9327717	tboal1w@list-manage.com	Room 728
70	Georgeanna	Carillo	(533) 6071391	gcarillo1x@mapy.cz	Apt 836
71	Guendolen	Bayles	(794) 3351315	gbayles1y@msu.edu	18th Floor
72	Jaquelin	Strapp	(443) 1910343	jstrapp1z@w3.org	Room 1505
73	Web	Pidler	(892) 9541282	wpidler20@is.gd	Room 1384
74	Amabel	O'Cahey	(831) 1615516	aocahey21@youtu.be	Apt 1090
75	Yetty	Isakovic	(390) 3960454	yisakovic22@addthis.com	Suite 59
76	Wat	Poulney	(230) 9811629	wpoulney23@unicef.org	PO Box 34635
77	Laurens	Van den Broek	(830) 7595998	lvandenbroek24@skype.com	15th Floor
78	Shel	MacEveley	(290) 1151311	smaceveley25@state.tx.us	Suite 38
79	Brooke	Foulser	(189) 3112655	bfoulser26@wikispaces.com	Suite 89
80	Cad	Brackley	(859) 8418632	cbrackley27@tinyurl.com	6th Floor
81	Gui	Mott	(998) 6136289	gmott28@privacy.gov.au	10th Floor
82	Heddie	Shelmerdine	(491) 9832250	hshelmerdine29@economist.com	12th Floor
83	Gregor	MacKessock	(339) 5079200	gmackessock2a@amazon.co.uk	Room 684
84	Rudolph	Whitwell	(502) 4487713	rwhitwell2b@meetup.com	Room 658
85	Ramsey	Simms	(643) 7247303	rsimms2c@engadget.com	Apt 341
86	Marcello	Cookman	(970) 1601593	mcookman2d@merriam-webster.com	Room 1186
87	Daven	Emes	(435) 2017660	demes2e@parallels.com	12th Floor
88	Minor	Bulluck	(332) 1232522	mbulluck2f@hostgator.com	Suite 56
89	Emmy	MacIlwrick	(930) 1813304	emacilwrick2g@google.com.au	Room 1866
90	Gaynor	Teasdale-Markie	(836) 9586080	gteasdalemarkie2h@ucsd.edu	13th Floor
91	Kirstin	Magnay	(188) 6028619	kmagnay2i@newyorker.com	Suite 3
92	Gino	Bradden	(440) 4980580	gbradden2j@webnode.com	Room 1475
93	Francklyn	Tohill	(602) 8431314	ftohill2k@usda.gov	14th Floor
94	Leigha	Roux	(827) 6242559	lroux2l@homestead.com	Apt 1633
95	Eimile	Bendle	(535) 6609885	ebendle2m@bloglovin.com	12th Floor
96	Malchy	Elwyn	(692) 4958096	melwyn2n@berkeley.edu	Apt 1790
97	Nikolas	Norquoy	(594) 1512455	nnorquoy2o@123-reg.co.uk	PO Box 88488
98	Emylee	Ivett	(637) 5188636	eivett2p@booking.com	Apt 717
99	Nola	Gooden	(984) 2567843	ngooden2q@state.tx.us	Suite 84
100	Jillian	Toleman	(491) 8022545	jtoleman2r@ihg.com	Apt 320
\.


--
-- Data for Name: pembelian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pembelian (id_pembelian, id_supplier, id_pegawai, tgl_beli, tgl_datang) FROM stdin;
101	2	101	2022-12-19	2025-06-11
102	1	102	2024-01-03	2023-06-02
103	7	103	2025-09-28	2025-03-02
104	8	104	2023-08-18	2025-03-24
105	1	105	2023-08-21	2024-08-09
106	10	106	2024-09-21	2023-01-12
107	9	107	2024-01-06	2024-09-14
108	4	108	2024-07-25	2024-09-06
109	5	109	2025-06-30	2024-02-17
110	6	110	2025-05-07	2023-10-13
111	6	111	2025-04-11	2023-01-09
112	6	112	2023-12-01	2023-01-21
113	4	113	2024-03-07	2024-12-12
114	1	114	2023-04-19	2023-11-12
115	10	115	2025-07-12	2024-11-03
116	2	116	2023-05-12	2023-05-17
117	10	117	2024-11-16	2023-09-07
118	2	118	2025-03-11	2023-01-06
119	3	119	2023-10-05	2025-08-22
120	1	120	2024-11-02	2023-10-08
121	8	121	2024-05-20	2025-03-05
122	5	122	2024-03-07	2024-11-04
123	8	123	2023-10-30	2023-11-20
124	1	124	2024-12-10	2025-08-20
125	2	125	2024-03-17	2025-01-23
126	4	126	2023-07-25	2025-01-23
127	10	127	2023-06-01	2024-05-30
128	1	128	2024-07-21	2023-05-18
129	5	129	2024-03-16	2023-04-19
130	8	130	2025-05-12	2023-03-02
131	8	131	2022-12-10	2025-06-21
132	9	132	2023-12-09	2024-05-10
133	2	133	2024-01-14	2024-11-01
134	8	134	2022-12-17	2024-12-04
135	6	135	2024-11-16	2025-08-12
136	9	136	2024-09-02	2024-04-26
137	8	137	2025-06-26	2022-12-31
138	1	138	2024-05-30	2024-02-02
139	10	139	2023-03-10	2024-01-17
140	4	140	2024-12-23	2022-12-28
141	7	141	2023-12-21	2023-02-02
142	4	142	2025-01-29	2024-07-19
143	1	143	2023-05-14	2024-04-27
144	9	144	2023-04-14	2025-02-21
145	7	145	2024-05-07	2024-03-12
146	8	146	2025-05-05	2025-07-19
147	2	147	2024-06-29	2024-12-23
148	2	148	2025-04-23	2025-05-28
149	9	149	2025-08-02	2024-02-01
150	4	150	2024-10-03	2025-10-13
151	9	151	2025-01-01	2023-08-11
152	5	152	2024-07-18	2023-03-15
153	7	153	2024-05-01	2024-02-19
154	1	154	2024-04-19	2024-04-26
155	10	155	2023-11-07	2023-02-14
156	3	156	2023-03-18	2023-08-16
157	2	157	2023-02-21	2023-07-25
158	3	158	2023-10-17	2025-06-22
159	1	159	2023-12-26	2023-02-20
160	5	160	2025-01-23	2024-10-21
161	9	161	2024-10-27	2023-11-06
162	5	162	2024-08-29	2024-07-27
163	1	163	2023-03-01	2025-02-28
164	1	164	2025-08-15	2023-05-05
165	8	165	2023-07-16	2023-12-29
166	8	166	2025-09-23	2023-11-01
167	7	167	2025-04-06	2024-08-21
168	10	168	2023-10-06	2023-12-16
169	1	169	2025-05-22	2023-06-05
170	5	170	2024-11-17	2023-12-21
171	5	171	2025-01-24	2023-08-03
172	5	172	2023-06-26	2025-08-28
173	7	173	2025-09-30	2022-12-07
174	6	174	2025-06-22	2025-03-31
175	3	175	2023-04-11	2025-04-02
176	1	176	2025-07-01	2024-02-27
177	8	177	2024-01-02	2024-09-16
178	4	178	2023-03-09	2025-04-11
179	5	179	2023-06-23	2024-12-18
180	10	180	2024-03-26	2024-08-11
181	2	181	2023-06-25	2025-02-28
182	6	182	2025-06-01	2023-01-10
183	4	183	2024-12-27	2025-08-28
184	9	184	2023-03-25	2023-05-31
185	3	185	2023-01-25	2025-09-26
186	4	186	2024-12-07	2023-10-19
187	1	187	2025-01-07	2023-07-26
188	1	188	2022-12-29	2023-04-08
189	4	189	2023-09-24	2024-03-14
190	9	190	2025-05-30	2024-10-05
191	9	191	2025-03-12	2025-10-02
192	2	192	2023-01-13	2024-07-02
193	7	193	2025-04-02	2024-02-19
194	10	194	2023-12-24	2024-01-19
195	4	195	2025-05-23	2023-08-24
196	6	196	2023-08-30	2022-12-22
197	7	197	2025-08-30	2023-02-27
198	10	198	2023-05-24	2025-01-28
199	5	199	2024-02-28	2024-07-11
200	1	200	2024-03-12	2024-12-03
\.


--
-- Data for Name: penjualan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.penjualan (id_penjualan, tgl_jual, id_pelanggan, id_pegawai, tgl_pengambilan, status_konfirmasi) FROM stdin;
403	2023-03-02	101	101	2025-06-24	diverifikasi
404	2024-02-20	102	102	2025-02-10	diverifikasi
405	2025-05-08	103	103	2025-09-12	belum diverifikasi
406	2023-09-07	104	104	2025-04-18	diverifikasi
407	2023-06-01	105	105	2025-01-03	belum diverifikasi
408	2024-11-16	106	106	2023-01-14	diverifikasi
409	2025-02-27	107	107	2024-05-06	belum diverifikasi
410	2022-12-01	108	108	2025-05-02	belum diverifikasi
411	2024-03-12	109	109	2024-05-18	diverifikasi
412	2023-10-11	110	110	2025-07-14	diverifikasi
413	2025-06-03	111	111	2023-03-13	belum diverifikasi
414	2023-02-05	112	112	2024-06-05	diverifikasi
415	2023-05-26	113	113	2025-10-02	diverifikasi
416	2022-12-28	114	114	2025-05-04	diverifikasi
417	2024-08-01	115	115	2025-06-18	belum diverifikasi
418	2025-03-07	116	116	2023-08-09	diverifikasi
419	2024-03-14	117	117	2023-12-15	diverifikasi
420	2023-02-24	118	118	2024-10-27	diverifikasi
421	2023-08-18	119	119	2023-09-18	belum diverifikasi
422	2023-06-25	120	120	2023-05-07	belum diverifikasi
423	2024-03-01	121	121	2023-03-10	diverifikasi
424	2025-01-13	122	122	2023-01-17	diverifikasi
425	2025-03-03	123	123	2023-09-07	belum diverifikasi
426	2023-11-21	124	124	2024-06-28	diverifikasi
427	2023-06-24	125	125	2025-03-07	belum diverifikasi
428	2023-08-03	126	126	2025-07-01	diverifikasi
429	2024-07-13	127	127	2023-05-02	belum diverifikasi
430	2023-07-27	128	128	2025-08-30	belum diverifikasi
431	2024-05-17	129	129	2025-07-25	diverifikasi
432	2024-05-05	130	130	2023-08-16	diverifikasi
433	2025-08-31	131	131	2023-01-03	diverifikasi
434	2023-05-19	132	132	2023-10-15	diverifikasi
435	2025-04-09	133	133	2024-04-30	belum diverifikasi
436	2024-02-29	134	134	2025-06-24	belum diverifikasi
437	2023-07-24	135	135	2025-06-15	belum diverifikasi
438	2023-04-06	136	136	2025-10-13	diverifikasi
439	2023-01-30	137	137	2025-07-30	belum diverifikasi
440	2023-09-22	138	138	2024-04-15	belum diverifikasi
441	2023-08-26	139	139	2023-11-20	diverifikasi
442	2025-09-14	140	140	2023-02-28	belum diverifikasi
443	2023-08-24	141	141	2025-04-16	diverifikasi
444	2022-12-12	142	142	2025-01-23	belum diverifikasi
445	2025-06-08	143	143	2024-06-04	diverifikasi
446	2024-06-04	144	144	2024-11-16	belum diverifikasi
447	2024-10-25	145	145	2025-10-05	belum diverifikasi
448	2024-03-03	146	146	2023-09-07	diverifikasi
449	2024-10-14	147	147	2023-01-14	belum diverifikasi
450	2023-06-10	148	148	2023-02-25	diverifikasi
451	2025-01-21	149	149	2023-11-07	diverifikasi
452	2023-11-22	150	150	2025-03-14	diverifikasi
453	2024-10-16	151	151	2024-12-16	diverifikasi
454	2024-04-08	152	152	2023-08-10	diverifikasi
455	2025-07-17	153	153	2023-10-21	belum diverifikasi
456	2023-01-03	154	154	2025-08-18	diverifikasi
457	2023-05-08	155	155	2024-01-12	diverifikasi
458	2024-10-12	156	156	2023-10-10	belum diverifikasi
459	2024-10-23	157	157	2024-08-23	belum diverifikasi
460	2024-10-03	158	158	2025-09-05	diverifikasi
461	2023-11-10	159	159	2023-03-13	belum diverifikasi
462	2025-07-18	160	160	2025-05-29	belum diverifikasi
463	2023-01-24	161	161	2023-03-10	belum diverifikasi
464	2023-09-16	162	162	2023-10-09	diverifikasi
465	2023-06-04	163	163	2023-09-01	diverifikasi
466	2025-06-19	164	164	2024-08-13	belum diverifikasi
467	2024-07-05	165	165	2025-08-07	belum diverifikasi
468	2024-12-27	166	166	2023-01-29	diverifikasi
469	2023-03-11	167	167	2023-10-10	diverifikasi
470	2025-05-03	168	168	2024-08-30	diverifikasi
471	2023-05-25	169	169	2024-05-28	diverifikasi
472	2024-01-10	170	170	2024-12-19	belum diverifikasi
473	2024-06-26	171	171	2023-05-14	belum diverifikasi
474	2023-05-26	172	172	2025-04-09	belum diverifikasi
475	2023-09-29	173	173	2025-10-14	diverifikasi
476	2023-01-09	174	174	2024-11-15	belum diverifikasi
477	2024-05-25	175	175	2023-04-16	diverifikasi
478	2024-06-27	176	176	2024-06-01	diverifikasi
479	2024-05-23	177	177	2023-07-18	belum diverifikasi
480	2023-05-10	178	178	2023-04-17	diverifikasi
481	2025-09-19	179	179	2024-09-02	belum diverifikasi
482	2025-03-01	180	180	2024-07-11	diverifikasi
483	2024-02-29	181	181	2022-12-09	belum diverifikasi
484	2024-03-11	182	182	2025-08-21	diverifikasi
485	2023-08-27	183	183	2024-07-04	diverifikasi
486	2024-08-08	184	184	2024-12-10	diverifikasi
487	2024-08-01	185	185	2023-10-18	diverifikasi
488	2025-07-07	186	186	2023-02-11	diverifikasi
489	2025-06-20	187	187	2023-08-18	diverifikasi
490	2024-06-05	188	188	2023-05-30	belum diverifikasi
491	2025-09-01	189	189	2023-04-19	diverifikasi
492	2025-02-14	190	190	2023-05-01	belum diverifikasi
493	2023-01-17	191	191	2025-03-29	belum diverifikasi
494	2023-03-14	192	192	2023-08-03	belum diverifikasi
495	2024-03-16	193	193	2024-06-14	belum diverifikasi
496	2023-05-26	194	194	2024-10-05	diverifikasi
497	2023-08-16	195	195	2024-05-14	belum diverifikasi
498	2023-10-26	196	196	2024-02-26	diverifikasi
499	2023-10-30	197	197	2024-07-22	belum diverifikasi
500	2023-06-26	198	198	2023-02-08	belum diverifikasi
501	2023-08-22	199	199	2023-02-05	diverifikasi
502	2023-02-22	200	200	2025-04-20	diverifikasi
503	2023-03-02	200	200	2025-06-24	diverifikasi
\.


--
-- Data for Name: produk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produk (id_produk, nama_produk, harga_produk, stok_awal) FROM stdin;
1	Kertas Foto Glossy 4R (Isi 100 lbr)	65000.00	150
2	Kertas Foto Doff 4R (Isi 100 lbr)	70000.00	120
3	Kertas Foto Glossy 5R (Isi 50 lbr)	55000.00	80
4	Kertas Foto Doff 5R (Isi 50 lbr)	60000.00	75
5	Kertas Foto Glossy A4 210gsm (Isi 50 lbr)	90000.00	110
6	Kertas Foto Doff A4 230gsm (Isi 50 lbr)	95000.00	90
7	Kertas Foto Silky/Luster A4 (Isi 20 lbr)	110000.00	40
8	Kertas Foto Stiker Glossy A4 (Isi 20 lbr)	45000.00	65
9	Kertas Foto Stiker Doff A4 (Isi 20 lbr)	50000.00	55
10	Kertas Foto Canvas Inkjet A4 (Isi 10 lbr)	130000.00	30
11	Kertas Foto Double Sided Glossy A4 (Isi 50 lbr)	120000.00	45
12	Kertas Foto Kodak Glossy 4R (Isi 100)	85000.00	80
13	Kertas Foto Epson Premium Glossy A4 (Isi 20)	140000.00	35
14	Kertas Foto Inkjet 10R (Isi 20 lbr)	75000.00	50
15	Figora Minimalis Hitam 4R	30000.00	200
16	Figora Minimalis Putih 4R	30000.00	210
17	Figora Minimalis Kayu 4R	35000.00	150
18	Figora Minimalis Hitam 5R	40000.00	180
19	Figora Minimalis Putih 5R	40000.00	190
20	Figora Minimalis Kayu 5R	45000.00	130
21	Figora Minimalis Hitam 6R	45000.00	160
22	Figora Minimalis Putih 6R	45000.00	170
23	Figora Minimalis Kayu 6R	50000.00	110
24	Figora Minimalis Hitam 8R	55000.00	140
25	Figora Minimalis Putih 8R	55000.00	135
26	Figora Minimalis Kayu 8R	60000.00	90
27	Figora Minimalis Hitam 10R	70000.00	150
28	Figora Minimalis Putih 10R	70000.00	145
29	Figora Minimalis Kayu 10R	80000.00	100
30	Figora Minimalis Hitam A4 (10R+)	75000.00	130
31	Figora Minimalis Putih A4 (10R+)	75000.00	125
32	Figora Minimalis Kayu A4 (10R+)	85000.00	95
33	Figora Minimalis Hitam 12R	90000.00	80
34	Figora Minimalis Putih 12R	90000.00	85
35	Figora Minimalis Hitam 16R	130000.00	60
36	Figora Minimalis Putih 16R	130000.00	65
37	Figora Minimalis Kayu 16R	150000.00	40
38	Figora Minimalis Hitam 20R	180000.00	50
39	Figora Minimalis Putih 20R	180000.00	55
40	Figora Ukir Emas 4R	50000.00	70
41	Figora Ukir Silver 4R	50000.00	65
42	Figora Ukir Emas 5R	65000.00	60
43	Figora Ukir Silver 5R	65000.00	55
44	Figora Ukir Emas 10R	110000.00	40
45	Figora Ukir Silver 10R	110000.00	42
46	Figora Ukir Emas 12R	140000.00	30
47	Figora Ukir Silver 12R	140000.00	33
48	Figora Ukir Putih Emas 10R	120000.00	25
49	Figora Ukir Coklat Emas 12R	150000.00	20
50	Figora Akrilik Bening 4R (Meja)	45000.00	80
51	Figora Akrilik Bening 5R (Meja)	55000.00	70
52	Figora Akrilik Bening A4 (Dinding)	80000.00	60
53	Figora Kolase 3 Foto 4R (Hitam)	90000.00	50
54	Figora Kolase 5 Foto 4R (Putih)	120000.00	40
55	Figora Kolase Gantung 10 Foto (Tali Rami)	60000.00	90
56	Figora Kanvas 30x40 cm (Spanram)	70000.00	50
57	Figora Kanvas 40x60 cm (Spanram)	110000.00	40
58	Figora Kanvas 60x90 cm (Spanram)	180000.00	30
59	Figora Meja Metal Silver 4R	55000.00	45
60	Album Foto Magnetic Sedang (Hitam)	80000.00	100
61	Album Foto Magnetic Sedang (Merah Marun)	80000.00	90
62	Album Foto Magnetic Sedang (Biru Dongker)	80000.00	85
63	Album Foto Magnetic Besar (Hitam)	110000.00	80
64	Album Foto Magnetic Besar (Merah Marun)	110000.00	70
65	Album Foto Magnetic Besar (Coklat)	110000.00	65
66	Album Foto Slip-in 4R (Isi 100 foto)	60000.00	120
67	Album Foto Slip-in 4R (Isi 200 foto)	95000.00	100
68	Album Foto Slip-in 5R (Isi 50 foto)	50000.00	70
69	Album Foto Kulit Sintetis (Hitam, Box)	250000.00	30
70	Album Foto Kulit Sintetis (Coklat, Box)	250000.00	28
71	Album Foto Scrapbook Polos (Besar, Kraft)	70000.00	60
72	Album Foto Scrapbook Polos (Kecil, Hitam)	45000.00	75
73	Album Foto Polaroid Mini (Isi 64)	35000.00	90
74	Album Foto Polaroid Mini (Isi 128)	55000.00	80
75	Stiker Sudut Album (1 sheet)	5000.00	300
76	Refill Kertas Album Magnetic (10 lbr)	30000.00	150
77	Tinta Printer Epson 003 (Black)	75000.00	90
78	Tinta Printer Epson 003 (Cyan)	75000.00	85
79	Tinta Printer Epson 003 (Magenta)	75000.00	83
80	Tinta Printer Epson 003 (Yellow)	75000.00	84
81	Tinta Printer Canon GI-790 (Black)	80000.00	70
82	Tinta Printer Canon GI-790 (Cyan)	80000.00	68
83	Tinta Printer Canon GI-790 (Magenta)	80000.00	67
84	Tinta Printer Canon GI-790 (Yellow)	80000.00	69
85	Baterai Kamera NP-FW50 (OEM)	180000.00	40
86	Baterai Kamera LP-E6 (OEM)	220000.00	35
87	Baterai Kamera LP-E17 (OEM)	210000.00	33
88	Memory Card SDXC 64GB V30	150000.00	60
89	Memory Card SDXC 128GB V30	280000.00	50
90	Memory Card MicroSD 64GB (Adapter)	120000.00	45
91	Flashdisk 32GB (OTG)	70000.00	80
92	Flashdisk 64GB (USB 3.0)	110000.00	70
93	Dry Box Kabinet 20L	750000.00	15
94	Silica Gel Elektrik (Reusable)	90000.00	50
95	Tripod Mini Fleksibel (GorillaPod)	80000.00	40
96	Cleaning Kit Kamera (Blower, Lenspen, Kain)	50000.00	100
97	Laminating Film A4 (Isi 100)	85000.00	60
98	Laminating Film F4 (Isi 100)	95000.00	50
99	Mug Polos (Siap Cetak)	20000.00	150
100	Mug Hias	30000.00	150
\.


--
-- Data for Name: properti; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.properti (id_properti, nama_properti, jumlah_properti) FROM stdin;
1	Kamera Canon	15
2	Kamera Nikon	23
3	Kamera Sony	12
4	Tripod Aluminium	7
5	Tripod Karbon	18
6	Backdrop Kayu	9
7	Backdrop Putih	14
8	Backdrop Hitam	11
9	Lighting Softbox	22
10	Lampu LED	25
11	Kursi Antik	17
12	Kursi Modern	8
13	Sofa Elegan	10
14	Meja Vintage	12
15	Meja Kaca	13
16	Cermin Besar	6
17	Cermin Kecil	19
18	Tanaman Hias	20
19	Vas Bunga	5
20	Karpet Merah	27
21	Karpet Abu	14
22	Latar Kain	8
23	Latar Bata	16
24	Speaker Mini	21
25	Speaker Besar	9
26	Mic Wireless	15
27	Mic Kabel	18
28	Panggung Mini	7
29	Dekorasi Balon	13
30	Dekorasi Bunga	22
31	Gorden Putih	19
32	Gorden Hitam	17
33	Gitar Akustik	8
34	Drum Set	10
35	Piano Elektrik	14
36	TV Monitor	12
37	Proyektor	6
38	Kipas Angin	25
39	AC Portable	11
40	Lampu Sorot	18
41	Tangga Lipat	9
42	Rak Buku	15
43	Rak Baju	20
44	Jam Dinding	13
45	Frame Foto	22
46	Patung Kecil	7
47	Boneka Beruang	5
48	Bantal Dekorasi	28
49	Selimut Polos	17
50	Tirai Transparan	14
51	Latar Kayu	10
52	Latar Batu	9
53	Background Motif	18
54	Set Kursi Rotan	12
55	Set Meja Cafe	21
56	Set Sofa Studio	8
57	Backdrop Vintage	19
58	Backdrop Minimalis	15
59	Backdrop Polos	16
60	Backdrop Motif	13
61	Kamera GoPro	6
62	Lensa Tele	11
63	Lensa Wide	8
64	Stabilizer Kamera	17
65	Drone DJI	10
66	Lighting Ring	23
67	Softbox Besar	9
68	Softbox Kecil	13
69	Payung Studio	11
70	Reflector	15
71	Tripod Kamera	14
72	Tripod Ring Light	8
73	Tripod Mini	10
74	Microphone Stand	7
75	Stand Lampu	19
76	Kabel Ekstensi	20
77	Kabel HDMI	16
78	Kabel Audio	14
79	Adaptor Daya	9
80	Baterai Cadangan	11
81	Tas Kamera	15
82	Tas Studio	13
83	Box Penyimpanan	10
84	Rak Sepatu	6
85	Rak Dekorasi	17
86	Dekorasi Natal	18
87	Dekorasi Tahun Baru	19
88	Dekorasi Ulang Tahun	15
89	Dekorasi Pernikahan	20
90	Dekorasi Lamaran	13
91	Banner Lipat	14
92	Spanduk	11
93	Poster Frame	16
94	Display Produk	17
95	Lampu Gantung	18
96	Frame Besar	10
97	Frame Kecil	9
98	Backdrop Custom	12
99	Backdrop Logo	11
100	Backdrop Event	13
\.


--
-- Data for Name: studio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.studio (id_studio, nama_studio, keterangan_studio) FROM stdin;
1	Studio Aesthetic	Khusus untuk foto keluarga dengan tema minimalis dan pencahayaan natural
2	Studio Vintage	Tema klasik dengan dekorasi retro dan warna hangat
3	Studio Modern	Desain futuristik dengan latar belakang LED dinamis
4	Studio Outdoor	Pemotretan di area taman dan ruang terbuka hijau
5	Studio Elegant	Cocok untuk foto prewedding dengan gaya elegan dan mewah
6	Studio Kids	Didesain khusus untuk anak-anak dengan properti lucu dan warna cerah
7	Studio Portrait	Fokus pada close-up wajah dan ekspresi individu
8	Studio Product	Dikhususkan untuk pemotretan produk dengan pencahayaan softbox
9	Studio Graduation	Latar khusus untuk foto wisuda dan seragam akademik
10	Studio Black & White	Konsep monokrom dengan efek cahaya dramatis dan artistic
\.


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (id_supplier, nama_supplier, no_telp_supplier, alamat_supplier) FROM stdin;
1	PT Fokus Optima Lensa	(021) 7831085	Jl. Kemang Raya No. 45, Jakarta Selatan
2	PT Cahaya Visualindo	(031) 3228726	Jl. Diponegoro No. 18, Surabaya
3	CV Kreatif Warna Nusantara	(022) 2609462	Jl. Braga No. 56, Bandung
4	PT Sigma Foto Digital	(061) 6314359	Jl. Iskandar Muda No. 12, Medan
5	PT Tripod Media Supply	(024) 4270667	Jl. Imam Bonjol No. 33, Semarang
6	CV Flashpoint Jaya	(0411) 5263022	Jl. Veteran No. 9, Makassar
7	PT StudioPro Indonesia	(0361) 2059178	Jl. Dewi Sartika No. 72, Denpasar
8	PT Frame Artindo	(0711) 9245766	Jl. Rajawali No. 21, Palembang
9	CV Digital Print House	(0751) 9616798	Jl. Sudirman No. 77, Padang
10	PT Lensa Karya Abadi	(0561) 4410009	Jl. Ahmad Yani No. 102, Pontianak
\.


--
-- Name: jabatan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jabatan_id_seq', 10, true);


--
-- Name: paket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paket_id_seq', 10, true);


--
-- Name: pegawai_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pegawai_id_seq', 200, true);


--
-- Name: pelanggan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pelanggan_id_seq', 100, true);


--
-- Name: pembelian_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pembelian_id_seq', 200, true);


--
-- Name: penjualan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.penjualan_id_seq', 503, true);


--
-- Name: produk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produk_id_seq', 100, true);


--
-- Name: properti_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.properti_id_seq', 100, true);


--
-- Name: studio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.studio_id_seq', 10, true);


--
-- Name: supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_id_seq', 10, true);


--
-- Name: det_penjualan det_penjualan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.det_penjualan
    ADD CONSTRAINT det_penjualan_pkey PRIMARY KEY (id_penjualan, id_produk);


--
-- Name: detail_beli detail_beli_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_beli
    ADD CONSTRAINT detail_beli_pkey PRIMARY KEY (id_produk, id_pembelian);


--
-- Name: detail_paket detail_paket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_paket
    ADD CONSTRAINT detail_paket_pkey PRIMARY KEY (id_paket, id_penjualan);


--
-- Name: foto foto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foto
    ADD CONSTRAINT foto_pkey PRIMARY KEY (id_penjualan, nama_file);


--
-- Name: jabatan jabatan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jabatan
    ADD CONSTRAINT jabatan_pkey PRIMARY KEY (id);


--
-- Name: paket paket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paket
    ADD CONSTRAINT paket_pkey PRIMARY KEY (id_paket);


--
-- Name: paket_properti paket_properti_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paket_properti
    ADD CONSTRAINT paket_properti_pkey PRIMARY KEY (id_paket, id_properti);


--
-- Name: pegawai pegawai_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pegawai
    ADD CONSTRAINT pegawai_pkey PRIMARY KEY (id_pegawai);


--
-- Name: pelanggan pelanggan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pelanggan
    ADD CONSTRAINT pelanggan_pkey PRIMARY KEY (id_pelanggan);


--
-- Name: pembelian pembelian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pembelian
    ADD CONSTRAINT pembelian_pkey PRIMARY KEY (id_pembelian);


--
-- Name: penjualan penjualan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penjualan
    ADD CONSTRAINT penjualan_pkey PRIMARY KEY (id_penjualan);


--
-- Name: produk produk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produk
    ADD CONSTRAINT produk_pkey PRIMARY KEY (id_produk);


--
-- Name: properti properti_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properti
    ADD CONSTRAINT properti_pkey PRIMARY KEY (id_properti);


--
-- Name: studio studio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studio
    ADD CONSTRAINT studio_pkey PRIMARY KEY (id_studio);


--
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id_supplier);


--
-- Name: det_penjualan det_penjualan_id_penjualan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.det_penjualan
    ADD CONSTRAINT det_penjualan_id_penjualan_fkey FOREIGN KEY (id_penjualan) REFERENCES public.penjualan(id_penjualan);


--
-- Name: detail_beli detail_beli_id_pembelian_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_beli
    ADD CONSTRAINT detail_beli_id_pembelian_fkey FOREIGN KEY (id_pembelian) REFERENCES public.pembelian(id_pembelian);


--
-- Name: detail_beli detail_beli_id_produk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_beli
    ADD CONSTRAINT detail_beli_id_produk_fkey FOREIGN KEY (id_produk) REFERENCES public.produk(id_produk);


--
-- Name: detail_paket detail_paket_id_paket_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_paket
    ADD CONSTRAINT detail_paket_id_paket_fkey FOREIGN KEY (id_paket) REFERENCES public.paket(id_paket);


--
-- Name: foto foto_id_penjualan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foto
    ADD CONSTRAINT foto_id_penjualan_fkey FOREIGN KEY (id_penjualan) REFERENCES public.penjualan(id_penjualan);


--
-- Name: paket paket_id_studio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paket
    ADD CONSTRAINT paket_id_studio_fkey FOREIGN KEY (id_studio) REFERENCES public.studio(id_studio);


--
-- Name: paket_properti paket_properti_id_paket_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paket_properti
    ADD CONSTRAINT paket_properti_id_paket_fkey FOREIGN KEY (id_paket) REFERENCES public.paket(id_paket);


--
-- Name: paket_properti paket_properti_id_properti_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paket_properti
    ADD CONSTRAINT paket_properti_id_properti_fkey FOREIGN KEY (id_properti) REFERENCES public.properti(id_properti);


--
-- Name: pegawai pegawai_id_jabatan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pegawai
    ADD CONSTRAINT pegawai_id_jabatan_fkey FOREIGN KEY (id_jabatan) REFERENCES public.jabatan(id);


--
-- Name: pembelian pembelian_id_pegawai_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pembelian
    ADD CONSTRAINT pembelian_id_pegawai_fkey FOREIGN KEY (id_pegawai) REFERENCES public.pegawai(id_pegawai);


--
-- Name: pembelian pembelian_id_supplier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pembelian
    ADD CONSTRAINT pembelian_id_supplier_fkey FOREIGN KEY (id_supplier) REFERENCES public.supplier(id_supplier);


--
-- Name: penjualan penjualan_id_pegawai_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penjualan
    ADD CONSTRAINT penjualan_id_pegawai_fkey FOREIGN KEY (id_pegawai) REFERENCES public.pegawai(id_pegawai);


--
-- PostgreSQL database dump complete
--

\unrestrict k8eSrMxneQBLq6TxOjlUazul1KEmNqbKp7tqGeZFiYkwH1e4qSiE0hG62yBCS96

