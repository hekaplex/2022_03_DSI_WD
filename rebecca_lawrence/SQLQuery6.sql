SELECT * FROM dbo.Customers
SELECT CustID, CustFirstName, CustLastName,CustFirstName + ' ' + CustLastName AS FullName
FROM dbo.Customers;
SELECT CustState, COUNT (*)
FROM dbo.Customers
GROUP BY CustState 