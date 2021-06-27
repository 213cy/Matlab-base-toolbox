/*************************************************/
/* ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���    */
/* ��  �ߣ������� ��ά                           */
/* �����磺�������պ����ѧ������                */
/*************************************************/

/*  dlladd.h */

#ifndef _DLL_ADD_H
#define _DLL_ADD_H
 
#define DLLEXPORT  __declspec( dllexport )
 
#include "matrix.h"
 
DLLEXPORT double addDoubleS(double v1,double v2);
DLLEXPORT void addDoubleV(double * v1,const double * v2, int size);
DLLEXPORT void addDoubleArray(mxArray * pA1,mxArray * pA2);
 
#endif
