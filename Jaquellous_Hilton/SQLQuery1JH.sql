-- --How many items with ListPrice more than $1000 have been sold?
--With REandI
--AS 
--(
--Select Distinct [SalesOrderNumber], SalesOrderLineNumber
--From FactResellerSales F
--Join DimProduct P
--On F.ProductKey = P.ProductKey
--Where P.ListPrice > 1000
--Union All

--Select Distinct [SalesOrderNumber], SalesOrderLineNumber
--From FactInternetSales I
--Join DimProduct P
--On I.ProductKey = P.ProductKey
--Where P.ListPrice > 1000
--)
--Select Count(*)
--From REandI
-- --How many items with ListPrice more than $1000 have been sold?

Select Distinct TotalProductCost
From FactInternetSales

Select Distinct SalesTerritoryRegion, Sum (SalesAmount) [Sum of all Sales]
From FactResellerSales FRS
Join DimSalesTerritory ST
On FRS.SalesTerritoryKey = ST.SalesTerritoryKey
Group by SalesTerritoryRegion
Order By Sum(Salesamount) Desc;