CREATE DATABASE Seccion2;

USE Seccion2;

CREATE TABLE Empleados(
	EmpleadoID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(255) NOT NULL,
	Departamento VARCHAR(255),
	Salario DECIMAL(10,2) NOT NULL,
	Fecha_Contratacion DATE);

INSERT INTO Empleados (Nombre, Departamento, Salario, Fecha_Contratacion) VALUES
('Ana','Ventas',5000,'2020-01-15'),('Luis','IT',6000,'2019-08-21'),
('María','Ventas',5500,'2021-05-10'),('Juan','IT',7000,'2018-11-03')

WITH SalarioProm AS (
    SELECT Departamento, AVG(Salario) AS Salario_Medio
    FROM Empleados
    GROUP BY Departamento
)

SELECT T.Nombre, T.Departamento, T.Salario,T.Fecha_Contratacion
FROM Empleados T
JOIN SalarioProm sp ON T.Departamento = sp.Departamento
WHERE T.Fecha_Contratacion < '2020-01-01';