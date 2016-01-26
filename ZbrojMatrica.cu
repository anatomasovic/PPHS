__global__ void zbroji_matrice (float *dest, float *a, float *b)
{
  const int i = threadIdx.y * blockDim.x + threadIdx.x; //Velicina i pozicija indeksa definirina je pomocu y indeksa niti!
  dest[i] = a[i] + b[i];
}
