DROP TRIGGER IF EXISTS math;
DELIMITER &&
CREATE TRIGGER math AFTER INSERT ON hitung_math
FOR EACH ROW
BEGIN
	DECLARE hasil double;
	DECLARE a, b double;
	DECLARE operasi VARCHAR(10);
	SET operasi = NEW.operator;
	SET a = NEW.nilai1;
	SET b = NEW.nilai2;
	
	CASE
		WHEN (operasi = "TAMBAH") THEN
			SET hasil = a + b;
		WHEN (operasi = "KALI") THEN
			SET hasil = a * b;
		WHEN (operasi = "BAGI") THEN
			SET hasil = a / b;
		ELSE SET hasil = a - b;
	END CASE;
	
	INSERT INTO hasil_hitung_math VALUES(NULL, a, b, operasi, hasil);
END;
&&
DELIMITER;