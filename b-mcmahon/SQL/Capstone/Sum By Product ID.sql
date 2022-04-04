SELECT 
	sum(Product_ID)
	, Unit_quantity
	, Weight
FROM	
	OrderList
GROUP BY 
	Product_ID