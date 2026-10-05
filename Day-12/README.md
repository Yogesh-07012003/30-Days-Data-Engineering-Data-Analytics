# Day 12 — Customer Data Cleaning

## Objective

Learn how to clean messy datasets using Pandas.

## Topics Covered

* `dropna()`
* `fillna()`
* `drop_duplicates()`
* `astype()`
* `replace()`
* Missing-value handling
* Duplicate removal
* Data type conversion
* Saving cleaned data

## Project

**Customer Data Cleaning**

The project uses a deliberately messy customer dataset and cleans it using Pandas.

## Dataset

Columns:

```text
customer_id
name
email
city
age
phone
```

## Files

```text
Day12/
├── customers_raw.csv
├── customer_data_cleaning.ipynb
├── customers_cleaned.csv
└── README.md
```

## Data Problems

The raw dataset contains:

* Missing email values
* Missing age values
* Missing phone values
* Duplicate customer records
* Invalid age values
* Inconsistent city names

## Cleaning Steps

### 1. Load Dataset

```python
import pandas as pd

df = pd.read_csv("customers_raw.csv")
```

### 2. Check Missing Values

```python
df.isnull().sum()
```

### 3. Remove Missing Rows

```python
df.dropna()
```

### 4. Fill Missing Values

```python
df["email"] = df["email"].fillna("Not Available")
```

### 5. Remove Duplicates

```python
df = df.drop_duplicates()
```

### 6. Convert Data Types

```python
df["age"] = pd.to_numeric(
    df["age"],
    errors="coerce"
)
```

### 7. Replace Incorrect Values

```python
df["city"] = df["city"].replace({
    "Bangalore": "Bengaluru"
})
```

### 8. Save Cleaned Dataset

```python
df.to_csv(
    "customers_cleaned.csv",
    index=False
)
```

## Cleaning Workflow

```text
Raw Dataset
     ↓
Inspect Data
     ↓
Check Missing Values
     ↓
Handle Missing Values
     ↓
Remove Duplicates
     ↓
Fix Data Types
     ↓
Replace Incorrect Values
     ↓
Validate Data
     ↓
Clean Dataset
```

## Learning Outcome

After completing Day 12, I can:

* Identify missing values
* Remove or replace missing data
* Remove duplicate records
* Convert data types
* Replace incorrect values
* Validate cleaned data
* Export cleaned datasets using Pandas

## Tools

* Python
* Pandas
* Jupyter Notebook
* VS Code
* Git
* GitHub

## Git Commit

```bash
git add Day12/
git commit -m "Day 12: Customer data cleaning with Pandas"
git push
```
