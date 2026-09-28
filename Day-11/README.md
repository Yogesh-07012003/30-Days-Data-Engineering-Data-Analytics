# Day 11 — Pandas Basics

## Objective

Learn the fundamentals of Pandas and understand how to load and inspect a dataset using Python.

## Topics Covered

* Pandas
* DataFrame
* `read_csv()`
* `head()`
* `info()`
* `describe()`
* `shape`
* `columns`
* Basic filtering
* Basic statistical analysis

## Dataset

The project uses an employee dataset containing:

* Employee ID
* Name
* Department
* City
* Salary
* Experience

## Files

```text
Day11/
├── employees.csv
├── pandas_basics.ipynb
└── README.md
```

## Pandas Concepts

### 1. Import Pandas

```python
import pandas as pd
```

### 2. Read CSV

```python
df = pd.read_csv("employees.csv")
```

### 3. View First Rows

```python
df.head()
```

### 4. View Dataset Information

```python
df.info()
```

### 5. Statistical Summary

```python
df.describe()
```

### 6. Dataset Shape

```python
df.shape
```

Example:

```text
(10, 6)
```

This means 10 rows and 6 columns.

### 7. Column Names

```python
df.columns
```

## Practice Analysis

### Average Salary

```python
df["salary"].mean()
```

### Highest Salary

```python
df["salary"].max()
```

### Lowest Salary

```python
df["salary"].min()
```

### Chennai Employees

```python
df[df["city"] == "Chennai"]
```

### Data Engineering Employees

```python
df[df["department"] == "Data Engineering"]
```

## Learning Outcome

After completing Day 11, I can:

* Load CSV files using Pandas
* Understand a Pandas DataFrame
* Inspect datasets
* Check rows and columns
* Understand column names and data types
* Generate basic statistics
* Perform simple filtering
