/*************************************************/
/* ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���    */
/* ��  �ߣ������� ��ά                           */
/* �����磺�������պ����ѧ������                */
/*************************************************/

/* ���� 3-2 matReadmxArray.c */
/*matReadmxArray.c�ļ�����*/
#include <stdio.h>
#include "string.h"
#include "mat.h"

#define _FILE_NAME_LEN 100

int analyze_matfile(const char *file) 
{
	MATFile *pmat;
	char **dir;
	const char *name;
	int ndir;
	int i;
	mxArray *pa;
	
	printf("��ʼ��ȡMAT�ļ� %s...\n\n", file);
	
	pmat = matOpen(file, "r");
	if (pmat == NULL) 
	{
		printf("�ļ�%s�򿪳���!\n", file);
		return(1);
	}
	
	
	dir = matGetDir(pmat, &ndir);	
	if (dir == NULL) 
	{
		printf("��ǰMAT�ļ�%s��û���κα���!\n", file);
		return(1);
	}
	else
	{
		printf("MAT�ļ�%s�ı���Ϊ:\n", file);
		for (i=0; i < ndir; i++)
		{
			printf("%s\n", dir[i]);
		}
	}
	mxFree(dir);

	if (matClose(pmat) != 0) 
	{
		printf("�ر��ļ� %s ����!\n",file);
		return(1);
	}
	
	/*���´�MATLAB MAT�ļ�*/
	pmat = matOpen(file, "r");
	if (pmat == NULL) 
	{
		printf("���ļ� %s ����!\n", file);
		return(1);
	}
	
	for (i=0; i < ndir; i++) 
	{
		pa = matGetNextVariableInfo(pmat, &name);
		if (pa == NULL) 
		{
			printf("��ȡ�ļ� %s ����!\n", file);
			return(1);
		}
		
		printf("MATLAB ���� %s ��:\n\tά��Ϊ: %d\n", 
								name, mxGetNumberOfDimensions(pa));
		printf(" \t����x����Ϊ%dx%d\n",
								mxGetM(pa),mxGetN(pa));
		
		mxDestroyArray(pa);
	}
	
	
	if (matClose(pmat) != 0) 
	{
		printf("�ر��ļ� %s ����!\n",file);
		return(1);
	}
	printf("�ļ�%s�������!\n",file);
	return(0);
}


int main(int argc, char **argv)
{
	char name[_FILE_NAME_LEN];
	int num=0;
	int nFlag1,nFlag2;
	
	printf("������Ҫ��ȡ���ļ�����(*.mat):");
	scanf("%s",name);
	while((name[num++]!='\0')&&(num<=_FILE_NAME_LEN-1));
	num = num-1;
	if(num>=_FILE_NAME_LEN-5)
	{
		printf("������ļ���̫��!\n");
		return 0;
	}

	nFlag1 = strcmp(name+num-4,".MAT");
	nFlag2 = strcmp(name+num-4,".mat");
	
	if(nFlag1&&nFlag2)
	{
		name[num]='.';
		name[num+1]='M';
		name[num+2]='A';
		name[num+3]='T';
		name[num+4]='\0';
	}
	analyze_matfile(name);
	getchar();
	return 0;
}
