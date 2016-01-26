__global__ void matrix_mult (float *result, float *mat1, float *mat2)
{
  const int idx = threadIdx.y * blockDim.x + threadIdx.x;

  float sum_product = 0;
  for (int k = 0; k < 20; k++)
    {
      sum_product += mat1[threadIdx.y * blockDim.x + k] * mat2[k * blockDim.x + threadIdx.x];
    }

  result[idx] = sum_product;
}

/*
import pycuda.autoinit
import pycuda.driver as drv
import numpy as np
from pycuda.compiler import SourceModule

mod = SourceModule(open("mnozenje_vektora.cu").read())

matrix_mult = mod.get_function("matrix_mult")

a = np.ones((20, 20), dtype=np.float32)
b = np.ones((20, 20), dtype=np.float32)

result_gpu = np.empty_like(a)

matrix_mult(drv.Out(result_gpu), drv.In(a), drv.In(b), block=(20,20,1), grid=(1,1))

print (result_gpu)
*/
