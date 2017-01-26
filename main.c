#include<stdio.h>
#include <stdlib.h> 
#include "kernel.h"
#define N 256*256
int main()
{
	float *u2 = (float*)malloc(N*sizeof(float));
	float *v2 = (float*)malloc(N*sizeof(float));
	for (int i = 0; i<N; i++)
	{
		u2[i] = 0.25;
		v2[i] = 0.75;
	}
	float *out = (float*)malloc(N*sizeof(float));
	printf("Question 2c \n N = %u \n", N);
	vecAdd(u2, N, v2, N, out);
	for (int i = 0; i < 10; i++)
	{
		int r = rand() % N;
		printf("Random Node check %u, Answer %e \n", r, out[r]);
	}

	printf("Question 2d \n N = %u \n", N);
	float sc= -3.0;
	scale(u2, N, out, sc);
	float *out1 = (float*)malloc(N*sizeof(float));
	vecAdd(out, N, v2, N, out1);
	for (int i = 0; i < 10; i++)
	{
		int r = rand() % N;
		printf("Random Node check %u, Answer %e \n", r, out1[r]);
	}

	printf("Question 2e \n N = %u \n", N);
	compProd(u2, N, v2, N, out);
		for (int i = 0; i < 10; i++)
		{
			int r = rand() % N;
			printf("Random Node check %u, Answer %e \n", r, out[r]);
		}



}
