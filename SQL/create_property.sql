CREATE SEQUENCE IF NOT EXISTS public.properti_id_seq
    INCREMENT BY 1
    MINVALUE 1
    START 1
    CACHE 1
    NO CYCLE;

CREATE TABLE properti (
    id_properti INT DEFAULT nextval('properti_id_seq') PRIMARY KEY,
    pr_code VARCHAR(10) GENERATED ALWAYS AS ('PR' || LPAD(id_properti::TEXT, 3, '0')) STORED,
    nama_properti VARCHAR(50),
    jumlah_properti INT
);
