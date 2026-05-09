# what is enumerate?

grocery_list = ["peach", "apple", "chocolate chip cookies", "rotisserie chicken", "pita"]

for number, thing in enumerate(grocery_list, start=1):  # could also call the iterator variables i, x
    # print(number, thing)
    if number > 3:
        break
    print(f'Item number {number} in the list is {thing}')