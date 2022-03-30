SELECT 
	InvoiceNumber,
	InvoiceTotal,
	TermsDueDays,
	DATEDIFF(day, InvoiceDate, PaymentDate)
		AS date_diff
FROM
	Invoices AS i JOIN Terms AS t
	ON i.TermsID=t.TermsID
Where
	DATEDIFF(day, InvoiceDate, PaymentDate) > TermsDueDays
