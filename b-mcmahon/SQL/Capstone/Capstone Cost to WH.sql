SELECT 
	Product_ID
	, Destination_Port
	, Unit_quantity
	, Cost/Unit
	, Unit_quantity * Cost/Unit = Order_ship_cost	
FROM 
	OrderList as o
	JOIN
		WHCosts as w
			ON 
				o.Plant_Code = w.WH	