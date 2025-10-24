CREATE TABLE paket_properti (
    id_paket INT REFERENCES paket(id_paket),
    id_properti INT REFERENCES properti(id_properti),
    PRIMARY KEY (id_paket, id_properti)
);
