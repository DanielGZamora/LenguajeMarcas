CREATE DATABASE IF NOT EXISTS prueba;

USE prueba;

-- EJ1
DELIMITER $$
DROP PROCEDURE IF EXISTS GenerarNIF $$
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
DROP PROCEDURE IF EXISTS ComprovarVentajas $$
CREATE PROCEDURE ComprovarVentajas(
	IN nomina VARCHAR(50),
	IN edad varchar(100),
	IN profesión varchar(50),
	OUT respuesta VARCHAR(10)
)
BEGIN
	IF (nomina > 1000 OR edad < 18 OR edad > 65 OR profesión = 'profesor') THEN
		SET respuesta = 'SI';
	ELSE
		SET respuesta = 'NO';
	END IF;
END $$
DELIMITER ;

CALL ComprovarVentajas("1200", "34", "desempleado");

-- EJ3
DELIMITER $$
DROP PROCEDURE IF EXISTS ComprovarPeaje $$
CREATE PROCEDURE ComprovarPeaje(
	IN autopista VARCHAR(50),
	OUT respuesta VARCHAR(10)
)
BEGIN
	CASE autopista
		WHEN 'AP-6' THEN SET respuesta = '14,30';
		WHEN 'AP-46' THEN SET respuesta = '5,6';
		WHEN 'AP-51' THEN SET respuesta = '3';
		WHEN 'AP-6' THEN SET respuesta = '3';
		WHEN 'AP-61' THEN SET respuesta = '5,2';
		WHEN 'AP-53' THEN SET respuesta = '10,35';
		ELSE SET respuesta = '-1';
	END CASE;
END $$
DELIMITER ;

CALL ComprovarPeaje('AP-6',@respuesta);
SELECT @respuesta;
-- EJ4
DELIMITER $$
DROP PROCEDURE IF EXISTS EncuentraNumero $$
CREATE PROCEDURE EncuentraNumero(
	IN numero INT,
	OUT contador INT
)
BEGIN 
	DECLARE random INT;
	SET contador = 0;
	bucle1: WHILE random != numero DO
		SET random = FLOOR(RAND() * 10);
		SET contador = contador + 1;
		IF (random = numero) THEN
			LEAVE bucle1 ;
		END IF;
	END WHILE;
END $$
DELIMITER ;

CALL EncuentraNumero(5,@contador);
SELECT @contador;
-- EJ5
DELIMITER $$
DROP PROCEDURE IF EXISTS SustituyeVocales $$
CREATE PROCEDURE SustituyeVocales(
	IN cadena VARCHAR(50),
	OUT resultado VARCHAR(50)
)
BEGIN
	DECLARE i INT DEFAULT 1;
	DECLARE letra CHAR(1);
	DECLARE longitud INT;

	SET longitud = LENGTH(cadena);
	SET resultado = '';

	WHILE i <= longitud DO
		SET letra = SUBSTR(cadena, i, 1);
		CASE letra
			WHEN 'a' THEN SET resultado = CONCAT(resultado, '1');
			WHEN 'e' THEN SET resultado = CONCAT(resultado, '2');
			WHEN 'i' THEN SET resultado = CONCAT(resultado, '3');
			WHEN 'o' THEN SET resultado = CONCAT(resultado, '4');
			WHEN 'u' THEN SET resultado = CONCAT(resultado, '5');
			ELSE SET resultado = CONCAT(resultado, letra);
		END CASE;
		SET i = i + 1;
	END WHILE;
END $$
DELIMITER ;

CALL SustituyeVocales('hola');
