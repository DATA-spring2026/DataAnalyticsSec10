# copying from p. 78 in the Student Guide

ice_cream_menu = [ 
    ('cone-single', 'chocolate', 4.00), 
    ('cone-double', 'mint', 6.00), 
    ('dish-single', 'cherry chip', 4.00), 
    ]

order  = input("What is your order type (dish or cone)? ")

for i in ice_cream_menu:
   for x in i:
      if order in str(x):
         print(i)

