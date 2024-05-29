USE libreria;

INSERT INTO Libro VALUES ('978-84-376-0494-7', 'El Quijote', 'Miguel de Cervantes', 'Anaya', 'Novela', 20.00);
INSERT INTO Libro VALUES ('978-84-376-0494-8', 'JavaScript: The Good Parts', 'Douglas Crockford', 'Yahoo Press', 'Aprendizaje', 14.09);
INSERT INTO Libro VALUES ('978-84-376-0494-9', 'JavaScript: The Definitive Guide', 'David Flanagan', 'O''Reilly Media', 'Aprendizaje', 39.99);
INSERT INTO Libro VALUES ('978-84-376-0494-20', 'JavaScript: The other Guide', 'David Flanagan', 'O''Reilly Media', 'Aprendizaje', 59.99);
INSERT INTO Libro VALUES ('978-84-376-0494-21', 'JavaScript: The other other Guide', 'David Flanagan', 'O''Reilly Media', 'Aprendizaje', 69.99);

INSERT INTO Libro VALUES ('978-84-376-0494-10', 'Book1', 'Author1', 'Publisher1', 'Genre1', 10.00);
INSERT INTO Libro VALUES ('978-84-376-0494-11', 'Book2', 'Author2', 'Publisher2', 'Genre2', 12.99);
INSERT INTO Libro VALUES ('978-84-376-0494-12', 'Book3', 'Author3', 'Publisher3', 'Genre3', 15.50);
INSERT INTO Libro VALUES ('978-84-376-0494-13', 'Book4', 'Author4', 'Publisher4', 'Genre4', 9.99);
INSERT INTO Libro VALUES ('978-84-376-0494-14', 'Book5', 'Author5', 'Publisher5', 'Genre1', 18.75);
INSERT INTO Libro VALUES ('978-84-376-0494-15', 'Book6', 'Author6', 'Publisher6', 'Genre2', 11.25);
INSERT INTO Libro VALUES ('978-84-376-0494-16', 'Book7', 'Author7', 'Publisher7', 'Genre3', 14.99);
INSERT INTO Libro VALUES ('978-84-376-0494-17', 'Book8', 'Author8', 'Publisher8', 'Genre4', 16.50);
INSERT INTO Libro VALUES ('978-84-376-0494-18', 'Book9', 'Author9', 'Publisher9', 'Genre1', 13.25);
INSERT INTO Libro VALUES ('978-84-376-0494-19', 'Book10', 'Author10', 'Publisher10', 'Genre2', 20.00);

INSERT INTO Cliente VALUES('12345678A', 'Juan', 'García', 'Calle Mayor 1', '123456789');

INSERT INTO Cliente VALUES('11111111A', 'Client1', 'LastName1', 'Address1', '111111111');
INSERT INTO Cliente VALUES('22222222B', 'Client2', 'LastName2', 'Address2', '222222222');
INSERT INTO Cliente VALUES('33333333C', 'Client3', 'LastName3', 'Address3', '333333333');
INSERT INTO Cliente VALUES('44444444D', 'Client4', 'LastName4', 'Address4', '444444444');
INSERT INTO Cliente VALUES('55555555E', 'Client5', 'LastName5', 'Address5', '555555555');


INSERT INTO Empleado VALUES('87654321B', 'Pedro', 'González', 'Calle Menor 2', '987654321');

INSERT INTO Empleado VALUES('66666666F', 'Employee1', 'LastName1', 'Address1', '666666666');
INSERT INTO Empleado VALUES('77777777G', 'Employee2', 'LastName2', 'Address2', '777777777');
INSERT INTO Empleado VALUES('88888888H', 'Employee3', 'LastName3', 'Address3', '888888888');
INSERT INTO Empleado VALUES('99999999I', 'Employee4', 'LastName4', 'Address4', '999999999');
INSERT INTO Empleado VALUES('00000000J', 'Employee5', 'LastName5', 'Address5', '000000000');


INSERT INTO Venta VALUES( 1,'2021-06-01', '12345678A', '978-84-376-0494-7', '87654321B');
INSERT INTO Venta VALUES(2, '2021-06-02', '11111111A', '978-84-376-0494-9', '66666666F');
INSERT INTO Venta VALUES(3, '2021-06-03', '22222222B', '978-84-376-0494-10', '77777777G');
INSERT INTO Venta VALUES(4, '2021-06-04', '33333333C', '978-84-376-0494-11', '88888888H');
INSERT INTO Venta VALUES(5, '2021-06-05', '44444444D', '978-84-376-0494-12', '99999999I');
INSERT INTO Venta VALUES(6, '2021-06-06', '55555555E', '978-84-376-0494-13', '00000000J');


INSERT INTO Prestamo VALUES(1, '2021-06-01', '12345678A', '978-84-376-0494-8', 0 , '87654321B');

INSERT INTO Prestamo VALUES(2, '2021-06-02', '11111111A', '978-84-376-0494-14', 0 , '66666666F');
INSERT INTO Prestamo VALUES(3, '2021-06-03', '22222222B', '978-84-376-0494-15', 0 , '77777777G');
INSERT INTO Prestamo VALUES(4, '2021-06-04', '33333333C', '978-84-376-0494-16', 0 , '88888888H');
INSERT INTO Prestamo VALUES(5, '2021-06-05', '44444444D', '978-84-376-0494-17', 0 , '99999999I');