-- ============================================
-- Day 6: SQL Basics
-- Sales Database Practice
-- ============================================

-- Create database
CREATE DATABASE sales_db;

-- Use database
USE sales_db;

-- Create sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    region VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    sale_date DATE
);

-- Insert sample data
INSERT INTO sales
(sale_id, product_name, category, region, quantity, price, sale_date)
VALUES
(1, 'Laptop', 'Electronics', 'Chennai', 2, 55000.00, '2026-01-05'),
(2, 'Mouse', 'Accessories', 'Bangalore', 5, 800.00, '2026-01-08'),
(3, 'Keyboard', 'Accessories', 'Chennai', 3, 1500.00, '2026-01-12'),
(4, 'Monitor', 'Electronics', 'Hyderabad', 2, 12000.00, '2026-01-15'),
(5, 'Laptop', 'Electronics', 'Bangalore', 1, 60000.00, '2026-02-02'),
(6, 'Headphones', 'Accessories', 'Chennai', 4, 2500.00, '2026-02-10'),
(7, 'Monitor', 'Electronics', 'Bangalore', 3, 11500.00, '2026-02-15'),
(8, 'Keyboard', 'Accessories', 'Hyderabad', 6, 1400.00, '2026-03-01'),
(9, 'Laptop', 'Electronics', 'Hyderabad', 2, 58000.00, '2026-03-05'),
(10, 'Mouse', 'Accessories', 'Chennai', 8, 750.00, '2026-03-10');


-- ============================================
-- 1. SELECT
-- ============================================

-- Display all records
SELECT *
FROM sales;

-- Display selected columns
SELECT product_name, category, price
FROM sales;


-- ============================================
-- 2. WHERE
-- ============================================

-- Find sales from Chennai
SELECT *
FROM sales
WHERE region = 'Chennai';

-- Find products with price greater than 10000
SELECT *
FROM sales
WHERE price > 10000;

-- Find Electronics products
SELECT *
FROM sales
WHERE category = 'Electronics';


-- ============================================
-- 3. ORDER BY
-- ============================================

-- Sort products by price from lowest to highest
SELECT *
FROM sales
ORDER BY price ASC;

-- Sort products by price from highest to lowest
SELECT *
FROM sales
ORDER BY price DESC;

-- Sort by quantity from highest to lowest
SELECT *
FROM sales
ORDER BY quantity DESC;


-- ============================================
-- 4. DISTINCT
-- ============================================

-- Display unique regions
SELECT DISTINCT region
FROM sales;

-- Display unique categories
SELECT DISTINCT category
FROM sales;

-- Display unique product names
SELECT DISTINCT product_name
FROM sales;


-- ============================================
-- 5. LIMIT
-- ============================================

-- Display first 5 records
SELECT *
FROM sales
LIMIT 5;

-- Display top 3 most expensive products
SELECT *
FROM sales
ORDER BY price DESC
LIMIT 3;

-- Display top 3 products by quantity
SELECT *
FROM sales
ORDER BY quantity DESC
LIMIT 3;


-- ============================================
-- PRACTICE QUESTIONS
-- ============================================

-- 1. Display all Laptop sales.

SELECT *
FROM sales
WHERE product_name = 'Laptop';


-- 2. Display products sold in Bangalore.

SELECT *
FROM sales
WHERE region = 'Bangalore';


-- 3. Display products with price less than 5000.

SELECT *
FROM sales
WHERE price < 5000;


-- 4. Display all products sorted by quantity.

SELECT *
FROM sales
ORDER BY quantity DESC;


-- 5. Display unique product categories.

SELECT DISTINCT category
FROM sales;


-- 6. Display the 5 most expensive products.

SELECT *
FROM sales
ORDER BY price DESC
LIMIT 5;
