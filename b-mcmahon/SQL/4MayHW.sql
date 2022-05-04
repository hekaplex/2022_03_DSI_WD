--USE ADVENTUREWORKS2020 DATABASE

/* 
1. How many items with ListPrice more than $1000 have been sold?
*/
SELECT SUM(orderquantity) AS Reseller_Over_$1000
FROM dbo.FactResellerSales
WHERE UnitPrice > 1000;

SELECT SUM(orderquantity) AS Internet_Over_$1000
FROM dbo.FactInternetSales
WHERE UnitPrice > 1000;

/* 
2. Give the Store Name of those customers with Total orders over $100000. Include the subtotal plus tax plus freight.
*/
--There is no store name associated with internet sales (which have the freight charges), I just went with the Customerkey
SELECT customerkey, (SUM(SalesAmount)+SUM(TaxAmt)+SUM(Freight)) AS total_sales
FROM FactInternetSales JOIN DimReseller 
GROUP BY CustomerKey
ORDER BY total_sales DESC;

/* 
3. A "Single Item Order" is a customer order where only one item is ordered. Show the SalesOrderID and the UnitPrice for every Single Item Order.
*/
SELECT salesordernumber, UnitPrice
FROM FactInternetSales
WHERE OrderQuantity = 1;

/* 
4. Where did the racing socks go? List the product name and the Store Name for all Customers who ordered ProductModel 'Racing Socks'.
*/
SELECT englishproductname, ResellerName
FROM FactResellerSales fs JOIN DimProduct dp ON fs.ProductKey = dp.ProductKey
    JOIN DimReseller ds ON fs.ResellerKey = ds.ResellerKey
WHERE EnglishProductName LIKE '%racing%';

/* 
5. Show the product description for culture 'fr' for product with ProductID 736.
*/
--Rertuns nothing
SELECT FrenchDescription
FROM DimProduct
WHERE ProductKey = 736

/* 
6. Use the SubTotal value in SaleOrderHeader to list orders from the largest to the smallest. For each order show the Store Name and the SubTotal and the total weight of the order.
*/


/* 
7. How many products in ProductCategory 'Components' have been sold to an address in 'London'?
*/


/* 
8. For every customer with a 'Main Office' in Dallas show AddressLine1 of the 'Main Office' and AddressLine1 of the 'Shipping' address - if there is no shipping address leave it blank. Use one row per customer.
*/


/* 
9. For each order show the SalesOrderID and SubTotal calculated three ways: A) From the SalesOrderHeader B) Sum of OrderQtyUnitPrice C) Sum of OrderQtyListPrice
*/


/* 
10. Show the best selling item by value.
*/