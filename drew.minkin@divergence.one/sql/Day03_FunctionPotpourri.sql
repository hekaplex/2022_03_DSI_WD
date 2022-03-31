Use Examples;

SELECT
	--Divergence	Minkin, D.
	VendorName
	,VendorContactLName
		+', '
		+ LEFT(VendorContactFName,1)
		+ '.'
			AS ContactName
	--(209) 555-7785
	,VendorPhone
	,SUBSTRING(VendorPhone,2,3) As AreaCode
	,SUBSTRING(VendorPhone,7,3) As Prefix
	,SUBSTRING(VendorPhone,11,4) As Extension
FROM
Vendors
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
ORDER BY CAST(ID AS int)
;
--text breaking
SELECT 
	[Name]
	,LEFT([Name],CHARINDEX(' ',[Name]) -1) AS FirstName
	,RIGHT([Name],LEN([Name]) - CHARINDEX(' ',[Name])) AS LastName
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
	, (R - ROUND(R,2)) * 10000000000 AS Precision_Invisible
	,ROUND(R,2) AS [Rounded_2_digits]
	,ROUND(R,2,1) AS [Rounded_2_digits_truncate_or_floor]
FROM
	RealSample
WHERE 
	ROUND(R,2) = 1
;
SELECT 
	*
	,CAST(StartDate AS time)
FROM
	DateSample
WHERE CAST(StartDate AS time) = '10:00:00' 

SELECT 
	*
FROM
	DateSample
	;

SELECT 
	*
	,DATEPART(SECOND,StartDate) SEC
	,DATEPART(MINUTE,StartDate) MIN
	,DATEPART(HOUR,StartDate)   HOU
	,CONVERT(time, StartDate)	time
FROM
	DateSample
WHERE DATEPART(HOUR,StartDate)  BETWEEN 9 AND 13

use AP;

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
		AS terms
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
		AS NetDue
FROM 
Invoices

SELECT
	VendorID
	,SUM(InvoiceTotal) as SumInvoices
	,CASE
		WHEN SUM(InvoiceTotal) < 1000 THEN 'Low'
		ELSE 'High'
	END
FROM	
	Invoices
GROUP BY
	VendorID
;
SELECT
	VendorID
	,SUM(InvoiceTotal) as SumInvoices
	,IIF(SUM(InvoiceTotal) < 1000, 'Low','High')
FROM	
	Invoices
GROUP BY
	VendorID
;
SELECT
	InvoiceNumber
	,InvoiceTotal as SumInvoices
	,InvoiceDate
	,InvoiceDueDate
	,DATEDIFF(DAY,InvoiceDueDate,GETDATE()) PastDueDays
	,CASE
		WHEN DATEDIFF(DAY,InvoiceDueDate,'2016-04-01') > 30 THEN 'Over 30 days past due'
		WHEN DATEDIFF(DAY,InvoiceDueDate,'2016-04-01') > 0 THEN '1 - 30 days past due'
		ELSE 'Current'
	END
FROM	
	Invoices
;
SELECT
	 V.VendorName
	,I.InvoiceNumber
	,I.InvoiceTotal 
	,I.InvoiceDate
	,COALESCE(CAST(InvoiceTotal as varchar),'No Invoices') as InvoiceTotalCoalesce
	,ISNULL(CAST(InvoiceTotal as varchar),'No Invoices') as InvoiceTotalISNULL
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
			ELSE
				VendorState
		END
		AS	VendorState
	, 
		CASE
			WHEN
			GROUPING(VendorCity) = 1
			THEN 'All Cities'
			ELSE
				VendorCity
		END
		AS	VendorCity
	,  COUNT(*) AS QtyVendors
FROM Vendors
WHERE VendorState IN ('IA', 'NJ')
GROUP BY 
	VendorState
	, VendorCity 
	WITH ROLLUP
ORDER BY 
	VendorState DESC
	, VendorCity DESC;

SELECT
	VendorName
	,VendorState
	,ROW_NUMBER() OVER ( ORDER BY VendorName) As RowNum_Name
	,ROW_NUMBER() OVER ( ORDER BY VendorState ) As RowNum_State
	,ROW_NUMBER() OVER ( PARTITION BY VendorState ORDER BY VendorName) As RowNumber
FROM Vendors
