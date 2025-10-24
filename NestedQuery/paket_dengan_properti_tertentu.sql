SELECT nama_paket, harga_paket
FROM paket
WHERE id_paket IN (
    SELECT id_paket FROM paket_properti WHERE id_properti = (
        SELECT id_properti FROM properti WHERE nama_properti = 'Kamera Canon'  )
);
