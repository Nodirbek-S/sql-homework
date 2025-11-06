----------------------------------------Easy-Level Tasks (10)------------------------------------

-- 1. You need to write a query that outputs "100-Steven King", meaning emp_id + first_name + last_name in that format using employees table.

select * from Employees

select CONCAT(employee_id, '-', first_name, ' ',last_name) from Employees

-- 2. Update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'

select * from Employees

Update Employees 

set phone_number = replace(phone_number, '124', '999')


-- 3. Display the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the employees' first names.(Employees)

select first_name as FirstName, len(first_name) as NameLength from Employees 
where first_name like 'A%'
or first_name like 'J%'
or first_name like 'M%'
order by first_name;


-- 4. Write an SQL query to find the total salary for each manager ID.(Employees table)

select * from Employees

select MANAGER_ID, Sum(Salary) from Employees
group by MANAGER_ID



-- 5. Write a query to retrieve the year and the highest value from the columns Max1, Max2, and Max3 for each row in the TestMax table

select * from TestMax

select Year1, Greatest(Max1,Max2,Max3) from TestMax



-- 6. Find me odd numbered movies and description is not boring.(cinema)

select * from cinema

select *
from cinema
where id % 2 <>0
and description <> 'boring'
order by movie



-- 7. You have to sort data based on the Id but Id with 0 should always be the last row. Now the question is can you do that with a single order by column.(SingleOrder)

select * from SingleOrder

select *
from SingleOrder
order by case when Id = 0 then 999999 else Id end;

-- 8. Write an SQL query to select the first non-null value from a set of columns. If the first column is null, move to the next, and so on. If all columns are null, return null.(person)

select * from Employee

select coalesce(EmployeeID, ManagerID, JobTitle) as FirstNonNullValue from Employee


----------------------------------------Medium-Level Tasks (10)------------------------------------

-- 9. Split column FullName into 3 part (Firstname, Middlename, and Lastname).(Students Table)

select * from Students

SELECT 
  SUBSTRING(FullName, 1, CHARINDEX(' ', FullName) - 1) AS FirstName,
  SUBSTRING(FullName, CHARINDEX(' ', FullName) + 1, CHARINDEX(' ', FullName, CHARINDEX(' ', FullName) + 1) - CHARINDEX(' ', FullName) - 1) AS MiddleName,
  SUBSTRING(FullName, CHARINDEX(' ', FullName, CHARINDEX(' ', FullName) + 1) + 1, LEN(FullName)) AS LastName
FROM Students;



-- 10. For every customer that had a delivery to California, provide a result set of the customer orders that were delivered to Texas. (Orders Table)

select * from Orders

select * from Orders
where CustomerID in(
	select distinct CustomerID
	from Orders
	where DeliveryState = 'CA'
)
and DeliveryState = 'TX';

select distinct DeliveryState
from Orders;



-- 11. Write an SQL statement that can group concatenate the following values.(DMLTable)

select * from DMLTable

select STRING_AGG(String, ' ') as ConcatenatedString
from DMLTable
group by SequenceNumber
order by SequenceNumber;


-- 12. Find all employees whose names (concatenated first and last) contain the letter "a" at least 3 times.

SELECT *
FROM Employees
WHERE LEN(CONCAT(first_name, last_name)) - LEN(REPLACE(CONCAT(first_name, last_name), 'a', '')) >= 3;


-- 13. The total number of employees in each department and the percentage of those employees who have been with the company for more than 3 years(Employees)

select * from Employees

SELECT 
    DEPARTMENT_ID,
    COUNT(*) AS TotalEmployees,
    (COUNT(CASE WHEN DATEDIFF(YEAR, Hire_Date, GETDATE()) > 3 THEN 1 END) * 100.0) / COUNT(*) AS PercentageMoreThan3Years
FROM Employees
GROUP BY Department_ID;


----------------------------------------Hard-Level Tasks (10)------------------------------------

-- 14. Write an SQL query that replaces each row with the sum of its value and the previous rows' value. (Students table)

select * from Students

select STudentID, FullName, Grade, sum(Grade) over (order by StudentID) as TotalSum
from Students;



-- 15. Given the following dataset, find the students that share the same birthday.(Student Table)

select * from Student

SELECT 
    StudentName,
    s.Birthday
FROM Student s
JOIN (
    SELECT 
        Birthday
    FROM Student
    GROUP BY Birthday
    HAVING COUNT(*) > 1
) shared_bdays ON s.Birthday = shared_bdays.Birthday;



-- 16. You have a table with two players (Player A and Player B) and their scores. If a pair of players have multiple entries, aggregate their scores into a single row for each unique pair of players. Write an SQL query to calculate the total score for each unique player pair(PlayerScores)

select * from PlayerScores

SELECT 
    LEAST(PlayerA, PlayerB) AS Player1,
    GREATEST(PlayerA, PlayerB) AS Player2,
    SUM(Score) AS TotalScore
FROM PlayerScores
GROUP BY 
    LEAST(PlayerA, PlayerB), 
    GREATEST(PlayerA, PlayerB);



-- 17. Write an SQL query that separates the uppercase letters, lowercase letters, numbers, and other characters from the given string 'tf56sd#%OqH' into separate columns.
