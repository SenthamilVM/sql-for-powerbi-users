USE AdventureWorks2012

SELECT TOP 100 * FROM Sales.SalesOrderHeader


SELECT * FROM Sales.SalesOrderHeader

--Count the rows in the result
SELECT COUNT(*) as [Total Rows] FROM Sales.SalesOrderHeader

--count the actual values, not null
SELECT COUNT(SalesPersonID) as TotalSalesPersons FROM Sales.SalesOrderHeader


--Can have multiple functions in one query

SELECT 
	SUM(TotalDue) as TotalDueAmount, 
	AVG(TotalDue) as AvgDue,  
	MAX(TaxAmt) as TaxAmount
FROM Sales.SalesOrderHeader

--Error!! (Without Group By)

SELECT 
	CustomerID,
	SUM(TotalDue) as TotalDueAmount, 
	AVG(TotalDue) as AvgDue,  
	MAX(TaxAmt) as TaxAmount
FROM Sales.SalesOrderHeader

/*Error: Column 'Sales.SalesOrderHeader.CustomerID' is invalid in the select list because it is not 
contained in either an aggregate function or the GROUP BY clause.*/

--CustomerID should be either in an aggregate function or in the Group By function.

SELECT 
	CustomerID,
	SUM(TotalDue) as TotalDueAmount, 
	AVG(TotalDue) as AvgDue,  
	MAX(TaxAmt) as TaxAmount
FROM Sales.SalesOrderHeader
GROUP BY CustomerID;


--Make sure that all non-aggregate columns and expressions are included
SELECT 
SUM(TotalDue) as [Total Due Amount], 
YEAR(OrderDate) as [Order Year]
FROM Sales.SalesOrderHeader
GROUP BY OrderDate -- This will not be grouped correctly. Checkout the correct query below.

--Correct query
SELECT 
SUM(TotalDue) as [Total Due Amount],
YEAR(OrderDate) as [Order Year]
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate);
