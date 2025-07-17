--get all records from [Person].[Person]
USE AdventureWorks2012
SELECT * FROM Person.Person

--Get FirstName, LastName, EmailPromotion from [Person].[Person]
SELECT FirstName, LastName, EmailPromotion FROM Person.Person

--Alias
SELECT FirstName As FName, LastName As LName, EmailPromotion As Email FROM Person.Person

--ORDER BY FirstName
SELECT FirstName As FName, LastName As LName, EmailPromotion As Email FROM Person.Person
ORDER BY FName;

--ORDER BY ASC
SELECT FirstName As FName, LastName As LName, EmailPromotion As Email FROM Person.Person
ORDER BY FName ASC;

--ORDER BY DESC
SELECT FirstName As FName, LastName As LName, EmailPromotion As Email FROM Person.Person
ORDER BY FName DESC;

--Check [Sales].[SalesOrderHeader] using TOP
SELECT * FROM Sales.SalesOrderHeader;
SELECT TOP 10 * FROM Sales.SalesOrderHeader;

--ORDER [Sales].[SalesOrderHeader] by orderDate
SELECT TOP 10 * FROM Sales.SalesOrderHeader
ORDER BY OrderDate;

--ORDER [Sales].[SalesOrderHeader] by orderDate in Descending order
SELECT TOP 10 * FROM Sales.SalesOrderHeader
ORDER BY OrderDate DESC;