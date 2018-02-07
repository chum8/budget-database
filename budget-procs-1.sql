CREATE OR ALTER PROC Budget.IncomeTotals
	@LMonth INT = 1,
	@UMonth INT = 12
AS

	SELECT	SUM(Credit) [Credit], SUM(Debit) [Debit], SUM(Tithe) [Tithe], SUM([Income Difference]) [Income Difference],
			SUM(Asset) [Asset],	SUM(Debt) [Debt], SUM([Asset/Debt Difference]) [Asset/Debt Difference], SUM(Balance) [Balance]
	FROM Budget.IncomeExpenseMonthlySummary
	WHERE Month >= @LMonth AND Month <= @UMonth
GO

CREATE OR ALTER PROC Budget.MonthlyReport
AS
SELECT DATENAME(Month, N'9999-' + CAST(Month as NVARCHAR) + N'-01') [Month of Year], Credit, Debit, Tithe, [Income Difference],
		Asset,	Debt, [Asset/Debt Difference], Balance [Monthly Balance], SUM(Balance) OVER(ORDER BY month ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) [Running Balance]
	FROM Budget.IncomeExpenseMonthlySummary
	GROUP BY Month, Balance, Credit, Debit, Tithe, [Income Difference], Asset, Debt, [Asset/Debt Difference], Balance
	ORDER BY Month
GO
/*
--Another way of achieving the same thing. 
CREATE OR ALTER PROC Budget.MonthlyReport
AS

	SELECT DATENAME(Month, N'9999-' + CAST(Month as NVARCHAR) + N'-01'), SUM(Credit) [Credit], SUM(Debit) [Debit], SUM(Tithe) [Tithe], SUM([Income Difference]) [Income Difference],
		SUM(Asset) [Asset],	SUM(Debt) [Debt], SUM([Asset/Debt Difference]) [Asset/Debt Difference], SUM(Balance) [Monthly Balance], SUM(Balance) OVER(ORDER BY month ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) [Running Balance]
	FROM Budget.IncomeExpenseMonthlySummary
	GROUP BY Month, Balance
	ORDER BY Month
GO
*/