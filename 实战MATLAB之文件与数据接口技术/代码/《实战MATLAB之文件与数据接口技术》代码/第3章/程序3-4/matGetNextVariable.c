/*************************************************/
/* ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���    */
/* ��  �ߣ������� ��ά                           */
/* �����磺�������պ����ѧ������                */
/*************************************************/

/* ���� 3-4 matGetNextVariable.c */
/*matGetNextVariable.c�ļ�����*/
#include "mex.h"
#include "mat.h"
int listvariabledims(const char * file) 
{
	MATFile *pmat;	
	const char * name=NULL;	
	int	  i;	
	mxArray * pa = NULL;
	mwSize ndim;
	mwSize * dim;
    
	/*��MAT�ļ�*/
	pmat = matOpen(file, "r");
	if (pmat == NULL) 
    {
        mexPrintf("���ļ�:%s����!\n", file);
        return(1);
    }
 	mexPrintf("MAT�ļ� %s�еı�������Ϣ����:\n", file);
    /*�õ�MAT�ļ��еĸ�������*/
	pa = matGetNextVariable(pmat, &name);
    while(pa!=NULL)
    {
        mexPrintf("����%s  ",name);
        dim = mxGetDimensions(pa);
        ndim = mxGetNumberOfDimensions(pa);
        mexPrintf("ά����Ϣ��");
        for(i=0;i<ndim-1;i++)
        {
            mexPrintf("%dx", dim[i]);
        }
        mexPrintf("%d\n", dim[i]);
        mxDestroyArray(pa);
        pa = matGetNextVariable(pmat,&name);
    }
    
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
            listvariabledims(buff);
        }
        else
        {
            mexPrintf("����ĵ�%d�����������ַ���������!\n");
        }
    }
	mxFree(buff);
}
