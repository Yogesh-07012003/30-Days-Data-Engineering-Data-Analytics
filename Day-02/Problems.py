# find Duplicates
numbers = [10, 20, 30, 20, 40, 50, 30, 60, 10]

seen = set()
duplicates = set()

for number in numbers:
    if number in seen:
        duplicates.add(number)
    else:
        seen.add(number)

print("Duplicates:", duplicates)

# Count Frequency
fruits = [
    "apple",
    "banana",
    "apple",
    "orange",
    "banana",
    "apple"
]

frequency = {}

for fruit in fruits:
    if fruit in frequency:
        frequency[fruit] += 1
    else:
        frequency[fruit] = 1

print(frequency)

# Find Maximum and Minimum
numbers = [45, 12, 89, 34, 67, 23]

maximum = numbers[0]
minimum = numbers[0]

for number in numbers:

    if number > maximum:
        maximum = number

    if number < minimum:
        minimum = number

print("Maximum:", maximum)
print("Minimum:", minimum)

# Dictionary-Based Employee Data
employees = {
    101: {
        "name": "Yogesh",
        "department": "Data Engineering",
        "salary": 40000
    },

    102: {
        "name": "Rahul",
        "department": "Data Analyst",
        "salary": 35000
    },

    103: {
        "name": "Priya",
        "department": "QA",
        "salary": 30000
    }
}

# Display all employees

for employee_id, employee in employees.items():

    print("Employee ID:", employee_id)
    print("Name:", employee["name"])
    print("Department:", employee["department"])
    print("Salary:", employee["salary"])

# Find employees with salary greater than 35,000

for employee_id, employee in employees.items():

    if employee["salary"] > 35000:
        print(employee["name"], employee["salary"])


# Calculate average salary
total_salary = 0

for employee in employees.values():
    total_salary += employee["salary"]

average_salary = total_salary / len(employees)

print("Average Salary:", average_salary)
