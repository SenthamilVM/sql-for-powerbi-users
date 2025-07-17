--Check table first
USE AdventureWorks2012
SELECT * FROM Sales.SalesOrderHeader;

--Filter one record based on territory ID
SELECT * FROM Sales.SalesOrderHeader
WHERE TerritoryID = 5;

--Filter one record based on territory ID & bring few columns
SELECT Status, OrderDate, TaxAmt FROM Sales.SalesOrderHeader
WHERE TerritoryID = 5;

--Filter multiple records
SELECT * FROM Sales.SalesOrderHeader
WHERE TerritoryID = 5 AND CustomerID = 29888;

--Filter any text value
SELECT * FROM Sales.SalesOrderHeader
WHERE TerritoryID = 5 AND PurchaseOrderNumber = 'PO9657130250';

--Sort by Order date
SELECT * FROM Sales.SalesOrderHeader
ORDER BY OrderDate DESC;

--filter by orderdate
SELECT * FROM Sales.SalesOrderHeader
WHERE OrderDate >= '2014-01-01';

--filter using AND
SELECT * FROM Sales.SalesOrderHeader
WHERE Status = 5 AND SalesPersonID = 282;

--Using AND for orderdate
SELECT * FROM Sales.SalesOrderHeader
WHERE OrderDate >= '2014-01-01' AND OrderDate <= '2014-02-01';

--filter using BETWEEN
SELECT * FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2014-01-01' AND '2014-02-01'
ORDER BY OrderDate DESC; --Checking the date

--filter using OR
SELECT * FROM Sales.SalesOrderHeader
WHERE TerritoryID = 5 OR TerritoryID = 6 OR TerritoryID = 7;

--Use function in WHERE condition
SELECT * FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2014;