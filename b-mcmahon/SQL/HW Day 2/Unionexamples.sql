SELECT * FROM Investors

	SELECT 'Gain' AS Source, LastName, FirstName, Investments, NetGain
	FROM Investors
	WHERE NetGain > 0
UNION
	SELECT 'Loss' AS Source, LastName, FirstName, Investments, NetGain
	FROM Investors
	WHERe NetGain < 0 
ORDER BY NetGain DESC;