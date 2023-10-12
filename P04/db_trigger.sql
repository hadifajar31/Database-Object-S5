DROP TRIGGER IF EXISTS nilai_akhir;
DELIMITER &&
CREATE TRIGGER nilai_akhir AFTER INSERT ON nilai_mhs
FOR EACH ROW
BEGIN
	DECLARE nilai_tugas, nilai_uts, nilai_uas double;
	DECLARE nilai_total double;
	DECLARE Nilai CHAR(1);
	
	SET nilai_tugas = NEW.Tugas*0.20;
	SET nilai_uts = NEW.Uts*0.30;
	SET nilai_uas = NEW.Uas*0.50;
	SET nilai_total = nilai_tugas + nilai_uts + nilai_uas;

	CASE
		WHEN (nilai_total >= 85) THEN
			SET Nilai = "A"; 
		WHEN (nilai_total >= 75 AND nilai_total < 85) THEN
			SET Nilai = "B"; 
		WHEN (nilai_total >= 75 AND nilai_total < 85) THEN
			SET Nilai = "C"; 
		WHEN (nilai_total >= 75 AND nilai_total < 85) THEN
			SET Nilai = "D"; 
		ELSE SET Nilai = "E";
	END CASE;
	
	INSERT INTO nilai_akhir_mhs VALUES (NULL, nilai_tugas, nilai_uts, nilai_uas, nilai_total, Nilai);
END;
&&
DELEMITER;