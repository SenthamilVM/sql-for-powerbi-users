USE AdventureWorks2012

--Check dbo.product_offset table

SELECT * FROM dbo.product_offset

--Get rows between 11 to 25
SELECT * FROM dbo.product_offset
ORDER BY ProductID ASC
OFFSET 10 ROWS
FETCH NEXT 15 ROWS ONLY;


--ordered in descending order. The result will be different
SELECT * FROM dbo.product_offset
ORDER BY ProductID DESC
OFFSET 10 ROWS
FETCH NEXT 15 ROWS ONLY;

