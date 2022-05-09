-- Question 1. How many items with ListPrice more than $1000 have been sold?
WITH ReAndNet -- Common Table Expression Begin
AS
( --CTE Query
Select DISTINCT SalesOrderNumber, SalesOrderLineNumber
FROM FactResellerSales F
JOIN DimProduct P
ON F.ProductKey = P.ProductKey
WHERE P.ListPrice > 1000
UNION ALL
Select DISTINCT SalesOrderNumber, SalesOrderLineNumber
FROM FactInternetSales I
JOIN DimProduct P
ON I.ProductKey = P.ProductKey
WHERE P.ListPrice > 1000
) -- CTE Query End

SELECT COUNT(*)
FROM ReAndNet
-- Question 1. How many items with ListPrice more than $1000 have been sold?

-- Question 2. Give the State/Province Name of those customers with Total orders over $100000. Include the subtotal plus tax plus freight.
SELECT SalesTerritoryRegion, SUM(SalesAmount) [Sum of All Sales]
FROM FactResellerSales FRS
JOIN DimSalesTerritory ST
ON FRS.SalesTerritoryKey = ST.SalesTerritoryKey
GROUP BY SalesTerritoryRegion
ORDER BY SUM(SalesAmount) DESC;