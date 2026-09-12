department_count = {}

for employee in employee_list:
    department = employee["department"]

    if department in department_count:
        department_count[department] += 1
    else:
        department_count[department] = 1
