#include "kernel.h"
#include<stdio.h>
#include <stdlib.h> 
#include <math.h>
#define TPB 32

__global__ 
void scaleKernel(float *d_inp, int len, float *d_out, float scale)
{
	const int i = blockIdx.x*blockDim.x + threadIdx.x;
	if(i<len)
		d_out[i] = d_in[i]*scale;
		
}
__global__ 
void vecAddKernel(float *d_inp1, int len1, float *d_inp2, int len2,float *d_out)
{
	if(len1 != len2)
	{
		printf("Vector dimensions do not match, Please Verify");
	}
	else
	{
		const int i = blockIdx.x*blockDim.x + threadIdx.x;
		if(i<len1)
			d_out[i] = d_inp1[i]+d_inp2[i];
		
	}
	
}

__global__ 
void compProdKernel(float *inp1, int len1, float *inp2, int len2, float *out)
{
	
	else
	{
		const int i = blockIdx.x*blockDim.x + threadIdx.x;
		if(i<len1)
			d_out[i] = d_inp1[i]*d_inp2[i];
		
	}		
}


void scale(float *inp, int len, float *out, float scale);
{
	float *d_inp =0;
	float *d_out =0;
	
	cudaMalloc(&d_inp, len*sizeof(float));
	cudaMalloc(&d_out, len*sizeof(float));
	
	cudaMemcpy(d_inp, inp, len*sizeof(float),cudaMemcpyHostToDevice);
	scaleKernel<<<len/TPB,TPB>>>(d_inp, len, d_out, scale);
	
	cudaMemcpy(out,d_out, len*sizeof(float),cudaMemcpuDeviceToHost);
	cudaFree(d_inp);
	cudaFree(d_out);
}

void vecAdd(float *inp1, int len1, float *inp2, int len2,float *out);
{
	if(len1 != len2)
	{
		printf("Vector dimensions do not match, Please Verify");
	}
	else
	{
		float *d_inp1 =0;
		float *d_inp2 =0;
		float *d_out =0;
		
		cudaMalloc(&d_inp1, len*sizeof(float));
		cudaMalloc(&d_inp2, len*sizeof(float));
		cudaMalloc(&d_out, len*sizeof(float));
		
		cudaMemcpy(d_inp1, inp1, len*sizeof(float),cudaMemcpyHostToDevice);
		cudaMemcpy(d_inp2, inp2, len*sizeof(float),cudaMemcpyHostToDevice);
		
		vecAddKernel<<<len/TPB,TPB>>>(*d_inp1, len1, *d_inp2, len2, *d_out);
		
		cudaMemcpy(out,d_out, len*sizeof(float),cudaMemcpuDeviceToHost);
		cudaFree(d_inp1);
		cudaFree(d_inp2);
		cudaFree(d_out);

	}
	
	
}

void compProd(float *inp1, int len1, float *inp2, int len2,float *out);
{
	if(len1 != len2)
	{
		printf("Vector dimensions do not match, Please Verify");
	}
	else
	{
		float *d_inp1 =0;
		float *d_inp2 =0;
		float *d_out =0;
		
		cudaMalloc(&d_inp1, len*sizeof(float));
		cudaMalloc(&d_inp2, len*sizeof(float));
		cudaMalloc(&d_out, len*sizeof(float));
		
		cudaMemcpy(d_inp1, inp1, len*sizeof(float),cudaMemcpyHostToDevice);
		cudaMemcpy(d_inp2, inp2, len*sizeof(float),cudaMemcpyHostToDevice);
		
		compProdKernel<<<len/TPB,TPB>>>(*d_inp1, len1, *d_inp2, len2, *d_out);
		
		cudaMemcpy(out,d_out, len*sizeof(float),cudaMemcpuDeviceToHost);
		cudaFree(d_inp1);
		cudaFree(d_inp2);
		cudaFree(d_out);

	}
	
	
}
