# Working with floor division

# Helpful pattern:
# 1. Start with the known 
# 2. Calculate the unknown
# 3. Display results

# How many cookies per student at the bake sale? How many cookies left over?

# Define the known
total_cookies = 34 + 28 + 56 + 22 + 12 + 78
students = 33

# Calculate the unknown

# cookies_per_student = total_cookies / students  # normal division

cookies_per_student = total_cookies // students  # floor division
leftover_cookies = total_cookies % students  # remainder

# Display the results
print("Total cookies contributed: " + str(total_cookies))
print("Number of students: " + str(students))
print("Cookies per student: " + str(cookies_per_student))
print("Remaining cookies: " + str(leftover_cookies))


# Hours / minutes / seconds

length_of_recording = 1554  # seconds 

# calculate in minutes:
minutes = length_of_recording // 60
seconds_left = length_of_recording % 60

print()
print(minutes, "minutes", seconds_left, "seconds")



# Gas prices

price = 3.999

gallons_purchased = 4.31

print()
print(price * gallons_purchased)  # not rounded
print(round(price * gallons_purchased, 2))