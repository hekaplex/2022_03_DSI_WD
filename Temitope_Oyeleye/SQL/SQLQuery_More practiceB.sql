SELECT OrganizationKey, COUNT(*) AS FinanceCount,
    SUM(Amount) AS AmountTotal
FROM FActFinance
GROUP BY (OrganizationKey);

--Identifying largest 0.02% FinanceKey ordered by amt desc
SELECT 
		TOP 0.02 percent
		FinanceKey
		,DateKey
		,OrganizationKey
        ,Date
        ,Amount
        FROM
		FActFinance
	ORDER BY Amount DESC
    GO