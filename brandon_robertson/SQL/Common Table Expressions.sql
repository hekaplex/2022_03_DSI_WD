-- Common Table Expression
WITH
	Summary
		AS
		(
			SELECT
				V.VendorState
				,V.VendorName
				,SUM(I.InvoiceTotal) AS SumOfInvoices
			FROM
				Vendors V
			JOIN		Invoices AS I
				ON
						I.VendorID = V.VendorID
			GROUP BY
				V.VendorState
				,V.VendorName
		)
	,
	TopInState
	AS
		(
		SELECT
			VendorState
			,MAX(SumOfInvoices) MaxSumOfInvoices
		FROM
			Summary

			GROUP BY
				VendorState
	)