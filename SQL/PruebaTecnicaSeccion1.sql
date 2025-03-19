CREATE DATABASE RAPPI;

USE RAPPI;

CREATE TABLE Categorias(
	CategoriaID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(255) NOT NULL);

CREATE TABLE Productos(
	ProductoID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(255) NOT NULL,
	CategoriaID INT,
	Precio DECIMAL (10,2)NOT NULL);

CREATE TABLE Productos_Nuevos(
	Nombre VARCHAR(255) NOT NULL,
	Categoria INT,
	Precio DECIMAL (10,2)NOT NULL);

CREATE TABLE Ventas(
	Id_Ventas INT PRIMARY KEY IDENTITY,
	Fecha DATE,
	ClienteID INT,
	Monto INT);


-- Insertar datos en Categorias
INSERT INTO Categorias (Nombre) VALUES
('Comida Rápida'), ('Postres'), ('Bebidas'), ('Adiciones'), ('Desayunos'),
('Cafetería'), ('Helados'), ('Comida Vegana'), ('Carnes'), ('Pizzas');

INSERT INTO Productos (Nombre, CategoriaID, Precio) VALUES
('Hamburguesa Deluxe', 1, 9.99), ('Cheeseburger', 1, 7.99), ('Pizza Margarita', 10, 11.99),
('Pizza Pepperoni', 10, 12.99), ('Helado de Chocolate', 7, 2.99)

SELECT *FROM Productos

INSERT INTO Productos_Nuevos (Nombre, Categoria, Precio) VALUES
('Cheese Fries', 4, 8.99), ('Chikenburger', 1, 11.99), ('Coffe Late', 6, 6.99)

SELECT * FROM Productos_Nuevos

INSERT INTO Ventas (Fecha, ClienteID, Monto) VALUES
('2025-03-01',101,200),('2025-03-02',102,150),('2025-03-02',101,300)

SELECT * FROM Ventas

SELECT Categoria, Nombre FROM Productos_Nuevos
UNION
SELECT CategoriaID, Nombre FROM Productos;

SELECT	ClienteID,
		SUM(Monto) AS VentaTotal
FROM Ventas
GROUP BY ClienteID
HAVING SUM(Monto) > 250;
