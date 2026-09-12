import csv

try:
    # Read CSV file
    with open("employees.csv", "r") as file:
        employees = csv.DictReader(file)

        employee_list = list(employees)

    # Calculate salaries
    salaries = []

    for employee in employee_list:
        salary = int(employee["salary"])
        salaries.append(salary)

    # Average salary
    average_salary = sum(salaries) / len(salaries)

    # Highest salary
    highest_salary = max(salaries)

    # Find employee with highest salary
    highest_employee = max(
        employee_list,
        key=lambda employee: int(employee["salary"])
    )

    # Department count
    department_count = {}

    for employee in employee_list:
        department = employee["department"]

        if department in department_count:
            department_count[department] += 1
        else:
            department_count[department] = 1

    # Display results
    print("===== Employee CSV Analyzer =====")

    print(f"Average Salary: ₹{average_salary:.2f}")

    print(
        f"Highest Salary: ₹{highest_salary} "
        f"({highest_employee['name']})"
    )

    print("\nDepartment Count:")

    for department, count in department_count.items():
        print(f"{department}: {count}")

except FileNotFoundError:
    print("Error: employees.csv file not found.")

except ValueError:
    print("Error: Salary must contain valid numbers.")

except Exception as e:
    print(f"Unexpected error: {e}")
