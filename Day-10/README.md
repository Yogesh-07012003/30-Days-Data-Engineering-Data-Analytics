# Day 10 — E-Commerce Sales Analysis

## Project Overview

This project analyzes an e-commerce sales database using SQL.

The objective is to extract business insights related to customers, products, orders, revenue, and sales performance.

## Database Schema

The project contains four tables:

```text
customers
products
orders
order_items
```

### Relationships

```text
customers
    |
    | customer_id
    ↓
orders
    |
    | order_id
    ↓
order_items
    |
    | product_id
    ↓
products
```

## Tables

### customers

Stores customer information.

Columns:

```text
customer_id
customer_name
email
city
signup_date
```

### products

Stores product information.

Columns:

```text
product_id
product_name
category
price
```

### orders

Stores order information.

Columns:

```text
order_id
customer_id
order_date
order_status
```

### order_items

Stores products included in each order.

Columns:

```text
order_item_id
order_id
product_id
quantity
```

## Business Questions

The project answers the following questions:

1. Who are the top 10 customers by total spending?
2. What is the monthly revenue?
3. Which products have the highest sales quantity?
4. Which products generate the highest revenue?
5. What is the revenue by product category?
6. How frequently does each customer purchase?
7. What is the average order value?
8. What is the year-over-year sales growth?
9. Which cities generate the most revenue?
10. Which customers are repeat customers?

## Key SQL Concepts

```text
JOINs
GROUP BY
HAVING
ORDER BY
Aggregate Functions
Subqueries
CTEs
Window Functions
LAG()
Date Functions
```

## Revenue Calculation

```text
Revenue = Product Price × Quantity
```

## YoY Growth

```text
YoY Growth =
(Current Year Revenue - Previous Year Revenue)
/
Previous Year Revenue × 100
```

## Tools

* MySQL
* SQL
* Git
* GitHub
* VS Code

## Project Structure

```text
Day10/
│
├── ecommerce_sales_analysis.sql
└── README.md
```

## Learning Outcome

After completing this project, I can use SQL to analyze relational e-commerce data and generate business insights involving customers, products, orders, revenue, and sales trends.

## Git Commit

```bash
git add Day10/
git commit -m "Day 10: E-Commerce Sales Analysis SQL project"
git push
```
