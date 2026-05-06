import math

# Gas prices

price = 3.999

gallons_purchased = 4.31

t = price * gallons_purchased

print()
print(price * gallons_purchased)  # not rounded
print(round(price * gallons_purchased, 2))

print()

print("Floor rounding:", math.floor(price * gallons_purchased))
print("Celiing rounding:", math.ceil(price * gallons_purchased))

print()
print("Using floor division: ", (price * gallons_purchased) // 1)

# Use of pi from the math library
# print()
# print(math.pi)

# print()
# print(round(price, 6))

print("Gas bill using format function:", format(price * gallons_purchased, ".2f"))
print(type(format(price * gallons_purchased, ".2f")))