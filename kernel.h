#ifndef KERNEL_H_INCLUDED
#define KERNEL_H_INCLUDED

void scale(float *inp, int len, float *out, float scale);

void vecAdd(float *inp1, int len1, float *inp2, int len2, float *out);

void compProd(float *inp1, int len1, float *inp2, int len2, float *out);


#endif
