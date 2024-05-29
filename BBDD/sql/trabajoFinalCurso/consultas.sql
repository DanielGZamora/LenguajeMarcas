USE libreria;

-- 1. Listar todos los libros que sean del genero novela
SELECT * FROM Libro WHERE Genero = 'Novela';

-- 2. Listar todos los libros cuyo precio sea mayor a 20
SELECT * FROM Libro WHERE Precio > 20;

-- 3. Listar todos los libros cuyo autor haya escrito al menos un libro del genero novela
SELECT * FROM Libro WHERE Autor IN (SELECT Autor FROM Libro WHERE Genero = 'Novela');

-- 4. Listar un libro con almenos una venta
SELECT * FROM Libro WHERE ISBN IN (SELECT ISBN FROM Venta);