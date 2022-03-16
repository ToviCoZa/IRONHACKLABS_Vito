"""
This is a dumb calculator that can add and subtract whole numbers from zero to five.
When you run the code, you are prompted to enter two numbers (in the form of English
word instead of number) and the operator sign (also in the form of English word).
The code will perform the calculation and give the result if your input is what it
expects.
The code is very long and messy. Refactor it according to what you have learned about
code simplicity and efficiency.
"""

from sqlalchemy import false


print('Welcome to this calculator!')
print('It can add and subtract whole numbers from zero to five')
values_dict = {'zero' : 0 , 'one' : 1, 'two' : 2, 'three' : 3, 'four' : 4, 'five' : 5, 'six' : 6, 'seven' : 7, 'eight' : 8, 'nine' : 9, 'ten' : 10 }

a = input('Please choose your first number (zero to five): ')
b = input('What do you want to do? plus or minus: ')
c = input('Please choose your second number (zero to five): ')
if a in values_dict == False or b in values_dict == False or c in values_dict == False:
# if (not a == 'zero' and not a == 'one' and not a == 'two' and not a == 'three' and not a == 'four' and not a == 'five') or (not c == 'zero' and not c == 'one' and not c == 'two' and not c == 'three' and not c == 'four' and not c == 'five') or (not b == 'plus' and not b == 'minus'):
    print("I am not able to answer this question. Check your input.")


if b == 'plus':
    answer = values_dict[a] + values_dict[c]
    print(a + ' ' + b + ' ' + c + ' equals ' + list(values_dict.keys())[list(values_dict.values()).index(answer)])
elif b == 'minus' :
    if (values_dict[a] - values_dict[c]) > 0 :
        answer = values_dict[a] - values_dict[c]
        print(a + ' ' + b + ' ' + c + ' equals ' + list(values_dict.keys())[list(values_dict.values()).index(answer)])
    else :
        answer = abs(values_dict[a] - values_dict[c])
        print(a + ' ' + b + ' ' + c + ' equals negative ' + list(values_dict.keys())[list(values_dict.values()).index(answer)])




print("Thanks for using this calculator, goodbye :)")