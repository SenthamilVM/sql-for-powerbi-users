--CTE is a Table Expression

USE AdventureWorks2012
GO
SELECT TOP 50 * FROM Production.Product;

--Select * from Sales.Salesorderdetail where orderqty > 5
--Show product name, color and their quantity from Production.product. Qty is available in Sales.Salesorderdetail table

;WITH C1 AS
(
SELECT * FROM Sales.SalesOrderDetail s
WHERE OrderQty > 5
),
C2 AS
(
SELECT p.Name as [Product Name], p.Color, SUM(C1.OrderQty) as OrderQty FROM Production.Product p
LEFT JOIN C1 ON
p.ProductID = C1.ProductID
GROUP BY p.Name, p.Color
)
SELECT * FROM C2
WHERE OrderQty > 1000;
--SELECT * FROM C2 -- Check the output of C2

----------------------------------------------

--Creating an additional column

;WITH C1 AS
(
SELECT * FROM Sales.SalesOrderDetail s
WHERE s.OrderQty > 5
),
C2 AS
(
SELECT p.Name as [Product Name], p.Color, SUM(C1.OrderQty) as [Order Quantity] FROM C1
LEFT JOIN Production.Product p ON
p.ProductID = C1.ProductID
GROUP BY p.Name, p.Color
)
SELECT *,
	CASE WHEN [Order Quantity] > 100 THEN 'Good Product'
	WHEN [Order Quantity] > 50 THEN 'Avg Product'
	ELSE 'Bad Product'
	END AS [Product Category]
FROM C2;

--Aggregate based on the Product Category

;WITH C1 AS
(
SELECT * FROM Sales.SalesOrderDetail
WHERE OrderQty > 5
),
C2 AS
(
SELECT p.Name as [Product Name], p.Color, SUM(C1.OrderQty) as [Order Quantity] FROM C1
LEFT JOIN Production.Product p
ON p.ProductID = C1.ProductID
GROUP BY p.Name, p.Color
),
C3 AS
(
SELECT *,
	CASE WHEN [Order Quantity] > 1000 THEN 'Good Product'
	WHEN [Order Quantity] > 500 THEN 'Avg Product'
	ELSE 
	'Bad Product'
	END AS [Product Category]
FROM C2
)
SELECT [Product Category], SUM([Order Quantity]) As Qty FROM C3
GROUP BY [Product Category];


