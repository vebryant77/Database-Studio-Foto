SELECT id_penjualan, tgl_jual
FROM penjualan p
WHERE (SELECT SUM(jumlah) FROM det_penjualan dp WHERE dp.id_penjualan = p.id_penjualan) >
      (SELECT AVG(total_jumlah)
       FROM (SELECT SUM(jumlah) AS total_jumlah FROM det_penjualan GROUP BY id_penjualan) AS rata_item);
