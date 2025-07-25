USE TestDB
GO
CREATE TABLE dbo.Names
(
ID INT,
FirstName VARCHAR(40),
LastName VARCHAR(40)
);


--Creating a temporary table. Temp table starts with #
--This will be available locally to this particular session
--Once this session is closed, it will no longer be available.

CREATE TABLE #NAMES
(
ID INT,
FirstName VARCHAR(40),
LastName VARCHAR(40)
)

SELECT * FROM #NAMES

--Dropping Temp table
DROP TABLE #NAMES;

--INSERT 1 Record
INSERT INTO #NAMES
(ID, FirstName, LastName)
VALUES (1, 'Dean', 'Jones')

--Insert Multiple values

INSERT INTO #NAMES
(ID, FirstName, LastName)
VALUES
(2, 'John', 'Black'),
(3, 'Mary', 'Smith'),
(4,'Brian','Smith')

--Update Records
--Update John's ID to 10

UPDATE #NAMES
SET ID = 10
WHERE FirstName = 'John';

SELECT * FROM #NAMES

--DELETE

DELETE FROM #NAMES
WHERE ID = 3;

--TRUNCATE Table -- Empty the table
TRUNCATE TABLE #NAMES

--DROP TABLE
DROP TABLE #NAMES


--Creating a table on the fly
USE TestDB
GO
SELECT * INTO dbo.SalesCopy
FROM dbo.Sales

SELECT * FROM dbo.SalesCopy

--Copying subset
DROP TABLE dbo.SalesCopy

SELECT * INTO dbo.SalesCopy
FROM dbo.Sales
WHERE productID = 1;
