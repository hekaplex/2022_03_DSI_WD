USE Examples_DH22;

SELECT
	--divergence	Hinman, D.
	VendorName
	,VendorContactLName
		+ '.'
		+ LEFT(VendorContactFName,1)
		+ '.'
			AS ContactName
	--(918) 906-5601
	,VendorPhone
	,SUBSTRING(VendorPhone,2,3) AS AreaCode
	,SUBSTRING(VendorPhone,11,4) AS Extension
FROM Vendors
	WHERE SUBSTRING(VendorPhone,2,3) = 800
;
SELECT
	*
FROM 
	StringSample
ORDER BY ID
;
SELECT 
	*
FROM
	StringSample
ORDER BY CAST(ID AS INT)
;
--Text Breaking
SELECT
	LEFT([Name],CHARINDEX(' ',[Name]) -1) AS FirstName
	,Right([Name],LEN([Name]) - CHARINDEX(' ',[Name])) AS LastName
	,LEN([Name]) NameLength
	,CHARINDEX(' ',[Name]) SpacePosition
FROM
	StringSample

;
SELECT
	*
FROM
	RealSample
WHERE R BETWEEN 0.99 AND 1.01
;
SELECT
	*
	, (R - ROUND(R,2)) * 1000000000 AS Precision_Invisible
	,ROUND(R,2) AS [Rounded_2_Digits]
	,ROUND(R,2,1) AS[Rounded_2_Digits_Truncate_or_Floor]
FROM
	RealSample
WHERE
	ROUND(R,2) = 1
;
SELECT
	*
	,CAST(StartDate AS Time)
FROM
	DateSample
WHERE CAST(StartDate AS Time) = '10:00:00'
;
SELECT
	*
	,DATEPART(SECOND, StartDate)
	,DATEPART(MINUTE, StartDate) 
	,DATEPART(HOUR, StartDate)
	,CONVERT(Time, StartDate)
FROM
	DateSAmple
WHERE DATEPART(HOUR, StartDate) BETWEEN 9 AND 13
;

USE AP_DH22;

SELECT
InvoiceNumber
,TermsID
,CASE TermsID
	WHEN 1 THEN 'Net due 10 days	10'
	WHEN 2 THEN 'Net due 20 days	20'
	WHEN 3 THEN 'Net due 30 days	30'
	WHEN 4 THEN 'Net due 60 days	60'
	WHEN 5 THEN 'Net due 90 days	90'
	END
FROM
Invoices
;
SELECT
InvoiceNumber
,TermsID
,CHOOSE( TermsID
	,'Net due 10 days	10'
	,'Net due 20 days	20'
	,'Net due 30 days	30'
	,'Net due 60 days	60'
	,'Net due 90 days	90'
	)
FROM
Invoices
;
SELECT
	VendorID
	,SUM(InvoiceTotal) AS SumInvoices
	,CASE
		WHEN SUM(InvoiceTotal) < 1000 THEN 'LOW'
		ELSE 'HIGH'
	END
FROM
	Invoices
GROUP BY
	VendorID
;
SELECT
	InvoiceNumber
	,InvoiceTotal AS SumInvoices
	,InvoiceDate
	,InvoiceDueDate
	,DATEDIFF(DAY,InvoiceDueDate,GETDATE()) PastDueDays
	,CASE
		WHEN DATEDIFF(DAY,InvoiceDueDate,GETDATE()) > 30 THEN 'Over 30 Days Past Due'
		WHEN DATEDIFF(DAY,InvoiceDueDate,GETDATE()) > 0  THEN '1-30 Days Past Due'
		ELSE 'CURRENT'
	END
FROM
	Invoices

;
SELECT
	InvoiceNumber
	,InvoiceTotal AS SumInvoices
	,InvoiceDate
	,InvoiceDueDate
	,DATEDIFF(DAY,InvoiceDueDate,GETDATE()) PastDueDays
	,CASE
		WHEN DATEDIFF(DAY,InvoiceDueDate,'2016-04-01') > 30 THEN 'Over 30 Days Past Due'
		WHEN DATEDIFF(DAY,InvoiceDueDate,'2016-04-01') > 0 THEN '1-30 Days Past Due'
		ELSE 'CURRENT'
	END
FROM
	Invoices
;
SELECT
	V.VendorName
	,I.InvoiceNumber
	,I.InvoiceTotal
	,I.InvoiceDate
	,COALESCE(CAST(InvoiceTotal AS VarChar),'No Invoices') AS InvoiceTotalCoalesce
	,ISNUll(CAST(InvoiceTotal AS VarChar),'No Invoices') AS InvoiceTotalisNULL
FROM
	Vendors V
	LEFT JOIN
		Invoices I
		ON I.VendorID = V.VendorID
;
SELECT
	CASE
		WHEN
			GROUPING(VendorState) = 1
			THEN 'All States'
			ELSE	VendorCity
		END
		AS VendorState
	,CASE
		WHEN
			GROUPING(VendorCity) = 1
			THEN 'All Cities'
			ELSE	VendorCity
		END
		AS VendorCity
	, COUNT(*) AS QtyVendors
FROM Vendors
;
Select
	VendorName
	,VendorState
	,ROW_NUMBER() OVER ( ORDER BY VendorName) AS RowNum_Name
	,ROW_NUMBER() OVER ( ORDER BY VendorState) AS RowNum_State
	,ROW_NUMBER() OVER (PARTITION BY VendorState ORDER BY VendorName) AS RowNumber
FROM Vendors

--
SELECT
	TermsDescription
	,TermsID
	,NTILE(2) OVER (ORDER BY TermsID) AS Tile2
	,NTILE(3) OVER (ORDER BY TermsID) AS Tile3
	,NTILE(4) OVER (ORDER BY TermsID) AS Tile4
FROM Terms

WITH
	InvTile
	AS
	(Select
		InvoiceTotal
		,NTILE(3) OVER (ORDER BY InvoiceTotal) AS InvoiceTotalTile
	FROM
		Invoices
	)
SELECT
	MIN(InvoiceTotal) AS MIN_InvoiceTotal
	,AVG(InvoiceTotal) AS AVG_InvoiceTotal
	,MAX(InvoiceTotal) AS MAX_InvoiceTotal
	,STDEV(InvoiceTotal) AS STD_InvoiceTotal
	,COUNT(*) AS InvQty
FROM
	InvTile
GROUP BY
	InvoiceTotalTile
ORDER BY 1 DESC

USE Examples_DH22

GO
SELECT
[RepID]
,[SalesYear]
,[SalesTotal]
--,LAG([SalesTotal],1,0) OVER (PARTITION BY [RepID] ORDER BY [SalesYear])	AS LastSales
--,[SalesTotal] - LAG([SalesTotal],1,0) OVER (PARTITION BY [RepID] ORDER BY [SalesYear])AS ChangeFromLastSales
--, ([SalesTotal] - LAG([SalesTotal],1,0) OVER (PARTITION BY [RepID] ORDER BY [SalesYear]) AS ChangeFromLastSales
--,PERCENT_RANK() OVER (PARTITION BY [SalesYear] ORDER BY [SalesTotal]) AS PctRank	
--,CUME_DIST() OVER (PARTITION BY [SalesYear] ORDER BY [SalesTotal]) AS CumeDist
,CUME_DIST() OVER (ORDER BY [SalesTotal]) AS CumeDistHistorical	
,NTILE(3) OVER (ORDER BY [SalesTotal]) AS CumeDistHistoricalQuartile	
,NTILE(100) OVER (ORDER BY [SalesTotal]) AS CumeDistHistoricalPercentile
--median = 50 percentile
	,PERCENTILE_CONT(.5) WITHIN GROUP ( ORDER BY [SalesTotal]) OVER (PARTITION BY 1) AS PctContHistorical
	,PERCENTILE_CONT(.5) WITHIN GROUP ( ORDER BY [SalesTotal]) OVER (PARTITION BY [SalesYear]) AS YearlyMedianContinuous
	--,PERCENTILE_CONT(.5) WITHIN GROUP ( ORDER BY [SalesTotal]) OVER (PARTITION BY 1) AS PctDISCHistorical
	--,PERCENTILE_CONT(.5) WITHIN GROUP ( ORDER BY [SalesTotal]) OVER (PARTITION BY [SalesYear]) AS YearlyMedianDISC
FROM SalesTotals
ORDER BY SalesTotal

