SELECT VendorId, InvoiceID, InvoiceDate AS [Date Posted], 
InvoiceDueDate AS [Date Due],
DATEADD(DAY,15,InvoiceDueDate) AS [Net 15],
DATEADD(DAY,30,InvoiceDueDate) AS [Net 30],
DATEADD(DAY,90,InvoiceDueDate) AS [Net 90],
(InvoiceTotal - PaymentTotal) + CreditTotal AS [Balance Due]
FROM Invoices
WHERE PaymentTotal - InvoiceTotal NOT LIKE '0.00'
ORDER BY [Balance Due] DESC
go

Select 
	VendorId, 
	VendorName,
	VendorCity + ', ' + VendorState + ', ' + VendorZipCode AS Address
From Vendors
Order By VendorContactLName + VendorContactFName
go

Select
	TOP 20 InvoiceLineItemAmount,
	InvoiceLineItemDescription
FROM InvoiceLineItems
Order By InvoiceLineItemAmount DESC