# Day 13 — Pandas Data Transformation

## 📌 Objective

Learn how to transform, combine, summarize, and sort data using Pandas.

In this practice, we will learn:

* `groupby()`
* `merge()`
* `concat()`
* `pivot_table()`
* `sort_values()`

---

## 📚 Topics Covered

### 1. `groupby()`

Used to group data based on a column and perform calculations.

Example:

```python
employees.groupby("department")["salary"].mean()
```

This calculates the average salary for each department.

---

### 2. `merge()`

Used to combine two DataFrames based on a common column.

Example:

```python
merged_data = pd.merge(
    employees,
    departments,
    on="department",
    how="left"
)
```

This is similar to a SQL `LEFT JOIN`.

SQL equivalent:

```sql
SELECT *
FROM employees
LEFT JOIN departments
ON employees.department = departments.department;
```

---

### 3. `concat()`

Used to combine multiple DataFrames.

Example:

```python
all_employees = pd.concat(
    [employees, new_employees],
    ignore_index=True
)
```

This combines the rows from both DataFrames.

---

### 4. `pivot_table()`

Used to create summary tables from data.

Example:

```python
pivot = pd.pivot_table(
    employees,
    values="salary",
    index="department",
    columns="city",
    aggfunc="mean",
    fill_value=0
)
```

This calculates the average salary by department and city.

---

### 5. `sort_values()`

Used to sort DataFrame values.

Example:

```python
employees.sort_values(
    by="salary",
    ascending=False
)
```

This sorts employees from highest salary to lowest salary.

---

# 📂 Project Structure

```text
Day13/
│
├── employees.csv
├── departments.csv
├── pandas_data_transformation.py
├── employees_with_department_details.csv
├── department_summary.csv
└── README.md
```

---

# 📊 Dataset

## employees.csv

```csv
employee_id,name,department,city,salary,experience
101,Arun,Data Engineering,Chennai,55000,2
102,Priya,Data Analytics,Coimbatore,48000,1
103,Karthik,Data Engineering,Trichy,62000,3
104,Divya,HR,Madurai,42000,2
105,Rahul,Data Analytics,Chennai,50000,2
106,Sneha,Data Engineering,Chennai,68000,4
107,Vijay,Finance,Bangalore,58000,3
108,Anitha,Data Analytics,Chennai,52000,2
109,Suresh,Finance,Coimbatore,60000,4
110,Meena,Data Engineering,Trichy,65000,3
```

## departments.csv

```csv
department,manager,budget
Data Engineering,Ramesh,500000
Data Analytics,Kavya,400000
HR,Geetha,300000
Finance,Prakash,450000
```

---

# 🐍 Complete Practice Code

```python
import pandas as pd

# Load datasets
employees = pd.read_csv("employees.csv")
departments = pd.read_csv("departments.csv")

# ============================================================
# 1. GROUPBY
# ============================================================

# Employee count by department
employee_count = employees.groupby(
    "department"
)["employee_id"].count()

print(employee_count)


# Average salary by department
average_salary = employees.groupby(
    "department"
)["salary"].mean()

print(average_salary)


# Total salary by department
total_salary = employees.groupby(
    "department"
)["salary"].sum()

print(total_salary)


# Multiple aggregations
department_summary = employees.groupby(
    "department"
).agg(
    employee_count=("employee_id", "count"),
    average_salary=("salary", "mean"),
    maximum_salary=("salary", "max"),
    minimum_salary=("salary", "min")
)

print(department_summary)


# ============================================================
# 2. MERGE
# ============================================================

merged_data = pd.merge(
    employees,
    departments,
    on="department",
    how="left"
)

print(merged_data)


# ============================================================
# 3. CONCAT
# ============================================================

new_employees = pd.DataFrame({
    "employee_id": [111, 112],
    "name": ["Ravi", "Lakshmi"],
    "department": ["Data Engineering", "HR"],
    "city": ["Chennai", "Madurai"],
    "salary": [60000, 45000],
    "experience": [2, 1]
})

all_employees = pd.concat(
    [employees, new_employees],
    ignore_index=True
)

print(all_employees)


# ============================================================
# 4. PIVOT TABLE
# ============================================================

pivot = pd.pivot_table(
    employees,
    values="salary",
    index="department",
    columns="city",
    aggfunc="mean",
    fill_value=0
)

print(pivot)


# Employee count pivot
employee_pivot = pd.pivot_table(
    employees,
    values="employee_id",
    index="department",
    columns="city",
    aggfunc="count",
    fill_value=0
)

print(employee_pivot)


# ============================================================
# 5. SORT VALUES
# ============================================================

# Sort by salary
salary_sorted = employees.sort_values(
    by="salary",
    ascending=False
)

print(salary_sorted)


# Sort by experience
experience_sorted = employees.sort_values(
    by="experience",
    ascending=False
)

print(experience_sorted)


# Sort by department and salary
multi_sorted = employees.sort_values(
    by=["department", "salary"],
    ascending=[True, False]
)

print(multi_sorted)


# ============================================================
# 6. TOP 5 HIGHEST PAID EMPLOYEES
# ============================================================

top_5 = employees.sort_values(
    by="salary",
    ascending=False
).head(5)

print(
    top_5[
        ["employee_id", "name", "department", "salary"]
    ]
)


# ============================================================
# 7. DEPARTMENT-WISE ANALYSIS
# ============================================================

analysis = employees.groupby(
    "department"
).agg(
    employees=("employee_id", "count"),
    average_salary=("salary", "mean"),
    total_salary=("salary", "sum"),
    average_experience=("experience", "mean")
).reset_index()

print(analysis)


# ============================================================
# 8. SAVE RESULTS
# ============================================================

merged_data.to_csv(
    "employees_with_department_details.csv",
    index=False
)

department_summary.to_csv(
    "department_summary.csv"
)

print("Day 13 completed successfully!")
```

---

# 🔍 Important Concepts

| Function        | Purpose                       |
| --------------- | ----------------------------- |
| `groupby()`     | Group and summarize data      |
| `merge()`       | Join two DataFrames           |
| `concat()`      | Combine DataFrames            |
| `pivot_table()` | Create summary tables         |
| `sort_values()` | Sort data                     |
| `agg()`         | Perform multiple calculations |
| `reset_index()` | Convert index back to column  |

---

# 🧠 SQL vs Pandas

| SQL           | Pandas          |
| ------------- | --------------- |
| `GROUP BY`    | `groupby()`     |
| `JOIN`        | `merge()`       |
| `UNION`       | `concat()`      |
| `ORDER BY`    | `sort_values()` |
| Summary table | `pivot_table()` |
| `COUNT()`     | `count()`       |
| `SUM()`       | `sum()`         |
| `AVG()`       | `mean()`        |
| `MAX()`       | `max()`         |
| `MIN()`       | `min()`         |

---

# 🎯 Practice Questions

1. Find the number of employees in each department.
2. Find the average salary of each department.
3. Find the highest salary in each department.
4. Find the total salary paid by each department.
5. Merge employee data with department manager information.
6. Add two new employees using `concat()`.
7. Create a pivot table showing average salary by city.
8. Create a pivot table showing employee count by department and city.
9. Find the top 3 highest-paid employees.
10. Sort employees by experience.
11. Sort employees by department and salary.
12. Find the department with the highest average salary.
13. Find the department with the highest total salary.

---

# 📈 Learning Outcome

After completing Day 13, I can:

* Group data using `groupby()`
* Calculate department-wise statistics
* Combine datasets using `merge()`
* Append datasets using `concat()`
* Create summary tables using `pivot_table()`
* Sort DataFrames using `sort_values()`
* Perform multiple aggregations using `agg()`
* Export transformed data to CSV
* Understand the relationship between SQL and Pandas operations

---

# 🛠️ Tools Used

* Python
* Pandas
* Jupyter Notebook
* VS Code
* Git
* GitHub

---

# 📌 Git Commands

```bash
git add Day13/

git commit -m "Day 13: Pandas data transformation"

git push
```

---

# ✅ Day 13 Completed

**Topics completed:**

```text
✅ groupby()
✅ merge()
✅ concat()
✅ pivot_table()
✅ sort_values()
✅ agg()
✅ Data transformation
✅ Data analysis
✅ CSV export
```

**Next:** Day 14 — Pandas Data Analysis Project

