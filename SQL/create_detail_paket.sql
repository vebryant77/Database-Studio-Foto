CREATE TABLE detail_paket (
    id_paket INT REFERENCES paket(id_paket),
    id_penjualan INT,
    PRIMARY KEY (id_paket, id_penjualan)
);