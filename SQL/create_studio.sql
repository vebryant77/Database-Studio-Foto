CREATE SEQUENCE IF NOT EXISTS public.studio_id_seq
    INCREMENT BY 1
    MINVALUE 1
    START 1
    CACHE 1
    NO CYCLE;

CREATE TABLE studio (
    id_studio INT DEFAULT nextval('studio_id_seq') PRIMARY KEY,
    st_code VARCHAR(10) GENERATED ALWAYS AS ('STD' || LPAD(id_studio::TEXT, 3, '0')) STORED,
    nama_studio VARCHAR(50),
    keterangan_studio TEXT );
