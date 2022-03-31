Select 'SELECT '+''''+TABLE_NAME +''''+ ' AS tbl_name, COUNT(*) FROM '+TABLE_NAME+' AS QTY UNION' from INFORMATION_SCHEMA.TABLES

SELECT 'ContactUpdates' AS tbl_name, COUNT(*) FROM ContactUpdates AS QTY UNION
SELECT 'GLAccounts' AS tbl_name, COUNT(*) FROM GLAccounts AS QTY UNION
SELECT 'InvoiceArchive' AS tbl_name, COUNT(*) FROM InvoiceArchive AS QTY UNION
SELECT 'InvoiceLineItems' AS tbl_name, COUNT(*) FROM InvoiceLineItems AS QTY UNION
SELECT 'Invoices' AS tbl_name, COUNT(*) FROM Invoices AS QTY UNION
SELECT 'Terms' AS tbl_name, COUNT(*) FROM Terms AS QTY UNION
SELECT 'Vendors' AS tbl_name, COUNT(*) FROM Vendors AS QTY
GO