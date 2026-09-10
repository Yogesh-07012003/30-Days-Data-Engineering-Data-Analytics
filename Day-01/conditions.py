## Conditions
marks = 75

if marks >= 90:
    print("Grade A")
elif marks >= 75:
    print("Grade B")
elif marks >= 50:
    print("Grade C")
else:
    print("Fail")

## Loops
print("Numbers from 1 to 5:")

for number in range(1, 6):
    print(number)

## functions
def calculate_sum(a, b):
    return a + b


result = calculate_sum(10, 20)

print("Sum:", result)
