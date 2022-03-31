SELECT 
	DATEDIFF(day, InvoiceDate, PaymentDate)
		AS date_diff
FROM
	Invoices
Where
	InvoiceID > 1
GO
select count(*) from Vendors

-- Time from invoice to payment, and any outstanding amounts
