SELECT
    p.id_penjualan,
    p.tgl_jual
FROM
    penjualan p
WHERE
    (SELECT COUNT(f.nama_file)
     FROM foto f
     WHERE f.id_penjualan = p.id_penjualan) > 2;
 -- Ganti angka 2 jika perlu
