SELECT id_properti, nama_properti
FROM properti
WHERE id_properti NOT IN (SELECT DISTINCT id_properti FROM paket_properti);
