/*************************************************/
/* ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���    */
/* ��  �ߣ������� ��ά                           */
/* �����磺�������պ����ѧ������                */
/*************************************************/

#include "strToUpper.h"

DLLEXPORT char * strToUpper(char * str)
{
	int nLen;
	int kk = 0;
	nLen = strlen(str);
	for(kk=0;kk<nLen;kk++)
		{
			str[kk] = toupper(str[kk]);
		}
	return str;
}

DLLEXPORT void strToUpperCell(char ** pStr, int N)
{
	int kk;	
	for(kk=0;kk<N;kk++)
		{
			pStr[kk] = strToUpper(pStr[kk]);			
		}	
}
