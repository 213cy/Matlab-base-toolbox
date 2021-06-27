/*************************************************/
/* ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���    */
/* ��  �ߣ������� ��ά                           */
/* �����磺�������պ����ѧ������                */
/*************************************************/

//showinfo.cpp
#include "stdio.h"
#define _START_FLAG 0xAAAAAAAA
#define _END_FLAG 0xEEEEEEEE

typedef struct _FRAME_HEAD
{
	unsigned int startv;
	unsigned int frameLen;
	unsigned int type;
}fmHead;

char * GetElementType(unsigned int type)
{
    switch(type)
    {
        case 1:
        {
            return "float";
        }
        case 2:
        {
            return "double";
        }
        case 3:
        {
            return "int16";
        }
        case 4:
        {
            return "int32";
        }
        default:
        {
            return "unknown";
        }
    }
}
int GetElementSize(unsigned int type)
{
    switch(type)
    {
        case 1:
        {
            return sizeof(float);
        }
        case 2:
        {
            return sizeof(double);
        }
        case 3:
        {
            return sizeof(short);
        }
        case 4:
        {
            return sizeof(int);
        }
        default:
        {
            return 1;//Ĭ�ϰ��ֽڼ���
        }
    }
}

//������Ч��
void SearchFlag(FILE * fp)
{
    int ib,ie;
    int fpos;
    int kk;
    unsigned int startv,endv;
    fmHead head;
    double filesize;
    fseek(fp,0,SEEK_SET);
    ib = ftell(fp);
    fseek(fp,0,SEEK_END);
    ie = ftell(fp);
    filesize = ie - ib;
    fseek(fp,0,SEEK_SET);
    fpos = ftell(fp);
    kk = 0;
    while(fpos<filesize)
    {
        fread(&startv,sizeof(unsigned int),1,fp);
        if(startv == _START_FLAG)
        {
            fseek(fp,-4,SEEK_CUR);
            fread(&head,sizeof(fmHead),1,fp);
            fseek(fp, head.frameLen - sizeof(fmHead) - sizeof(unsigned int), SEEK_CUR);
            fread(&endv,sizeof(unsigned int),1,fp);
             kk = kk + 1;
            if(endv == _END_FLAG)
            {
                printf("��%d֡���ݣ����ͣ�%s, ֡��С:%d�ֽڣ�%d��Ԫ��\n", 
kk,
GetElementType(head.type),
head.frameLen,
head.frameLen/GetElementSize(head.type));
            }
        }
        fpos = ftell(fp);
    }
}

int main(int argc, char* argv[])
{
	FILE * fp=NULL;	
	if(argc<=1)
	{
		printf("�������ļ���\n");
		return 1;
	}
	fp =  fopen(argv[1],"rb");
	if(!fp)
	{
		printf("�ļ��򿪴���,fp = 0x%x\n",fp);
		return 1;
	}
    SearchFlag(fp);
    
    fclose(fp);
    fp = NULL;
	return 0;
}
