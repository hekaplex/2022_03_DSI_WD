SELECT
	InvoiceNumber,
	InvoiceDate,
	CreditTotal
FROM
	PaidInvoices
WHERE
	InvoiceDate BETWEEN '2019-11-01' AND '2020-12-01'
ORDER BY 
	InvoiceDate