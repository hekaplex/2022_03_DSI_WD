SELECT
	InvoiceID,
	VendorID,
	InvoiceDate,
	InvoiceTotal,
	PaymentDate
FROM
	PaidInvoices
ORDER BY 
	InvoiceTotal

-- Orders by Invoice Total