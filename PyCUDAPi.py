import pycuda.autoinit
import pycuda.gpuarray as ga
import numpy as np

#Za ovaj kod ne kuzim matematiku algoritma al nek se nadje u slucaju da bude nesto slicno 

n_iterations = 1000

def compute_pi(n):
    h = 1.0 / n
    x = h * (ga.arange(1, n, dtype=np.float32) + 0.5)
    s = ga.sum(4.0 / (1.0 + x**2), dtype=np.float32)
    return s.get() * h

pi = compute_pi(n_iterations)
error = abs(pi - np.math.pi)
print("pi is approximately %.16f, error is approximately %.16f" % (pi, error))


