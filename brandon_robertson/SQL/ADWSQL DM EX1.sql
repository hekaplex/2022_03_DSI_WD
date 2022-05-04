WITH ReAndNet
AS
(
Select DISTINCT SalesOrderLineNumber
FROM FactResellerSales F
JOIN DimProduct P
ON F.ProductKey = P.ProductKey
WHERE P.ListPrice > 1000
UNION
Select DISTINCT SalesOrderLineNumber
FROM FactInternetSales I
JOIN DimProduct P
ON I.ProductKey = P.ProductKey
WHERE P.ListPrice > 1000
)

SELECT COUNT(*)
FROM ReAndNet