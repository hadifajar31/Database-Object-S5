DROP TRIGGER IF EXISTS delete_penjualan;
DELIMITER $$
CREATE TRIGGER delete_penjualan
AFTER DELETE ON barang
FOR EACH ROW
BEGIN
DELETE FROM pembelian
WHERE kd_barang = OLD.kd_barang;
END;
$$
DELIMITER;