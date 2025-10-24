CREATE TABLE foto (
    id_penjualan INT REFERENCES penjualan(id_penjualan),
    nama_file VARCHAR(255),
    PRIMARY KEY (id_penjualan, nama_file)
);
