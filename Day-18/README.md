# Day 18 — API to Database ETL Pipeline

## Project Overview

This project demonstrates an API-based ETL (Extract, Transform, Load) pipeline using Python, Pandas, JSON, and MySQL.

The pipeline extracts data from a REST API, receives the response in JSON format, transforms the records using Pandas, and loads the cleaned data into a MySQL database.

## API Used

**JSONPlaceholder Posts API**

https://jsonplaceholder.typicode.com/posts

- Free practice API.
- No API key required.
- Returns 100 sample post records.

## Technologies Used

- Python
- Requests
- JSON
- Pandas
- MySQL
- SQLAlchemy
- PyMySQL

## Project Structure

```text
Day18_API_to_Database_ETL/
│
├── data/
│   └── raw_posts.json
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

- Connect to the REST API using Python Requests.
- Send an HTTP GET request.
- Receive API data in JSON format.
- Save the raw response into `raw_posts.json`.

### 2. Transform

- Convert JSON records into a Pandas DataFrame.
- Select required columns.
- Rename columns.
- Remove missing values.
- Remove duplicate post IDs.
- Clean text fields.
- Convert ID columns into integers.

### 3. Load

- Connect Python to MySQL using SQLAlchemy.
- Load transformed records into the `posts` table.
- Store data in the `api_etl_db` database.

## Database Setup

Create the database:

```sql
CREATE DATABASE api_etl_db;
```

## Installation

Install the dependencies:

```bash
python -m pip install -r requirements.txt
```

## How to Run

1. Install Python and MySQL Server.
2. Create the `api_etl_db` database.
3. Make sure the MySQL server is running.
4. Install the required Python packages.
5. Open the terminal in the project directory.
6. Execute:

```bash
python main.py
```

7. Enter your MySQL username and password.

## SQL Verification

```sql
USE api_etl_db;

SELECT * FROM posts;

SELECT COUNT(*) FROM posts;

SELECT user_id, COUNT(*)
FROM posts
GROUP BY user_id;
```

## Expected Results

- 100 records extracted from the API.
- Raw JSON response saved locally.
- Data transformed using Pandas.
- 100 cleaned records loaded into MySQL.

## Learning Outcomes

- Understand REST APIs.
- Learn HTTP GET requests.
- Consume APIs using Python Requests.
- Understand JSON data.
- Convert JSON into Pandas DataFrames.
- Clean and transform API records.
- Connect Python to MySQL.
- Build an API-based ETL pipeline.

## Conclusion

This project demonstrates how to extract data from an external API, process JSON records using Python, and store the transformed data in MySQL.

It provides a foundation for working with real-world API-based Data Engineering pipelines.
