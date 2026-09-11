# Creating a list
numbers = [10, 20, 30, 40, 50]

print(numbers)

# Accessing elements
print(numbers[0])
print(numbers[-1])

# Adding an element
numbers.append(60)

# Removing an element
numbers.remove(20)

# Updating an element
numbers[0] = 100

print(numbers)

# Looping through list
for number in numbers:
    print(number)
