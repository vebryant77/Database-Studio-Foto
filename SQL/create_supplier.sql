CREATE SEQUENCE IF NOT EXISTS public.supplier_id_seq
    INCREMENT BY 1
    MINVALUE 1
    START 1
    CACHE 1
    NO CYCLE;

CREATE TABLE supplier (
    id_supplier INT DEFAULT nextval('supplier_id_seq') PRIMARY KEY,
    sup_code VARCHAR(10) GENERATED ALWAYS AS ('SUP' || LPAD(id_supplier::TEXT, 3, '0')) STORED,
    nama_supplier VARCHAR(100),
    no_telp_supplier VARCHAR(20),
    alamat_supplier TEXT
);

