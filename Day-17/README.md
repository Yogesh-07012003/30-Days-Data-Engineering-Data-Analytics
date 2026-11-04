# Day 17 — Python ETL Pipeline

## Project Overview
This project demonstrates a modular ETL (Extract, Transform, Load) pipeline using Python, Pandas, and MySQL.

The pipeline extracts retail sales data from a CSV file, cleans and transforms it using separate Python modules, and loads the final data into a MySQL database.

## Technologies Used
- Python
- Pandas
- MySQL
- SQLAlchemy
- PyMySQL

## Project Structure

```text
Day17_Python_ETL_Pipeline/
│
├── data/
│   └── sales.csv
│
├── src/
│   ├── __init__.py
│   ├── extract.py
│   ├── transform.py
│   └── load.py
│
├── main.py
├── requirements.txt
└── README.md
```

## ETL Workflow

### 1. Extract
- Read CSV data using Pandas.
- Load raw sales records into a DataFrame.

### 2. Transform
- Convert dates into datetime format.
- Convert numeric columns into the correct data types.
- Remove missing required values.
- Remove duplicate order IDs.
- Remove invalid quantities and prices.
- Calculate revenue.

Formula:

`revenue = quantity * unit_price`

### 3. Load
- Connect Python to MySQL.
- Load cleaned data into the `sales_data` table.
- Store the final records in the `sales_db` database.

## Database Setup

Create the database in MySQL:

```sql
CREATE DATABASE sales_db;
```

## Installation

Install the required packages:

```bash
python -m pip install -r requirements.txt
```

## How to Run

1. Install Python and MySQL Server.
2. Create the `sales_db` database.
3. Place the CSV file inside the `data` folder.
4. Install the Python dependencies.
5. Open the terminal in the project folder.
6. Run:

```bash
python main.py
```

7. Enter your MySQL username and password when prompted.

## Expected Results
- 10 raw CSV records extracted.
- 8 valid records after cleaning.
- Duplicate records removed.
- Missing required values removed.
- Revenue calculated.
- Cleaned records loaded into MySQL.

## SQL Verification

```sql
USE sales_db;

SELECT * FROM sales_data;

SELECT COUNT(*) FROM sales_data;

SELECT SUM(revenue) FROM sales_data;
```

## Learning Outcomes
- Understand modular Python programming.
- Build reusable ETL functions.
- Work with CSV files using Pandas.
- Clean and transform datasets.
- Connect Python applications to MySQL.
- Load processed data into database tables.
- Organize a Data Engineering project.

## Conclusion
This project demonstrates a modular Python ETL pipeline. Separating extraction, transformation, and loading into different files makes the project easier to maintain, test, and extend.
