SELECT id_penjualan
FROM penjualan p
WHERE
    EXISTS (SELECT 1 FROM detail_paket pp WHERE pp.id_penjualan = p.id_penjualan)
AND
    EXISTS (SELECT 1 FROM det_penjualan dp WHERE dp.id_penjualan = p.id_penjualan);
