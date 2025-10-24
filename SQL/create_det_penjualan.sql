CREATE TABLE det_penjualan (
    id_penjualan INT REFERENCES penjualan(id_penjualan),
    id_produk INT,
    jumlah INT,
    PRIMARY KEY (id_penjualan, id_produk)
);
