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

