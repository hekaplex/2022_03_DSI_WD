USE AP_DH22;

IF OBJECT_ID('InvoiceCopy') IS NOT NULL
	DROP TABLE InvoiceCopy
--SELECT...INTO
SELECT 
	*
INTO InvoiceCopy
FROM Invoices

SELECT OBJECT_ID('InvoiceCopy')

SELECT COUNT(*) FROM InvoiceCopy

--Insert
INSERT INTO InvoiceCopy
VALUES
--[InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]
(98, '456789', '2022-03-31', 8344.50, 0, 0, 1, '2022-03-31', NULL);

SELECT * FROM InvoiceCopy

--MutliRow Insert

--Select into MetaData Only
SELECT 
	*
Into InvcoiceEmpty
FROM Invoices
WHERE 1 =2

--Update Simple

SELECT * FROM InvoiceCopy

BEGIN TRAN
UPDATE
	InvoiceCopy
--ALWAYS DO A SELECT oF new/old version of volumns before UPDATE or DELETE
SET
	PaymentDate = '2022-04-01'
	,PaymentTotal = 19351.18
WHERE 
	InvoiceNumber = '97/522'

--ROLLBACK -- (UNDO)
--COMMMIT

SELECT VendorID ,LastName ,FirstName FROM ContactUpdates
EXCEPT
SELECT VendorID ,[VendorContactLName], [VendorContactFName] FROM VendorCopy
SELECT
	*
Into
	VendorCopy
FROM
	Vendors

--preflight check
SELECT
	vc.[VendorContactLName]
	,vs.LastName
	,vc.[VendorContactFName]
	vs.FirstName
FROM
	VendorCopy vc
		JOIN
		Vendors vc
			ON
				vc.VendorID = vs.VendorID
--Complex Update
UPDATE
	VC
	VendorCopy
	SET
	[VendorContactLName] = LastName
	,[VendorContactFName] = FirstName
FROM
	VendorCopy vc
		JOIN
		Vendors vc
			ON
				vc.VendorID = vs.VendorID

--DELETE
DELETE 
	InvoiceCopy
WHERE
	VendorID =
		(
			SELECT
				VendorID
			FROM
				VendorCopy
			WHERE
				VendorName = 'BlueCross'
		)

--ROWCOUNT
SET ROWCOUNT 0
SELECT COUNT(*) FROM Invoices

--Complex DELETE
DELETE
	ic
FROM
	InvoiceCopy ic
		JOIN
			VendorCopy
				ON ic.VendorID = vc.VendorID
			WHERE
				vc.VendorName = 'BlueCross'

--MERGE
SELECT * FROM [dbo].[InvoiceArchive]
MERGE INTO InvoiceArchive ia
USING InvoiceCopy ic
ON ia.InvoiceID = ic.InvoiceID
WHEN MATCHED
	AND ic.PaymentDate IS NOT NULL
	AND ic.PaymentTotal > ia.PaymentTotal
	THEN
		UPDATE SET
		ia.PaymentTotal = ic.PaymentTotal
		,ia.PaymentDate = ic.PaymentDate
		,ia.CreditTotal = ic.CreditTotal;
--Left Outer Join With Null From Source = INSERT
WHEN NOT MATCHED
	THEN
		INSERT([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate])
		VALUES(ic.[InvoiceID], [ic.VendorID], [ic.InvoiceNumber], [ic.InvoiceDate], [ic.InvoiceTotal], [ic.PaymentTotal], [ic.CreditTotal], [ic.TermsID], [ic.InvoiceDueDate], [ic.PaymentDate]
		--RightOuterJoinWithDelete
		WHEN NOT MATCHED BY SOURCE
