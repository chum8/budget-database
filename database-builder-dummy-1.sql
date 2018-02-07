DROP PROC IF EXISTS Budget.MonthlyReport;
DROP PROC IF EXISTS Budget.IncomeTotals;

DROP VIEW IF EXISTS Budget.IncomeExpenseList;
DROP VIEW IF EXISTS Budget.IncomeExpenseMonthlySummary;

DROP TABLE IF EXISTS Budget.Entities;
DROP TABLE IF EXISTS Budget.Items;
DROP TABLE IF EXISTS Budget.Debits;
DROP TABLE IF EXISTS Budget.Credits;
DROP TABLE IF EXISTS Budget.Assets;
DROP TABLE IF EXISTS Budget.Debts;

DROP SCHEMA IF EXISTS Budget;

GO
CREATE SCHEMA Budget
GO

CREATE TABLE Budget.Entities
(	
	EntityId	INT IDENTITY,
	Title		VARCHAR(35) NOT NULL,
		CONSTRAINT chum8_PK_Entities_EntityId PRIMARY KEY (EntityId)
);
CREATE TABLE Budget.Items
(
	ItemId		INT IDENTITY,	
	EntityId	INT,
	Title		VARCHAR(35) NOT NULL,
	Amount		DECIMAL(11,2) NOT NULL,
		CONSTRAINT chum8_PK_Budget_ItemId PRIMARY KEY (ItemId),
		CONSTRAINT chum8_CHK_Budget_EntityId CHECK (EntityId >= 0),
		CONSTRAINT chum8_CHK_Budget_Amount CHECK (Amount >= 0.00)
);
CREATE TABLE Budget.Debits
(
	DebitId		INT IDENTITY,
	ItemId		INT NOT NULL,
	Date		DATE NOT NULL,
		CONSTRAINT chum8_PK_Debits_DebitId PRIMARY KEY (DebitId),
		CONSTRAINT chum8_CHK_Debits_ItemId CHECK (ItemId >= 0)
);
CREATE TABLE Budget.Credits
(
	CreditId	INT IDENTITY,
	ItemId		INT NOT NULL,
	Date		DATE NOT NULL,
		CONSTRAINT chum8_PK_Credits_CreditId PRIMARY KEY (CreditId),
		CONSTRAINT chum8_CHK_Credits_ItemId CHECK (ItemId >= 0)
);
CREATE TABLE Budget.Assets
(
	AssetId		INT IDENTITY,
	ItemId		INT NOT NULL,
	Date		DATE NOT NULL,
		CONSTRAINT chum8_CHK_Assets_ItemId CHECK (ItemId >= 0)	
);
CREATE TABLE Budget.Debts
(
	DebtId		INT IDENTITY,
	ItemId		INT NOT NULL,
	Date		DATE NOT NULL,
		CONSTRAINT chum8_CHK_Assets_DebtId CHECK (DebtId >= 0)	
);

INSERT INTO Budget.Entities(	Title)
	VALUES	('City Car and Umbrella'),		--1
			('Long Life Insurance'),		--2
			('John Landlord'),				--3
			('City Smoke Utilities'),		--4
			('Water Purifiers LLC'),		--5
			('Trash Takeaway Disposal'),	--6
			('Divided Health'),				--7
			('American Wireless'),			--8
			('Bill Ya Cable and Internet'),	--9
			('Big Interest Loans'),			--10
			('My Comm College'),			--11
			('My Catholic School'),			--12
			('My Own LLC'),					--13
			('My Public School'),			--14
			('Fat Tails Bank'),				--15
			('Corner Cars'),				--16
			('My Bustling Credit Union'),	--17
			('My Charity Tax Deduction'),	--18
			('My Mutual Investment Co.'),	--19
			('Ripoff Credit Card'),			--20
			('Car Repair Spot'				--21
);
INSERT INTO Budget.Items(	Title,	Amount,	EntityId	)
	VALUES	(	'Insurance Porsche',	842.32,		1),		--1
			(	'Insurance Geo',		15.00,		1),		--2
			(	'House Rent',			770.00,		3),		--3
			(	'Utility Bill',	400.00,		4),		--4
			(	'Spring Utility Bill',	250.00,		4),		--5
			(	'Summer Utility Bill',	350.00,		4),		--6
			(	'Fall Utility Bill',	200.00,		4),		--7
			(	'Garbage Disposal',		50.00,		6),		--8
			(	'Health',				655.90,		7),		--9
			(	'Groceries',			1140.00,	NULL),	--10
			(	'Water System',			19.95,		5),		--11
			(	'Internet and Cable',   139.99,		9),		--12
			(	'Cell Phone',			110.25,		28),	--13
			(	'Life Insurance',		340.00,		2),		--14
			(	'Gasoline Commute',		185.00,		NULL),	--15
			(	'Car Payment',			266.63,		10),	--16
			(	'Employment Income',	4035.00,	13),	--17
			(	'Freelance Income',		689.00,		14),	--18
			(	'Kickback Income',		135.00,		11),	--19
			(	'Book Sale Royalties',	0.29,		11),	--20
			(	'Public Speech Income',	200.00,		12),	--21
			(	'Bank Balance',			8123.60,	15),	--22
			(	'Car Loan Payoff',		11424.79,	10),	--23
			(	'Repair Porsche',		4302.01,	16),	--24
			(	'CD Balance',			5011.49,	17),	--25
			(	'Roth IRA Balance',		27184.29,	19),	--26
			(	'Insurance Loan Payoff',663.00,		2),		--27
			(	'Credit Card Debt',		18529.94,	20),	--28
			(	'Donation',				1700.00,	18),	--29
			(	'Repair Geo',			318.29,		21),	--30
			(	'My New Job',			5284.80,	NULL),	--31
			(	'My New Job (Final)',	800.16,		NULL	--32
);

INSERT INTO Budget.Debits	(	ItemId,		Date	)	
	VALUES
--due each month
	--January
			(	4,	'01-04-9999'	),
			(	3,	'01-10-9999'	),
			(	9,	'01-28-9999'	),
			(	10,	'01-15-9999'	),
			(	11,	'01-28-9999'	),
			(	12,	'01-08-9999'	),
			(	13,	'01-23-9999'	),
			(	15,	'01-28-9999'	),
			(	16,	'01-15-9999'	),
	--February
			(	4,	'02-04-9999'	),
			(	3,	'02-10-9999'	),
			(	9,	'02-28-9999'	),
			(	10,	'02-15-9999'	),
			(	11,	'02-28-9999'	),
			(	12,	'02-08-9999'	),
			(	13,	'02-23-9999'	),
			(	15,	'02-28-9999'	),
			(	16,	'02-15-9999'	),
	--March
			(	4,	'03-04-9999'	),
			(	3,	'03-10-9999'	),
			(	9,	'03-28-9999'	),
			(	10,	'03-15-9999'	),
			(	11,	'03-28-9999'	),
			(	12,	'03-08-9999'	),
			(	13,	'03-23-9999'	),
			(	15,	'03-28-9999'	),
			(	16,	'03-15-9999'	),
	--April
			(	4,	'04-04-9999'	),
			(	3,	'04-10-9999'	),
			(	9,	'04-28-9999'	),
			(	10,	'04-15-9999'	),
			(	11,	'04-28-9999'	),
			(	12,	'04-08-9999'	),
			(	13,	'04-23-9999'	),
			(	15,	'04-28-9999'	),
			(	16,	'04-15-9999'	),
	--May
			(	4,	'05-04-9999'	),
			(	3,	'05-10-9999'	),
			(	9,	'05-28-9999'	),
			(	10,	'05-15-9999'	),
			(	11,	'05-28-9999'	),
			(	12,	'05-08-9999'	),
			(	13,	'05-23-9999'	),
			(	15,	'05-28-9999'	),
			(	16,	'05-15-9999'	),
	--June
			(	4,	'06-04-9999'	),
			(	3,	'06-10-9999'	),
			(	9,	'06-28-9999'	),
			(	10,	'06-15-9999'	),
			(	11,	'06-28-9999'	),
			(	12,	'06-08-9999'	),
			(	13,	'06-23-9999'	),
			(	15,	'06-28-9999'	),
			(	16,	'06-15-9999'	),
	--July
			(	4,	'07-04-9999'	),
			(	3,	'07-10-9999'	),
			(	9,	'07-28-9999'	),
			(	10,	'07-15-9999'	),
			(	11,	'07-28-9999'	),
			(	12,	'07-08-9999'	),
			(	13,	'07-23-9999'	),
			(	15,	'07-28-9999'	),
			(	16,	'07-15-9999'	),
	--August
			(	4,	'08-04-9999'	),
			(	3,	'08-10-9999'	),
			(	9,	'08-28-9999'	),
			(	10,	'08-15-9999'	),
			(	11,	'08-28-9999'	),
			(	12,	'08-08-9999'	),
			(	13,	'08-23-9999'	),
			(	15,	'08-28-9999'	),
			(	16,	'08-15-9999'	),
	--September
			(	4,	'09-04-9999'	),
			(	3,	'09-10-9999'	),
			(	9,	'09-28-9999'	),
			(	10,	'09-15-9999'	),
			(	11,	'09-28-9999'	),
			(	12,	'09-08-9999'	),
			(	13,	'09-23-9999'	),
			(	15,	'09-28-9999'	),
			(	16,	'09-15-9999'	),
	--October
			(	4,	'10-04-9999'	),
			(	3,	'10-10-9999'	),
			(	9,	'10-28-9999'	),
			(	10,	'10-15-9999'	),
			(	11,	'10-28-9999'	),
			(	12,	'10-08-9999'	),
			(	13,	'10-23-9999'	),
			(	15,	'10-28-9999'	),
			(	16,	'10-15-9999'	),
	--November
			(	4,	'11-04-9999'	),
			(	3,	'11-10-9999'	),
			(	9,	'11-28-9999'	),
			(	10,	'11-15-9999'	),
			(	11,	'11-28-9999'	),
			(	12,	'11-08-9999'	),
			(	13,	'11-23-9999'	),
			(	15,	'11-28-9999'	),
			(	16,	'11-15-9999'	),
	--December
			(	4,	'12-04-9999'	),
			(	3,	'12-10-9999'	),
			(	9,	'12-28-9999'	),
			(	10,	'12-15-9999'	),
			(	11,	'12-28-9999'	),
			(	12,	'12-08-9999'	),
			(	13,	'12-23-9999'	),
			(	15,	'12-28-9999'	),
			(	16,	'12-15-9999'	),

--due every other month
			(	8,	'01-28-9999'	),
			(	8,	'03-28-9999'	),
			(	8,	'05-28-9999'	),
			(	8,	'07-28-9999'	),
			(	8,	'09-28-9999'	),
			(	8,	'11-28-9999'	),

--due twice a year
			(	1,	'02-02-9999'	),
			(	1,	'08-02-9999'	),
			(	2,	'02-02-9999'	),
			(	2,	'08-02-9999'	),

--due once a year
			(	14,	'09-01-9999'	);

INSERT INTO Budget.Credits(	ItemId,	Date)
	VALUES	
		--Income
			(	17,	'01-28-9999'),
			(	18,	'01-28-9999'),
			(	17,	'02-28-9999'),
			(	17,	'03-28-9999'),
			(	17,	'04-28-9999'),
			(	18,	'02-28-9999'),
			(	18,	'03-28-9999'),
			(	18,	'04-28-9999'),
			(	19,	'05-10-9999'),
			(	20,	'05-10-9999'),
			(	21,	'03-28-9999'),
			(	20,	'06-10-9999'),
			(	21,	'06-10-9999'),
			(	20,	'07-10-9999'),
			(	21,	'07-10-9999'),
			(	31,	'08-10-9999'),
			(	31,	'09-10-9999'),
			(	31,	'10-10-9999'),
			(	31,	'11-10-9999'),
			(	32,	'12-10-9999'
);
INSERT INTO Budget.Debts(	ItemId,	Date)
	VALUES	(	23,	'01-01-9999'	),
			(	24,	'01-01-9999'	),
			(	27,	'01-01-9999'	),
			(	28,	'01-01-9999'	),
			(	29,	'01-01-9999'	),
			(	30,	'01-01-9999'
);
INSERT INTO Budget.Assets(	ItemId,	Date)
	VALUES	(	22,	'01-01-9999'	),
			(	25,	'01-01-9999'	),
			(	26,	'01-01-9999'
);