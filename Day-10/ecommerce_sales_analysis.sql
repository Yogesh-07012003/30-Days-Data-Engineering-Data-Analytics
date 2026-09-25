-- ============================================================
-- DAY 10 — E-COMMERCE SALES ANALYSIS
-- ============================================================

-- ============================================================
-- 1. CREATE DATABASE
-- ============================================================

CREATE DATABASE ecommerce_sales;

USE ecommerce_sales;


-- ============================================================
-- 2. CREATE CUSTOMERS TABLE
-- ============================================================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);


-- ============================================================
-- 3. CREATE PRODUCTS TABLE
-- ============================================================

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);


-- ============================================================
-- 4. CREATE ORDERS TABLE
-- ============================================================

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);


-- ============================================================
-- 5. CREATE ORDER_ITEMS TABLE
-- ============================================================

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);


-- ============================================================
-- 6. INSERT CUSTOMERS
-- ============================================================

INSERT INTO customers
(customer_id, customer_name, email, city, signup_date)
VALUES
(1, 'Arun Kumar', 'arun@gmail.com', 'Chennai', '2024-01-10'),
(2, 'Priya S', 'priya@gmail.com', 'Coimbatore', '2024-02-15'),
(3, 'Karthik R', 'karthik@gmail.com', 'Trichy', '2024-03-20'),
(4, 'Divya M', 'divya@gmail.com', 'Madurai', '2024-04-12'),
(5, 'Rahul P', 'rahul@gmail.com', 'Salem', '2024-05-18'),
(6, 'Sneha K', 'sneha@gmail.com', 'Chennai', '2024-06-22'),
(7, 'Vijay S', 'vijay@gmail.com', 'Bangalore', '2024-07-10'),
(8, 'Anitha R', 'anitha@gmail.com', 'Chennai', '2024-08-14'),
(9, 'Suresh B', 'suresh@gmail.com', 'Coimbatore', '2024-09-05'),
(10, 'Meena V', 'meena@gmail.com', 'Trichy', '2024-10-20');


-- ============================================================
-- 7. INSERT PRODUCTS
-- ============================================================

INSERT INTO products
(product_id, product_name, category, price)
VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Smartphone', 'Electronics', 30000),
(103, 'Headphones', 'Electronics', 2500),
(104, 'Keyboard', 'Accessories', 1500),
(105, 'Mouse', 'Accessories', 800),
(106, 'Monitor', 'Electronics', 12000),
(107, 'Backpack', 'Bags', 2000),
(108, 'Office Chair', 'Furniture', 8500),
(109, 'Desk Lamp', 'Furniture', 1800),
(110, 'USB Cable', 'Accessories', 500);


-- ============================================================
-- 8. INSERT ORDERS
-- ============================================================

INSERT INTO orders
(order_id, customer_id, order_date, order_status)
VALUES
(1001, 1, '2024-01-15', 'Completed'),
(1002, 2, '2024-02-20', 'Completed'),
(1003, 1, '2024-03-10', 'Completed'),
(1004, 3, '2024-03-25', 'Completed'),
(1005, 4, '2024-04-18', 'Completed'),
(1006, 5, '2024-05-12', 'Completed'),
(1007, 2, '2024-06-05', 'Completed'),
(1008, 6, '2024-06-20', 'Completed'),
(1009, 7, '2024-07-15', 'Completed'),
(1010, 1, '2024-08-10', 'Completed'),
(1011, 8, '2024-08-22', 'Completed'),
(1012, 9, '2024-09-10', 'Completed'),
(1013, 10, '2024-10-05', 'Completed'),
(1014, 3, '2024-10-18', 'Completed'),
(1015, 5, '2024-11-12', 'Completed'),
(1016, 2, '2024-11-20', 'Completed'),
(1017, 4, '2024-12-05', 'Completed'),
(1018, 1, '2024-12-15', 'Completed'),

(1019, 6, '2025-01-10', 'Completed'),
(1020, 7, '2025-01-20', 'Completed'),
(1021, 1, '2025-02-05', 'Completed'),
(1022, 3, '2025-02-18', 'Completed'),
(1023, 2, '2025-03-10', 'Completed'),
(1024, 5, '2025-03-22', 'Completed'),
(1025, 8, '2025-04-12', 'Completed'),
(1026, 1, '2025-04-25', 'Completed'),
(1027, 9, '2025-05-15', 'Completed'),
(1028, 10, '2025-06-05', 'Completed'),
(1029, 2, '2025-07-12', 'Completed'),
(1030, 4, '2025-08-20', 'Completed');


-- ============================================================
-- 9. INSERT ORDER ITEMS
-- ============================================================

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity)
VALUES
(1, 1001, 101, 1),
(2, 1001, 105, 2),

(3, 1002, 102, 1),
(4, 1002, 103, 1),

(5, 1003, 101, 1),
(6, 1003, 104, 2),

(7, 1004, 106, 1),
(8, 1004, 105, 1),

(9, 1005, 108, 1),
(10, 1005, 109, 2),

(11, 1006, 107, 1),
(12, 1006, 110, 3),

(13, 1007, 102, 1),
(14, 1007, 103, 2),

(15, 1008, 101, 1),
(16, 1008, 105, 1),

(17, 1009, 106, 2),
(18, 1009, 110, 2),

(19, 1010, 102, 1),
(20, 1010, 104, 1),

(21, 1011, 103, 2),
(22, 1011, 107, 1),

(23, 1012, 108, 1),
(24, 1012, 109, 1),

(25, 1013, 101, 1),
(26, 1013, 105, 2),

(27, 1014, 102, 1),
(28, 1014, 110, 3),

(29, 1015, 106, 1),
(30, 1015, 104, 2),

(31, 1016, 101, 1),
(32, 1016, 103, 1),

(33, 1017, 108, 1),
(34, 1017, 107, 1),

(35, 1018, 102, 2),
(36, 1018, 105, 2),

(37, 1019, 101, 1),
(38, 1019, 104, 1),

(39, 1020, 106, 1),
(40, 1020, 110, 2),

(41, 1021, 102, 1),
(42, 1021, 103, 2),

(43, 1022, 108, 1),
(44, 1022, 109, 1),

(45, 1023, 101, 1),
(46, 1023, 105, 1),

(47, 1024, 107, 2),
(48, 1024, 110, 2),

(49, 1025, 106, 1),
(50, 1025, 104, 1),

(51, 1026, 102, 1),
(52, 1026, 105, 3),

(53, 1027, 108, 1),
(54, 1027, 109, 2),

(55, 1028, 101, 1),
(56, 1028, 103, 1),

(57, 1029, 102, 2),
(58, 1029, 110, 2),

(59, 1030, 106, 1),
(60, 1030, 107, 1);


-- ============================================================
-- 10. CHECK TABLES
-- ============================================================

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;


-- ============================================================
-- 11. REVENUE FOR EACH ORDER ITEM
-- ============================================================

SELECT
    oi.order_id,
    p.product_name,
    oi.quantity,
    p.price,
    oi.quantity * p.price AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id;


-- ============================================================
-- 12. TOP 10 CUSTOMERS
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_spent DESC
LIMIT 10;


-- ============================================================
-- 13. MONTHLY REVENUE
-- ============================================================

SELECT
    YEAR(o.order_date) AS year,
    MONTH(o.order_date) AS month,
    SUM(oi.quantity * p.price) AS monthly_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY
    YEAR(o.order_date),
    MONTH(o.order_date)
ORDER BY
    year,
    month;


-- ============================================================
-- 14. TOP-SELLING PRODUCTS BY QUANTITY
-- ============================================================

SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 10;


-- ============================================================
-- 15. TOP PRODUCTS BY REVENUE
-- ============================================================

SELECT
    p.product_name,
    SUM(oi.quantity * p.price) AS total_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 10;


-- ============================================================
-- 16. REVENUE BY CATEGORY
-- ============================================================

SELECT
    p.category,
    SUM(oi.quantity * p.price) AS category_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.category
ORDER BY category_revenue DESC;


-- ============================================================
-- 17. CUSTOMER PURCHASE FREQUENCY
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS purchase_frequency
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_status = 'Completed'
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY purchase_frequency DESC;


-- ============================================================
-- 18. AVERAGE ORDER VALUE
-- ============================================================

SELECT
    AVG(order_total) AS average_order_value
FROM (
    SELECT
        o.order_id,
        SUM(oi.quantity * p.price) AS order_total
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON oi.product_id = p.product_id
    WHERE o.order_status = 'Completed'
    GROUP BY o.order_id
) AS order_summary;


-- ============================================================
-- 19. YEARLY REVENUE
-- ============================================================

SELECT
    YEAR(o.order_date) AS year,
    SUM(oi.quantity * p.price) AS yearly_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY YEAR(o.order_date)
ORDER BY year;


-- ============================================================
-- 20. YEAR-OVER-YEAR SALES
-- ============================================================

WITH yearly_sales AS (
    SELECT
        YEAR(o.order_date) AS year,
        SUM(oi.quantity * p.price) AS revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON oi.product_id = p.product_id
    WHERE o.order_status = 'Completed'
    GROUP BY YEAR(o.order_date)
)

SELECT
    year,
    revenue,
    LAG(revenue) OVER (
        ORDER BY year
    ) AS previous_year_revenue,

    ROUND(
        (
            revenue -
            LAG(revenue) OVER (ORDER BY year)
        )
        /
        LAG(revenue) OVER (ORDER BY year)
        * 100,
        2
    ) AS yoy_growth_percentage

FROM yearly_sales
ORDER BY year;


-- ============================================================
-- 21. REVENUE BY CITY
-- ============================================================

SELECT
    c.city,
    SUM(oi.quantity * p.price) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY c.city
ORDER BY total_revenue DESC;


-- ============================================================
-- 22. REPEAT CUSTOMERS
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_status = 'Completed'
GROUP BY
    c.customer_id,
    c.customer_name
HAVING COUNT(DISTINCT o.order_id) > 1
ORDER BY total_orders DESC;


-- ============================================================
-- 23. CUSTOMER LIFETIME VALUE
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * p.price) AS lifetime_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY lifetime_value DESC;


-- ============================================================
-- END OF DAY 10 PROJECT
-- ============================================================
