CREATE TABLE detail_beli (
    id_produk INT REFERENCES produk(id_produk),
    id_pembelian INT REFERENCES pembelian(id_pembelian),
    jumlah_pembelian INT,
    harga_beli NUMERIC(12,2),
    PRIMARY KEY (id_produk, id_pembelian)
);
