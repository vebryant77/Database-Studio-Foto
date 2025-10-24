CREATE SEQUENCE IF NOT EXISTS public.pegawai_id_seq
    INCREMENT BY 1
    MINVALUE 1
    START 1
    CACHE 1
    NO CYCLE;

CREATE TABLE pegawai (
    id_pegawai INT DEFAULT nextval('pegawai_id_seq') PRIMARY KEY,
    peg_code VARCHAR(10) GENERATED ALWAYS AS ('PEG' || LPAD(id_pegawai::TEXT, 3, '0')) STORED,
    nama_depan_peg VARCHAR(50),
    nama_belakang_peg VARCHAR(50),
    no_telp_pegawai VARCHAR(20),
    email_pegawai VARCHAR(100),
    alamat_pegawai TEXT,
    id_jabatan INT REFERENCES jabatan(id)
);
