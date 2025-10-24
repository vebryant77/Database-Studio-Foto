CREATE SEQUENCE IF NOT EXISTS public.produk_id_seq
    INCREMENT BY 1
    MINVALUE 1
    START 1
    CACHE 1
    NO CYCLE;

CREATE TABLE produk (
    id_produk INT DEFAULT nextval('produk_id_seq') PRIMARY KEY,
    prd_code VARCHAR(10) GENERATED ALWAYS AS ('PD' || LPAD(id_produk::TEXT, 3, '0')) STORED,
    nama_produk VARCHAR(100),
    harga_produk NUMERIC(12,2),
    stok_awal INT);
