USE libreria;

-- . Lista todos los libros de la editorial Ayana
SELECT * FROM Libro WHERE Editorial = 'Ayana';

-- . Selecciona los autores que tienen al menos 3 libros publicados
SELECT Autor, COUNT(*) AS LibrosPublicados
FROM Libro
GROUP BY Autor
HAVING COUNT(*) >= 3 
LIMIT 3;

-- . Seleciona los  3 generos  mas comunes
SELECT Genero, COUNT(*) AS CantidadLibros
FROM Libro
GROUP BY Genero
ORDER BY CantidadLibros DESC
LIMIT 3;

-- . Lista un libro con almenos una venta
SELECT * FROM Libro WHERE ISBN IN (SELECT ISBN FROM Venta);

-- . Lista los usuarios que hayan realizado un prestamo
SELECT * FROM Cliente WHERE DNI IN (SELECT DNI FROM Prestamo);

-- . Lista todos los libros junto con la cantidad de ventas y prestamos que han tenido
SELECT L.*, COUNT(V.ISBN) AS CantidadVentas, COUNT(P.ISBN) AS CantidadPrestamos
FROM Libro L
LEFT JOIN Venta V ON L.ISBN = V.ISBN

LEFT JOIN Prestamo P ON L.ISBN = P.ISBN
GROUP BY L.ISBN;

-- . Lista los empleados que hayan prestado un libro , el ISBM del libro prestado y persona a la que se le ha prestado el libro
SELECT E.Nombre AS NombreEmpleado, P.ISBN, C.Nombre AS NombreCliente
FROM Prestamo P
JOIN Empleado E ON P.EmpleadoEncargado = E.DNI
JOIN Cliente C ON P.DNI = C.DNI;

-- . Lista todos los libros de la editorial Ayana
CREATE VIEW  LibrosDeAyana  AS
SELECT * FROM Libro WHERE Editorial = 'Ayana';

-- . Lista todos los libros cuyo precio sea mayor a 50
CREATE VIEW LibrosCaros  AS
SELECT * FROM Libro WHERE Precio > 50;

-- . Listar los libros que no han tenido ni ventas ni prestamos
CREATE VIEW  LibrosInactivos  AS
SELECT L.* FROM Libro L
LEFT JOIN Venta V ON L.ISBN = V.ISBN
LEFT JOIN Prestamo P ON L.ISBN = P.ISBN
WHERE V.ISBN IS NULL AND P.ISBN IS NULL;

-- .  Un procedimiento que busca por autor un libro
DELIMITER $$
DROP PROCEDURE IF EXISTS BusquedaAutor;
CREATE PROCEDURE BusquedaAutor(IN Busqueda VARCHAR(50))
BEGIN
    IF (SELECT COUNT(*) FROM Libro WHERE Autor = Busqueda) = 0
    THEN SELECT 'No se encontraron libros del autor' AS Nop;
    ELSE SELECT * FROM Libro WHERE Autor = Busqueda; END IF;
END $$
DELIMITER ;
-- . Un procedimiento que busca por genero un libro
DELIMITER $$
DROP PROCEDURE IF EXISTS BusquedaGenero;
CREATE PROCEDURE BusquedaGenero(IN Busqueda VARCHAR(50))
BEGIN
    IF (SELECT COUNT(*) FROM Libro WHERE Genero = Busqueda) = 0
    THEN SELECT 'No se encontraron libros de ese genero' AS Nop;
    ELSE SELECT * FROM Libro WHERE Genero = Busqueda; END IF;
END $$
DELIMITER ;

-- . Este procedimiento aplica un descuento a un libro
DELIMITER $$
DROP PROCEDURE IF EXISTS AplicarDescuento;

CREATE PROCEDURE AplicarDescuento(INOUT ISBMLibroSeleccionado VARCHAR(50), IN Porcentaje DECIMAL(5,2))
BEGIN
    DECLARE PrecioAnterior DECIMAL(10,2);
    SELECT Precio INTO PrecioAnterior FROM Libro WHERE ISBM = ISBMLibroSeleccionado;
    SET PrecioAnterior = PrecioAnterior - (PrecioAnterior * Porcentaje);
    UPDATE Libro SET Precio = PrecioAnterior WHERE ISBM = ISBMLibroSeleccionado;
    SET ISBMLibroSeleccionado = CONCAT(ISBMLibroSeleccionado, ' (actualizado)');
END $$
DELIMITER ;
-- . Un procedimiento que añade un cliente a la base de datos
DELIMITER $$
DROP PROCEDURE IF EXISTS AgregarCliente;
CREATE PROCEDURE AgregarCliente(IN DNI VARCHAR(10), IN Nombre VARCHAR(50), IN Apellido VARCHAR(50), IN Direccion VARCHAR(50), IN Telefono VARCHAR(50))
BEGIN
    INSERT INTO Cliente VALUES (DNI, Nombre, Apellido, Direccion, Telefono);
END $$
DELIMITER ;




-- . Llamar procedimientos
CALL BusquedaAutor('Miguel de Cervantes');
CALL BusquedaGenero('Aprendizaje');
CALL AplicarDescuento('978-84-376-0494-7', 0.1);
CALL AgregarCliente('12345678Z', 'Juan', 'Perez', 'Calle Falsa 123', '12345678');
SELECT * FROM Cliente WHERE Nombre LIKE 'Juan';


