SELECT DISTINCT p.id_paket, p.nama_paket
FROM paket p
JOIN paket_properti pp ON p.id_paket = pp.id_paket
WHERE pp.id_properti = (
    -- Subquery 1: Cari ID properti yang paling sering muncul
    SELECT id_properti
    FROM paket_properti
    GROUP BY id_properti
    ORDER BY COUNT(id_paket) DESC
    LIMIT 1
);
