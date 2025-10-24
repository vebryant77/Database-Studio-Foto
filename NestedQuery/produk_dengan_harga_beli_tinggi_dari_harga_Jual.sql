SELECT p.id_produk, p.nama_produk, p.harga_produk
FROM produk p
WHERE EXISTS (
    SELECT 1
    FROM detail_beli db
    WHERE db.id_produk = p.id_produk
      AND db.harga_beli > p.harga_produk
);
