USE libreria;

-- 1. Listar todos los libros
SELECT * FROM Libro;

-- 2. Listar todos los libros cuyo autor haya escrito al menos un libro del genero novela
SELECT * FROM Libro WHERE Autor IN (SELECT Autor FROM Libro WHERE Genero = 'Novela');

-- 3. Listar un libro con almenos una venta
SELECT * FROM Libro WHERE ISBN IN (SELECT ISBN FROM Venta);

-- 4. Listar los usuarios que hayan realizado un prestamo
SELECT * FROM Cliente WHERE DNI IN (SELECT DNI FROM Prestamo);

-- 5. Listar todos los libros junto con la cantidad de ventas y prestamos que han tenido
SELECT L.*, COUNT(V.ISBN) AS CantidadVentas, COUNT(P.ISBN) AS CantidadPrestamos
FROM Libro L
LEFT JOIN Venta V ON L.ISBN = V.ISBN
LEFT JOIN Prestamo P ON L.ISBN = P.ISBN
GROUP BY L.ISBN;

-- 6. Listar los libros que no han tenido ventas
SELECT L.* FROM Libro L
LEFT JOIN Venta V ON L.ISBN = V.ISBN
WHERE V.ISBN IS NULL;

-- 7. Listar los libros de la editorial Ayana
CREATE VIEW [ LibrosDeAyana ] AS   
SELECT * FROM Libro WHERE Editorial = 'Ayana';

-- 8. Listar todos los libros cuyo precio sea mayor a 50
CREATE VIEW [ LibrosCaros ] AS
SELECT * FROM Libro WHERE Precio > 50;

-- 9. Listar los libros que no han tenido ni ventas ni prestamos
CREATE VIEW [ LibrosInactivos ] AS
SELECT L.* FROM Libro L
LEFT JOIN Venta V ON L.ISBN = V.ISBN
LEFT JOIN Prestamo P ON L.ISBN = P.ISBN
WHERE V.ISBN IS NULL AND P.ISBN IS NULL;




