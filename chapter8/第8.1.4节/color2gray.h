/*************************************************/
/* ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���    */
/* ��  �ߣ������� ��ά                           */
/* �����磺�������պ����ѧ������                */
/*************************************************/

#ifndef _COLOR_TO_GRAY_H
#define _COLOR_TO_GRAY_H

#define DLLEXPORT  __declspec( dllexport )

//#include "matrix.h"

typedef struct _COLOR
{
	double r;
	double g;
	double b;
}doubleColor;


DLLEXPORT double color2gray(doubleColor c);
#endif
