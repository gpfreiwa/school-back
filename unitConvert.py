# Unit conversions
def kg_lbs():
    kg = float(input('Enter mass in kilograms: '))
    lbs = kg*2.2
    print('Mass in pounds: {0}'.format(lbs))

def lbs_kg():
    lbs = float(input('Enter mass in pounds: '))
    kg = lbs/(2.2)
    print('Mass in kilograms: {0}'.format(kg))

def C_F():
    C = float(input('Enter temperature in celsius: '))
    F = C*(9/5) + 32
    print('Temperature in Farenheit: {0}'.format(F))

def F_C():
    F = float(input('Enter temperature in farenheit: '))
    C = (F - 32)*(5/9)
    print('Temperature in Celsius: {0}'.format(C))

def km_miles():
    km = float(input('Enter distance in kilometers: '))
    miles = km/1.609
    print('Distance in miles: {0}'.format(miles))

def miles_km():
    miles = float(input('Enter distance in miles: '))
    km = miles*1.609
    print('Distance in kiloneters: {0}'.format(km))

def printMenu():
    print('1. Kilograms to Pounds')
    print('2. Pounds to Kilograms')
    print('3. Celsius to Farenheit')
    print('4. Farenheit to Celsius')
    print('5. Kilometers to Miles')
    print('6. Miles to Kilometers')
    print('7. Quit')
    
if __name__ == '__main__':
    printMenu()
    choice = 1
    while choice == 1:
        systemChoice = int(input('What do you want to convert? '))
        if systemChoice == 1:
               kg_lbs()
        elif systemChoice == 2:
            lbs_kg()
        elif systemChoice == 3:
            C_F()
        elif systemChoice == 4:
            F_C()
        elif systemChoice == 5:
            km_miles()
        elif systemChoice == 6:
            miles_km()
        elif systemChoice == 7:
            break
        else: print('Invalid input')

