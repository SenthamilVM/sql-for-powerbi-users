USE AdventureWorks2012
GO
SELECT * FROM Sales.SalesOrderHeader

--If we are filtering on an aggregate function, add a HAVING clause
--Filter using WHERE clause will not work when we work with aggregate

--Get TotalDueAmount by CustomerID where TotalDueAmount is >10000

SELECT 
CustomerID, 
SUM(TotalDue) as [Total Due Amount] 
FROM Sales.SalesOrderHeader
WHERE SUM(TotalDue) > 1000
GROUP BY CustomerID;

/*ERROR: An aggregate may not appear in the WHERE clause unless it is in a 
subquery contained in a HAVING clause or a select list, and the column being aggregated is an outer reference.*/

--Instead do this
SELECT CustomerID,
SUM(TotalDue) as [Total Amount Due]
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
HAVING SUM(TotalDue) > 10000; -- HAVING will come after GROUP BY

--We can have both WHERE and HAVING clause

--Get TotalSales by Customer ID where Totalsale is > 10000 ONLY where Territory ID = 1

SELECT CustomerID,
SUM(TotalDue) as [Total Sale]
FROM Sales.SalesOrderHeader
WHERE TerritoryID = 1
GROUP BY CustomerID
HAVING SUM(TotalDue) > 10000;

