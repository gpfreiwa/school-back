def multy_table(a,b):
    for i in range(0,b+1):
        print('{0} x {1} = {2}'.format(a, i, a*i))


if __name__=='__main__':
    a = input('Enter a number: ')
    b = input('Enter the limit of  table: ')
    multy_table(float(a),int(b))
