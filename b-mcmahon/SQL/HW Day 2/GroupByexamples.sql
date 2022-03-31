SELECT RepID, SUM(SalesTotal) AS Productivity
FROM SalesTotals
GROUP BY RepID
HAVING SUM(SalesTotal) > 10000
ORDER BY Productivity DESC;