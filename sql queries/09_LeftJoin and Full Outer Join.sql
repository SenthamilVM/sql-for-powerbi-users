--Left Join and Full outer join

USE TestDB
SELECT * FROM dbo.product
SELECT * FROM dbo.supplier
SELECT * FROM dbo.Sales

--Get the supplier name for all the products
SELECT p.productID, p.ProductName, s.SuppliedID, splr.SupplierName
FROM dbo.product p
LEFT JOIN dbo.Sales s
ON p.productID = s.productID
LEFT JOIN dbo.supplier splr
ON s.SuppliedID = splr.SupplierID

--JOIN vs LEFT JOIN vs FULL JOIN

--JOIN
SELECT s.productID, s.Cost, p.ProductName
FROM dbo.Sales s
JOIN dbo.product p
ON s.productID = p.productID

--LEFT JOIN
SELECT s.productID, s.Cost, p.ProductName
FROM dbo.Sales s
LEFT JOIN dbo.product p
ON s.productID = p.productID

--FULL JOIN
SELECT s.productID, s.Cost, p.ProductName
FROM dbo.Sales s
FULL JOIN dbo.product p
ON s.productID = p.productID

--ISNULL
SELECT ISNULL(s.productID, p.productID), s.Cost, p.ProductName
FROM dbo.Sales s
FULL JOIN dbo.product p
ON s.productID = p.productID

--Get all rows
SELECT *
FROM dbo.Sales s
FULL JOIN dbo.product p
ON s.productID = p.productID