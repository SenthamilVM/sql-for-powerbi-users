USE TestDB

CREATE TABLE dbo.CustomerOrders
(
[Customerid] INT,
[Orderdate] DATE,
[CustomerName] VARCHAR(40),
[CourseName] VARCHAR(40),
[CustomerCity] VARCHAR(40),
[OrderAmount] MONEY
)

INSERT INTO dbo.CustomerOrders
(Customerid, Orderdate, CustomerName, CourseName, CustomerCity, OrderAmount)
VALUES
(1, CAST(N'2020-01-01' AS Date), 'Brian', 'DAX', 'Washington', 10),
(2, CAST(N'2020-02-01' AS Date), 'Dan', 'SQL', 'Perth', 20),
(1, CAST(N'2020-02-03' AS Date), 'Brian', 'Power BI', 'Islamabad', 30),
(3, CAST(N'2021-01-01'AS Date), 'Sam', 'PowerApps', 'Washington', 40),
(3, CAST(N'2021-02-01'AS Date), 'Sam', 'SQL', 'Perth', 50),
(3, CAST(N'2021-02-03' AS Date), 'Sam', 'DAX', 'Islamabad', 60),
(2, CAST(N'2021-02-01' As Date), 'Dan', 'DAX', 'Perth', 15),
(2, CAST(N'2021-01-01' AS Date), 'Dan', 'SQL', 'Perth', 40)

SELECT * FROM dbo.CustomerOrders

--Partition By CustomerName
SELECT *,
ROW_NUMBER() OVER(PARTITION BY CustomerName ORDER BY CustomerName) AS Customer_Partition
FROM dbo.CustomerOrders

--Get First order by Customer Name
SELECT *,
ROW_NUMBER() OVER(PARTITION BY CustomerName ORDER BY Orderdate) AS Customer_Partition
FROM dbo.CustomerOrders

--The following will throw an error
SELECT *,
ROW_NUMBER() OVER(PARTITION BY CustomerName ORDER BY Orderdate) AS Customer_Partition
FROM dbo.CustomerOrders
WHERE ROW_NUMBER() OVER(PARTITION BY CustomerName ORDER BY Orderdate) = 1;

--Error: Windowed functions can only appear in the SELECT or ORDER BY clauses.

SELECT *,
ROW_NUMBER() OVER(PARTITION BY CustomerName ORDER BY Orderdate) AS Customer_Partition
FROM dbo.CustomerOrders
WHERE Customer_Partition = 1;

--Error: Invalid column name 'Customer_Partition'.

--So, we need to use cte to use where clause here

;WITH C1 AS
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY CustomerName ORDER BY Orderdate) AS Customer_Partition
FROM dbo.CustomerOrders
)
SELECT * FROM C1 WHERE Customer_Partition = 1;

--Get latest order
;WITH C2 AS
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY CustomerName ORDER BY Orderdate DESC) AS rowno
FROM dbo.CustomerOrders
)
SELECT * FROM C2
WHERE rowno = 1;

--Get the highest order amount
SELECT *,
ROW_NUMBER() OVER(PARTITION BY CustomerName ORDER BY OrderAmount DESC) AS rowno
FROM dbo.CustomerOrders;