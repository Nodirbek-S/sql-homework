----------------------------------------Easy-Level Tasks (10)------------------------------------


-- 1. Write a SQL query to split the Name column by a comma into two separate columns: Name and Surname.(TestMultipleColumns)

select * from TestMultipleColumns

SELECT 
    SUBSTRING(Name, 1, CHARINDEX(',', Name) - 1) AS Name,
    SUBSTRING(Name, CHARINDEX(',', Name) + 1, LEN(Name)) AS Surname
FROM TestMultipleColumns;



-- 2. Write a SQL query to find strings from a table where the string itself contains the % character.(TestPercent)

select * from TestPercent


SELECT *
FROM TestPercent
WHERE Strs LIKE '%[%]%'


-- 3. Split a string based on dot(.).(Splitter)

select * from Splitter

SELECT value
FROM STRING_SPLIT('part1.part2.part3', '.');



-- 4. Write a SQL query to return all rows where the value in the Vals column contains more than two dots (.).(testDots)

select * from testDots

SELECT 
    Id,
    SUBSTRING(Vals, 1, CHARINDEX('.', Vals) - 1) AS FirstPart,
    SUBSTRING(Vals, CHARINDEX('.', Vals) + 1, LEN(Vals)) AS SecondPart
FROM TestDots;



-- 5. Write a SQL query to count the spaces present in the string.(CountSpaces)

select * from CountSpaces

SELECT LEN(texts) - LEN(REPLACE(texts, ' ', '')) AS SpaceCount
FROM CountSpaces;


-- 6. Write a SQL query that finds out employees who earn more than their managers.(Employee)

select * from Employees

SELECT e.Employee_ID, e.First_Name, e.Last_Name, e.Salary, m.First_Name AS ManagerFirstName, m.Last_Name AS ManagerLastName, m.Salary AS ManagerSalary
FROM Employees e
JOIN Employees m ON e.Manager_ID = m.Employee_ID
WHERE e.Salary > m.Salary;


-- 7. Find the employees who have been with the company for more than 10 years, but less than 15 years. Display their Employee ID, First Name, Last Name, Hire Date, and the Years of Service (calculated as the number of years between the current date and the hire date).(Employees)

select * from Employees

SELECT 
    Employee_ID, 
    First_Name, 
    Last_Name, 
    Hire_Date, 
    DATEDIFF(YEAR, Hire_Date, GETDATE()) AS YearsOfService
FROM Employees
WHERE DATEDIFF(YEAR, Hire_Date, GETDATE()) > 10 
  AND DATEDIFF(YEAR, Hire_Date, GETDATE()) < 15;



  ----------------------------------------Medium-Level Tasks (10)------------------------------------

-- 8. write a SQL query to find all dates' Ids with higher temperature compared to its previous (yesterday's) dates.(weather)

select * from weather

SELECT w1.Id, w1.RecordDate, w1.Temperature
FROM weather w1
JOIN weather w2 ON w1.RecordDate = DATEADD(DAY, 1, w2.RecordDate)
WHERE w1.Temperature > w2.Temperature;


-- 9. Write an SQL query that reports the first login date for each player.(Activity)

select * from Activity

SELECT player_id, MIN(event_date) AS LoginDate
FROM Activity
GROUP BY player_id;


-- 10. Your task is to return the third item from that list.(fruits)

select * from fruits

WITH RankedFruits AS (
    SELECT FruitName, ROW_NUMBER() OVER (ORDER BY FruitName) AS RowNum
    FROM Fruits
)
SELECT FruitName
FROM RankedFruits
WHERE RowNum = 3;


-- 11. Write an SQL query to determine the Employment Stage for each employee based on their HIRE_DATE. The stages are defined as follows:
/* If the employee has worked for less than 1 year → 'New Hire'
If the employee has worked for 1 to 5 years → 'Junior'
If the employee has worked for 5 to 10 years → 'Mid-Level'
If the employee has worked for 10 to 20 years → 'Senior'
If the employee has worked for more than 20 years → 'Veteran'(Employees) */

SELECT 
    Employee_ID,
    First_Name,
    Last_Name,
    HIRE_DATE,
    CASE 
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) < 1 THEN 'New Hire'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 1 AND 5 THEN 'Junior'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 5 AND 10 THEN 'Mid-Level'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 10 AND 20 THEN 'Senior'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) > 20 THEN 'Veteran'
    END AS EmploymentStage
FROM Employees;



-- 12. Write a SQL query to extract the integer value that appears at the start of the string in a column named Vals.(GetIntegers)

select * from GetIntegers

SELECT 
    Vals,
    SUBSTRING(Vals, 1, PATINDEX('%[^0-9]%', Vals) - 1) AS ExtractedInteger
FROM GetIntegers
WHERE ISNUMERIC(SUBSTRING(Vals, 1, PATINDEX('%[^0-9]%', Vals) - 1)) = 1;


----------------------------------------Hard-Level Tasks (10)------------------------------------


-- 13. In this puzzle you have to swap the first two letters of the comma separated string.(MultipleVals)


select * from MultipleVals

SELECT 
    CONCAT(SUBSTRING(Vals, 2, 1), SUBSTRING(Vals, 1, 1), SUBSTRING(Vals, 3, LEN(Vals)-2)) AS SwappedString
FROM MultipleVals;


-- 14. Write a SQL query to create a table where each character from the string will be converted into a row.(sdgfhsdgfhs@121313131)


WITH Numbers AS (
    SELECT TOP (LEN('sdgfhsdgfhs@121313131'))
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM master.dbo.spt_values
)
SELECT 
    SUBSTRING('sdgfhsdgfhs@121313131', n, 1) AS Character
FROM Numbers;



-- 15. Write a SQL query that reports the device that is first logged in for each player.(Activity)


select * from Activity

WITH event_date AS (
    SELECT 
        Player_ID, 
        Device_ID, 
        ROW_NUMBER() OVER (PARTITION BY PlayerID ORDER BY LoginDate ASC) AS RowNum
    FROM Activity
)
SELECT Player_ID, Device_ID
FROM event_date
WHERE RowNum = 1;




-- 16. Write a SQL query to separate the integer values and the character values into two different columns.(rtcfvty34redt)

