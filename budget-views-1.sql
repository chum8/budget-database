CREATE OR ALTER VIEW Budget.IncomeExpenseList
AS
WITH Debits AS
(
	SELECT I.Title [Description], D.Date [Date], I.Amount [Debit]
		FROM Budget.Debits AS D
			INNER JOIN Budget.Items AS I
				ON D.ItemId = I.ItemId
),
Credits AS
(
	SELECT I.Title [Description], C.Date [Date], I.Amount [Credit], CAST(I.Amount / 10 AS NUMERIC(12, 2)) [Tithe]
		FROM Budget.Credits AS C
			INNER JOIN Budget.Items AS I
				ON C.ItemId = I.ItemId
),
Assets AS
(
	SELECT I.Title [Description], A.Date [Date], I.Amount [Asset]
		FROM Budget.Assets AS A
			INNER JOIN Budget.Items AS I
				ON A.ItemId = I.ItemId
),
Debts AS
(	
	SELECT I.Title [Description], D.Date [Date], I.Amount [Debt]
		FROM Budget.Debts AS D
			INNER JOIN Budget.Items AS I
				ON D.ItemId = I.ItemId
)
SELECT Description, Date, 0 [Credit], 0 [Tithe], 0 [Debit], Asset [Asset], 0 [Debt] FROM Assets

	UNION

SELECT Description, Date, 0 [Credit], 0 [Tithe], 0 [Debit], 0 [Asset], Debt [Debt] FROM Debts

	UNION
	
SELECT Description, Date, Credit [Credit], Tithe [Tithe], 0 [Debit], 0 [Asset], 0 [Debt] FROM Credits

	UNION

SELECT Description, Date, 0 [Credit], 0 [Tithe], Debit [Debit], 0 [Asset], 0 [Debt] FROM Debits

GO

CREATE OR ALTER VIEW Budget.IncomeExpenseMonthlySummary
AS
SELECT MONTH(Date) [Month], SUM(Credit) [Credit],
	SUM(Tithe) [Tithe], SUM(Debit) [Debit], SUM(Credit) - SUM(Tithe) - SUM(Debit) [Income Difference],
	SUM(Asset) [Asset], SUM(Debt) [Debt], SUM(Asset) - SUM(Debt) [Asset/Debt Difference], (SUM(Credit) - SUM(Tithe) - SUM(Debit)) + (SUM(Asset) - SUM(Debt)) [Balance]
FROM Budget.IncomeExpenseList
GROUP BY MONTH(Date)
GO