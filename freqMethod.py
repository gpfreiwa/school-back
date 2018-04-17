from math import sqrt
c = 3 * 10^8
m = [0,1,2,3,4]
n = [0,1,2,3,4]
p = [0,1,2,3,4]

if __name__ == '__main__':

    a = 0.08
    b = 0.06
    d = 0.05
    f = []

    for i in m:
        for j in n:
            for k in p:
                f[int(i),int(j),int(k)] = (c/2)*sqrt((i/a)*(i/a)+(j/b)*(j/b)+(k/d)*(k/d))

