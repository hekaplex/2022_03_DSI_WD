---SELECT * from INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME like '%Product%'
--- Medium Q4. How many products via Internet in ProductCategory 'Components' have been sold to an address in 'London' in UK?
SELECT COUNT (*)
FROM [dbo].[FactInternetSales] FI
	JOIN 
	[dbo].[DimCustomer] DC
	ON FI.CustomerKey = DC.CustomerKey
	JOIN
	[dbo].[DimGeography] DG
	ON DG.GeographyKey = DC.GeographyKey
	JOIN
	[dbo].[DimProduct] DP
	ON DP.ProductKey = FI.ProductKey
	JOIN
	[dbo].[DimProductSubcategory] DPS
	ON DPS.ProductSubcategoryKey = DP.ProductSubcategoryKey
	JOIN
	[dbo].[DimProductCategory] DPC
	ON DPC.ProductCategoryKey = DPS.ProductCategoryKey
WHERE EnglishProductCategoryName = 'Components' and StateProvinceName = 'London'
GO


---Hard Q3 Show the best selling item by value. 
SELECT ProductLine, MAX(OrderQuantity)
FROM
	[dbo].[FactResellerSales] FR
	JOIN
	[dbo].[DimProduct] DP
	ON FR.ProductKey = DP.ProductKey
----Not working, will revisit later
	
	
	



---Hard Q*. Find the best customer in each Sales Territory Region in Internet Sales. 
SELECT COUNT (*)
	FROM [dbo].[DimSalesTerritory] DS
	JOIN
	[dbo].[FactInternetSales] FI
	ON FI.SalesTerritoryKey = DS.SalesTerritoryKey
	JOIN
	[dbo].[DimCustomer] DC
	ON DC.CustomerKey = FI.CustomerKey
	AGGREGATE f
