/*
BASE DE DATOS DESTINO
*/

CREATE DATABASE DEMO_VENTAS;
GO

USE DEMO_VENTAS;
GO

CREATE TABLE dbo.VENTAS(
	CustomerID nchar (5) NOT NULL,
	CompanyName nvarchar (40) NOT NULL,
	OrderID int NOT NULL,
	OrderDate datetime NULL,
	ProductName nvarchar (40) NOT NULL,
	UnitPrice money NOT NULL,
	Quantity smallint NOT NULL
);
GO

TRUNCATE TABLE DBO.VENTAS;
GO

SELECT * FROM dbo.VENTAS;
GO

/*
CONSULTA A UTILIZAR
*/


SELECT 
	C.CustomerID, C.CompanyName, O.OrderID, O.OrderDate,
	P.ProductName, D.UnitPrice, D.Quantity
FROM Northwind.dbo.Customers AS C
JOIN Northwind.dbo.Orders AS O ON C.CustomerID = O.CustomerID
JOIN Northwind.dbo.[Order Details] AS D ON O.OrderID = D.OrderID
JOIN Northwind.dbo.Products AS P ON D.ProductID = P.ProductID;
GO



