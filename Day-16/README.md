# Day 16 — ETL Fundamentals

## Project Overview
This project demonstrates a basic ETL (Extract, Transform, Load) pipeline using Python, Pandas, and MySQL.

The pipeline reads raw retail sales data from a CSV file, cleans and transforms it, and loads the processed records into a MySQL database.

## Technologies Used
- Python
- Pandas
- MySQL
- SQLAlchemy
- PyMySQL

## Project Structure
```text
Day16_ETL_Pipeline/
├── raw_sales.csv
├── etl_pipeline.py
├── requirements.txt
└── README.md
```

## ETL Process

### 1. Extract
- Read the raw CSV file using Pandas.
- Inspect the source records.

### 2. Transform
- Convert dates and numeric columns to appropriate data types.
- Remove records with missing required values.
- Remove duplicate order IDs.
- Filter invalid quantities and negative prices.
- Calculate total order amount.

Formula:

`total_amount = quantity * unit_price`

### 3. Load
- Connect to MySQL using SQLAlchemy and PyMySQL.
- Load transformed records into the `sales_orders` table.
- Read the table back to verify the load.

## Database Setup
Create the destination database in MySQL:

```sql
CREATE DATABASE retail_etl;
```

The Python script creates the `sales_orders` table when it loads the data.

## How to Run

1. Install Python and MySQL Server.
2. Create the `retail_etl` database.
3. Install the dependencies:

   `python -m pip install -r requirements.txt`

4. Keep `raw_sales.csv` in the project directory.
5. Run the script:

   `python etl_pipeline.py`

6. Enter your MySQL username and password when prompted.
7. Verify the results in MySQL Workbench:

```sql
USE retail_etl;

SELECT * FROM sales_orders;

SELECT COUNT(*) AS total_records
FROM sales_orders;

SELECT SUM(total_amount) AS total_sales
FROM sales_orders;
```

## Expected Results
- 10 raw CSV records.
- 8 valid records after removing the row with a missing quantity and the duplicate order ID.
- A `sales_orders` table containing the cleaned records.
- A `cleaned_sales.csv` file containing the transformed data.

## Learning Outcomes
- Understand Extract, Transform, and Load.
- Read CSV files using Pandas.
- Clean missing and duplicate data.
- Create calculated columns.
- Connect Python to MySQL.
- Load data into a relational database.
- Verify the results using SQL.

## Note
This is a beginner practice pipeline. It recreates the destination table on each run. A production pipeline should consider incremental loads, logging, error handling, database credentials management, and duplicate prevention.

## Conclusion
This project demonstrates the basic workflow of a data engineering pipeline, moving data from a raw CSV file through Python transformations into a MySQL database.
