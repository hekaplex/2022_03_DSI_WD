SELECT 
	Order_ID
	, Origin_Port
	, Carrier
	, Product_ID
	, Plant_Code
	, Unit_quantity
	, Weight
FROM 
	OrderList
	GROUP BY
		Origin_Port