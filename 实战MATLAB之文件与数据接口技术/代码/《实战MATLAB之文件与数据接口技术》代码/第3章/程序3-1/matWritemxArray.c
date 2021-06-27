/*************************************************/
/* ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���    */
/* ��  �ߣ������� ��ά                           */
/* �����磺�������պ����ѧ������                */
/*************************************************/

/* ���� 3-1 matWritemxArray.c */
/* matWritemxArray.c�ļ����� */
#include "memory.h"
#include "mat.h"

#ifndef NULL
#define NULL 0
#endif

int main(int argc, char* argv[]) 
{
	MATFile *pmat;
	mxArray *pa1, *pa2, *pa3;
	double * pdata = NULL;
	double data[9] = { 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0 };
	const char *file = "mattest.mat";	
	char ** dir;
	int ndir;
	int status,i; 
	
	printf("���ڴ����ļ� %s...\n\n", file);
	pmat = matOpen(file, "w");
	if (pmat == NULL)
	{
		printf("�ļ� %s ��������\n", file);
		return -1;
	}
	
	pa1 = mxCreateDoubleMatrix(3,3,mxREAL);
	if (pa1 == NULL) 
	{
		printf("����mxArray�ṹʧ�ܣ�pa1.\n");
matClose(file);
		return -1;
	}
	/*��������pa1������*/
	pdata = mxGetPr(pa1);
	for(i=0;i<mxGetM(pa1)*mxGetN(pa1);i++)
	{
		pdata[i]=mxGetM(pa1)*mxGetN(pa1)-i+1;
	}
	
	pa2 = mxCreateDoubleMatrix(3,3,mxREAL);
	if (pa2 == NULL) 
	{
		printf("����mxArray�ṹʧ�ܣ�pa2.\n");
matClose(file);
		return -1;
	}
	/*����pa2����*/
	memcpy((void *)(mxGetPr(pa2)), (void *)data, sizeof(data));

	pa3 = mxCreateString("MATLAB: the language of technical computing");
	if (pa3 == NULL) 
	{
		printf("����mxArray�ṹʧ�ܣ�pa3.\n");
matClose(file);
return -1;
	}
	
	status = matPutVariable(pmat, "LocalDouble", pa1);
	if (status != 0) 
	{
		printf("%s :  matPutVariable ��������, %d��\n",	__FILE__, __LINE__);
		return -1;
	} 
	
	status = matPutVariableAsGlobal(pmat, "GlobalDouble", pa2);
	if (status != 0) 
	{
		printf("%s: matPutVariableAsGlobal����, %d��\n", __FILE__, __LINE__);
		return -1;
	} 
	
	status = matPutVariable(pmat, "LocalString", pa3);
	if (status != 0) 
	{
		printf("%s :  matPutVariable ��������, %d��\n",	__FILE__, __LINE__);
		return -1;
	} 
	
		
	mxDestroyArray(pa1);
	mxDestroyArray(pa2);
	mxDestroyArray(pa3);

	printf("�ļ� %s �����ɹ�!\n\n", file);
	
	if (matClose(pmat) != 0) 
	{
		printf("�ر� %s �ļ�����!\n",file);
		return -1;
	}
	
  /*���´����ɵ�MAT�ļ����������еı�����ʾ����*/
	pmat = matOpen(file, "r");
	if (pmat == NULL) 
	{
		printf("���ļ� %s ����!\n", file);
		return -1;
	}
	
	dir = matGetDir(pmat, &ndir);
	if (dir == NULL) 
	{
		printf("MAT�ļ� %s û�б�������!\n", file);
		return(1);
	}
	else 
	{
		printf("MAT �ļ�%s �еı�����:\n", file);
		for (i=0; i < ndir; i++)
		{
			printf("\t%s\n",dir[i]);
		}
	}	
	
	if (matClose(pmat) != 0) 
	{
		printf("�ر� %s �ļ�����!\n",file);
		return(EXIT_FAILURE);
	}		
	return 0;
}
