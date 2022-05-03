----TO HELP LOOK UP WHAT TABLE AND COLUMN TO QUERY AGAINST
---SELECT * from INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME like '%OrderQty%'

SELECT COUNT(*)
FROM Production.Product PP 
	JOIN Sales.SalesOrderDetail SS
	ON PP.ProductID = SS.ProductID
WHERE ListPrice > 1000;



SELECT SalesOrderID, MAX(UnitPrice) as UnitPrice
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING COUNT(*) = 1;


SELECT	SubTotal, TaxAmt, Freight, TotalDue
FROM Sales.SalesOrderHeader SS
	JOIN
	Sales.Customer SC														 
		ON SC.CustomerID = SS.CustomerID
WHERE TotalDue > 100000;




SELECT ProductModelID, Name
FROM Poduction.Product PP
	JOIN OrderQty
	Sales.SalesOrderDetail SS
		ON SS.ProductID = PP.ProductID
  WHERE Name = 'Racing Socks'