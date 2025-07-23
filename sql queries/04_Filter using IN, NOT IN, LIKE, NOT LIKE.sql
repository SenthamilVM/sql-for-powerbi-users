--Write a query to bring all records from customer table where id is 1 or 5 or 7
USE AdventureWorks2012

SELECT * FROM Sales.Customer
WHERE CustomerID IN (1,5,7);

--Check table
SELECT * FROM Person.Person
--find unique persontype
SELECT DISTINCT(PersonType) As Uniquetype FROM Person.Person

--get list of different persontype using OR
SELECT * FROM Person.Person
WHERE PersonType = 'IN' OR PersonType = 'SP' OR PersonType = 'SC';

--Use IN operator instead of OR
SELECT * FROM Person.Person
WHERE PersonType IN ('IN', 'SP', 'SC');

--Use NOT IN
SELECT * FROM Person.Person
WHERE PersonType NOT IN ('IN', 'SP', 'SC');

--Use LIKE operator (firstname starts with Rob)
SELECT * FROM Person.Person
WHERE FirstName LIKE 'Rob%';

--First Name contains Rob
SELECT * FROM Person.Person
WHERE FirstName LIKE '%Rob%';

--Use NOT LIKE Operator
SELECT * FROM Person.Person
WHERE FirstName NOT LIKE 'Rob%';

