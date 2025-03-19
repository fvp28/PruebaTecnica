CREATE DATABASE Seccion3;

USE Seccion3;

CREATE TABLE Clientes(
	ClienteID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(255),
	Apellido VARCHAR(255));

CREATE TABLE Ventas (
    VentasID INT PRIMARY KEY,
    Cliente INT,  
    Producto VARCHAR(255),
    Fecha DATE,
    Monto DECIMAL(10,2),
    FOREIGN KEY (Cliente) REFERENCES Clientes(ClienteID)
);

INSERT INTO Clientes (Nombre, Apellido) VALUES
('Juan', 'Pérez'),('María', 'González'),('Carlos', 'Rodríguez'),('Ana', 'Martínez'),
('Pedro', 'López'),('Sofía', 'Hernández'),('Diego', 'Díaz'),('Elena', 'Torres'),
('Luis', 'Ramírez'),('Gabriela', 'Flores'),('Fernando', 'Gómez'),('Camila', 'Vargas'),
('Alejandro', 'Castro'),('Valeria', 'Jiménez'),('Raúl', 'Morales'),('Paola', 'Ortega'),
('Javier', 'Navarro'),('Andrea', 'Ríos'),('Manuel', 'Suárez'),('Lucía', 'Mendoza');

INSERT INTO Ventas (VentasID, Cliente, Producto, Fecha, Monto) VALUES
(1, 1, 'Laptop Dell', '2024-03-01', 1200.50),(2, 2, 'Smartphone Samsung', '2024-02-02', 850.00),
(3, 3, 'Tablet iPad', '2025-04-03', 600.99),(4, 4, 'Monitor LG', '2024-04-04', 300.75),
(5, 5, 'Teclado Mecánico', '2024-01-05', 120.00),(6, 6, 'Mouse Inalámbrico', '2025-02-06', 80.50),
(7, 7, 'Impresora HP', '2025-03-07', 220.30),(8, 8, 'Auriculares Sony', '2025-06-08', 150.25),
(9, 9, 'Disco Duro 1TB', '2024-07-09', 90.40),(10, 10, 'Tarjeta Gráfica RTX 3060', '2024-04-10', 450.60),
(11, 11, 'Memoria RAM 16GB', '2024-05-11', 130.75),(12, 12, 'Router Wi-Fi 6', '2024-04-12', 110.00),
(13, 13, 'Consola PlayStation 5', '2025-02-13', 500.99),(14, 14, 'Silla Gamer', '2024-02-14', 250.45),
(15, 15, 'Cámara Web Logitech', '2024-01-15', 95.99),(16, 16, 'SSD 512GB', '2024-02-16', 140.30),
(17, 17, 'Micrófono Profesional', '2024-07-17', 175.20),(18, 18, 'Fuente de Poder 750W', '2024-05-18', 125.50),
(19, 19, 'Monitor UltraWide', '2024-04-19', 320.90),(20, 20, 'Tablet Samsung', '2025-07-20', 550.00);


SELECT TOP 5 Cliente,  
       SUM(Monto) AS VentaTotal
FROM Ventas
WHERE Fecha >= DATEADD(MONTH, -6, '2024-07-01')
GROUP BY Cliente
ORDER BY VentaTotal DESC;


SELECT Cliente,  
       CONVERT(DECIMAL (10,2),SUM(Monto) / COUNT(VentasID)) AS TicketPromedio
FROM Ventas
WHERE Fecha >= DATEADD(YEAR, -1, GETDATE())
GROUP BY Cliente
ORDER BY TicketPromedio DESC;

SELECT T1.Nombre, T1.Apellido,
		SUM(Monto) AS TotalVentas
FROM Clientes AS T1
INNER JOIN Ventas AS T2
	ON T1.ClienteID = T2.Cliente
GROUP BY T1.Nombre, T1.Apellido
ORDER BY TotalVentas DESC;

SELECT 
		MONTH(Fecha) AS Mes,
		SUM(Monto) AS VentasTotales
FROM Ventas
GROUP BY MONTH(Fecha)
ORDER BY Mes

SELECT Cliente,
       CONVERT(DECIMAL(10,2), AVG(Monto)) AS PromedioVentas
FROM Ventas
GROUP BY Cliente
HAVING AVG(Monto) > (SELECT AVG(Monto) FROM Ventas);

