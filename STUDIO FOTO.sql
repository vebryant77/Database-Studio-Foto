--
-- PostgreSQL database dump
--

\restrict McXr2n4mBbTXvFlJiHC8AC4BH155Jp2iP3glLw4VCPnzzwLD17VZk3pFvSjM20k

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
\.


--
-- Data for Name: detail_beli; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detail_beli (id_produk, id_pembelian, jumlah_pembelian, harga_beli) FROM stdin;
\.


--
-- Data for Name: detail_paket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detail_paket (id_paket, id_penjualan) FROM stdin;
\.


--
-- Data for Name: foto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.foto (id_penjualan, nama_file) FROM stdin;
\.


--
-- Data for Name: jabatan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jabatan (id, nama_jabatan, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: paket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paket (id_paket, nama_paket, status_paket, harga_paket, keterangan_paket, id_studio) FROM stdin;
\.


--
-- Data for Name: paket_properti; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paket_properti (id_paket, id_properti) FROM stdin;
\.


--
-- Data for Name: pegawai; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pegawai (id_pegawai, nama_depan_peg, nama_belakang_peg, no_telp_pegawai, email_pegawai, alamat_pegawai, id_jabatan) FROM stdin;
\.


--
-- Data for Name: pelanggan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pelanggan (id_pelanggan, nama_depan_pel, nama_belakang_pel, no_telp_pelanggan, email_pelanggan, alamat_pelanggan) FROM stdin;
\.


--
-- Data for Name: pembelian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pembelian (id_pembelian, id_supplier, id_pegawai, tgl_beli, tgl_datang) FROM stdin;
\.


--
-- Data for Name: penjualan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.penjualan (id_penjualan, tgl_jual, id_pelanggan, id_pegawai, tgl_pengambilan, status_konfirmasi) FROM stdin;
\.


--
-- Data for Name: produk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produk (id_produk, nama_produk, harga_produk, stok_awal) FROM stdin;
\.


--
-- Data for Name: properti; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.properti (id_properti, nama_properti, jumlah_properti) FROM stdin;
\.


--
-- Data for Name: studio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.studio (id_studio, nama_studio, keterangan_studio) FROM stdin;
\.


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (id_supplier, nama_supplier, no_telp_supplier, alamat_supplier) FROM stdin;
\.


--
-- Name: jabatan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jabatan_id_seq', 1, false);


--
-- Name: paket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paket_id_seq', 1, false);


--
-- Name: pegawai_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pegawai_id_seq', 1, false);


--
-- Name: pelanggan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pelanggan_id_seq', 1, false);


--
-- Name: pembelian_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pembelian_id_seq', 1, false);


--
-- Name: penjualan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.penjualan_id_seq', 1, false);


--
-- Name: produk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produk_id_seq', 1, false);


--
-- Name: properti_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.properti_id_seq', 1, false);


--
-- Name: studio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.studio_id_seq', 1, false);


--
-- Name: supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_id_seq', 1, false);


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

\unrestrict McXr2n4mBbTXvFlJiHC8AC4BH155Jp2iP3glLw4VCPnzzwLD17VZk3pFvSjM20k

