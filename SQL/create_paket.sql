CREATE SEQUENCE IF NOT EXISTS public.paket_id_seq
    INCREMENT BY 1
    MINVALUE 1
    START 1
    CACHE 1
    NO CYCLE;

CREATE TABLE paket (
    id_paket INT DEFAULT nextval('paket_id_seq') PRIMARY KEY,
    pk_code VARCHAR(10) GENERATED ALWAYS AS ('PKT' || LPAD(id_paket::TEXT, 3, '0')) STORED,
    nama_paket VARCHAR(100),
    status_paket VARCHAR(20),
    harga_paket NUMERIC(12,2),
    keterangan_paket TEXT,
    id_studio INT REFERENCES studio(id_studio)
);
