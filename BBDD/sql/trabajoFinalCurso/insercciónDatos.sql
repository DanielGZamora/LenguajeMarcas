USE libreria;

INSERT INTO Libro VALUES ('978-84-376-0494-01', 'El Quijote', 'Miguel de Cervantes', 'Anaya', 'Novela', 20.50);
INSERT INTO Libro VALUES ('978-84-376-0494-02', 'JavaScript: The Good Parts', 'Douglas Crockford', 'Yahoo Press', 'Aprendizaje', 14.15);
INSERT INTO Libro VALUES ('978-84-376-0494-03', 'Aprende java con ejercicios', 'Luis José Sánchez González', 'Leanpub', 'Aprendizaje', 39.99);
INSERT INTO Libro VALUES ('978-84-376-0494-04', 'Programming in Lua(first edition)', 'Roberto lerusallmschy', 'Roberto lerusallmschy', 'Aprendizaje', 31.99);
INSERT INTO Libro VALUES ('978-84-376-0494-05', 'C Programming Language, 2nd Edition', 'Brian W. Kernighan', 'Pearson', 'Aprendizaje', 40.99);
INSERT INTO Libro VALUES ('978-84-376-0494-06', 'La mitologia en comic', 'SANDRINE MIRZA', 'Anaya', 'Aprendizaje', 30.99);


INSERT INTO Cliente VALUES('12345678A', 'Juan', 'García', 'Calle Mayor 1', '111111111');
INSERT INTO Cliente VALUES('12345678B', 'Pepe', 'Martinez', 'Calle Mayor 2', '222222222');
INSERT INTO Cliente VALUES('12345678C', 'Mauricio', 'Gonzalez', 'Calle Mayor 3', '333333333');
INSERT INTO Cliente VALUES('12345678D', 'Patricio', 'Estrella', 'Calle Mayor 4', '444444444');


INSERT INTO Empleado VALUES('01', 'Pedro', 'González', 'Calle Menor 1', '555555555');
INSERT INTO Empleado VALUES('02', 'Antonio', 'Marquez', 'Calle Menor 2', '666666666');
INSERT INTO Empleado VALUES('03', 'María', 'López', 'Calle Menor 3', '777777777');


INSERT INTO Venta VALUES(1,'2021-06-01', '12345678A', '978-84-376-0494-03', '01');
INSERT INTO Venta VALUES(2,'2021-06-03', '12345678B', '978-84-376-0494-03', '02');
INSERT INTO Venta VALUES(3,'2021-06-05', '12345678C', '978-84-376-0494-01', '03');
INSERT INTO Venta VALUES(4,'2021-06-01', '12345678D', '978-84-376-0494-02', '04');


INSERT INTO Prestamo VALUES(1, '2021-06-01', '12345678D', '978-84-376-0494-06', 0 , '01');
INSERT INTO Prestamo VALUES(2, '2021-06-02', '12345678D', '978-84-376-0494-06', 0 , '02');
INSERT INTO Prestamo VALUES(3, '2021-06-03', '12345678D', '978-84-376-0494-06', 1 , '03');
INSERT INTO Prestamo VALUES(4, '2021-06-05', '12345678C', '978-84-376-0494-05', 0 , '04');
