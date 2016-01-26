‪#‎include‬ <math.h>
__device__ float rez(float *a, float *b, int i)
{
return 2 * sin(a[i]) + 3 * cos(b[i]); //Pmocna funkcija koja vraca rezultat
}
__global__ void zbrajanje(float *dest, float *a, float *b)
{
const int i = threadIdx.y * blockDim.x + threadIdx.x;
dest[i] = rez(a, b, i);
}

/*
import pycuda.autoinit
import pycuda.driver as drv
import numpy as np
from pycuda.compiler import SourceModule

mod = SourceModule(open("modificirano_mnozenje_matrica.cu").read())
zbrajanje = mod.get_function("zbrajanje")

a = np.ones((10, 10), dtype=np.float32)
b = np.ones((10, 10), dtype=np.float32)

result_gpu = np.empty_like(a)

zbrajanje(drv.Out(result_gpu), drv.In(a), drv.In(b), block = (10, 10, 1), grid = (1, 1))

print (result_gpu)
*/
