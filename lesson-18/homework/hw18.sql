/*1. Create a tempora
total revenue for eac

	create table #Mon
		productID var
		ProductName v
		TotalQuantity
		TotalRevenue 
	)

	Insert into #Mont
		
		SELECT 
    p.ProductID,
    p.ProductName,
    SUM(s.Quantity) A
    SUM(s.Quantity * 
FROM Products p
JOIN Sales s ON p.Pro
WHERE YEAR(s.SaleDate
  AND MONTH(s.SaleDat
GROUP BY p.ProductID,

	/*2. Create a vie
	total sales quant

CREATE VIEW vw_Produc
SELECT 
    p.ProductID,
    p.ProductName,
    p.Category,
    p.Price,
    COALESCE(SUM(s.Qu
FROM Products p
LEFT JOIN Sales s
    ON p.ProductID = 
GROUP BY 
    p.ProductID,
    p.ProductName,
    p.Category,
    p.Price;

/*3. Create a functio

CREATE FUNCTION fn_Ge
RETURNS DECIMAL(18, 2
AS
BEGIN
    DECLARE @TotalRev

    SELECT 
        @TotalRevenue
    FROM OrderItems o
    INNER JOIN Produc
        ON oi.Product
    WHERE oi.ProductI

    RETURN ISNULL(@To
END;


/*4. Create an functi

CREATE FUNCTION fn_Ge
RETURNS DECIMAL(18, 2
AS
BEGIN
    DECLARE @TotalRev

    SELECT 
        @TotalRevenue
    FROM OrderItems o
    INNER JOIN Produc
        ON oi.Product
    WHERE p.Category 

    RETURN ISNULL(@To
END;
 /*5. You have to cre
 'Yes' if the input n
 and 'No' otherwise. 

 Create function dbo.
Returns ...
CREATE FUNCTION dbo.f
RETURNS VARCHAR(3)
AS
BEGIN
    DECLARE @Result V
    DECLARE @i INT = 

    -- Handle numbers
    IF @Number < 2
        SET @Result =
    ELSE
    BEGIN
        WHILE @i <= S
        BEGIN
            IF @Numbe
            BEGIN
                SET @
                BREAK
            END
            SET @i = 
        END
    END

    RETURN @Result;
END;

/*6. Create a table-v

@Start INT
@End INT



	CREATE FUNCTION d
(
    @Start INT,
    @End INT
)
RETURNS @Numbers TABL
(
    Number INT
)
AS
BEGIN
    DECLARE @i INT = 

    WHILE @i <= @End
    BEGIN
        INSERT INTO @
        VALUES (@i);

        SET @i = @i +
    END

    RETURN;
END;

/*7. Write a SQL quer
If there are fewer th

DECLARE @N INT = 2;

SELECT 
    CASE 
        WHEN COUNT(DI
        ELSE (
            SELECT DI
            FROM Empl
            ORDER BY 
            OFFSET (@
        )
    END AS HighestNSa
FROM Employee;

/*8. Write a SQL quer

SELECT TOP 1
    id,
    COUNT(*) AS num
FROM (
    -- requester_id i
    SELECT requester_
    FROM RequestAccep
    UNION ALL
    -- accepter_id is
    SELECT accepter_i
    FROM RequestAccep
) AS AllFriends
GROUP BY id
ORDER BY num DESC;

/*9. Create a View fo
CREATE VIEW vw_Custom
SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id)
    SUM(o.amount) AS 
    MAX(o.order_date)
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.customer_id 
GROUP BY
    c.customer_id,
    c.name;

/*10. Write an SQL st
You have to write onl


SELECT 
    RowNumber,
    MAX(TestCase) OVE
FROM Gaps;
