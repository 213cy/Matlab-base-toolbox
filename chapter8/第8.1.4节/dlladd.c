/*************************************************/
/* ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���    */
/* ��  �ߣ������� ��ά                           */
/* �����磺�������պ����ѧ������                */
/*************************************************/

/* dlladd.c */
/*dlladd.c�ļ�*/
#include "dlladd.h"
DLLEXPORT double addDoubleS(double v1,double v2)
{
    return (v1+v2);
}
DLLEXPORT void addDoubleV(double * v1,const double * v2, int size)
{
    int kk;
    for(kk=0;kk<size;kk++)
    {
        v1[kk] = v1[kk]+v2[kk];
    }
}


DLLEXPORT void addDoubleArray(mxArray * pA1,mxArray * pA2)
{
    double * pa1;
    double * pa2;
    int N1;
    int N2;
    int kk;
    pa1 = mxGetPr(pA1);
    pa2 = mxGetPr(pA2);
    N1 = mxGetNumberOfElements(pA1);
    N2 = mxGetNumberOfElements(pA2);
    if(N1!=N2)
    {
        printf("�������и�������ͬ!\n");
        return;
    }
    for(kk=0;kk<N1;kk++)
    {
        pa1[kk] = pa1[kk]+pa2[kk];
    }
}
