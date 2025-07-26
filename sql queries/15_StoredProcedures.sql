USE TestDB

--creating a table in testdb based on the data from adventureworks DB
SELECT * INTO TestDB.test.stageorders
FROM AdventureWorks2012.Sales.SalesOrderHeader

--Example 1

USE TestDB
GO
CREATE PROCEDURE sp_Test
AS
DROP TABLE test.stageorders
SELECT * INTO TestDB.test.stageorders
FROM AdventureWorks2012.Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2014


EXEC sp_Test;

--SELECT * FROM test.stageorders

--Alter the Stored Procedure, I don't want to drop the stageorders table, I'd ilke to see the records from the SalesOrderheader table.

ALTER PROCEDURE sp_Test
AS
SELECT * FROM AdventureWorks2012.Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2014;

EXEC sp_Test

--Alter procedure, empty stageorders table and show me the records from Salesorderheader

ALTER PROCEDURE sp_Test
AS
TRUNCATE TABLE TestDB.test.stageorders

SELECT* FROM AdventureWorks2012.Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2014;

EXEC sp_Test;

--Check if the stageorders table is empty after execuring sp_Test Stored Procedure
SELECT * FROM TestDB.test.stageorders


--Example 2: with parameter
USE AdventureWorks2012;

CREATE PROC sp_Getcustomer @Custid AS INT
AS
	SELECT * FROM Sales.Customer
	WHERE CustomerID = @Custid;

EXEC sp_Getcustomer 11000;


--Example 3 (with parameter and default value)
USE AdventureWorks2012;

CREATE PROC sp_GetOrdersByYear @orderyear AS INT
AS
	SELECT * FROM AdventureWorks2012.Sales.SalesOrderHeader
	WHERE YEAR(OrderDate) = @orderyear;

EXEC sp_GetOrdersByYear 2014;

--Default parameter value
CREATE PROCEDURE sp_GetordersByYear_default @orderyear INT = 2011
AS
	SELECT * FROM AdventureWorks2012.Sales.SalesOrderHeader
	WHERE YEAR(OrderDate) = @orderyear;

--executing without a value here will take the default value which is 2011
EXEC sp_GetordersByYear_default;

--Executing with a parameter value
EXEC sp_GetordersByYear_default 2014;





