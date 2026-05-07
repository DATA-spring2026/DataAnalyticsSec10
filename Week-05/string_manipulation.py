# Working with string indexing

emp_id = '007'

emp_name = "James Bond"

print(emp_id[2])

print(emp_id[-1])

print(emp_name[:5])

print(emp_name[-4:])

print(len(emp_name))


# Splitting strings

fruits = 'banana apple orange'

list_of_fruits = fruits.split()

print(list_of_fruits)

staff = "James Bond, Miss Moneypenny, Q"
all_staff = staff.split(", ")
alt_all_staff = staff.split()

print(all_staff)

print(alt_all_staff)

print(staff.split("s"))

print('11/2/1967'.split("/"))


# Back to indexing for a minute ...

emp_id = '007'
emp_name = "James Bond"

print(emp_id[0:2])
print(len(emp_id[0:2]))


# practice with .split() method

print(list_of_fruits)

# split_at_a = list_of_fruits.split("a")  # results in error

print(list_of_fruits[0].split("a"))


address_book = ['Grandma, 100 Pine Tree Dr, Willoburgh PA', 'Aunt Margret, 55 Whistlestop, Pinecone WY']

print(address_book[0].split(","))

grandma = address_book[0].split(",")

print("Grandma's address for holiday card:")
print(grandma[0])
print(grandma[1].strip())
print(grandma[2].strip())

# upper / lower / title

print(emp_name)
print(emp_name.upper())
print(emp_name.lower())

emp_name2 = "miSS mONEYpENNY"

print(emp_name2.title())
print(emp_name2)


# using replace()

gma_addr = 'Grandma, 100 Pine Tree Dr, Willoburgh PA'
print(gma_addr)
gma_addr = gma_addr.replace('Grandma', 'Kathy DiFiglia')
print(gma_addr)

receipt_total = "$2,234.87"
receipt_total = receipt_total.replace("$", '').replace(",", "")
# receipt_total = receipt_total.replace(",", "")

# receipt_total = receipt_total.replace("$", '', ",", "")  # creates an error, too many arguments

print(float(receipt_total))


# examples using input and string manipulation

checkin = input("Are you OK? (Enter Y or N) ").upper()

if checkin == 'Y':
    print("Oh good!")
else: 
    print("Oh no!")

print(f'You entered {checkin}')