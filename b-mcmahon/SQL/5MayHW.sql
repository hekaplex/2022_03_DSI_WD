/*
## AdventureworksDW SQL Exercises
_[Adapted from SQLZoo](https://sqlzoo.net/wiki)_

### _Note: Be sure to include both Internet AND Reseller Sales_ 
*/
/*
Easy SQL Questions
1. How many items with ListPrice more than $1000 have been sold?
*/
WITH
    ReAndNet
    AS
    (
                    Select DISTINCT SalesOrderLineNumber
            FROM FactResellerSales F
                JOIN DimProduct P
                ON F.ProductKey = P.ProductKey
            WHERE P.ListPrice > 1000
        UNION
            Select DISTINCT SalesOrderLineNumber
            FROM FactInternetSales I
                JOIN DimProduct P
                ON I.ProductKey = P.ProductKey
            WHERE P.ListPrice > 1000

    )

SELECT COUNT(*)
FROM ReAndNet
/*
2. Give the State/Province Name of those customers with Total orders over $100000. Include the subtotal plus tax plus freight.
*/
/*
2. Give the State/Province Name of those customers with Total orders over $100000. 
Include the subtotal plus tax plus freight.

   > 1. Union Internet & reseller sales NO
   > 1. Add tax + freight to Order Amount per order
   > 1. Join with Sales Territory 
   > 1. Aggregate by terrotory region
   > 1. Filter for orders > $100000
*/
SELECT top 1
    *
from dbo.FactInternetSales
SELECT top 1
    *
from dbo.DimCustomer
SELECT top 1
    *
from dbo.DimGeography

    SELECT *
    FROM dbo.FactInternetSales
UNION
    SELECT *
    FROM dbo.FactResellerSales

WITH 
	total_sales
AS
(
(SELECT CustomerKey, (SUM(SalesAmount) + SUM(TaxAmt) + SUM(Freight))
FROM FactInternetSales
GROUP BY CustomerKey)
)
SELECT stateprovincecode
FROM dbo.DimCustomer dc
    Join dbo.DimGeography dg ON dc.GeographyKey = dg.GeographyKey
    JOIN dbo.FactInternetSales fs ON dc.CustomerKey = fs.CustomerKey
WHERE (fs.SalesAmount + fs.TaxAmt + fs.Freight) > 1000;

/*
### Medium SQL Questions
1. A "Single Item Order" is a customer order where only one item is ordered. Show the SalesOrderNumber and the UnitPrice for every Single Item Order.
*/
    SELECT salesordernumber, SUM(salesamount)
    FROM dbo.FactInternetSales
    GROUP BY salesordernumber
    HAVING COUNT(SalesOrderNumber) = 1 AND SUM(OrderQuantity) = 1
Union
    SELECT salesordernumber, SUM(salesamount)
    FROM dbo.FactResellerSales
    GROUP BY salesordernumber
    HAVING COUNT(SalesOrderNumber) = 1 AND SUM(OrderQuantity) = 1;

/*
2. Where did the racing socks go? List the product name and the Store Name for all Customers who ordered ProductModel 'Racing Socks'.
*/


/*
3. Show the French product description for product with Product alternate key 'FR-M94S-42'.
*/
SELECT FrenchDescription
FROM DimProduct
WHERE ProductAlternateKey = 'FR-M94S-42';
/*
4. Use the SubTotal value in SaleOrderHeader to list orders from the largest to the smallest. For each order show the State/Province Name and the SubTotal and the total weight of the order.
*/

/*
5. How many products in ProductCategory 'Components' have been sold to an address in 'London'?
*/
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE column_name LIKE '%productcategory%';

SELECT top 1
    *
from dbo.FactInternetSales-- customerkey, productkey,
--SELECT top 1 * from DimCustomer--geographykey, customerkey
--SELECT * from DimGeography where city LIKE '%london%'--geographykey, city
SELECT top 1
    *
from DimProduct--productkey, 
SELECT top 1
    *
from DimProductCategory--productcategorykey, englishproductcategoryname

SELECT COUNT(englishproductcategoryname)
FROM dbo.FactInternetSales fis JOIN DimCustomer dc ON fis.CustomerKey = dc.CustomerKey
    JOIN DimGeography dg ON dc.GeographyKey = dg.GeographyKey
    JOIN DimProduct dp ON fis.ProductKey = dp.ProductKey
    JOIN DimProductCategory dpc ON dp.ProductKey = dpc.ProductCategoryKey
WHERE englishproductcategoryname = 'Components' AND city = 'London'


/*
### Hard SQL Questions
1. For every customer with a 'Main Office' in Dallas show AddressLine1 of the 'Main Office' and AddressLine1 of the 'Shipping' address - if there is no shipping address leave it blank. Use one row per customer.
*/

/*
2. For each order show the SalesOrderNumber and SubTotal calculated three ways:
A) From the SalesOrderNumber
B) Sum of OrderQty*UnitPrice
C) Sum of OrderQty*ListPrice
3. Show the best selling item by value.
4. Show how many orders are in the following ranges (in $):
    | RANGE | Num Orders |
    | ----------- | ----------- |  
    | 0 - 99 | |
    | 100- 999 | |
    | 1000-9999 | |
    | 10000+ | |

5. List the name and addresses of companies containing the word 'Bike' (upper or lower case) and companies containing 'cycle' (upper or lower case). Ensure that the 'bike's are listed before the 'cycles's.
6. Show the total order value for each Country/Region. List by value with the highest first.
7. Find the best customer in each Country/Region.    
*/