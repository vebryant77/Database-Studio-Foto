CREATE SEQUENCE IF NOT EXISTS public.penjualan_id_seq
    INCREMENT BY 1
    MINVALUE 1
    START 1
    CACHE 1
    NO CYCLE;

CREATE TABLE penjualan (
    id_penjualan INT DEFAULT nextval('penjualan_id_seq') PRIMARY KEY,
    pj_code VARCHAR(10) GENERATED ALWAYS AS ('PJL' || LPAD(id_penjualan::TEXT, 3, '0')) STORED,
    tgl_jual DATE,
    id_pelanggan INT,
    id_pegawai INT REFERENCES pegawai(id_pegawai),
    tgl_pengambilan DATE,
    status_konfirmasi VARCHAR(20)
);

