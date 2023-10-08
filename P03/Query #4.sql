DROP TRIGGER IF EXISTS update_stock_edit;
DELIMITER $$
CREATE TRIGGER update_stick_edit
AFTER UPDATE ON pembelian
FOR EACH ROW
BEGIN
UPDATE barang
SET stock = stock + (NEW.jml_pembelian - OLD.jlm_pembelian)
WHERE kd_barang = NEW.kd_barang;
END;
$$
DELIMITER;