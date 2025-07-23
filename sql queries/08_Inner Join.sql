--JOINS

--Creating tables
USE TestDB

--Creating Sales table
CREATE TABLE dbo.Sales
(
productID INT,
SuppliedID INT,
Cost INT
)

ALTER TABLE dbo.Sales
ALTER COLUMN productID INT NOT NULL;

ALTER TABLE dbo.Sales
ADD PRIMARY KEY (productID);

INSERT INTO dbo.Sales
(productID, SuppliedID, Cost)
VALUES 
(1,1,5),
(2,2,5),
(3,3,5),
(4,4,5),
(5,5,5),
(6,5,5),
(7,6,5),
(8,6,5)

SELECT * FROM dbo.Sales

--Creating product table
CREATE TABLE dbo.product
(
productID INT NOT NULL PRIMARY KEY,
ProductName VARCHAR(10)
)

INSERT INTO dbo.product
VALUES
(1,'P1'),
(2, 'P2'),
(3, 'P3'),
(4, 'P4'),
(5, 'P5')

SELECT * FROM dbo.product

CREATE TABLE dbo.supplier
(
SupplierID INT NOT NULL PRIMARY KEY,
SupplierName VARCHAR(10)
)

INSERT INTO dbo.supplier
VALUES
(1,'S1'),
(2,'S2'),
(3,'S3'),
(4,'S4'),
(5,'S5')


--checking the data
SELECT * FROM dbo.Sales
SELECT * FROM dbo.product
SELECT * FROM dbo.supplier

--get all products which are in Sales table
SELECT *
FROM dbo.Sales s
INNER JOIN dbo.product p
ON s.productID = p.productID

--Using JOIN instead of INNER JOIN which is the same.
SELECT *
FROM dbo.Sales s
JOIN dbo.product p
ON s.productID = p.productID

--Get Individual columns
SELECT s.SuppliedID, s.Cost, p.ProductName
FROM dbo.Sales s
JOIN dbo.product p
ON s.productID = p.productID

--JOIN more than 2 tables
SELECT * 
FROM dbo.Sales s
JOIN dbo.product p
ON s.productID = p.productID
JOIN dbo.supplier spr
ON s.SuppliedID = spr.SupplierID

--Use multiple tables with AdventureWorksDW2012
USE AdventureWorksDW2012
SELECT TOP 100 * 
FROM [dbo].[FactInternetSales]

--Get information from product/customer/Territory etc.
SELECT p.EnglishProductName, c.FirstName, t.SalesTerritoryCountry, f.SalesAmount
FROM dbo.FactInternetSales f
JOIN dbo.DimProduct p
ON f.ProductKey = p.ProductKey
JOIN DimCustomer c
ON f.CustomerKey = c.CustomerKey
JOIN DimSalesTerritory t
ON f.SalesTerritoryKey = t.SalesTerritoryKey;

--Apply Where clause in the above output
SELECT p.EnglishProductName, c.FirstName, t.SalesTerritoryCountry, f.SalesAmount
FROM dbo.FactInternetSales f
JOIN dbo.DimProduct p
ON f.ProductKey = p.ProductKey
JOIN DimCustomer c
ON f.CustomerKey = c.CustomerKey
JOIN DimSalesTerritory t
ON f.SalesTerritoryKey = t.SalesTerritoryKey
WHERE t.SalesTerritoryCountry = 'Canada';


