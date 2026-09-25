-- ============================================
-- DAY 9 - ADVANCED SQL
-- ============================================

CREATE DATABASE advanced_sql;

USE advanced_sql;


-- ============================================
-- 1. CREATE SALES TABLE
-- ============================================

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    product VARCHAR(100),
    region VARCHAR(50),
    sales_amount DECIMAL(10,2),
    sale_date DATE
);


-- ============================================
-- 2. INSERT SAMPLE DATA
-- ============================================

INSERT INTO sales
(sale_id, employee_name, department, product, region, sales_amount, sale_date)
VALUES
(1, 'Arun', 'Sales', 'Laptop', 'Chennai', 55000, '2026-01-05'),
(2, 'Priya', 'Sales', 'Mouse', 'Bangalore', 800, '2026-01-08'),
(3, 'Karthik', 'Sales', 'Monitor', 'Chennai', 12000, '2026-01-10'),
(4, 'Divya', 'Sales', 'Laptop', 'Hyderabad', 60000, '2026-01-15'),
(5, 'Arun', 'Sales', 'Keyboard', 'Chennai', 1500, '2026-02-05'),
(6, 'Priya', 'Sales', 'Monitor', 'Bangalore', 11500, '2026-02-08'),
(7, 'Karthik', 'Sales', 'Laptop', 'Chennai', 58000, '2026-02-12'),
(8, 'Divya', 'Sales', 'Mouse', 'Hyderabad', 900, '2026-02-18'),
(9, 'Arun', 'Sales', 'Monitor', 'Chennai', 12500, '2026-03-05'),
(10, 'Priya', 'Sales', 'Laptop', 'Bangalore', 62000, '2026-03-10'),
(11, 'Karthik', 'Sales', 'Keyboard', 'Chennai', 1800, '2026-03-15'),
(12, 'Divya', 'Sales', 'Monitor', 'Hyderabad', 13000, '2026-03-20');


-- ============================================
-- VIEW DATA
-- ============================================

SELECT *
FROM sales;


-- ============================================
-- 3. SUBQUERIES
-- ============================================

-- --------------------------------------------
-- Example 1:
-- Find sales greater than average sales
-- --------------------------------------------

SELECT
    employee_name,
    product,
    sales_amount
FROM sales
WHERE sales_amount > (
    SELECT AVG(sales_amount)
    FROM sales
);


-- --------------------------------------------
-- Example 2:
-- Find the employee who made the highest sale
-- --------------------------------------------

SELECT
    employee_name,
    product,
    sales_amount
FROM sales
WHERE sales_amount = (
    SELECT MAX(sales_amount)
    FROM sales
);


-- --------------------------------------------
-- Example 3:
-- Find employees whose sales are greater
-- than the average sales
-- --------------------------------------------

SELECT DISTINCT employee_name
FROM sales
WHERE sales_amount > (
    SELECT AVG(sales_amount)
    FROM sales
);


-- ============================================
-- 4. CASE STATEMENT
-- ============================================

-- Categorize sales performance

SELECT
    employee_name,
    sales_amount,

    CASE
        WHEN sales_amount >= 50000 THEN 'High'
        WHEN sales_amount >= 10000 THEN 'Medium'
        ELSE 'Low'
    END AS sales_category

FROM sales;


-- --------------------------------------------
-- CASE with employee performance
-- --------------------------------------------

SELECT
    employee_name,
    product,
    sales_amount,

    CASE
        WHEN sales_amount >= 50000 THEN 'Excellent'
        WHEN sales_amount >= 10000 THEN 'Good'
        ELSE 'Needs Improvement'
    END AS performance

FROM sales;


-- --------------------------------------------
-- CASE with region
-- --------------------------------------------

SELECT
    employee_name,
    region,

    CASE
        WHEN region = 'Chennai' THEN 'South'
        WHEN region = 'Bangalore' THEN 'South'
        WHEN region = 'Hyderabad' THEN 'South'
        ELSE 'Other'
    END AS region_group

FROM sales;


-- ============================================
-- 5. CTE
-- Common Table Expression
-- ============================================

-- Find employees whose total sales
-- are greater than 50000

WITH employee_sales AS (
    SELECT
        employee_name,
        SUM(sales_amount) AS total_sales
    FROM sales
    GROUP BY employee_name
)

SELECT
    employee_name,
    total_sales
FROM employee_sales
WHERE total_sales > 50000;


-- --------------------------------------------
-- CTE + CASE
-- --------------------------------------------

WITH employee_sales AS (
    SELECT
        employee_name,
        SUM(sales_amount) AS total_sales
    FROM sales
    GROUP BY employee_name
)

SELECT
    employee_name,
    total_sales,

    CASE
        WHEN total_sales >= 100000 THEN 'Excellent'
        WHEN total_sales >= 50000 THEN 'Good'
        ELSE 'Average'
    END AS performance

FROM employee_sales;


-- ============================================
-- 6. ROW_NUMBER()
-- ============================================

-- Give a unique number to each sale
-- based on highest sales amount

SELECT
    employee_name,
    product,
    sales_amount,

    ROW_NUMBER() OVER (
        ORDER BY sales_amount DESC
    ) AS row_number

FROM sales;


-- --------------------------------------------
-- ROW_NUMBER() by employee
-- --------------------------------------------

SELECT
    employee_name,
    product,
    sales_amount,

    ROW_NUMBER() OVER (
        PARTITION BY employee_name
        ORDER BY sales_amount DESC
    ) AS row_number

FROM sales;


-- ============================================
-- 7. RANK()
-- ============================================

SELECT
    employee_name,
    product,
    sales_amount,

    RANK() OVER (
        ORDER BY sales_amount DESC
    ) AS sales_rank

FROM sales;


-- ============================================
-- 8. DENSE_RANK()
-- ============================================

SELECT
    employee_name,
    product,
    sales_amount,

    DENSE_RANK() OVER (
        ORDER BY sales_amount DESC
    ) AS sales_rank

FROM sales;


-- ============================================
-- RANK vs DENSE_RANK
-- ============================================

-- Add duplicate sales values for practice

INSERT INTO sales
(sale_id, employee_name, department, product, region, sales_amount, sale_date)
VALUES
(13, 'Ravi', 'Sales', 'Laptop', 'Chennai', 55000, '2026-04-01'),
(14, 'Meena', 'Sales', 'Laptop', 'Bangalore', 55000, '2026-04-02');


SELECT
    employee_name,
    sales_amount,

    RANK() OVER (
        ORDER BY sales_amount DESC
    ) AS rank_value,

    DENSE_RANK() OVER (
        ORDER BY sales_amount DESC
    ) AS dense_rank_value

FROM sales;


-- ============================================
-- 9. LAG()
-- ============================================

-- Compare current sale with previous sale

SELECT
    sale_id,
    employee_name,
    sales_amount,
    sale_date,

    LAG(sales_amount) OVER (
        ORDER BY sale_date
    ) AS previous_sale

FROM sales;


-- --------------------------------------------
-- Calculate difference from previous sale
-- --------------------------------------------

SELECT
    sale_id,
    employee_name,
    sales_amount,

    LAG(sales_amount) OVER (
        ORDER BY sale_date
    ) AS previous_sale,

    sales_amount -
    LAG(sales_amount) OVER (
        ORDER BY sale_date
    ) AS difference

FROM sales;


-- ============================================
-- 10. LEAD()
-- ============================================

-- Compare current sale with next sale

SELECT
    sale_id,
    employee_name,
    sales_amount,
    sale_date,

    LEAD(sales_amount) OVER (
        ORDER BY sale_date
    ) AS next_sale

FROM sales;


-- ============================================
-- 11. LAG() BY EMPLOYEE
-- ============================================

SELECT
    employee_name,
    sale_date,
    sales_amount,

    LAG(sales_amount) OVER (
        PARTITION BY employee_name
        ORDER BY sale_date
    ) AS previous_employee_sale

FROM sales;


-- ============================================
-- 12. LEAD() BY EMPLOYEE
-- ============================================

SELECT
    employee_name,
    sale_date,
    sales_amount,

    LEAD(sales_amount) OVER (
        PARTITION BY employee_name
        ORDER BY sale_date
    ) AS next_employee_sale

FROM sales;


-- ============================================
-- 13. COMBINE WINDOW FUNCTIONS
-- ============================================

SELECT
    employee_name,
    product,
    sales_amount,

    ROW_NUMBER() OVER (
        ORDER BY sales_amount DESC
    ) AS row_number,

    RANK() OVER (
        ORDER BY sales_amount DESC
    ) AS rank_number,

    DENSE_RANK() OVER (
        ORDER BY sales_amount DESC
    ) AS dense_rank_number

FROM sales;


-- ============================================
-- 14. TOP SALE FOR EACH EMPLOYEE
-- ============================================

WITH ranked_sales AS (

    SELECT
        employee_name,
        product,
        sales_amount,

        ROW_NUMBER() OVER (
            PARTITION BY employee_name
            ORDER BY sales_amount DESC
        ) AS rn

    FROM sales

)

SELECT
    employee_name,
    product,
    sales_amount

FROM ranked_sales

WHERE rn = 1;


-- ============================================
-- 15. SECOND HIGHEST SALE
-- ============================================

WITH ranked_sales AS (

    SELECT
        employee_name,
        sales_amount,

        DENSE_RANK() OVER (
            ORDER BY sales_amount DESC
        ) AS sales_rank

    FROM sales

)

SELECT
    employee_name,
    sales_amount

FROM ranked_sales

WHERE sales_rank = 2;


-- ============================================
-- 16. MONTHLY SALES
-- ============================================

SELECT
    DATE_FORMAT(sale_date, '%Y-%m') AS sale_month,
    SUM(sales_amount) AS total_sales

FROM sales

GROUP BY DATE_FORMAT(sale_date, '%Y-%m')

ORDER BY sale_month;


-- ============================================
-- 17. MONTHLY SALES WITH LAG
-- ============================================

WITH monthly_sales AS (

    SELECT
        DATE_FORMAT(sale_date, '%Y-%m') AS sale_month,
        SUM(sales_amount) AS total_sales

    FROM sales

    GROUP BY DATE_FORMAT(sale_date, '%Y-%m')

)

SELECT
    sale_month,
    total_sales,

    LAG(total_sales) OVER (
        ORDER BY sale_month
    ) AS previous_month_sales

FROM monthly_sales;


-- ============================================
-- END OF DAY 9
-- ============================================
