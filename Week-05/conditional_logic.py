# using if / else

# groceries = ["milk", "eggs", "almond yogurt", "bread"]

# pantry = ['banana', 'peanut butter', 'Nutella']

# groc_check = input("Check for item on grocery list: ")

# if groc_check in groceries:
#     print(f"Grocery list contains {groc_check}")
# elif groc_check in pantry:
#     print(f"Already in pantry")
# else:
#     print("Not on grocery list")
#     groceries.append(groc_check)
#     print(f'{groc_check} has been added to list')

# print(f"Grocery list: {groceries}")


# conditions are read top-down -- as soon as a condition returns true, if/else block is done

print()
print("Grocery basket example:") 

grocery_budget = 100

basket = [10, 15, 10, 15, 20, 25]

# if sum(basket) < grocery_budget:
#     print(f"Keep shopping - ${grocery_budget - sum(basket)} left")
# elif (grocery_budget - sum(basket)) < 10:   # This condition will not be reached if the first is already met
#     print("Caution: you have less than $10")

if (grocery_budget - sum(basket)) < 10:
    print("Caution: you have less than $10")
    print(f"Actual remaining budget - ${grocery_budget - sum(basket)} left")
elif sum(basket) < grocery_budget:
    print(f"Keep shopping - ${grocery_budget - sum(basket)} left")


# working with comparison operators

print()
# print(grocery_budget == 102)
# must use == to check for equality (single = is an assignment operator, not used for comparison)


# Greeting script

greeting = input("Enter hi " )

if greeting[:2].lower() == 'hi':    # Added index range and .lower method so that HI or Hi!!!! also works
    print("Hello there!")
else:
    print("Rude.")