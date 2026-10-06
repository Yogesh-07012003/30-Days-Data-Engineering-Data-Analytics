import pandas as pd

# ============================================================
# DAY 13 — PANDAS DATA TRANSFORMATION
# ============================================================

# Load datasets
employees = pd.read_csv("employees.csv")
departments = pd.read_csv("departments.csv")

print("\n========== EMPLOYEE DATA ==========")
print(employees)

print("\n========== DEPARTMENT DATA ==========")
print(departments)


# ============================================================
# 1. groupby()
# ============================================================

print("\n========== GROUPBY — EMPLOYEE COUNT BY DEPARTMENT ==========")

employee_count = employees.groupby("department")["employee_id"].count()

print(employee_count)


# Average salary by department
print("\n========== AVERAGE SALARY BY DEPARTMENT ==========")

average_salary = employees.groupby("department")["salary"].mean()

print(average_salary)


# Total salary by department
print("\n========== TOTAL SALARY BY DEPARTMENT ==========")

total_salary = employees.groupby("department")["salary"].sum()

print(total_salary)


# Multiple aggregations
print("\n========== DEPARTMENT SUMMARY ==========")

department_summary = employees.groupby("department").agg(
    employee_count=("employee_id", "count"),
    average_salary=("salary", "mean"),
    maximum_salary=("salary", "max"),
    minimum_salary=("salary", "min")
)

print(department_summary)


# ============================================================
# 2. merge()
# ============================================================

print("\n========== MERGE EMPLOYEES + DEPARTMENTS ==========")

merged_data = pd.merge(
    employees,
    departments,
    on="department",
    how="left"
)

print(merged_data)


# ============================================================
# 3. concat()
# ============================================================

print("\n========== CONCAT ==========")

# Create new employee records
new_employees = pd.DataFrame({
    "employee_id": [111, 112],
    "name": ["Ravi", "Lakshmi"],
    "department": ["Data Engineering", "HR"],
    "city": ["Chennai", "Madurai"],
    "salary": [60000, 45000],
    "experience": [2, 1]
})

# Combine old + new employees
all_employees = pd.concat(
    [employees, new_employees],
    ignore_index=True
)

print(all_employees)


# ============================================================
# 4. pivot_table()
# ============================================================

print("\n========== PIVOT TABLE ==========")

pivot = pd.pivot_table(
    employees,
    values="salary",
    index="department",
    columns="city",
    aggfunc="mean",
    fill_value=0
)

print(pivot)


# Another pivot table
print("\n========== EMPLOYEE COUNT PIVOT ==========")

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
# 5. sort_values()
# ============================================================

print("\n========== SORT BY SALARY ==========")

salary_sorted = employees.sort_values(
    by="salary",
    ascending=False
)

print(salary_sorted)


# Sort by experience
print("\n========== SORT BY EXPERIENCE ==========")

experience_sorted = employees.sort_values(
    by="experience",
    ascending=False
)

print(experience_sorted)


# Sort by department and salary
print("\n========== SORT BY DEPARTMENT + SALARY ==========")

multi_sorted = employees.sort_values(
    by=["department", "salary"],
    ascending=[True, False]
)

print(multi_sorted)


# ============================================================
# 6. Top 5 highest-paid employees
# ============================================================

print("\n========== TOP 5 HIGHEST-PAID EMPLOYEES ==========")

top_5 = employees.sort_values(
    by="salary",
    ascending=False
).head(5)

print(top_5[["employee_id", "name", "department", "salary"]])


# ============================================================
# 7. Department-wise analysis
# ============================================================

print("\n========== DEPARTMENT-WISE ANALYSIS ==========")

analysis = employees.groupby("department").agg(
    employees=("employee_id", "count"),
    average_salary=("salary", "mean"),
    total_salary=("salary", "sum"),
    average_experience=("experience", "mean")
).reset_index()

print(analysis)


# ============================================================
# 8. Save transformed data
# ============================================================

merged_data.to_csv(
    "employees_with_department_details.csv",
    index=False
)

department_summary.to_csv(
    "department_summary.csv"
)

print("\n========== FILES CREATED ==========")
print("employees_with_department_details.csv")
print("department_summary.csv")

print("\nDay 13 completed successfully!")
