/*************************************************/
/* ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���    */
/* ��  �ߣ������� ��ά                           */
/* �����磺�������պ����ѧ������                */
/*************************************************/

/*dllfile.c*/
#include "dllfile.h"
DLLEXPORT mxArray * ReadFrameData(char * filename)
{
	FILE * fp=NULL;	
    	mxArray * pStruct = NULL;	
	fp =  fopen(filename,"rb");
	if(!fp)
	{
		char str[500];
		sprintf(str,"�ļ��򿪴���,fp = 0x%x",fp);
		return mxCreateString(str);
	}    
	pStruct = ReadData(fp);    
	fclose(fp);
	fp = NULL;    
	return pStruct;
}
