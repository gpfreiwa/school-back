from numpy import random
import matplotlib.pyplot as mplot

# generate the sample distributions
binom = random.binomial(1,0.65,100) 	#binomial distribution
expo = random.binomial(5, 100)			#exponential distribution
unif = random.uniform(0,10,100)			#uniform distribution
gauss1 = random.normal(0,2,100)			#Gaussian distribution
gauss2 = random.normal(3,4,100)			#	for making the bivariate gaussian

# visualize the distributions
mplt.plot(x, binom, label='binomial')
mplot.show()