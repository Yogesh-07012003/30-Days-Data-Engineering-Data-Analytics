# Day 8 - SQL JOINs

## Topics Covered

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL JOIN
- Multiple JOINs
- JOIN with WHERE
- JOIN with ORDER BY
- JOIN with calculations

---

## Database

`join_practice`

## Tables

### 1. customers

Stores customer information.

| Column | Description |
|---|---|
| customer_id | Unique customer ID |
| customer_name | Customer name |
| city | Customer city |

### 2. products

Stores product information.

| Column | Description |
|---|---|
| product_id | Unique product ID |
| product_name | Product name |
| category | Product category |
| price | Product price |

### 3. employees

Stores employee information.

| Column | Description |
|---|---|
| employee_id | Unique employee ID |
| employee_name | Employee name |
| department | Employee department |

### 4. orders

Stores customer orders.

| Column | Description |
|---|---|
| order_id | Unique order ID |
| customer_id | Customer reference |
| product_id | Product reference |
| employee_id | Employee reference |
| quantity | Number of products |
| order_date | Order date |

---

# What is a JOIN?

A JOIN is used to combine data from two or more tables using a related column.

Example:

```sql
SELECT
    customers.customer_name,
    orders.order_id
FROM customers
INNER JOIN orders
    ON customers.customer_id = orders.customer_id;
