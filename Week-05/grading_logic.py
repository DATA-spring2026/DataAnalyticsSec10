# # use if / elif / else to assign letter grades

# score = int(input("What is the raw score? (Enter a number) "))

# grade = None

# # print(type(score))

# if score == 100:   # order of conditions matters! most restrictive at the top
#     grade = 'A+'
# elif score >= 90:
#     grade = 'A'
# elif score >= 80:
#     grade = "B"
# elif score >= 70:
#     grade = 'C'
# elif score >= 60:
#     grade = 'D'
# else:
#     print("Retake required.")

# print(f'Grade is {grade}')





# sale_amt = float(input("Sale amount: "))
# tax = round(sale_amt * .08, 2) # 8% sales tax
# tax_exempt = input("Tax exempt? (Y/N) ")

# if tax_exempt == 'Y':
#     tax = 0

# print(tax)




# strawb = input('Strawberries on sale? Y/N: ')
# blueb = input('Blueberries on sale? Y/N: ')
# fresh = input('Are the berries fresh? Y/N: ')

# if (strawb =='Y' or blueb =='Y') and fresh == 'Y':
#     print('Buy it!')
# else:
#     print("Don't buy it")



# match case example

score = int(input("What is the raw score? (Enter a number 0-100) "))

extra_credit = int(input("Extra credit points earned: "))

if extra_credit != 0:
    score += extra_credit
    print(f"Updated score: {score}")

grade = None

score_flat = (score // 10) * 10

# print(score_flat)

match score_flat:
    case 90:
        grade = 'A'
    case 80:
        grade = 'B'
    case 70:
        grade = "C"
    case 60:
        grade = "D"
    case other:
        print("Retake required")


print(f'Grade is {grade}')