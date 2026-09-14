class Employee:

    def __init__(self, employee_id, name, department, salary):
        self.employee_id = employee_id
        self.name = name
        self.department = department
        self.__salary = salary

    def display_employee(self):
        print("-----------------------------")
        print(f"ID         : {self.employee_id}")
        print(f"Name       : {self.name}")
        print(f"Department : {self.department}")
        print(f"Salary     : ₹{self.__salary}")

    def get_salary(self):
        return self.__salary

    def update_salary(self, new_salary):
        if new_salary > 0:
            self.__salary = new_salary
            print("Salary updated successfully.")
        else:
            print("Invalid salary.")


class Manager(Employee):

    def __init__(self, employee_id, name, department, salary, team_size):
        super().__init__(employee_id, name, department, salary)
        self.team_size = team_size

    def display_manager(self):
        self.display_employee()
        print(f"Team Size  : {self.team_size}")


def display_menu():
    print("\n===== Employee Management System =====")
    print("1. Add Employee")
    print("2. Display Employees")
    print("3. Update Salary")
    print("4. Exit")


employees = []


def add_employee():
    employee_id = int(input("Enter Employee ID: "))
    name = input("Enter Name: ")
    department = input("Enter Department: ")
    salary = float(input("Enter Salary: "))

    employee = Employee(
        employee_id,
        name,
        department,
        salary
    )

    employees.append(employee)

    print("Employee added successfully.")


def display_employees():

    if len(employees) == 0:
        print("No employees found.")
        return

    print("\n===== Employee List =====")

    for employee in employees:
        employee.display_employee()


def update_employee_salary():

    employee_id = int(input("Enter Employee ID: "))

    for employee in employees:

        if employee.employee_id == employee_id:

            new_salary = float(
                input("Enter New Salary: ")
            )

            employee.update_salary(new_salary)
            return

    print("Employee not found.")


while True:

    display_menu()

    choice = input("Enter your choice: ")

    if choice == "1":
        add_employee()

    elif choice == "2":
        display_employees()

    elif choice == "3":
        update_employee_salary()

    elif choice == "4":
        print("Thank you!")
        break

    else:
        print("Invalid choice.")
