--This is the example. I am having trouble doing this on my own so far

SELECT VendorState, VendorCity, VendorZipCode, 
       COUNT(*) AS QtyVendors
FROM Vendors
WHERE VendorState IN ('IA', 'NJ')
GROUP BY GROUPING SETS(ROLLUP(VendorState, VendorCity), VendorZipCode)
ORDER BY VendorState DESC, VendorCity DESC;