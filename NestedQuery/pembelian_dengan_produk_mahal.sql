SELECT p.id_penjualan, p.id_pelanggan, p.tgl_jual
FROM penjualan p
WHERE p.tgl_jual = (
    SELECT MAX(p2.tgl_jual)
    FROM penjualan p2
    WHERE p2.id_pelanggan = p.id_pelanggan
);
