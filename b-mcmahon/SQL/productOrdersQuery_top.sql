/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [OrderID]
      ,[ItemID]
      ,[Quantity]
  FROM [ProductOrders].[dbo].[OrderDetails]