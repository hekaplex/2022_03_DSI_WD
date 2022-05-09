----TO HELP LOOK UP WHAT TABLE AND COLUMN TO QUERY AGAINST
---SELECT * from INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME like '%Weight%'


--Easy Q1. How many items with ListPrice more than $1000 have been sold?
SELECT COUNT(*)
FROM Production.Product PP 
	JOIN Sales.SalesOrderDetail SS
	ON PP.ProductID = SS.ProductID
WHERE ListPrice > 1000
GO


---Easy Q2. Give the Store Name of those customers with Total orders over $100000. Include the subtotal plus tax plus freight.
SELECT	SubTotal, TaxAmt, Freight, TotalDue
FROM Sales.SalesOrderHeader SS
	JOIN
	Sales.Customer SC														 
		ON SC.CustomerID = SS.CustomerID
WHERE TotalDue > 100000
GO

---Medium Q1. A "Single Item Order" is a customer order where only one item is ordered. Show the SalesOrderID and the UnitPrice for every Single Item Order
SELECT SalesOrderID, MAX(UnitPrice) as UnitPrice
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING COUNT(*) = 1
GO

--- Medium Q2. Where did the racing socks go? List the product name and the Store Name for all Customers who ordered ProductModel 'Racing Socks'.
SELECT ProductModelID, Name, OrderQty
FROM Production.Product PP
	JOIN
	Sales.SalesOrderDetail SS
		ON SS.ProductID = PP.ProductID
  WHERE Name LIKE 'Racing Socks%'
  GO

---Medium Q4. Show the product description for culture 'fr' for product with ProductID 736.
 SELECT
	Description 
	FROM Production.ProductDescription PD
	JOIN
	Production.ProductModelProductDescriptionCulture PM
		ON PD.ProductDescriptionID = PM.ProductDescriptionID
	JOIN
		Production.Product PP
		ON PP.ProductModelID = PM.ProductModelID
	WHERE ProductID = 736 AND CultureID = 'fr'
GO


---Medium Q4. Use the SubTotal value in SaleOrderHeader to list orders from the largest to the smallest.
---For each order show the Store Name and the SubTotal and the total weight of the order.
SELECT SS.Name StoreName, SUM(SubTotal) SubTotal, SUM(weight*orderqty) as total_weight
   FROM Sales.SalesOrderHeader SOH 
      JOIN Sales.Customer SC 
         ON SOH.CustomerID = SC.CustomerID
	  JOIN Sales.Store SS
	  ON SOH.SalesPersonID = SS.SalesPersonID
      JOIN Sales.SalesOrderDetail SOD 
         ON SOD.SalesOrderID = SOH.SalesOrderID
      JOIN Production.Product PD 
         ON SOD.productID = PD.ProductID
	GROUP BY SS.Name
   ORDER BY Subtotal DESC
   GO


   ---Medium Q5. How many products in ProductCategory 'Components' have been sold to an address in 'London'?
   SELECT SUM(OrderQTY)
	FROM 

