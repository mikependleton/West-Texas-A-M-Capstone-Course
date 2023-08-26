# Chapter 2.1 and 2.2 Variables
import math
students_count = 1000
rating = 4.99
is_published = True
course_name = "Python Programming"
print(students_count)
print(rating, is_published, course_name)
print("." * 10)

# Chapter 2.3 Strings
course = "Python Programming"
print(len(course))
print(course[0])
print(course[-1])
print(course[0:3])
print(course[0:])
print(course[:3])
print(course[:])
print("." * 10)

# Chapter 2.4 Escape Sequences
# \"
course = "Python \"Programming"
print(course)
# \'
course = "Python \'Programming"
print(course)
# \\
course = "Python \\Programming"
print(course)
print("." * 10)

# Chapter 2.5 Formatted Strings
first = "Sean"
last = "Humpherys"
full = f"{len(first)} {2 + 2}"
print(full)
print("." * 10)

# Chapter 2.6 String Methods
print("Chapter 2.6 String Methods")
course = "python programming"
print(course.upper())
print(course.lower())
print(course.title())
print(course.rstrip())
print(course.find("Pro"))
print(course.replace("p", "j"))
print("pro" in course)
print("swift" not in course)
print("." * 10)

# Chapter 2.7 Numbers"
print("Chapter 2.7 Numbers")
x = 1  # integer
x = 1.1  # float number with decimals
print(10 + 3)
print(10 - 3)
print(10 * 3)
print(10 / 3)
print(10 // 3)
print(10 % 3)  # modulous or mod
print(10 ** 3)  # exponent

x = 10
x = x + 3
print(x)
x = 10
x += 3  # augmented operator add
print(x)

y = 20
y -= 3  # augmented operator subtract
print(y)

z = 30
z *= 3  # augmented operator multiply
print(z)

# Chapter 2.8 working with Numbers
print("Chapter 2.8 Working with Numbers")

print(round(2.9))
print(abs(-2.0))
print(math.ceil(2.2))
print("." * 10)

# Chapter 2.9 Type Conversin
x = input("Enter a value for x: ")
y = int(x) + 1
print(f"x: {x}, y: {y}")
print("." * 10)

rate = input("Enter interest rate, e.g. 0.5: ")
rate = float(rate)  # may reuse the same variable
# three different ways to output a number variable with text
print(f"Bollower does not qualify at {rate}")  # string interpolation
print("Borrower does not qualify at ", rate)
print("Borrow does not qualify at " + str(rate))
# Dr. Humpherys likes string interpolation the best!

# Task G
print("." * 10)
card_number = "xxx8974"
date = "9\\7\\20"
#Salsa_cost_round = round(salsa_cost, 2)
cookies_cost = (3.15)
cookies_cost = (float(cookies_cost))
chips_cost = (3.15)
ships_cost = (float(chips_cost))
salsa_cost = (5.10)
salsa_cost = (float(salsa_cost))
total_cost = (salsa_cost + cookies_cost + chips_cost)
total_cost = (float(total_cost))
print("Reciept")
print(f"Date: {date}")
print(f"cookies $ {cookies_cost}")
print(f"chips $ {chips_cost}")
print(f"salsa $ {salsa_cost:.2f}")
print(f"Total: $ {total_cost:.2f}")
print("." * 10)
