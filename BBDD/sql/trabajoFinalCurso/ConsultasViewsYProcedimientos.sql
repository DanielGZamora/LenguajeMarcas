USE libreria;

-- . Lista todos los libros de la editorial Ayana
SELECT * FROM Libro WHERE Editorial = 'Anaya';

-- . Selecciona los autores que tienen al menos 3 libros publicados
SELECT Autor, COUNT(*) AS LibrosPublicados
FROM Libro
GROUP BY Autor
HAVING COUNT(*) >= 3 
LIMIT 3;

-- . Seleciona los 3 generos mas comunes
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

-- . Lista los empleados que hayan prestado un libro, el ISBM del libro prestado y persona a la que se le ha prestado el libro
SELECT E.Nombre AS NombreEmpleado, P.ISBN, C.Nombre AS NombreCliente
FROM Prestamo P
JOIN Empleado E ON P.IdEmpleado = E.ID
JOIN Cliente C ON P.DNI = C.DNI;

-- . Lista todos los libros que han tenido al menos una venta o un préstamo
CREATE VIEW LibrosActivos AS
SELECT L.*, COUNT(V.ISBN) AS CantidadVentas, COUNT(P.ISBN) AS CantidadPrestamos
FROM Libro L
LEFT JOIN Venta V ON L.ISBN = V.ISBN
LEFT JOIN Prestamo P ON L.ISBN = P.ISBN
WHERE V.ISBN IS NOT NULL OR P.ISBN IS NOT NULL
GROUP BY L.ISBN;

-- . Lista todos los libros cuyo precio sea mayor a 50
CREATE VIEW LibrosCaros AS
SELECT * FROM Libro WHERE Precio > 50;

-- . Listar los libros que no han tenido ni ventas ni prestamos
CREATE VIEW LibrosInactivos AS
SELECT L.* FROM Libro L
LEFT JOIN Venta V ON L.ISBN = V.ISBN
LEFT JOIN Prestamo P ON L.ISBN = P.ISBN
WHERE V.ISBN IS NULL AND P.ISBN IS NULL;

-- . Un procedimiento que busca por autor un libro
DELIMITER $$
DROP PROCEDURE IF EXISTS BusquedaAutor;
CREATE PROCEDURE BusquedaAutor(IN Busqueda VARCHAR(50))
BEGIN
    IF (SELECT COUNT(*) FROM Libro WHERE Autor = Busqueda) = 0
    THEN SELECT 'No se encontraron libros del autor' AS Nop;
    ELSE SELECT * FROM Libro WHERE Autor = Busqueda; END IF;
END $$
DELIMITER ;

-- . Un procedimiento que obtiene la cantidad de libros de un autor
DELIMITER $$
DROP PROCEDURE IF EXISTS LibrosAutor;
CREATE PROCEDURE LibrosAutor(IN AutorBusqueda VARCHAR(50), OUT CantidadLibros INT)
BEGIN
    SELECT COUNT(*) AS CantidadLibros INTO CantidadLibros FROM Libro WHERE Autor = AutorBusqueda;
    IF CantidadLibros = 0 THEN
        SELECT 'No se encontraron libros del autor' AS Nop;
    END IF;
END $$
DELIMITER ;

-- . Un procedimiento que obtiene la cantidad de libros de una editorial
DELIMITER $$
DROP PROCEDURE IF EXISTS LibrosEditorial;
CREATE PROCEDURE LibrosEditorial(IN EditorialBusqueda VARCHAR(50), OUT CantidadLibros INT)
BEGIN
    SELECT COUNT(*) AS CantidadLibros INTO CantidadLibros FROM Libro WHERE Editorial = EditorialBusqueda;
    IF CantidadLibros = 0 THEN
        SELECT 'No se encontraron libros de esa editorial' AS Nop;
    END IF;
END $$
DELIMITER ;

-- . Este procedimiento aplica un descuento a un libro
DELIMITER $$
DROP PROCEDURE IF EXISTS AplicarDescuento;

CREATE PROCEDURE AplicarDescuento(IN ISBMLibroSeleccionado VARCHAR(50), IN Porcentaje DECIMAL(5,2))
BEGIN
    DECLARE PrecioAnterior DECIMAL(10,2); 
    SELECT Precio INTO PrecioAnterior FROM Libro WHERE ISBN = ISBMLibroSeleccionado;
    IF PrecioAnterior IS NULL THEN
        SELECT 'El libro seleccionado no existe' AS Resultado;
    ELSE
        SET PrecioAnterior = PrecioAnterior - (PrecioAnterior * Porcentaje);
        UPDATE Libro SET Precio = PrecioAnterior WHERE ISBN = ISBMLibroSeleccionado;
        SELECT * FROM Libro WHERE ISBN = ISBMLibroSeleccionado;
    END IF;
END $$
DELIMITER ;

-- . Un procedimiento que aplica un descuento a todos los libros
DELIMITER $$
DROP PROCEDURE IF EXISTS AplicarDescuentoTodos;
CREATE PROCEDURE AplicarDescuentoTodos(IN Porcentaje DECIMAL(5,2))
BEGIN
    DECLARE Completado INT DEFAULT FALSE;
    DECLARE ISBMLibro VARCHAR(50);
    DECLARE cur CURSOR FOR SELECT ISBN FROM Libro;
    DECLARE Completado CONTINUE HANDLER FOR NOT FOUND SET Completado = TRUE;
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO ISBMLibro;
        IF Completado THEN
            LEAVE read_loop;
        END IF;
        
        DECLARE PrecioAnterior DECIMAL(10,2);
        SELECT Precio INTO PrecioAnterior FROM Libro WHERE ISBN = ISBMLibro;
        SET PrecioAnterior = PrecioAnterior - (PrecioAnterior * Porcentaje);
        UPDATE Libro SET Precio = PrecioAnterior WHERE ISBN = ISBMLibro;
    END LOOP;
    
    CLOSE cur;
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
-- . Un procedimiento que comprueba si un usuario a realizado un prestamo y si no es asi, crea un prestamo
DELIMITER $$
DROP PROCEDURE IF EXISTS CrearPrestamo;
CREATE PROCEDURE CrearPrestamo(IN ID INT, IN Fecha DATE, IN DNI VARCHAR(10), IN ISBN VARCHAR(50), IN Devolucion BOOLEAN, IN EmpleadoEncargado VARCHAR(10))
BEGIN
    IF (Devolucion = 1)
    THEN
        SELECT 'Debes devolver el libro prestado antes de poder pedir otro' AS Resultado;
    ELSE
        IF (SELECT COUNT(*) FROM Prestamo WHERE ID = ID) = 0
        THEN
            INSERT INTO Prestamo VALUES (ID, Fecha, DNI, ISBN, Devolucion, EmpleadoEncargado);
        ELSE
            SELECT 'El prestamo ya existe' AS Resultado;
        END IF;
    END IF;
END $$
DELIMITER ;

-- . Actualizar un libro
DELIMITER $$
DROP PROCEDURE IF EXISTS ActualizarLibro;
CREATE PROCEDURE ActualizarLibro(IN ISBMLibro VARCHAR(50), IN NuevoPrecio DECIMAL(10,2))
BEGIN
    UPDATE Libro SET Precio = NuevoPrecio WHERE ISBN = ISBMLibro;
END $$
DELIMITER ;


-- . Llamar procedimientos
CALL BusquedaAutor('Miguel de Cervantes');
CALL LibrosAutor('Miguel de Cervantes', @CantidadLibros);
SELECT @CantidadLibros AS CantidadLibrosAutor;
CALL LibrosEditorial('Anaya', @CantidadLibros);
SELECT @CantidadLibros AS CantidadLibrosEditorial;
CALL AplicarDescuento('978-84-376-0494-07', 0.1);
SELECT * FROM Libro WHERE ISBM LIKE '978-84-376-0494-07';
CALL AplicarDescuentoTodos(0.2);
CALL AgregarCliente('11111111Z', 'Pepe', 'Perez', 'Casa', '555554321');
CALL CrearPrestamo(5, '2021-06-01', '11111111Z', '978-84-376-0494-01', 1, '87654321A');
CALL ActualizarLibro('978-84-376-0494-01', 15.00);


-- . Llamar vistas
SELECT * FROM LibrosActivos;
SELECT * FROM LibrosCaros;
SELECT * FROM LibrosInactivos;

