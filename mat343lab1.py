import numpy as npy
A = npy.array([[1, 2], [3, 6]])
B = npy.array([[2, -3], [1, 4]])
C = npy.array([[-2, 1], [3, 2]])
A+B
B+A
(A+B)+C
A+(B+C)
alpha = 6
alpha*(A+B)
(alpha*A) + (alpha*B)
npy.dot(A,B+C)
npy.dot(A,B)+npy.dot(A,C)
npy.dot(A,B)
npy.dot(A,C)
npy.dot(B,A)
faCol1 = npy.dot(A,B[:,0])
faCol2 = npy.dot(A,B[:,1])
sec2fa = npy.array([faCol1, faCol2])
sec2fa.T
fbCol1 = npy.dot(A[0,:],B)
fbCol2 = npy.dot(A[1,:],B)
sec2fb = npy.array([fbCol1,fbCol2])
sec2fb.T