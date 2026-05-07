# compare list to tuple

groceries = ["milk", "eggs", "almond yogurt", "bread"]

groceries.insert(1, "brownies")

print(groceries)

# Creating a tuple

print()
print('Here is our tuple set of steps:')

groc_tup = ("milk", "eggs", "almond yogurt", "bread")

groc_tup = list(groc_tup)  # reassign the value of groc_tup, casting groc_tup as a list

print(groc_tup)

groc_tup.append("brownies")

groc_tup = tuple(groc_tup)

print(groc_tup[-1])
print(groc_tup)


# example of unpacking

print()
print("Working with unpacking")

print(groc_tup)

_, horatio, _, theodore, _ = groc_tup   # my roommates horatio and theodore have these specific requests

print(horatio)
print(theodore)
print(_)

x, y, *z = groc_tup

print(f'the value of x is {x}')
print(f'the value of y is {y}')
print(f'the remaining values are {z}')

a, b, c = (1, 2, 3)

print(f'{c}, {b}, {a}')


# tuple concatenation

print()
print("Starting tuple", groc_tup)

mike_groc = ("peanut butter", "caramel", "chocolate chip cookies")

groc_tup += mike_groc

print("Now with Mike's grocery request", groc_tup)

kevin_groc = ('salad',)   # need comma to make a tuple of 1 items

groc_tup += kevin_groc

print("Plus Kevin's salad", groc_tup)


# working with sets

print()
print("Creating a seating arrangment:")

attendees = {"Natalia", "Sthefanie", "Brandon", "Dahlia"}

seat1, seat2, seat3, seat4 = attendees

print(f'Table 1 seats: {seat1}, {seat2}, {seat3}, {seat4}')

rsvp = ["Brandon", "Dahlia", "Destiney", "Edmund"]

attendees.update(rsvp)

print(f"Updated for RSVPs: {attendees}")

attendees.add("Hritik")

print(f'One more for the guest list: {attendees}')

# list: ordered, mutable, allows duplicates -- enclosed in []
# tuple: ordered, immutable, allows duplicates -- enclosed in ()
# set: unordered, semi-immutable, does not allow duplicates -- enclosed in {}


# working with dictionaries

print()
print("Dahlia's car")

dahlia_car = {
    "make": "Nissan", 
    "model": "Rogue",
    "year": 2022,
    "color": "gray"
}

print(f'Dahlia owns a {dahlia_car['year']} {dahlia_car['make']} {dahlia_car['model']}')

parking_spaces = {1: 'Greg', 2: 'Sal', 3: 'Casey'}

print(f'Parking space 1 is assigned to {parking_spaces[1]}')

print(parking_spaces.items())
print(parking_spaces.keys())
print(parking_spaces.values())

print(f'Parking space 4 is assigned to {parking_spaces.get(4, '[no space available]')}')

parking_spaces[4] = 'Herman'

print(f'Parking space 4 is assigned to {parking_spaces.get(4, '[no space available]')}')

print(4 in parking_spaces)
print("Herman" in parking_spaces)
print(parking_spaces)


# nested collections

print()

print("Working with nested collections")

# When might this be useful?
# biology: body > organ > cell
# geography: state > county > city > municipal district > neighborhood
# taxonomy: kingdom > phylum > class > order > family > genus > species
# spreadsheets: a document with multiple rows (or columns)
# entity relationship diagram

employee = (
    ("emp_id", "name", "hire date", "salary"),
    ('007', "James Bond", "Nov 30, 2005", 128000),
    ('008', "Miss Moneypenny", "Apr 4, 2008", 148000),
    ('100', "Quigley Henry", "May 5, 2015", 178000)
)

print(f'This year the employee picnic is being run by {employee[1][1][0:5]}')