CREATE SEQUENCE IF NOT EXISTS public.pelanggan_id_seq
    INCREMENT BY 1
    MINVALUE 1
    START 1
    CACHE 1
    NO CYCLE;

CREATE TABLE pelanggan (
    id_pelanggan INT DEFAULT nextval('pelanggan_id_seq') PRIMARY KEY,
    plg_code VARCHAR(10) GENERATED ALWAYS AS ('PLG' || LPAD(id_pelanggan::TEXT, 3, '0')) STORED,
    nama_depan_pel VARCHAR(50),
    nama_belakang_pel VARCHAR(50),
    no_telp_pelanggan VARCHAR(20),
    email_pelanggan VARCHAR(100),
    alamat_pelanggan TEXT
);
