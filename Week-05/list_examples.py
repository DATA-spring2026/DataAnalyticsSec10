# working with lists and list methods

groceries = ['milk', 'eggs', 'cereal', 'cookies']

print(groceries)

groceries.pop(3)

print(groceries)

groceries.append("meat")
groceries.append("vegan alternative")

print(groceries)

groceries.insert(1, 'bell pepper')

print(groceries)

print(sorted(groceries))  # sorted() function returns a new sorted list

print(groceries)

groceries.sort()  # sort() method is going to re-sort the list items in place

print(groceries)

groceries.reverse()

print(groceries)

print(min(groceries))
print(max(groceries))


groc_purchase = [2.99, 6.99, 10.50, 12.99, 4.55]

print(min(groc_purchase))
print(sum(groc_purchase))


row_item = "2.99, 6.99, 10.50, 12.99, 4.55" 
split_row = row_item.split(", ")

print("After splitting string:", split_row)

row_num = []

for item in split_row:
    row_num.append(float(item))

# for i in split_row:     # i is for iterator
#     row_num.append(float(i))

print("Using loop to convert strings to floats", row_num)


print(sum(row_num))

# print(sum(row_item))  # won't work because that's a string
# print(sum(split_row))