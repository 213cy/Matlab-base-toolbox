/*************************************************/
/* ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���    */
/* ��  �ߣ������� ��ά                           */
/* �����磺�������պ����ѧ������                */
/*************************************************/

/* ���� 3-3 matGetDir.c */
/*matGetDir.c�ļ�����*/
#include "mex.h"
#include "mat.h"

int listvariable(const char * file) 
{
	MATFile *pmat;
	const char **dir;
	const char *name;
	int	  ndir;
	int	  i;	

	/*��MAT�ļ�*/
	pmat = matOpen(file, "r");
	if (pmat == NULL) 
    {
        mexPrintf("���ļ�:%s����!\n", file);
        return(1);
    }

	/*   �õ�MAT������Ŀ¼�б�  */
	dir = (const char **)matGetDir(pmat, &ndir);
	if (dir == NULL) 
    {
        mexPrintf("��ȡ�ļ� %s�ı����б����!\n", file);
        return(1);
    }
	else 
    {
        mexPrintf("MAT�ļ� %s�еı�������:\n", file);
        for (i=0; i < ndir; i++)
        {
            mexPrintf("%s\n",dir[i]);
        }
    }
    mxFree(dir);

    /* �ر�MAT�ļ�. */
    if (matClose(pmat) != 0) 
    {
        mexPrintf("�ر��ļ� %s ����!\n",file);
        return(1);
    }  
    return(0);
}

void mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[])
{
  	int i=0;
	char * buff=NULL;
	buff = mxCalloc(200,sizeof(char));
	for(i=0;i<nrhs;i++)
    {
        if(mxIsChar(prhs[0]))
        {					
            mxGetString(prhs[i], buff, 200);					
            listvariable(buff);
        }
        else
        {
            mexPrintf("����ĵ�%d�����������ַ���������!\n");
        }
    }	
	mxFree(buff);
}
