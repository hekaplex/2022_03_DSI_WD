SELECT 
	Order_ID
	, Product_ID
	, Unit_quantity
	, Weight
	, minm_wgh_qty
	, max_wgh_qty
	, rate
	, rate_for_order = rate
FROM OrderList as o JOIN FreightCharge as f
    ON o.Origin_Port = f.orig_port_cd
