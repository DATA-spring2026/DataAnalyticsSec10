# Simple budget calculator

# Starting values

monthly_income = 3500

rent = 1800
groceries = 500
gas = 100
utilities = 200
int_phone = 125
subscriptions = 100

# Calculate total expenses

monthly_exp = rent + groceries + gas + utilities + int_phone + subscriptions

# spending_money = (monthly_income - monthly_exp) * .10

savings_target = (monthly_income - monthly_exp) * .20
spending_money = (monthly_income - monthly_exp) - savings_target

print("Total monthly expenses:", monthly_exp)

print("Remaining money after expenses:", monthly_income - monthly_exp)

print("Savings target:", savings_target)

print("Available to spend:", spending_money)