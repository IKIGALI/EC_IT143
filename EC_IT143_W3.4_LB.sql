/******************************************************************
NAME: EC_IT143_W3.4_LB.sql
PURPOSE: AdventureWorks Questions and Answers

MODIFICATION LOG:
Ver     Date        Author              Description
1.0     11/12/2026  Landry Bizimana     Initial Version

RUNTIME:
Less than 1 minute

NOTES:
Contains eight AdventureWorks questions and SQL answers.
******************************************************************/

USE AdventureWorks2022;
GO

------------------------------------------------------------------
-- Question 1
-- Original Author: Landry Bizimana
-- What are the ten most expensive products by list price?
------------------------------------------------------------------

SELECT TOP 10
    Name,
    ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;
GO

------------------------------------------------------------------
-- Question 2
-- Original Author: Landry Bizimana
-- How many products are available in the Product table?
------------------------------------------------------------------

SELECT COUNT(*) AS TotalProducts
FROM Production.Product;
GO

------------------------------------------------------------------
-- Question 3
-- Original Author: Nsima John
-- What are the five cheapest products by list price?
------------------------------------------------------------------

SELECT TOP 5
    Name,
    ListPrice
FROM Production.Product
ORDER BY ListPrice ASC;
GO

------------------------------------------------------------------
-- Question 4
-- Original Author: Nsima John
-- Which ten customers placed the most sales orders?
------------------------------------------------------------------

SELECT TOP 10
    CustomerID,
    COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY OrderCount DESC;
GO

------------------------------------------------------------------
-- Question 5
-- Original Author: Nsima John
-- Which customers have placed the most orders?
-- Show customer name, order count, and amount spent.
------------------------------------------------------------------

SELECT
    CustomerID,
    COUNT(*) AS OrderCount,
    SUM(TotalDue) AS TotalAmountSpent
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY OrderCount DESC;
GO

------------------------------------------------------------------
-- Question 6
-- Original Author: Nsima John
-- Which customers do not have a phone number on file?
-- Show full name and email address.
------------------------------------------------------------------

SELECT
    p.FirstName,
    p.LastName,
    ea.EmailAddress
FROM Person.Person p
INNER JOIN Person.EmailAddress ea
    ON p.BusinessEntityID = ea.BusinessEntityID
WHERE p.BusinessEntityID NOT IN
(
    SELECT BusinessEntityID
    FROM Person.PersonPhone
);
GO

------------------------------------------------------------------
-- Question 7
-- Original Author: Nsima John
-- List all AdventureWorks tables that contain
-- a column named SalesOrderID.
------------------------------------------------------------------

SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'SalesOrderID'
ORDER BY TABLE_NAME;
GO

------------------------------------------------------------------
-- Question 8
-- Original Author: Nsima John
-- Show the column names and data types
-- for the Product table.
------------------------------------------------------------------

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Production'
AND TABLE_NAME = 'Product'
ORDER BY ORDINAL_POSITION;
GO
