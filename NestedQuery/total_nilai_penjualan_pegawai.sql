SELECT
    pg.id_pegawai,
    pg.nama_depan_peg || ' ' || pg.nama_belakang_peg AS nama_pegawai,
    COALESCE((SELECT SUM(dp.jumlah * pr.harga_produk)
              FROM det_penjualan dp
              JOIN produk pr ON dp.id_produk = pr.id_produk
              JOIN penjualan pj ON dp.id_penjualan = pj.id_penjualan
              WHERE pj.id_pegawai = pg.id_pegawai), 0) AS total_nilai_penjualan
FROM
    pegawai pg
ORDER BY total_nilai_penjualan DESC;
