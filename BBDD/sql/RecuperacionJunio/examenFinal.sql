-- ej1
SELECT id_usuario, COUNT(id_publicacion) AS cantidadPublicaciones 
FROM publicaciones GROUP BY id_usuario;
-- ej2
SELECT nombre AS usuarioMasSeguido FROM usuarios 
WHERE id_usuario LIKE (SELECT MAX(id_usuario_seguido) FROM seguidores);
-- ej3 
SELECT id_publicacion FROM publicaciones
	WHERE (SELECT id_seguidor  FROM seguidores -- falta algo aqui...
 		WHERE id_usuario_seguido LIKE 
 			(SELECT id_usuario FROM usuarios WHERE email LIKE 'juanperez@correo.com'));
	


-- ej4
SELECT id_usuario, max(fecha_publicacion) FROM publicaciones;

-- ej6
DELIMITER $$
DROP PROCEDURE devuelveContraseña $$
CREATE PROCEDURE devuelveContraseña(IN entrada VARCHAR(50))
BEGIN
	-- SET entrada = SELECT contrasena FROM usuarios WHERE entrada LIKE email;
    -- RETURN entrada;
    SELECT contrasena FROM usuarios WHERE entrada LIKE email;
END $$

DELIMITER ;
CALL devuelveContraseña("juanperez@correo.com");

-- ej7
DELIMITER $$
DROP PROCEDURE devuelveCadena $$
CREATE PROCEDURE devuelveCadena(IN entrada VARCHAR(50))
BEGIN
	DECLARE longitud VARCHAR(50);
    DECLARE palabra VARCHAR(1);
    DECLARE contador VARCHAR(50);
    SET longitud = length(entrada);
    SET palabra = "";
    bucle: WHILE contador != longitud DO
		SET palabra = 
    -- lo peor de todo es que en casa hice uno como este
    END WHILE;
		
    
    
END $$
DELIMITER ;

-- ej9
DELIMITER $$
DROP PROCEDURE probPaga $$
CREATE PROCEDURE probPaga(IN enParo BOOLEAN, 
			IN tieneDeuda BOOLEAN,
            IN tienePrestamo BOOLEAN,
            IN edad INT, OUT respuesta VARCHAR(50))
BEGIN
	IF edad <= 30 THEN
		SET respuesta = 80;
		ELSE IF edad > 30 THEN
			SET respuesta = 60;
		END IF;
    END IF;
	IF enParo THEN
		SET respuesta = respuesta - 20;
	END IF;
    IF tieneDeuda THEN
		SET respuesta = respuesta -30;
	END IF;
    IF tienePrestamo THEN
		SET respuesta = respuesta - 10;
	END IF;
    IF !tieneDeuda AND !tienePrestamo AND !enParo THEN
		SET respuesta = respuesta + 10;
	END IF;
    
END $$
DELIMITER ;

CALL ProbPaga(false,false,false,20,@respuesta);
SELECT @respuesta;
