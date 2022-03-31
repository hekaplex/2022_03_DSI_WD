SELECT RepID, SalesYear, SalesTotal AS Productivity,
SUM(SalesTotal) OVER(PARTITION BY SalesYear) AS ByYear,
SalesTotal / SUM(SalesTotal) OVER(PARTITION BY SalesYear) AS [Percent Total by Year]
FROM SalesTotals
ORDER BY SalesYear, RepID;