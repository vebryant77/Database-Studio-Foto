SELECT p.nama_produk, p.harga_produk
FROM produk p
WHERE p.harga_produk = (
    SELECT MAX(pr.harga_produk)
    FROM produk pr
    WHERE pr.id_produk IN (SELECT DISTINCT dp.id_produk FROM det_penjualan dp) -- Hanya produk yg pernah dijual
);
