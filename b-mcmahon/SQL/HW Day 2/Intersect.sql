	SELECT InvoiceID, VendorID, InvoiceNumber, InvoiceTotal
	FROM InvoiceArchive
INTERSECT
	SELECT InvoiceID, VendorID, InvoiceNumber, InvoiceTotal 
	FROM Invoices;