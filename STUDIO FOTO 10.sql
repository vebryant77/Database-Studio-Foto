--
-- PostgreSQL database dump
--

\restrict UNiOYRANNTwrivqmLFsQelUJSguevw5a1Q36pgqa1neKPR8rJLOyf7vzojOnzQU

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
1	1	2
2	2	8
3	3	4
4	4	6
5	5	5
6	6	7
7	7	5
8	8	6
9	9	2
10	10	4
\.


--
-- Data for Name: detail_beli; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detail_beli (id_produk, id_pembelian, jumlah_pembelian, harga_beli) FROM stdin;
1	41	16	443314.56
2	42	16	247187.22
3	43	29	36552.96
4	44	46	467811.40
5	45	5	222190.30
6	46	5	308371.18
7	47	13	210179.25
8	48	44	120475.18
9	49	49	262934.12
10	50	33	361722.24
\.


--
-- Data for Name: detail_paket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detail_paket (id_paket, id_penjualan) FROM stdin;
11	1
12	2
13	3
14	4
15	5
16	6
17	7
18	8
19	9
20	10
\.


--
-- Data for Name: foto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.foto (id_penjualan, nama_file) FROM stdin;
8	foto_6898_2.jpg
4	foto_634_1.jpg
6	foto_9676_1.jpg
3	foto_3384_2.jpg
9	foto_9236_1.jpg
1	foto_9645_2.jpg
10	foto_1099_3.jpg
2	foto_14_1.jpg
5	foto_4989_1.jpg
7	foto_3846_1.jpg
\.


--
-- Data for Name: jabatan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jabatan (id, nama_jabatan, created_at, updated_at) FROM stdin;
1	Pemilik Studio	2025-10-23 17:36:02.809543	2025-10-23 17:36:02.809543
2	Manajer Studio	2025-10-23 17:36:02.809543	2025-10-23 17:36:02.809543
3	Fotografer Senior	2025-10-23 17:36:02.809543	2025-10-23 17:36:02.809543
4	Fotografer Junior	2025-10-23 17:36:02.809543	2025-10-23 17:36:02.809543
5	Asisten Fotografer	2025-10-23 17:36:02.809543	2025-10-23 17:36:02.809543
6	Videografer	2025-10-23 17:36:02.809543	2025-10-23 17:36:02.809543
7	Editor Foto/Retoucher	2025-10-23 17:36:02.809543	2025-10-23 17:36:02.809543
8	Desainer Grafis	2025-10-23 17:36:02.809543	2025-10-23 17:36:02.809543
9	Admin & Customer Service	2025-10-23 17:36:02.809543	2025-10-23 17:36:02.809543
10	Office Boy/Girl	2025-10-23 17:36:02.809543	2025-10-23 17:36:02.809543
\.


--
-- Data for Name: paket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paket (id_paket, nama_paket, status_paket, harga_paket, keterangan_paket, id_studio) FROM stdin;
11	Paket Prewedding Elegan	Aktif	2500000.00	Paket foto prewedding indoor dan outdoor dengan 2 sesi	1
12	Paket Wisuda Ceria	Aktif	750000.00	Foto wisuda individu dengan 5 file digital dan 1 cetak besar	2
13	Paket Keluarga Bahagia	Aktif	1500000.00	Paket foto keluarga hingga 6 orang, dengan dekorasi khusus	3
14	Paket Couple Romantic	Aktif	950000.00	Foto pasangan dengan 2 latar berbeda dan 10 hasil edit	4
15	Paket Produk Premium	Aktif	1250000.00	Foto produk profesional untuk katalog dan e-commerce	5
16	Paket Fashion Glamour	Aktif	1750000.00	Pemotretan fashion indoor dengan lighting profesional	6
17	Paket Bayi Lucu	Aktif	850000.00	Paket khusus foto bayi usia 1–12 bulan dengan properti lucu	7
18	Paket Event Spesial	Aktif	3000000.00	Paket dokumentasi acara seperti ulang tahun dan lamaran	8
19	Paket Wedding Gold	Aktif	4500000.00	Paket foto pernikahan full day dengan 2 fotografer	9
20	Paket Portrait Profesional	Aktif	1000000.00	Foto profil profesional untuk CV dan LinkedIn	10
\.


--
-- Data for Name: paket_properti; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paket_properti (id_paket, id_properti) FROM stdin;
11	1
12	8
13	9
14	1
15	2
16	3
17	4
18	5
19	6
20	7
\.


--
-- Data for Name: pegawai; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pegawai (id_pegawai, nama_depan_peg, nama_belakang_peg, no_telp_pegawai, email_pegawai, alamat_pegawai, id_jabatan) FROM stdin;
1	Janene	Gamlyn	+86 827 196 0078	jgamlyn0@wired.com	Apt 1380	2
2	Fonsie	Gaymar	+62 869 597 9959	fgaymar1@unblog.fr	1st Floor	4
3	Cecil	Lindstedt	+46 479 752 0416	clindstedt2@walmart.com	PO Box 56206	2
4	Kassandra	Haslehurst	+86 325 609 7704	khaslehurst3@ask.com	PO Box 59230	5
5	Iseabal	Francklin	+86 903 279 1436	ifrancklin4@lycos.com	Room 1766	5
6	Roderic	Debell	+55 271 995 8504	rdebell5@fda.gov	Room 1475	4
7	Kathleen	Viveash	+62 842 808 7482	kviveash6@blinklist.com	Apt 566	8
8	Nadean	Watkin	+86 500 257 3151	nwatkin7@hexun.com	Suite 49	4
9	Kyle	Stiff	+1 540 301 4417	kstiff8@tamu.edu	PO Box 27599	9
10	Daniela	Rozenbaum	+86 625 332 3896	drozenbaum9@techcrunch.com	Apt 600	5
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
\.


--
-- Data for Name: pembelian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pembelian (id_pembelian, id_supplier, id_pegawai, tgl_beli, tgl_datang) FROM stdin;
41	2	1	2022-12-19	2025-06-11
42	1	6	2024-01-03	2023-06-02
43	7	5	2025-09-28	2025-03-02
44	8	8	2023-08-18	2025-03-24
45	1	7	2023-08-21	2024-08-09
46	10	5	2024-09-21	2023-01-12
47	9	3	2024-01-06	2024-09-14
48	4	2	2024-07-25	2024-09-06
49	5	9	2025-06-30	2024-02-17
50	6	4	2025-05-07	2023-10-13
\.


--
-- Data for Name: penjualan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.penjualan (id_penjualan, tgl_jual, id_pelanggan, id_pegawai, tgl_pengambilan, status_konfirmasi) FROM stdin;
1	2023-03-02	1	1	2025-06-24	diverifikasi
2	2024-02-20	2	2	2025-02-10	diverifikasi
3	2025-05-08	3	3	2025-09-12	belum diverifikasi
4	2023-09-07	4	4	2025-04-18	diverifikasi
5	2023-06-01	5	5	2025-01-03	belum diverifikasi
6	2024-11-16	6	6	2023-01-14	diverifikasi
7	2025-02-27	7	7	2024-05-06	belum diverifikasi
8	2022-12-01	8	8	2025-05-02	belum diverifikasi
9	2024-03-12	9	9	2024-05-18	diverifikasi
10	2023-10-11	10	10	2025-07-14	diverifikasi
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

SELECT pg_catalog.setval('public.paket_id_seq', 20, true);


--
-- Name: pegawai_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pegawai_id_seq', 10, true);


--
-- Name: pelanggan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pelanggan_id_seq', 10, true);


--
-- Name: pembelian_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pembelian_id_seq', 50, true);


--
-- Name: penjualan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.penjualan_id_seq', 10, true);


--
-- Name: produk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produk_id_seq', 10, true);


--
-- Name: properti_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.properti_id_seq', 10, true);


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
-- Name: detail_paket fk_detailpaket_penjualan; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_paket
    ADD CONSTRAINT fk_detailpaket_penjualan FOREIGN KEY (id_penjualan) REFERENCES public.penjualan(id_penjualan);


--
-- Name: det_penjualan fk_detpenjualan_produk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.det_penjualan
    ADD CONSTRAINT fk_detpenjualan_produk FOREIGN KEY (id_produk) REFERENCES public.produk(id_produk);


--
-- Name: penjualan fk_penjualan_pelanggan; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penjualan
    ADD CONSTRAINT fk_penjualan_pelanggan FOREIGN KEY (id_pelanggan) REFERENCES public.pelanggan(id_pelanggan);


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

\unrestrict UNiOYRANNTwrivqmLFsQelUJSguevw5a1Q36pgqa1neKPR8rJLOyf7vzojOnzQU

