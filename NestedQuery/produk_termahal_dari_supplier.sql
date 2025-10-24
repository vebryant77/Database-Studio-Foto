SELECT
    s.nama_supplier,
    (SELECT pr.nama_produk
     FROM produk pr
     JOIN detail_beli db ON pr.id_produk = db.id_produk
     JOIN pembelian pb ON db.id_pembelian = pb.id_pembelian
     WHERE pb.id_supplier = s.id_supplier
     ORDER BY db.harga_beli DESC
     LIMIT 1) AS produk_termahal_dibeli,
     (SELECT MAX(db.harga_beli)
     FROM detail_beli db
     JOIN pembelian pb ON db.id_pembelian = pb.id_pembelian
     WHERE pb.id_supplier = s.id_supplier) AS harga_termahal
FROM
    supplier s
WHERE EXISTS (SELECT 1 FROM pembelian pb WHERE pb.id_supplier = s.id_supplier);
 -- Hanya supplier yang pernah ada transaksi
