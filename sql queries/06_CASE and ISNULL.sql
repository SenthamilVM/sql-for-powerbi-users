--select top 100 rows from Person.Person

USE AdventureWorks2012
SELECT FirstName 
FROM Person.Person;

--Create a column mentioning if Firt Name is Kim or Not
SELECT FirstName, 
	CASE WHEN FirstName = 'Kim' THEN 'Yes'
	ELSE 'No'
	END AS [IsKim?]
FROM Person.Person;

--Check salesOrderHeader and create a column based on the Tax Amount
SELECT TOP 100 *
FROM Sales.SalesOrderHeader;

SELECT TaxAmt,
	CASE WHEN TaxAmt <= 500 THEN 'Low'
	WHEN TaxAmt <=2000 THEN 'Medium'
	ELSE 'High Tax'
	END
	AS [Tax Category]
FROM Sales.SalesOrderHeader;

--Example of ISNULL
SELECT TOP 100 *
FROM Sales.SalesOrderHeader

--Replace NULL with a default number
SELECT 
CurrencyRateID, 
ISNULL(CurrencyRateID, 1) AS [New Currency Rate]
FROM Sales.SalesOrderHeader

--Replace NULL with a column
SELECT
TerritoryID,
CurrencyRateID, 
ISNULL(CurrencyRateID,TerritoryID) As [New Currency Rate]
FROM Sales.SalesOrderHeader
