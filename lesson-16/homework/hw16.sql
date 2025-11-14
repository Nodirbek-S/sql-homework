-------------------------------------------------lesson_16_homeworks--------------------------------------------------------
drop table if exists employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES
(1, 1, 'John', 'Doe', 60000.00),
(2, 1, 'Jane', 'Smith', 65000.00),
(3, 2, 'James', 'Brown', 70000.00),
(4, 3, 'Mary', 'Johnson', 75000.00),
(5, 4, 'Linda', 'Williams', 80000.00),
(6, 2, 'Michael', 'Jones', 85000.00),
(7, 1, 'Robert', 'Miller', 55000.00),
(8, 3, 'Patricia', 'Davis', 72000.00),
(9, 4, 'Jennifer', 'García', 77000.00),
(10, 1, 'William', 'Martínez', 69000.00);

drop table if exists sales
CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    EmployeeID INT,
    ProductID INT,
    SalesAmount DECIMAL(10, 2),
    SaleDate DATE
);
INSERT INTO Sales (SalesID, EmployeeID, ProductID, SalesAmount, SaleDate) VALUES
-- January 2025
(1, 1, 1, 1550.00, '2025-01-02'),
(2, 2, 2, 2050.00, '2025-01-04'),
(3, 3, 3, 1250.00, '2025-01-06'),
(4, 4, 4, 1850.00, '2025-01-08'),
(5, 5, 5, 2250.00, '2025-01-10'),
(6, 6, 6, 1450.00, '2025-01-12'),
(7, 7, 1, 2550.00, '2025-01-14'),
(8, 8, 2, 1750.00, '2025-01-16'),
(9, 9, 3, 1650.00, '2025-01-18'),
(10, 10, 4, 1950.00, '2025-01-20'),
(11, 1, 5, 2150.00, '2025-02-01'),
(12, 2, 6, 1350.00, '2025-02-03'),
(13, 3, 1, 2050.00, '2025-02-05'),
(14, 4, 2, 1850.00, '2025-02-07'),
(15, 5, 3, 1550.00, '2025-02-09'),
(16, 6, 4, 2250.00, '2025-02-11'),
(17, 7, 5, 1750.00, '2025-02-13'),
(18, 8, 6, 1650.00, '2025-02-15'),
(19, 9, 1, 2550.00, '2025-02-17'),
(20, 10, 2, 1850.00, '2025-02-19'),
(21, 1, 3, 1450.00, '2025-03-02'),
(22, 2, 4, 1950.00, '2025-03-05'),
(23, 3, 5, 2150.00, '2025-03-08'),
(24, 4, 6, 1700.00, '2025-03-11'),
(25, 5, 1, 1600.00, '2025-03-14'),
(26, 6, 2, 2050.00, '2025-03-17'),
(27, 7, 3, 2250.00, '2025-03-20'),
(28, 8, 4, 1350.00, '2025-03-23'),
(29, 9, 5, 2550.00, '2025-03-26'),
(30, 10, 6, 1850.00, '2025-03-29'),
(31, 1, 1, 2150.00, '2025-04-02'),
(32, 2, 2, 1750.00, '2025-04-05'),
(33, 3, 3, 1650.00, '2025-04-08'),
(34, 4, 4, 1950.00, '2025-04-11'),
(35, 5, 5, 2050.00, '2025-04-14'),
(36, 6, 6, 2250.00, '2025-04-17'),
(37, 7, 1, 2350.00, '2025-04-20'),
(38, 8, 2, 1800.00, '2025-04-23'),
(39, 9, 3, 1700.00, '2025-04-26'),
(40, 10, 4, 2000.00, '2025-04-29'),
(41, 1, 5, 2200.00, '2025-05-03'),
(42, 2, 6, 1650.00, '2025-05-07'),
(43, 3, 1, 2250.00, '2025-05-11'),
(44, 4, 2, 1800.00, '2025-05-15'),
(45, 5, 3, 1900.00, '2025-05-19'),
(46, 6, 4, 2000.00, '2025-05-23'),
(47, 7, 5, 2400.00, '2025-05-27'),
(48, 8, 6, 2450.00, '2025-05-31'),
(49, 9, 1, 2600.00, '2025-06-04'),
(50, 10, 2, 2050.00, '2025-06-08'),
(51, 1, 3, 1550.00, '2025-06-12'),
(52, 2, 4, 1850.00, '2025-06-16'),
(53, 3, 5, 1950.00, '2025-06-20'),
(54, 4, 6, 1900.00, '2025-06-24'),
(55, 5, 1, 2000.00, '2025-07-01'),
(56, 6, 2, 2100.00, '2025-07-05'),
(57, 7, 3, 2200.00, '2025-07-09'),
(58, 8, 4, 2300.00, '2025-07-13'),
(59, 9, 5, 2350.00, '2025-07-17'),
(60, 10, 6, 2450.00, '2025-08-01');

drop table if exists products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    CategoryID INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, CategoryID, ProductName, Price) VALUES
(1, 1, 'Laptop', 1000.00),
(2, 1, 'Smartphone', 800.00),
(3, 2, 'Tablet', 500.00),
(4, 2, 'Monitor', 300.00),
(5, 3, 'Headphones', 150.00),
(6, 3, 'Mouse', 25.00),
(7, 4, 'Keyboard', 50.00),
(8, 4, 'Speaker', 200.00),
(9, 5, 'Smartwatch', 250.00),
(10, 5, 'Camera', 700.00);


---------------------------------------------------------------
CREATE TABLE Numbers1(Number INT)

INSERT INTO Numbers1 VALUES (5),(9),(8),(6),(7)

-------------------------------------------------------------------

CREATE TABLE Example
(
Id       INTEGER IDENTITY(1,1) PRIMARY KEY,
String VARCHAR(30) NOT NULL
);


INSERT INTO Example VALUES('123456789'),('abcdefghi');


---------------------------------------------------------------------

CREATE TABLE FindSameCharacters
(
     Id INT
    ,Vals VARCHAR(10)
)
 
INSERT INTO FindSameCharacters VALUES
(1,'aa'),
(2,'cccc'),
(3,'abc'),
(4,'aabc'),
(5,NULL),
(6,'a'),
(7,'zzz'),
(8,'abc')



------------------------------------------------------------------------------------------------------------------
/*1. Create a numbers table using a recursive query from 1 to 1000. */

	-- Recursive CTE to generate numbers from 1 to 1000
WITH Numbers AS (
    SELECT 1 AS Number
    UNION ALL
    SELECT Number + 1
    FROM Numbers
    WHERE Number < 1000
)
SELECT Number
FROM Numbers
OPTION (MAXRECURSION 1000);  -- Allow recursion up to 1000 levels


/*2. Write a query to find the total sales per employee using a derived table.(Sales, Employees) */
	drop table if exists dt
	
	select employeeid,
		sum(salesamount) as total_employee from sales
	group by employeeid
	
	select sales_table.employeeid, total_employee, departmentid, firstname, lastname,salary from (select employeeid,
		sum(salesamount) as total_employee from sales
	group by employeeid) as sales_table join employees on sales_table.employeeid=employees.employeeid

/*3. Create a CTE to find the average salary of employees.(Employees) */

with cte as(
select *from employees
)
select avg(salary) as avg_salary from cte

/*4. Write a query using a derived table to find the highest sales for each product.(Sales, Products) */

select productid,
	max(salesamount) as max from sales
group by productid

select *from (select productid,
	max(salesamount) as max from sales
group by productid) as s join products p on s.productid=p.productid

/*5. Beginning at 1, write a statement to double the number for each record, 
the max value you get should be less than 1000000. */


WITH DoubledNumbers AS (
    SELECT 1 AS Num
    UNION ALL
    SELECT Num * 2
    FROM DoubledNumbers
    WHERE Num * 2 < 1000000
)
SELECT Num
FROM DoubledNumbers
ORDER BY Num
OPTION (MAXRECURSION 100); -- Limit recursion to avoid infinite loops

/*6. Use a CTE to get the names of employees who have made more than 5 sales.(Sales, Employees)*/

with cte as(
	select employeeid, 
		count(salesid) as amount_sales from sales
	group by employeeid
	)
	select *from cte
	where amount_sales>5

/*7. Write a query using a CTE to find all products with sales greater than $500.(Sales, Products) */

with cte as(
	select productid,
		sum(salesamount) as sales_amount from sales
	group by productid
	)
	select *from cte
	where sales_amount>500

/*8. Create a CTE to find employees with salaries above the average salary.(Employees) */



with cte as(
select avg(salary) as avg_salary from employees
)
select e.employeeid, e.firstname, e.lastname, e.salary from employees e
cross join cte c 
where e.salary>c.avg_salary; 

/* Medium Tasks/ 1. Write a query using a derived table to find the top 5 employees by the number of orders made.
(Employees, Sales) */
	
	select * from 
		(select employeeid, sum(salesamount) as sales_grouped from sales group by employeeid) as dt order by sales_grouped desc
		OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY



/*2. Write a query using a derived table to find the sales per product category.(Sales, Products)*/

select *from 
(select  productid, 
	sum(salesamount) as sales_amount from sales
group by productid) as dt join products p on dt.productid=p.productid

/*3. Write a script to return the factorial of each value next to it.(Numbers1) */
	
	-- Recursive CTE to compute factorials
WITH FactorialCTE AS (
    SELECT 
        Number AS OriginalNumber,
        Number AS CurrentValue,
        1 AS Factorial
    FROM Numbers1

    UNION ALL

    SELECT 
        OriginalNumber,
        CurrentValue - 1,
        Factorial * CurrentValue
    FROM FactorialCTE
    WHERE CurrentValue > 1
)

-- Final selection: get the last factorial value per number
SELECT 
    OriginalNumber AS Number,
    MAX(Factorial) AS Factorial
FROM FactorialCTE
GROUP BY OriginalNumber
ORDER BY OriginalNumber;

/*4. This script uses recursion to split a string into rows of substrings for each character in the string.(Example)*/


DECLARE @InputString VARCHAR(100) = 'HELLO';

WITH CharSplitter AS (
    SELECT 
        1 AS Position,
        SUBSTRING(@InputString, 1, 1) AS Character,
        LEN(@InputString) AS TotalLength
    UNION ALL
    SELECT 
        Position + 1,
        SUBSTRING(@InputString, Position + 1, 1),
        TotalLength
    FROM CharSplitter
    WHERE Position + 1 <= TotalLength
)

SELECT Position, Character
FROM CharSplitter
ORDER BY Position;

OPTION (MAXRECURSION 100);

/*5. Use a CTE to calculate the sales difference between the current month and the previous month.(Sales)*/
	
	with cte as(
	select month(saledate) as months,
		sum(salesamount) as sales_amount from sales s
	group by month(saledate)
	)
	select * from cte



	WITH MonthlySales AS (
    SELECT 
        FORMAT(SaleDate, 'yyyy-MM') AS SaleMonth,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY FORMAT(SaleDate, 'yyyy-MM')
),
SalesWithDifference AS (
    SELECT 
        m1.SaleMonth,
        m1.TotalSales,
        LAG(m1.TotalSales) OVER (ORDER BY m1.SaleMonth) AS PreviousMonthSales
    FROM MonthlySales m1
)
SELECT 
    SaleMonth,
    TotalSales,
    PreviousMonthSales,
    TotalSales - ISNULL(PreviousMonthSales, 0) AS SalesDifference
FROM SalesWithDifference
ORDER BY SaleMonth;

/*6. Create a derived table to find employees with sales over $45000 in each quarter.(Sales, Employees)*/
-- Step 1: Count how many qualifying quarters each employee has
WITH QuarterlySales AS (
    SELECT 
        EmployeeID,
        DATEPART(QUARTER, SaleDate) AS Quarter,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID, DATEPART(QUARTER, SaleDate)
),
Qualified AS (
    SELECT EmployeeID
    FROM QuarterlySales
    WHERE TotalSales > 45000
    GROUP BY EmployeeID
    HAVING COUNT(*) = 4  -- All 4 quarters passed
)
SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName
FROM Employees e
JOIN Qualified q ON e.EmployeeID = q.EmployeeID;

--Difficult Tasks
	/*1. This script uses recursion to calculate Fibonacci numbers */
	-- Generate the first N Fibonacci numbers using recursion
WITH FibonacciCTE AS (
    SELECT 
        1 AS Position,
        0 AS FibValue
    UNION ALL
    SELECT 
        2 AS Position,
        1 AS FibValue
    UNION ALL
    SELECT 
        Position + 1,
        Prev.FibValue + Curr.FibValue
    FROM FibonacciCTE Curr
    JOIN FibonacciCTE Prev ON Curr.Position = Prev.Position + 1
    WHERE Curr.Position < 30  -- Limit to avoid infinite recursion
)
SELECT Position, FibValue
FROM FibonacciCTE
ORDER BY Position
OPTION (MAXRECURSION 100);

/*Find a string where all characters are the same and the length is greater than 1.(FindSameCharacters)*/

SELECT *
FROM FindSameCharacters
WHERE 
    Vals IS NOT NULL
    AND LEN(Vals) > 1
    AND LEN(Vals) = LEN(REPLACE(Vals, LEFT(Vals, 1), ''));

	/*Create a numbers table that shows all numbers 1 through n and their order gradually increasing 
	by the next number in the sequence.
	(Example:n=5 | 1, 12, 123, 1234, 12345)*/

	DECLARE @n INT = 5;

WITH NumberBuild AS (
    SELECT 
        1 AS Step,
        CAST('1' AS VARCHAR(MAX)) AS Sequence
    UNION ALL
    SELECT 
        Step + 1,
        Sequence + CAST(Step + 1 AS VARCHAR)
    FROM NumberBuild
    WHERE Step + 1 <= @n
)
SELECT Step, Sequence
FROM NumberBuild
OPTION (MAXRECURSION 100);

/*Write a query using a derived table to find the employees who have made the most sales in the last 6 months.
(Employees,Sales)*/

SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    s.TotalSales
FROM Employees e
JOIN (
    SELECT 
        EmployeeID,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    WHERE SaleDate >= DATEADD(MONTH, -6, GETDATE())
    GROUP BY EmployeeID
) s ON e.EmployeeID = s.EmployeeID
WHERE s.TotalSales = (
    SELECT MAX(SumSales)
    FROM (
        SELECT 
            EmployeeID,
            SUM(SalesAmount) AS SumSales
        FROM Sales
        WHERE SaleDate >= DATEADD(MONTH, -6, GETDATE())
        GROUP BY EmployeeID
    ) x
)
ORDER BY s.TotalSales DESC;

/*Write a T-SQL query to remove the duplicate integer values present in the string column. 
Additionally, remove the single integer character that appears in the string.(RemoveDuplicateIntsFromNames)*/

-- Assumption: Use a string splitter that can separate non-letter parts
-- First, convert the data into XML or table to split, then remove unwanted parts

WITH SplitParts AS (
    SELECT 
        PawanName,
        value AS Part
    FROM (
        SELECT 
            PawanName,
            CAST('<x>' + 
                 REPLACE(
                     REPLACE(Pawan_slug_name, '-', '<x>'), 
                 '', '</x><x>') + 
                 '</x>' AS XML) AS xmlVal
        FROM RemoveDuplicateIntsFromNames
    ) AS A
    CROSS APPLY xmlVal.nodes('/x') AS X(p)
    CROSS APPLY (SELECT LTRIM(RTRIM(X.p.value('.', 'VARCHAR(100)'))) AS value) AS parts
),
FilteredParts AS (
    SELECT 
        PawanName,
        Part
    FROM Spl
