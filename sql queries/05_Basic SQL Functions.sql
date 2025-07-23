USE AdventureWorks2012
--1.STRING functions
--LEFT/RIGHT
SELECT 
LEFT(FirstName,3) AS FName, 
RIGHT(FirstName,3) AS LName, 
FirstName 
FROM Person.Person

--LOWER/UPPER
SELECT 
LOWER(FirstName) AS LowFName, 
UPPER(FirstName) As UpFName, 
FirstName 
FROM Person.Person

--REPLACE
SELECT 
REPLACE(FirstName, 'a', '*') as replacedFName, 
FirstName
FROM Person.Person

--REPLICATE
SELECT REPLICATE('A', 5) AS FiveA, REPLICATe(FirstName, 5) AS ReplicFName,
FirstName
FROM Person.Person

--LEN
SELECT LEN(FirstName) AS FirstNameLength,
FirstName
FROM Person.Person

--2.DATE Function
SELECT GETDATE() AS CurrentDate;

--this is an example of a nested function
--GETDATE() first returns the current date, then DATEPART operates on that value
SELECT 
DATEPART(MONTH, GETDATE()) AS [Month],
DATEPART(YEAR, GETDATE()) AS [Year],
DATEPART(WEEKDAY, GETDATE()) AS [Weekday],
DATEPART(DAY, GETDATE()) AS [Day]

SELECT 
OrderDate, 
DATEPART(MONTH, OrderDate) As [Ordered Month]
FROM Sales.SalesOrderHeader

SELECT 
DAY(OrderDate) AS [Ordered Day],
MONTH(OrderDate) AS [Ordered Month],
YEAR(OrderDate) AS [Ordered Year],
OrderDate
FROM Sales.SalesOrderHeader;

--in Where clause
SELECT * 
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2014;


--DATEADD
SELECT GETDATE();

SELECT 
DATEADD(MONTH, -1, GETDATE()) As Previousmonth, 
GETDATE() AS CurrentDate;

SELECT 
DATEADD(YEAR, -1, OrderDate) As [Previous Year],
OrderDate
FROM Sales.SalesOrderHeader

--DATEDIFF
SELECT OrderDate,ShipDate, DATEDIFF(DAY, OrderDate, ShipDate) AS DaysToShip
FROM Sales.SalesOrderHeader

SELECT 
OrderDate,
DATEDIFF(MONTH, OrderDate, GETDATE()) As MonthSinceOrder
FROM Sales.SalesOrderHeader;

--OTHER Functions
--IIF
SELECT FirstName,
IIF(FirstName = 'Catherine', 'Catherine', 'Not Catherine') As [IsCatherine?]
FROM Person.Person

--Can't do this
SELECT FirstName + BusinessEntityID 
FROM Person.Person;


SELECT FirstName , BusinessEntityID 
FROM Person.Person;

--CAST
SELECT FirstName + CAST(BusinessEntityID AS CHAR) -- Convering BusinessEntityID to Character
FROM Person.Person;

SELECT FirstName, LastName, FirstName + ' ' + LastName AS [Full Name]
FROM Person.Person

--FORMAT
SELECT FORMAT(OrderDate, 'MMM yyyy') AS FormatedDate
FROM Sales.SalesOrderHeader

SELECT FORMAT(OrderDate, 'yyyy/MM') AS FormatedDate
FROM Sales.SalesOrderHeader

