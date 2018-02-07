DROP VIEW IF EXISTS Summary
GO
CREATE  VIEW Summary

AS
WITH Expense AS
(
SELECT MONTH(C.Due) [Month], SUM(E.Amount) [Expense] FROM Budget.Calendar AS C

	INNER JOIN Budget.Items AS E
		ON C.ItemId = E.ItemId
		AND C.CodeId = 0
	GROUP BY MONTH(C.Due)
)
SELECT E.Month, E.Expense, SUM(I.Amount) [Income], SUM(I.Amount) - E.Expense [Difference] FROM Expense AS E
	INNER JOIN Budget.Calendar AS C
		ON E.Month  = Month(C.Due)
	INNER JOIN Budget.Items AS I
		ON C.ItemId = I.ItemId
			AND C.CodeId = 1
	GROUP BY E.Month, E.Expense
GO

SELECT SUM(Income) [Income], SUM(Expense) [Expense], SUM(Difference) [Difference] FROM Summary
