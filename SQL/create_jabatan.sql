CREATE SEQUENCE IF NOT EXISTS public.jabatan_id_seq
    INCREMENT BY 1
    MINVALUE 1
    START 1
    CACHE 1
    NO CYCLE;

CREATE TABLE public.jabatan (
    id INT4 DEFAULT nextval('public.jabatan_id_seq'::regclass) NOT NULL,
    jb_code VARCHAR(10) GENERATED ALWAYS AS (
        ('JB'::text || lpad(id::text, 3, '0'::text))
    ) STORED,
    nama_jabatan VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT jabatan_pkey PRIMARY KEY (id)
);
