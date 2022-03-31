-- This is an exists clause. (NOT EXISTS IN EXAMPLE)
-- Vendors without invoices.
SELECT
	V.VendorCity
	,V.VendorState
	,V.VendorName
FROM
	Vendors V
	WHERE NOT EXISTS
	(
		SELECT 
		*
		FROM
			Invoices AS I
				WHERE
					I.VendorID = V.VendorID
	)