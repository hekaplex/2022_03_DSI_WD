## AdventureworksDW SQL Exercises
_[Adapted from SQLZoo](https://sqlzoo.net/wiki)_

### _Note: Be sure to include both Internet AND Reseller Sales_ 

 
### Easy SQL Questions

1. How many items with ListPrice more than $1000 have been sold?
    Step 1: union Internet & reseller sales
    Step 2: filter  > 1000 on OrderlineNumber
    Step 3: count total ordernumber+orderlinenumber


1. Give the Sales Territory Region Name with Total orders for the region over $100000. Include the subtotal plus tax plus freight.

    Step 1: union Internet & reseller sales
    Step 2: Add tax + frieght to Order Amount per order
    Step 3: Join with Sales Territory 
    Step 4: Aggregate by terrotory region
    Step 5: Filter for orders > $10000

1. A "Single Item Order" is a customer order where only one item is ordered. Show the SalesOrderNumber and the UnitPrice for every Single Item Order.
    Step 1: union Internet & reseller sales
    Step 2: aggrgate SalesOrderNumber for SUm of salesAmount and use HAVING for Count(*) = 1

1. Show the French product description for product with Product alternate key 'FR-M94S-42'.

### Medium SQL Questions

1. Where did the racing socks go? List the product name and the State for all Customers, total orders and total amount of product  'Racing Socks' sold who ordered ProductModel 'Racing Socks' for Internet sales.

    Step 1: Join Geography, Customers, Internet Sales and Product
    Step 2: filter for models with 'Racing Socks' using LIKE
    Step 3: Aggregate by State 


1. Use the SubTotal value in SaleOrderHeader to list orders from the largest to the smallest. For each order show the State/Province Name and the SubTotal and the total weight of the order.

1. How many products in ProductCategory 'Components' have been sold to an address in 'London'?

### Hard SQL Questions
1. For every customer with a 'Main Office' in Dallas show AddressLine1 of the 'Main Office' and AddressLine1 of the 'Shipping' address - if there is no shipping address leave it blank. Use one row per customer.

1. For each order show the SalesOrderNumber and SubTotal calculated three ways:
A) From the SalesOrderNumber
B) Sum of OrderQty*UnitPrice
C) Sum of OrderQty*ListPrice

1. Show the best selling item by value.

1. Show how many orders are in the following ranges (in $):

    | RANGE | Num Orders |
    | ----------- | ----------- |  
    | 0 - 99 | |
    | 100- 999 | |
    | 1000-9999 | |
    | 10000+ | |

1. List the name and addresses of companies containing the word 'Bike' (upper or lower case) and companies containing 'cycle' (upper or lower case). Ensure that the 'bike's are listed before the 'cycles's.

1. Show the total order value for each Sales Territory Region. List by value with the highest first.

1. Find the best customer in each Sales Territory Region.    
