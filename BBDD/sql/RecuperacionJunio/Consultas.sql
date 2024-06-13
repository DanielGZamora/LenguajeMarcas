CREATE DATABASE IF NOT EXISTS prueba;
USE prueba;

-- EJ 1
DELIMITER $$
DROP PROCEDURE IF EXISTS GenerarNIF;
CREATE PROCEDURE GenerarNIF(IN NumeroDNI VARCHAR(50))
BEGIN
	DECLARE Letras CHAR(23) DEFAULT 'TRWAGMYFPDXBNJZSQVHLCKE';
	DECLARE Letra CHAR(1);
    DECLARE Numero INT;
    
    SET Numero = NumeroDNI;
    SET Letra = SUBSTRING(Letras, Numero % 23 + 1, 1);
    SELECT CONCAT(NumeroDNI, Letra);
END $$
DELIMITER ;

CALL GenerarNIF('23123030');

-- EJ2
DELIMITER $$
DROP PROCEDURE IF EXISTS ComprovarVentajas;
CREATE PROCEDURE ComprovarVentajas(IN nomina VARCHAR(50),IN edad varchar(100),IN profesión varchar(50)OUT respuesta VARCHAR(10))
	IF (nomina > 1000 OR edad < 18 OR edad > 65 OR profesión = 'profesor') THEN
		SET respuesta = 'SI';
	ELSE 
		SET respuesta = 'NO';
	END IF;
END $$
DELIMITER ;

CALL ComprovarVentajas("1000","32","desempleado")