DROP VIEW IF EXISTS Summary
GO
CREATE  VIEW Summary

AS
WITH Expense AS
(
SELECT MONTH(C.Date) [Month], SUM(E.Amount) [Expense] FROM Budget.Debits AS C

	INNER JOIN Budget.Items AS E
		ON C.ItemId = E.ItemId
	GROUP BY MONTH(C.Date)
)
SELECT E.Month, E.Expense, SUM(I.Amount) [Income], SUM(I.Amount) - E.Expense [Difference] FROM Expense AS E
	INNER JOIN Budget.Credits AS C
		ON E.Month  = Month(C.Date)
	INNER JOIN Budget.Items AS I
		ON C.ItemId = I.ItemId
	GROUP BY E.Month, E.Expense
GO

SELECT SUM(Income) [Income], SUM(Expense) [Expense], SUM(Difference) [Difference] FROM Summary
