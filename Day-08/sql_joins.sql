-- ============================================
-- DAY 8 - SQL JOINS
-- ============================================

CREATE DATABASE join_practice;

USE join_practice;


-- ============================================
-- 1. CREATE TABLES
-- ============================================

-- Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);


-- Products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);


-- Employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50)
);


-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    employee_id INT,
    quantity INT,
    order_date DATE,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id),

    FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
);


-- ============================================
-- 2. INSERT CUSTOMERS
-- ============================================

INSERT INTO customers
(customer_id, customer_name, city)
VALUES
(1, 'Arun', 'Chennai'),
(2, 'Priya', 'Bangalore'),
(3, 'Karthik', 'Hyderabad'),
(4, 'Divya', 'Chennai'),
(5, 'Rahul', 'Coimbatore'),
(6, 'Meena', 'Madurai');


-- ============================================
-- 3. INSERT PRODUCTS
-- ============================================

INSERT INTO products
(product_id, product_name, category, price)
VALUES
(101, 'Laptop', 'Electronics', 55000.00),
(102, 'Mouse', 'Accessories', 800.00),
(103, 'Keyboard', 'Accessories', 1500.00),
(104, 'Monitor', 'Electronics', 12000.00),
(105, 'Headphones', 'Accessories', 2500.00),
(106, 'Printer', 'Electronics', 15000.00);


-- ============================================
-- 4. INSERT EMPLOYEES
-- ============================================

INSERT INTO employees
(employee_id, employee_name, department)
VALUES
(201, 'Ravi', 'Sales'),
(202, 'Anitha', 'Sales'),
(203, 'Suresh', 'Support'),
(204, 'Meena', 'Sales'),
(205, 'Vijay', 'HR');


-- ============================================
-- 5. INSERT ORDERS
-- ============================================

INSERT INTO orders
(order_id, customer_id, product_id, employee_id, quantity, order_date)
VALUES
(1001, 1, 101, 201, 1, '2026-01-05'),
(1002, 2, 102, 202, 2, '2026-01-08'),
(1003, 3, 103, 201, 1, '2026-01-10'),
(1004, 1, 104, 204, 2, '2026-01-15'),
(1005, 4, 105, 202, 3, '2026-02-02'),
(1006, 2, 101, 201, 1, '2026-02-10'),
(1007, 3, 102, 204, 5, '2026-02-15'),
(1008, 5, 104, 202, 1, '2026-03-01');


-- ============================================
-- CHECK TABLES
-- ============================================

SELECT * FROM customers;

SELECT * FROM products;

SELECT * FROM employees;

SELECT * FROM orders;


-- ============================================
-- 6. INNER JOIN
-- ============================================

-- Show orders with customer names

SELECT
    orders.order_id,
    customers.customer_name,
    orders.quantity,
    orders.order_date
FROM orders
INNER JOIN customers
    ON orders.customer_id = customers.customer_id;


-- Order + Customer + Product

SELECT
    orders.order_id,
    customers.customer_name,
    products.product_name,
    orders.quantity,
    products.price
FROM orders
INNER JOIN customers
    ON orders.customer_id = customers.customer_id
INNER JOIN products
    ON orders.product_id = products.product_id;


-- Order + Customer + Product + Employee

SELECT
    orders.order_id,
    customers.customer_name,
    products.product_name,
    employees.employee_name,
    orders.quantity,
    orders.order_date
FROM orders
INNER JOIN customers
    ON orders.customer_id = customers.customer_id
INNER JOIN products
    ON orders.product_id = products.product_id
INNER JOIN employees
    ON orders.employee_id = employees.employee_id;


-- ============================================
-- 7. LEFT JOIN
-- ============================================

-- Show ALL customers,
-- even customers who have not placed an order.

SELECT
    customers.customer_id,
    customers.customer_name,
    orders.order_id
FROM customers
LEFT JOIN orders
    ON customers.customer_id = orders.customer_id;


-- Show customers and their products

SELECT
    customers.customer_name,
    products.product_name,
    orders.quantity
FROM customers
LEFT JOIN orders
    ON customers.customer_id = orders.customer_id
LEFT JOIN products
    ON orders.product_id = products.product_id;


-- ============================================
-- 8. RIGHT JOIN
-- ============================================

-- Show ALL customers from the right side
-- of the JOIN.

SELECT
    orders.order_id,
    customers.customer_name
FROM orders
RIGHT JOIN customers
    ON orders.customer_id = customers.customer_id;


-- Show ALL products,
-- including products that were never ordered.

SELECT
    products.product_id,
    products.product_name,
    orders.order_id
FROM orders
RIGHT JOIN products
    ON orders.product_id = products.product_id;


-- ============================================
-- 9. FULL JOIN
-- ============================================

-- MySQL does NOT directly support FULL OUTER JOIN.
--
-- We can simulate it using UNION.

SELECT
    customers.customer_id,
    customers.customer_name,
    orders.order_id
FROM customers
LEFT JOIN orders
    ON customers.customer_id = orders.customer_id

UNION

SELECT
    customers.customer_id,
    customers.customer_name,
    orders.order_id
FROM customers
RIGHT JOIN orders
    ON customers.customer_id = orders.customer_id;


-- ============================================
-- 10. JOIN WITH WHERE
-- ============================================

-- Find orders from Chennai customers.

SELECT
    customers.customer_name,
    customers.city,
    orders.order_id,
    orders.quantity
FROM customers
INNER JOIN orders
    ON customers.customer_id = orders.customer_id
WHERE customers.city = 'Chennai';


-- Find Electronics products that were ordered.

SELECT
    products.product_name,
    products.category,
    orders.quantity
FROM products
INNER JOIN orders
    ON products.product_id = orders.product_id
WHERE products.category = 'Electronics';


-- ============================================
-- 11. JOIN + CALCULATION
-- ============================================

-- Calculate total price for each order.

SELECT
    orders.order_id,
    customers.customer_name,
    products.product_name,
    orders.quantity,
    products.price,
    orders.quantity * products.price AS total_amount
FROM orders
INNER JOIN customers
    ON orders.customer_id = customers.customer_id
INNER JOIN products
    ON orders.product_id = products.product_id;


-- ============================================
-- 12. JOIN + ORDER BY
-- ============================================

-- Display orders from highest total amount.

SELECT
    orders.order_id,
    customers.customer_name,
    products.product_name,
    orders.quantity,
    products.price,
    orders.quantity * products.price AS total_amount
FROM orders
INNER JOIN customers
    ON orders.customer_id = customers.customer_id
INNER JOIN products
    ON orders.product_id = products.product_id
ORDER BY total_amount DESC;

-- ============================================
-- END OF DAY 8
-- ============================================
