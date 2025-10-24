SELECT p.nama_produk, p.harga_produk
FROM produk p
WHERE p.harga_produk = (
    SELECT MIN(pr.harga_produk)
    FROM produk pr
    WHERE pr.id_produk IN (SELECT DISTINCT db.id_produk FROM detail_beli db) -- Hanya produk yg pernah dibeli
);
