SELECT
	InvoiceID,
	InvoiceLineItemAmount,
	InvoiceLineItemDescription
		as HighCharges
FROM 
	InvoiceLineItems
WHERE
	InvoiceLineItemAmount > 100
GO
select count(*) from Vendors

-- Charges over $100.00