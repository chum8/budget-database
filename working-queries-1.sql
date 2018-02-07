/*SELECT * FROM Budget.IncomeExpenseList
	ORDER BY Date
*/
/*
SELECT * FROM Budget.IncomeExpenseMonthlySummary
	ORDER BY Month
*/
--EXEC Budget.IncomeTotals 1, 2

--EXEC Budget.MonthlyReport

/*SELECT DATENAME(Month, C.Date), I.Title, I.Amount FROM Budget.Items AS I
	INNER JOIN Budget.Credits AS C
		ON I.ItemId = C.ItemId
	ORDER BY Month(C.Date)
*/

/*
SELECT MONTH(C.Date) [Month], SUM(I.Amount) [Income] FROM Budget.Items AS I
	INNER JOIN Budget.Credits AS C
		ON I.ItemId = C.ItemId
GROUP BY MONTH(C.Date)
ORDER BY MONTH(C.Date)
*/
/*
SELECT I.Title [Description], I.Amount [Expense] FROM Budget.Items AS I
	INNER JOIN Budget.Debits AS D
		ON I.ItemId = D.ItemId
WHERE MONTH(D.Date) = 3
*/

