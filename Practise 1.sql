--Create a test Database
--Comment Ctrl + KC, Uncomment Ctrl+KU
--CREATE DATABASE TestDB

--Create below sample tables in TestDB
--USE TestDB
CREATE SCHEMA test
GO
CREATE TABLE test.product
(
ProductID int,
ProductName VARCHAR(10)
);

--Insert data into table
INSERT INTO test.product VALUES(1,'P1')
INSERT INTO test.product VALUES(2,'P2')
INSERT INTO test.product VALUES(3,'P3')
INSERT INTO test.product VALUES(4,'P4')
INSERT INTO test.product VALUES(5,'P5');

--Another method of writing
INSERT INTO test.product (ProductID, ProductName)
VALUES	(6,'P6'),(7,'P7');

INSERT INTO test.product (ProductID, ProductName)
VALUES	(8,'P6'),
		(9,'P7'),
		(10,'P8');

SELECT* FROM test.product


