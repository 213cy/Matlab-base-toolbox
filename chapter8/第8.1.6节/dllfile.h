/*************************************************/
/* ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���    */
/* ��  �ߣ������� ��ά                           */
/* �����磺�������պ����ѧ������                */
/*************************************************/

/*dllfile.h*/
#ifndef _DLL_FILE_H
#define _DLL_FILE_H
#include "basedef.h"
#include "matrix.h"
#include "string.h"
#include "stdio.h"
#ifndef NULL
#define NULL 0
#endif
DLLEXPORT mxArray * ReadFrameData(char * filename);
#endif

