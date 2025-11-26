create database lesson_22
use lesson_22;


CREATE TABLE sales_data (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100),
    product_category VARCHAR(50),
    product_name VARCHAR(100),
    quantity_sold INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    order_date DATE,
    region VARCHAR(50)
);

INSERT INTO sales_data VALUES
    (1, 101, 'Alice', 'Electronics', 'Laptop', 1, 1200.00, 1200.00, '2024-01-01', 'North'),
    (2, 102, 'Bob', 'Electronics', 'Phone', 2, 600.00, 1200.00, '2024-01-02', 'South'),
    (3, 103, 'Charlie', 'Clothing', 'T-Shirt', 5, 20.00, 100.00, '2024-01-03', 'East'),
    (4, 104, 'David', 'Furniture', 'Table', 1, 250.00, 250.00, '2024-01-04', 'West'),
    (5, 105, 'Eve', 'Electronics', 'Tablet', 1, 300.00, 300.00, '2024-01-05', 'North'),
    (6, 106, 'Frank', 'Clothing', 'Jacket', 2, 80.00, 160.00, '2024-01-06', 'South'),
    (7, 107, 'Grace', 'Electronics', 'Headphones', 3, 50.00, 150.00, '2024-01-07', 'East'),
    (8, 108, 'Hank', 'Furniture', 'Chair', 4, 75.00, 300.00, '2024-01-08', 'West'),
    (9, 109, 'Ivy', 'Clothing', 'Jeans', 1, 40.00, 40.00, '2024-01-09', 'North'),
    (10, 110, 'Jack', 'Electronics', 'Laptop', 2, 1200.00, 2400.00, '2024-01-10', 'South'),
    (11, 101, 'Alice', 'Electronics', 'Phone', 1, 600.00, 600.00, '2024-01-11', 'North'),
    (12, 102, 'Bob', 'Furniture', 'Sofa', 1, 500.00, 500.00, '2024-01-12', 'South'),
    (13, 103, 'Charlie', 'Electronics', 'Camera', 1, 400.00, 400.00, '2024-01-13', 'East'),
    (14, 104, 'David', 'Clothing', 'Sweater', 2, 60.00, 120.00, '2024-01-14', 'West'),
    (15, 105, 'Eve', 'Furniture', 'Bed', 1, 800.00, 800.00, '2024-01-15', 'North'),
    (16, 106, 'Frank', 'Electronics', 'Monitor', 1, 200.00, 200.00, '2024-01-16', 'South'),
    (17, 107, 'Grace', 'Clothing', 'Scarf', 3, 25.00, 75.00, '2024-01-17', 'East'),
    (18, 108, 'Hank', 'Furniture', 'Desk', 1, 350.00, 350.00, '2024-01-18', 'West'),
    (19, 109, 'Ivy', 'Electronics', 'Speaker', 2, 100.00, 200.00, '2024-01-19', 'North'),
    (20, 110, 'Jack', 'Clothing', 'Shoes', 1, 90.00, 90.00, '2024-01-20', 'South'),
    (21, 111, 'Kevin', 'Electronics', 'Mouse', 3, 25.00, 75.00, '2024-01-21', 'East'),
    (22, 112, 'Laura', 'Furniture', 'Couch', 1, 700.00, 700.00, '2024-01-22', 'West'),
    (23, 113, 'Mike', 'Clothing', 'Hat', 4, 15.00, 60.00, '2024-01-23', 'North'),
    (24, 114, 'Nancy', 'Electronics', 'Smartwatch', 1, 250.00, 250.00, '2024-01-24', 'South'),
    (25, 115, 'Oscar', 'Furniture', 'Wardrobe', 1, 1000.00, 1000.00, '2024-01-25', 'East');


	CREATE TABLE OneColumn (
    Value SMALLINT
);
INSERT INTO OneColumn VALUES (10), (20), (30), (40), (100);

----------------------------------------------------------------------
CREATE TABLE MyData (
    Id INT, Grp INT, Val1 INT, Val2 INT
);
INSERT INTO MyData VALUES
(1,1,30,29), (2,1,19,0), (3,1,11,45), (4,2,0,0), (5,2,100,17);

---------------------------------------------------------------------
CREATE TABLE TheSumPuzzle (
    ID INT, Cost INT, Quantity INT
);
INSERT INTO TheSumPuzzle VALUES
(1234,12,164), (1234,13,164), (1235,100,130), (1235,100,135), (1236,12,136);
---------------------------------------------------------------------
CREATE TABLE Seats 
( 
SeatNumber INTEGER 
); 

INSERT INTO Seats VALUES 
(7),(13),(14),(15),(27),(28),(29),(30), 
(31),(32),(33),(34),(35),(52),(53),(54); 


-------------------------------homeworks_22---------------------------
	/*1. Compute Running Total Sales per Customer*/

	select *,
		sum(total_amount) over(partition by customer_id order by order_date) as total_sales_per_customer
	from sales_data;

	/*2. Count the Number of Orders per Product Category */

	select *,
		sum(quantity_sold) over(partition by product_category order by order_date) as counting_orders_number
	from sales_data;

	/*3. Find the Maximum Total Amount per Product Category*/

	with ranked as (
	select *,
		dense_rank() over (partition by product_category order by total_amount desc) as rnk
	from sales_data
	)
	select *from ranked 
		where rnk=1;

	/*4. Find the Minimum Price of Products per Product Category*/

	with cte as (
	select *,
		DENSE_RANK() over (partition by product_category order by total_amount asc) as rnk
	from sales_data
	)
	select *from cte
		where rnk=1;

	/*5. Compute the Moving Average of Sales of 3 days (prev day, curr day, next day) */

	select *,
		avg(total_amount) over (order by total_amount rows between 1 preceding and 1 following) as avg_prv_curr_fllw
	from sales_data;

	/*6. Find the Total Sales per Region*/

	select *,
		sum(total_amount) over (partition by region) as total_sales_byregion
	from sales_data;

	/*7. Compute the Rank of Customers Based on Their Total Purchase Amount*/



	with rankingcustomers as (
	select customer_id,
		sum(total_amount) as total_purchase_amount from sales_data
	group by customer_id
	)
	select *,
		DENSE_RANK() over(order by total_purchase_amount) as rnk
	from rankingcustomers;

	/*8. Calculate the Difference Between Current and Previous Sale Amount per Customer*/

	with cte as (
	select *,
		lag(total_amount) over(order by order_date) as prev_sale
	from sales_data
	)
	select *,
		(total_amount-prev_sale) as differ
	from cte;

	/*9. Find the Top 3 Most Expensive Products in Each Category*/

	with cte as (
	select *,
		ROW_NUMBER () over(partition by product_category order by unit_price desc) as rnk
	from sales_data
	)
	select *from cte
	where rnk='1';

	/*10. Compute the Cumulative Sum of Sales Per Region by Order Date */

	select *,
		sum(total_amount) over(partition by region order by order_date asc) as cumulative_Sum
	from sales_data;

	/*11. Compute Cumulative Revenue per Product Category */

	select *,
		sum(total_amount) over(partition by product_category order by order_date asc) as cumul_rev
	from sales_data;

	/*12. Here you need to find out the sum of previous values. 
	Please go through the sample input and expected output. */

	SELECT 
		ID,
		SUM(ID) OVER (ORDER BY ID) AS SumPreValues
	FROM tablename;

	/*13. Sum of Previous Values to Current Value*/

	with cte as (
	select *, 
		lag(value) over(order by value) as previous_values
	from OneColumn
	)
	select Value, 
		(value+isnull(previous_values,0)) as [Sum of Previous]
	from cte;

	/*14. Find customers who have purchased items from more than one product_category*/

	select customer_id, customer_name,
		count(distinct product_category) as category_count
	from sales_data
	group by customer_id, customer_name
	having COUNT(distinct product_category)>1;

	/*15. Find Customers with Above-Average Spending in Their Region*/

	with cte as (
	select *,
		AVG(total_amount) over(partition by region) as avg_region
	from sales_data
	)
	select * from cte
	where total_amount>avg_region;

	/*16. Rank customers based on their total spending (total_amount) within each region. 
	If multiple customers have the same spending, they should receive the same rank.*/

	select *,
		rank () over (partition by region order by total_amount desc) as same_rnk
 	from sales_data	;


	/*17. Calculate the running total (cumulative_sales) of total_amount 
	for each customer_id, ordered by order_date. */

	select *,
		sum(total_amount) over(partition by customer_id order by order_date) as cumulative_sales
	from sales_data;

	/*18. Calculate the sales growth rate (growth_rate) for each month compared to the previous month.*/


	with cte as (
	select *,
		lag(total_amount) over (order by order_date asc) as previous_month
	from sales_data
	)
	select*,
		(total_amount-isnull(previous_month,0)) as growth_rate
	from cte


	/*19. Identify customers whose total_amount is higher than their last order''s total_amount.
	(Table sales_data) */

	WITH cte AS (
    SELECT 
        sale_id,
        customer_id,
        customer_name,
        order_date,
        total_amount,
        LAG(total_amount) OVER (
            PARTITION BY customer_id 
            ORDER BY order_date
        ) AS last_order_amount
    FROM sales_data
)
SELECT 
    customer_id,
    customer_name,
    order_date,
    total_amount,
    last_order_amount
FROM cte
WHERE total_amount > ISNULL(last_order_amount, 0);

	/*20. Identify Products that prices are above the average product price*/

	with cte as (
	select *,
		avg(total_amount) over(partition by product_name) as avg_prod
	from sales_data
	)
	select *from cte
	where total_amount>avg_prod

	/*21. In this puzzle you have to find the sum of val1 and val2 for each group and put that value 
	at the beginning of the group in the new column. The challenge here is to do this in a single select. 
	For more details please see the sample input and expected output.*/

	SELECT 
    Id,
    Grp,
    Val1,
    Val2,
    CASE 
        WHEN ROW_NUMBER() OVER (PARTITION BY Grp ORDER BY Id) = 1 
        THEN SUM(Val1 + Val2) OVER (PARTITION BY Grp)
        ELSE NULL
    END AS Tot
FROM MyData;


/*22.Here you have to sum up the value of the cost column based on the values of Id. 
For Quantity if values are different then we have to add those values.
Please go through the sample input and expected output for details.*/

SELECT 
    Id,
    SUM(Cost) AS Cost,
    SUM(DISTINCT Quantity) AS Quantity
FROM TheSumPuzzle
GROUP BY Id;

/*23. From following set of integers, write an SQL statement to determine the expected outputs*/

WITH Numbers AS (
    -- Generate all numbers from 1 up to the max seat number
    SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.objects
),
MissingSeats AS (
    -- Find missing seats (numbers not in Seats table)
    SELECT n
    FROM Numbers
    WHERE n <= (SELECT MAX(SeatNumber) FROM Seats)
      AND n NOT IN (SELECT SeatNumber FROM Seats)
),
Marked AS (
    -- Mark groups of consecutive missing numbers
    SELECT n,
           n - ROW_NUMBER() OVER (ORDER BY n) AS grp
    FROM MissingSeats
)
SELECT 
    MIN(n) AS [Gap Start],
    MAX(n) AS [Gap End]
FROM Marked
GROUP BY grp
ORDER BY [Gap Start];




	select *from seats
	select *from TheSumPuzzle
	select *from MyData
	select *from OneColumn
	select *from sales_data
