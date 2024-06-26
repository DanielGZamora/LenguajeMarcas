DROP DATABASE IF EXISTS libreria;
CREATE DATABASE IF NOT EXISTS libreria;
USE libreria;

DROP TABLE IF EXISTS Libro;
CREATE TABLE Libro(
    ISBN CHAR(20),
    Titulo VARCHAR(100),
    Autor VARCHAR(100),
    Editorial VARCHAR(100),
    Genero VARCHAR(100),
    Precio FLOAT,

    CONSTRAINT PK_Libro PRIMARY KEY (ISBN),
    CONSTRAINT CK1_Libro CHECK (Precio > 0)
);

DROP TABLE IF EXISTS Cliente;
CREATE TABLE Cliente(
    DNI CHAR(9),
    Nombre VARCHAR(100),
    Apellidos VARCHAR(100),
    Direccion VARCHAR(100),
    Telefono CHAR(9),

    CONSTRAINT PK_Cliente PRIMARY KEY (DNI)
);

DROP TABLE IF EXISTS Empleado;
CREATE TABLE Empleado(
    IdEmpleado CHAR(9),
    Nombre VARCHAR(100),
    Apellidos VARCHAR(100),
    Direccion VARCHAR(100),
    Telefono CHAR(9),

    CONSTRAINT PK_Empleado PRIMARY KEY (IdEmpleado)
);

DROP TABLE IF EXISTS Venta;
CREATE TABLE Venta(
    ID INT AUTO_INCREMENT,
    Fecha DATE,
    DNI CHAR(9),
    ISBN CHAR(20),
    EmpleadoEncargado CHAR(9),

    CONSTRAINT PK_Venta PRIMARY KEY (ID),
    CONSTRAINT FK1_Venta FOREIGN KEY (DNI) REFERENCES Cliente(DNI),
    CONSTRAINT FK2_Venta FOREIGN KEY (ISBN) REFERENCES Libro(ISBN),
    CONSTRAINT FK3_Venta FOREIGN KEY (EmpleadoEncargado) REFERENCES Empleado(IdEmpleado)
);

DROP TABLE IF EXISTS Prestamo;
CREATE TABLE Prestamo(
    ID INT AUTO_INCREMENT,
    Fecha DATE,
    DNI CHAR(9),
    ISBN CHAR(20),
    Devolucion BOOLEAN,
    EmpleadoEncargado CHAR(9),

    CONSTRAINT PK_Prestamo PRIMARY KEY (ID),
    CONSTRAINT FK1_Prestamo FOREIGN KEY (DNI) REFERENCES Cliente(DNI),
    CONSTRAINT FK2_Prestamo FOREIGN KEY (ISBN) REFERENCES Libro(ISBN),
    CONSTRAINT FK3_Prestamo FOREIGN KEY (EmpleadoEncargado) REFERENCES Empleado(IdEmpleado)
);



