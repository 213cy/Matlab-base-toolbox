/*************************************************/
/* ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���    */
/* ��  �ߣ������� ��ά                           */
/* �����磺�������պ����ѧ������                */
/*************************************************/

#ifndef __STR_TO_UPPER_H_
#define __STR_TO_UPPER_H_

#define DLLEXPORT  __declspec( dllexport )

DLLEXPORT char * strToUpper(char * str);
DLLEXPORT void strToUpperCell(char ** pStr, int N);

#endif
