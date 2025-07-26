--Join SalesOrderHeader and Customer

USE AdventureWorks2012
GO
SELECT soh.CustomerID, soh.SalesOrderID, c.AccountNumber 
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.Customer c
ON soh.CustomerID = c.CustomerID

--Create a local temp table using SELET INTO

SELECT soh.CustomerID, soh.SalesOrderID, c.AccountNumber 
INTO #test_local
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.Customer c
ON soh.CustomerID = c.CustomerID;

SELECT * FROM #test_local
ORDER BY CustomerID DESC;

--Create Global Temp table using SELECT INTO

SELECT soh.CustomerID, soh.SalesOrderID, c.AccountNumber 
INTO ##test_global
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.Customer c
ON soh.CustomerID = c.CustomerID;

SELECT * FROM ##test_global
ORDER BY CustomerID DESC;


--Create a view from the above query

CREATE VIEW dbo.vCustomerview AS
SELECT soh.CustomerID, soh.SalesOrderID, c.AccountNumber 
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.Customer c
ON soh.CustomerID = c.CustomerID


--Use the view

SELECT * FROM vCustomerview
WHERE SalesOrderID > 50000;


