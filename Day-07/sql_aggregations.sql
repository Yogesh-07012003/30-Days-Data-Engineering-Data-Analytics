-- DAY 07 - SQL AGGREGATIONS
-- Topics: COUNT, SUM, AVG, MIN, MAX, GROUP BY, HAVING
-- Database: Sales Practice Database
-- ============================================================

-- ------------------------------------------------------------
-- 1. CREATE TABLE
-- ------------------------------------------------------------

DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    sale_id INT,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    product VARCHAR(50),
    region VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    sale_date DATE
);

-- ------------------------------------------------------------
-- 2. INSERT SAMPLE DATA
-- ------------------------------------------------------------

INSERT INTO sales VALUES
(1, 'Arun', 'Electronics', 'Laptop', 'Chennai', 2, 55000, '2026-01-10'),
(2, 'Priya', 'Electronics', 'Mobile', 'Chennai', 5, 20000, '2026-01-12'),
(3, 'Kumar', 'Furniture', 'Chair', 'Bangalore', 10, 2500, '2026-01-15'),
(4, 'Divya', 'Electronics', 'Laptop', 'Bangalore', 1, 55000, '2026-02-05'),
(5, 'Arun', 'Furniture', 'Table', 'Chennai', 3, 7000, '2026-02-10'),
(6, 'Priya', 'Clothing', 'Shirt', 'Mumbai', 8, 1200, '2026-02-12'),
(7, 'Kumar', 'Electronics', 'Mobile', 'Mumbai', 4, 20000, '2026-02-18'),
(8, 'Divya', 'Clothing', 'Jeans', 'Chennai', 6, 2500, '2026-03-01'),
(9, 'Arun', 'Furniture', 'Chair', 'Bangalore', 15, 2500, '2026-03-05'),
(10, 'Priya', 'Electronics', 'Laptop', 'Mumbai', 2, 55000, '2026-03-10');

-- ============================================================
-- 3. BASIC AGGREGATE FUNCTIONS
-- ============================================================

-- COUNT(*) - Count all rows
SELECT COUNT(*) AS total_sales
FROM sales;

-- COUNT(column) - Count non-NULL values in a column
SELECT COUNT(product) AS products_recorded
FROM sales;

-- SUM() - Total quantity sold
SELECT SUM(quantity) AS total_quantity
FROM sales;

-- AVG() - Average product price
SELECT AVG(price) AS average_price
FROM sales;

-- MIN() - Lowest product price
SELECT MIN(price) AS minimum_price
FROM sales;

-- MAX() - Highest product price
SELECT MAX(price) AS maximum_price
FROM sales;

-- ============================================================
-- 4. AGGREGATIONS WITH WHERE
-- ============================================================

-- Total quantity sold in Chennai
SELECT SUM(quantity) AS chennai_quantity
FROM sales
WHERE region = 'Chennai';

-- Number of Electronics sales
SELECT COUNT(*) AS electronics_sales
FROM sales
WHERE department = 'Electronics';

-- Average price of products in Mumbai
SELECT AVG(price) AS mumbai_average_price
FROM sales
WHERE region = 'Mumbai';

-- Maximum price of Electronics products
SELECT MAX(price) AS electronics_max_price
FROM sales
WHERE department = 'Electronics';

-- ============================================================
-- 5. GROUP BY
-- ============================================================

-- Number of sales by department
SELECT department, COUNT(*) AS sales_count
FROM sales
GROUP BY department;

-- Total quantity by department
SELECT department, SUM(quantity) AS total_quantity
FROM sales
GROUP BY department;

-- Average price by department
SELECT department, AVG(price) AS average_price
FROM sales
GROUP BY department;

-- Minimum price by department
SELECT department, MIN(price) AS minimum_price
FROM sales
GROUP BY department;

-- Maximum price by department
SELECT department, MAX(price) AS maximum_price
FROM sales
GROUP BY department;

-- Number of sales by region
SELECT region, COUNT(*) AS sales_count
FROM sales
GROUP BY region;

-- Total quantity by region
SELECT region, SUM(quantity) AS total_quantity
FROM sales
GROUP BY region;

-- Total quantity by product
SELECT product, SUM(quantity) AS total_quantity
FROM sales
GROUP BY product;

-- Number of sales by employee
SELECT employee_name, COUNT(*) AS sales_count
FROM sales
GROUP BY employee_name;

-- Total quantity by employee
SELECT employee_name, SUM(quantity) AS total_quantity
FROM sales
GROUP BY employee_name;

-- ============================================================
-- 6. GROUP BY MULTIPLE COLUMNS
-- ============================================================

-- Sales count by department and region
SELECT department, region, COUNT(*) AS sales_count
FROM sales
GROUP BY department, region;

-- Total quantity by department and region
SELECT department, region, SUM(quantity) AS total_quantity
FROM sales
GROUP BY department, region;

-- Average price by department and region
SELECT department, region, AVG(price) AS average_price
FROM sales
GROUP BY department, region;

-- ============================================================
-- 7. HAVING
-- ============================================================

-- Departments with total quantity greater than 10
SELECT department, SUM(quantity) AS total_quantity
FROM sales
GROUP BY department
HAVING SUM(quantity) > 10;

-- Regions with more than 2 sales
SELECT region, COUNT(*) AS sales_count
FROM sales
GROUP BY region
HAVING COUNT(*) > 2;

-- Products with total quantity greater than 5
SELECT product, SUM(quantity) AS total_quantity
FROM sales
GROUP BY product
HAVING SUM(quantity) > 5;

-- Employees with total quantity greater than 10
SELECT employee_name, SUM(quantity) AS total_quantity
FROM sales
GROUP BY employee_name
HAVING SUM(quantity) > 10;

-- Departments where average price is greater than 10,000
SELECT department, AVG(price) AS average_price
FROM sales
GROUP BY department
HAVING AVG(price) > 10000;

-- ============================================================
-- 8. WHERE + GROUP BY + HAVING
-- ============================================================

-- Chennai sales grouped by department,
-- showing only departments with quantity > 5
SELECT department, SUM(quantity) AS total_quantity
FROM sales
WHERE region = 'Chennai'
GROUP BY department
HAVING SUM(quantity) > 5;

-- Electronics sales grouped by employee,
-- showing employees with more than 2 units sold
SELECT employee_name, SUM(quantity) AS total_quantity
FROM sales
WHERE department = 'Electronics'
GROUP BY employee_name
HAVING SUM(quantity) > 2;

-- ============================================================
-- 9. AGGREGATIONS WITH CALCULATIONS
-- ============================================================

-- Revenue for every sale
SELECT
    sale_id,
    product,
    quantity,
    price,
    quantity * price AS revenue
FROM sales;

-- Total revenue
SELECT SUM(quantity * price) AS total_revenue
FROM sales;

-- Total revenue by department
SELECT
    department,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY department;

-- Total revenue by region
SELECT
    region,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY region;

-- Total revenue by product
SELECT
    product,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY product;

-- Average revenue per sale
SELECT AVG(quantity * price) AS average_sale_revenue
FROM sales;

-- ============================================================
-- 10. ROUND() WITH AVG
-- ============================================================

SELECT
    department,
    ROUND(AVG(price), 2) AS average_price
FROM sales
GROUP BY department;

-- ============================================================
-- 11. DISTINCT + COUNT
-- ============================================================

-- Number of unique products
SELECT COUNT(DISTINCT product) AS unique_products
FROM sales;

-- Number of unique employees
SELECT COUNT(DISTINCT employee_name) AS unique_employees
FROM sales;

-- Number of unique regions
SELECT COUNT(DISTINCT region) AS unique_regions
FROM sales;

-- ============================================================
-- 12. GROUP BY + ORDER BY
-- ============================================================

-- Departments ordered by total quantity, highest first
SELECT
    department,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY department
ORDER BY total_quantity DESC;

-- Products ordered by revenue, highest first
SELECT
    product,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC;

-- Regions ordered by number of sales
SELECT
    region,
    COUNT(*) AS sales_count
FROM sales
GROUP BY region
ORDER BY sales_count DESC;

-- ============================================================
-- 13. TOP / LIMIT WITH AGGREGATION
-- ============================================================

-- Top department by total quantity (MySQL/PostgreSQL)
SELECT
    department,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY department
ORDER BY total_quantity DESC
LIMIT 1;

-- Top product by revenue
SELECT
    product,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC
LIMIT 1;

-- ============================================================
-- 14. 20 PRACTICE QUESTIONS
-- ============================================================

-- Q1. Find the total number of sales records.
SELECT COUNT(*) AS total_sales
FROM sales;

-- Q2. Find the total quantity of products sold.
SELECT SUM(quantity) AS total_quantity
FROM sales;

-- Q3. Find the average product price.
SELECT AVG(price) AS average_price
FROM sales;

-- Q4. Find the minimum product price.
SELECT MIN(price) AS minimum_price
FROM sales;

-- Q5. Find the maximum product price.
SELECT MAX(price) AS maximum_price
FROM sales;

-- Q6. Find the number of sales made by each department.
SELECT department, COUNT(*) AS sales_count
FROM sales
GROUP BY department;

-- Q7. Find the total quantity sold by each department.
SELECT department, SUM(quantity) AS total_quantity
FROM sales
GROUP BY department;

-- Q8. Find the average product price for each department.
SELECT department, AVG(price) AS average_price
FROM sales
GROUP BY department;

-- Q9. Find the total quantity sold in each region.
SELECT region, SUM(quantity) AS total_quantity
FROM sales
GROUP BY region;

-- Q10. Find the number of sales made in each region.
SELECT region, COUNT(*) AS sales_count
FROM sales
GROUP BY region;

-- Q11. Find the total quantity sold for each product.
SELECT product, SUM(quantity) AS total_quantity
FROM sales
GROUP BY product;

-- Q12. Find the average price for each product.
SELECT product, AVG(price) AS average_price
FROM sales
GROUP BY product;

-- Q13. Find the maximum price for each department.
SELECT department, MAX(price) AS maximum_price
FROM sales
GROUP BY department;

-- Q14. Find the minimum price for each region.
SELECT region, MIN(price) AS minimum_price
FROM sales
GROUP BY region;

-- Q15. Find the total quantity sold by each employee.
SELECT employee_name, SUM(quantity) AS total_quantity
FROM sales
GROUP BY employee_name;

-- Q16. Find departments where total quantity sold is greater than 10.
SELECT department, SUM(quantity) AS total_quantity
FROM sales
GROUP BY department
HAVING SUM(quantity) > 10;

-- Q17. Find regions where more than 2 sales were made.
SELECT region, COUNT(*) AS sales_count
FROM sales
GROUP BY region
HAVING COUNT(*) > 2;

-- Q18. Find products where total quantity sold is greater than 5.
SELECT product, SUM(quantity) AS total_quantity
FROM sales
GROUP BY product
HAVING SUM(quantity) > 5;

-- Q19. Find employees whose total quantity sold is greater than 10.
SELECT employee_name, SUM(quantity) AS total_quantity
FROM sales
GROUP BY employee_name
HAVING SUM(quantity) > 10;

-- Q20. Find departments where average product price is greater than 10,000.
SELECT department, AVG(price) AS average_price
FROM sales
GROUP BY department
HAVING AVG(price) > 10000;

-- ============================================================
-- 15. IMPORTANT CONCEPT: WHERE vs HAVING
-- ============================================================

-- WHERE filters individual rows BEFORE grouping.
SELECT department, SUM(quantity) AS total_quantity
FROM sales
WHERE region = 'Chennai'
GROUP BY department;

-- HAVING filters groups AFTER grouping.
SELECT department, SUM(quantity) AS total_quantity
FROM sales
GROUP BY department
HAVING SUM(quantity) > 10;

-- WHERE + GROUP BY + HAVING together
SELECT
    department,
    SUM(quantity) AS total_quantity
FROM sales
WHERE region = 'Chennai'
GROUP BY department
HAVING SUM(quantity) > 5;

-- ============================================================
-- 16. EXECUTION ORDER
-- ============================================================
-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- SELECT
-- ORDER BY
-- LIMIT
