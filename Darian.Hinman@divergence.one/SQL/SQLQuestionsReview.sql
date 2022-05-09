--Q1
SELECT COUNT(*)
FROM Production.Product PP 
	JOIN Sales.SalesOrderDetail SS
	ON PP.ProductID = SS.ProductID
WHERE ListPrice > 1000

--Q2
SELECT	SubTotal, TaxAmt, Freight, TotalDue
FROM Sales.SalesOrderHeader SS
	JOIN
	Sales.Customer SC														 
		ON SC.CustomerID = SS.CustomerID
WHERE TotalDue > 100000

--Q3
SELECT SalesOrderID, MAX(UnitPrice) as UnitPrice
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING COUNT(*) = 1

--Q4
--Q5

SELECT COUNT(*), City
FROM Production.ProductCategory PC
JOIN Person.Address 
WHERE Person.Address[City] = 'London'