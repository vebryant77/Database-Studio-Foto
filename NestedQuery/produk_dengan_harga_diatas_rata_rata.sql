SELECT p.nama_produk, p.harga_produk
FROM produk p
WHERE p.id_produk IN (SELECT DISTINCT dp.id_produk FROM det_penjualan dp) -- Pastikan produk pernah dijual
  AND p.harga_produk > (
    -- Subquery: Hitung rata-rata harga produk HANYA untuk yg pernah dijual
    SELECT AVG(pr.harga_produk)
    FROM produk pr
    WHERE pr.id_produk IN (SELECT DISTINCT dp.id_produk FROM det_penjualan dp)
);
