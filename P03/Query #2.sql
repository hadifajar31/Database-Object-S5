DROP TRIGGER IF EXISTS updatestock
DELIMITER $$
CREATE TRIGGER updatestock
AFTER INSERT ON pembelian
FOR EACH ROW
BEGIN
UPDATE barang
SET stock = stock + NEW.jml_pembelian
WHERE kd_barang = NEW.kd_barang;
END;
$$
DELIMITER;