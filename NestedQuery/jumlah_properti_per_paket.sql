SELECT
    pk.id_paket,
    pk.nama_paket,
    (SELECT COUNT(*)
     FROM paket_properti pp
     WHERE pp.id_paket = pk.id_paket) AS jumlah_properti
FROM
    paket pk
ORDER BY jumlah_properti DESC;
