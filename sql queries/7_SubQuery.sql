--Sub Query - A Query within a query

--Get US Sales
USE AdventureWorks2012
--Check the data
SELECT TOP 10 * FROM Sales.SalesOrderHeader
SELECT TOP 10 * FROM Sales.SalesTerritory

--Get US Territory ID
SELECT TerritoryID FROM Sales.SalesTerritory
WHERE CountryRegionCode = 'US';

--Get US sales using Territory ID
SELECT * FROM Sales.SalesOrderHeader
WHERE TerritoryID IN (1,2,3,4,5)

--Use as sub-query
SELECT * FROM Sales.SalesOrderHeader
WHERE TerritoryID IN
(SELECT TerritoryID FROM Sales.SalesTerritory
WHERE CountryRegionCode = 'US');