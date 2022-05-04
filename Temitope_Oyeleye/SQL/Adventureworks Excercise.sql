----TO HELP LOOK UP WHAT TABLE AND COLUMN TO QUERY AGAINST
---SELECT * from INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME like '%Store%'

SELECT COUNT(*)
FROM Production.Product PP 
	JOIN Sales.SalesOrderDetail SS
	ON PP.ProductID = SS.ProductID
WHERE ListPrice > 1000
GO



SELECT SalesOrderID, MAX(UnitPrice) as UnitPrice
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING COUNT(*) = 1
GO


SELECT	SubTotal, TaxAmt, Freight, TotalDue
FROM Sales.SalesOrderHeader SS
	JOIN
	Sales.Customer SC														 
		ON SC.CustomerID = SS.CustomerID
WHERE TotalDue > 100000
GO




SELECT ProductModelID, Name, OrderQty
FROM Production.Product PP
	JOIN
	Sales.SalesOrderDetail SS
		ON SS.ProductID = PP.ProductID
		JOIN 
  WHERE Name LIKE 'Racing Socks%'
  GO


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



SELECT SS.Name StoreName, SUM(SubTotal) SubTotal, SUM(weight*orderqty) as total_weight
   FROM Sales.SalesOrderHeader SOH 
      JOIN Sales.Customer SC 
         ON SOH.CustomerID = SC.CustomerID
      JOIN Sales.SalesOrderDetail SOD 
         ON SOD.SalesOrderID = SOH.SalesOrderID
      JOIN Production.Product PD 
         ON SOD.productID = PD.ProductID
	  JOIN Sales.Store SS
	  ON SS.StoreID = SC.StoreID
	GROUP BY SS.Name
   ORDER BY Subtotal DESC

   USE [AdventureWorks2019]
GO

ALTER TABLE [Sales].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Person_PersonID] FOREIGN KEY([PersonID])
REFERENCES [Person].[Person] ([BusinessEntityID])
GO

ALTER TABLE [Sales].[Customer] CHECK CONSTRAINT [FK_Customer_Person_PersonID]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key constraint referencing Person.BusinessEntityID.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'CONSTRAINT',@level2name=N'FK_Customer_Person_PersonID'
GO

