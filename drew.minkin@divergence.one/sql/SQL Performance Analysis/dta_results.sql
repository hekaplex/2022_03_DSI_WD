use [AdventureWorksDW2019]
go

CREATE NONCLUSTERED INDEX [_dta_index_FactFinance_9_1301579675__K6] ON [dbo].[FactFinance]
(
	[AccountKey] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

