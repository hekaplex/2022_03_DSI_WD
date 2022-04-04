SELECT
	Product_ID
	, SUM(Unit_quantity)
	, SUM(Weight)
FROM
	OrderList
GROUP BY 
	Product_ID
ORDER BY 
	Product_ID ASC