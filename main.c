#include<stdio.h>
#include <stdlib.h> 
#include "kernel.h"
#define N 32
int main()
{
	float *u2 = (float*) malloc(N*sizeof(float));
 	float *v2 = (float*) malloc(N*sizeof(float));
 	for(int i=0; i<N;i++)
	{
		u2[i]=0.25;
		v2[i]=0.75;
	}
	float *out = (float*) malloc(N*sizeof(float));
	printf("Question 2c \n N = %u \n",N);
	vecAdd(u2,len1,v2,len2,out);
	for(int i =0 i<10; i++)
	{
		int r = rand() % 20;
		printf("Random Node check %u, Answer %g \n",N,out[r]);
	}
	
	
}
