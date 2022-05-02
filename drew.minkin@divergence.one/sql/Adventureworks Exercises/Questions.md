## Adventureworks SQL Exercises
_[Adapted from SQLZoo](https://sqlzoo.net/wiki)_
### Easy SQL Questions

1. Show the first name and the email address of customer with CompanyName 'Bike World'.

1. Show the CompanyName for all customers with an address in City 'Dallas'.

1. How many items with ListPrice more than $1000 have been sold?

1. Give the CompanyName of those customers with Total orders over $100000. Include the subtotal plus tax plus freight.

1. Find the number of left racing socks ('Racing Socks, L') ordered by CompanyName 'Riding Cycles'

### Medium SQL Questions
1. A "Single Item Order" is a customer order where only one item is ordered. Show the SalesOrderID and the UnitPrice for every Single Item Order.

1. Where did the racing socks go? List the product name and the CompanyName for all Customers who ordered ProductModel 'Racing Socks'.

1. Show the product description for culture 'fr' for product with ProductID 736.


1. Use the SubTotal value in SaleOrderHeader to list orders from the largest to the smallest. For each order show the CompanyName and the SubTotal and the total weight of the order.

1. How many products in ProductCategory 'Cranksets' have been sold to an address in 'London'?

### Hard SQL Questions
1. For every customer with a 'Main Office' in Dallas show AddressLine1 of the 'Main Office' and AddressLine1 of the 'Shipping' address - if there is no shipping address leave it blank. Use one row per customer.

1. For each order show the SalesOrderID and SubTotal calculated three ways:
A) From the SalesOrderHeader
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
1. List the SalesOrderNumber for the customer 'Good Toys' 'Bike World'

1. List the ProductName and the quantity of what was ordered by 'Futuristic Bikes'

1. List the name and addresses of companies containing the word 'Bike' (upper or lower case) and companies containing 'cycle' (upper or lower case). Ensure that the 'bike's are listed before the 'cycles's.

1. Show the total order value for each CountryRegion. List by value with the highest first.

1. Find the best customer in each region.    