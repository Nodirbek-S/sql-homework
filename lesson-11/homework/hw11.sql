----------------------------------------Easy-Level Tasks (10)------------------------------------

-- 1. Return: OrderID, CustomerName, OrderDate
-- Task: Show all orders placed after 2022 along with the names of the customers who placed them.
-- Tables Used: Orders, Customers

select * from Orders
select * from Customers

select 
  o.OrderID,
  c.FirstName,
  c.LastName,
  o.OrderDate
from Orders o
join Customers c on c.CustomerID = o.CustomerID
where o.OrderDate >= '2023-01-01';


-- 2. Return: EmployeeName, DepartmentName
-- Task: Display the names of employees who work in either the Sales or Marketing department.
-- Tables Used: Employees, Departments

select * from Employees
select * from Departments

select 
  concat(e.Name, ' ') as EmployeeName,
  d.DepartmentName
from Employees e
join Departments d ON d.DepartmentID = e.DepartmentID
where d.DepartmentName IN ('Sales', 'Marketing');



-- 3. Return: DepartmentName, MaxSalary
-- Task: Show the highest salary for each department.
-- Tables Used: Departments, Employees

select * from Departments
select * from Employees

select 
  d.DepartmentName,
  max(e.Salary) as MaxSalary
from Departments d
join Employees e on e.DepartmentID = d.DepartmentID
group by d.DepartmentName;


-- 4. Return: CustomerName, OrderID, OrderDate
-- Task: List all customers from the USA who placed orders in the year 2023.
-- Tables Used: Customers, Orders

select * from Customers
select * from Orders

select 
  c.FirstName,
  c.LastName,
  o.OrderID,
  o.OrderDate
from Customers c
join Orders o on o.CustomerID = c.CustomerID
where c.Country = 'USA'
  and year(o.OrderDate) = 2023;


-- 5. Return: CustomerName, TotalOrders
-- Task: Show how many orders each customer has placed.
-- Tables Used: Orders , Customers

select * from Orders
select * from Customers

select
  c.FirstName,
  c.LastName,
  count(o.OrderID) as TotalOrders
from Customers c
left join Orders o on o.CustomerID = c.CustomerID
group by c.FirstName, c.LastName
order by c.FirstName, c.LastName;


-- 6. Return: ProductName, SupplierName
-- Task: Display the names of products that are supplied by either Gadget Supplies or Clothing Mart.
-- Tables Used: Products, Suppliers

select * from Products
select * from Suppliers

select 
  p.ProductName,
  s.SupplierName
from Products p
join Suppliers s on s.SupplierID = p.SupplierID
where s.SupplierName in ('Gadget Supplies', 'Clothing Mart');


-- 7. Return: CustomerName, MostRecentOrderDate
-- Task: For each customer, show their most recent order. Include customers who haven't placed any orders.
-- Tables Used: Customers, Orders

select * from Customers
select * from Orders

select (FirstName + ' ' + LastName) as CustomerName, OrderDate as MostRecentOrderDate from Customers c
left join Orders o on c.CustomerID = o.CustomerID
order by OrderDate desc

----------------------------------------Medium-Level Tasks (10)------------------------------------

-- 8. Return: CustomerName, OrderTotal
-- Task: Show the customers who have placed an order where the total amount is greater than 500.
-- Tables Used: Orders, Customers

select * from Orders
select * from Customers

select (FirstName + ' ' + LastName) as CustomerName, TotalAmount as OrderTotal from Orders o
left join Customers c on o.CustomerID = c.CustomerID
where TotalAmount > 500;


-- 9. Return: ProductName, SaleDate, SaleAmount
-- Task: List product sales where the sale was made in 2022 or the sale amount exceeded 400.
-- Tables Used: Products, Sales

select * from Products
select * from Sales

select 
  p.ProductName,
  s.SaleDate,
  s.SaleAmount
from Sales s
join Products p on p.ProductID = s.ProductID
where year(s.SaleDate) = 2022
   or s.SaleAmount > 400;


-- 10. Return: ProductName, TotalSalesAmount
-- Task: Display each product along with the total amount it has been sold for.
-- Tables Used: Sales, Products

select * from Sales
select * from Products

select 
  p.ProductName,
  sum(s.SaleAmount) as TotalSalesAmount
from Products p
left join Sales s on s.ProductID = p.ProductID
group by p.ProductName;


-- 11. Return: EmployeeName, DepartmentName, Salary
-- Task: Show the employees who work in the HR department and earn a salary greater than 60000.
-- Tables Used: Employees, Departments

select * from Employees
select * from Departments

select 
  concat(e.Name, ' ') as EmployeeName,
  d.DepartmentName,
  e.Salary
from Employees e
join Departments d on d.DepartmentID = e.DepartmentID
where d.DepartmentName = 'HR'
  and e.Salary > 60000;


-- 12. Return: ProductName, SaleDate, StockQuantity
-- Task: List the products that were sold in 2023 and had more than 100 units in stock at the time.
-- Tables Used: Products, Sales

select * from Products
select * from Sales

select 
  p.ProductName,
  s.SaleDate,
  p.StockQuantity
from Sales s
join Products p on p.ProductID = s.ProductID
where year(s.SaleDate) = 2023
  and p.StockQuantity > 100;


-- 13. Return: EmployeeName, DepartmentName, HireDate
-- Task: Show employees who either work in the Sales department or were hired after 2020.
-- Tables Used: Employees, Departments

select * from Employees
select * from Departments

select 
  concat(e.Name, ' ') as EmployeeName,
  d.DepartmentName,
  e.HireDate
from Employees e
join Departments d on d.DepartmentID = e.DepartmentID
where d.DepartmentName = 'Sales'
   or e.HireDate > '2020-12-31';


----------------------------------------Hard-Level Tasks (10)------------------------------------

-- 14. Return: CustomerName, OrderID, Address, OrderDate
-- Task: List all orders made by customers in the USA whose address starts with 4 digits.
-- Tables Used: Customers, Orders

select * from Customers
select * from Orders

select 
  c.FirstName,
  o.OrderID,
  c.Address,
  o.OrderDate
from Customers c
join Orders o on o.CustomerID = c.CustomerID
where c.Country = 'USA'
  and c.Address like '[0-9][0-9][0-9][0-9]%';


-- 15. Return: ProductName, Category, SaleAmount
-- Task: Display product sales for items in the Electronics category or where the sale amount exceeded 350.
-- Tables Used: Products, Sales

select * from Products
select * from Sales

select 
  p.ProductName,
  p.Category,
  s.SaleAmount
from Sales s
join Products p on p.ProductID = s.ProductID
where p.Category = 'Electronics'
   or s.SaleAmount > 350;


-- 16. Return: CategoryName, ProductCount
-- Task: Show the number of products available in each category.
-- Tables Used: Products, Categories

select * from Products
select * from Categories

select 
  c.CategoryName,
  count(p.ProductID) as ProductCount
from Categories c
left join Products p on p.Category = c.CategoryID
group by c.CategoryName;

-- 17. Return: CustomerName, City, OrderID, Amount
-- Task: List orders where the customer is from Los Angeles and the order amount is greater than 300.
-- Tables Used: Customers, Orders

select * from Customers
select * from Orders

select 
  c.FirstName,
  c.City,
  o.OrderID,
  o.TotalAmount as Amount
from Customers c
join Orders o on o.CustomerID = c.CustomerID
where c.City = 'Los Angeles'
  and o.TotalAmount > 300;


-- 18. Return: EmployeeName, DepartmentName
-- Task: Display employees who are in the HR or Finance department, or whose name contains at least 4 vowels.
-- Tables Used: Employees, Departments

select * from Employees
select * from Departments



-- 19. Return: EmployeeName, DepartmentName, Salary
-- Task: Show employees who are in the Sales or Marketing department and have a salary above 60000.
-- Tables Used: Employees, Departments

select * from Employees
select * from Departments

select 
  concat(e.Name, ' ') as EmployeeName,
  d.DepartmentName,
  e.Salary
from Employees e
join Departments d on d.DepartmentID = e.DepartmentID
where d.DepartmentName in ('Sales', 'Marketing')
  and e.Salary > 60000;
