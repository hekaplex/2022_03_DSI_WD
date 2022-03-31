-- This was an example given by the instructor on subqueries using the ANY and ALL clauses.
SELECT
	I.InvoiceNumber [Invoice #]
	,I.InvoiceTotal [Invoice Total]
	,I.InvoiceDate [Date Posted]
	,V.VendorName [Vendor]
FROM
	Invoices AS I
	JOIN
		Vendors V
		ON
			I.VendorID = V.VendorID
WHERE
		InvoiceTotal > ALL
		(
			SELECT
			I.InvoiceTotal [Invoice Total]
			FROM
			Invoices AS I
			WHERE
				I.VendorID = 20
		)
ORDER BY [Invoice Total] ASC;