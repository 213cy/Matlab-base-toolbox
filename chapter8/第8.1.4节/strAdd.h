/*************************************************/
/* ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���    */
/* ��  �ߣ������� ��ά                           */
/* �����磺�������պ����ѧ������                */
/*************************************************/

#ifndef _STR_ADD_H
#define _STR_ADD_H

#include "matrix.h"
#define DLLEXPORT  __declspec( dllexport )
DLLEXPORT char** ppStrAdd(char *str);
DLLEXPORT void destroyPP();
#endif
