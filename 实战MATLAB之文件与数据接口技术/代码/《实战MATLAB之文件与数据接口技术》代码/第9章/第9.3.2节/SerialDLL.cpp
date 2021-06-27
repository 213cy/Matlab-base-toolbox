/*************************************************/
/* ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���    */
/* ��  �ߣ������� ��ά                           */
/* �����磺�������պ����ѧ������                */
/*************************************************/

#include "SerialDLL.h"
DLLEXPORT int ReadData(char * receivePort)
{
    HANDLE hComm;
    DCB portDCB;
    char *ch;
    DWORD nRead,nToRead;
    int ii;
    FILE* fw = fopen("RcvFile.txt","w");

    ch = (char*)malloc(sizeof(char)*(RECEIVING_BLOCK_SIZE+8));
    nToRead = RECEIVING_BLOCK_SIZE;

    /*�򿪴���*/
    hComm = CreateFile(receivePort, GENERIC_READ | GENERIC_WRITE, 
		0, NULL, OPEN_EXISTING, 0, NULL);
    if (hComm == INVALID_HANDLE_VALUE)
    {
        printf("ERROR! ���ն˴��ڴ���ʧ��.\n");
        return -1;
    }
    else
    {
        printf("OK! ���ն˴��ڴ����ɹ�.\n");
    }
    if (!PurgeComm(hComm,PURGE_TXCLEAR |PURGE_RXCLEAR)==TRUE)
    {
        printf("ERROR! ���ն˴�����ջ���ʧ��.\n");
        return -2;
    }
    else
    {
        printf("OK! ���ն˴�����ջ���ɹ�.\n");
    }

    /*���ô��ڲ���*/
    if (!GetCommState(hComm,&portDCB)==TRUE)/*��ȡ���ڲ���*/
    {
        printf("ERROR! ���ն˴��ڲ�����ȡʧ��.\n");
        return -3;
    }
    else
    {
        printf("OK! ���ն˴��ڲ�����ȡ�ɹ�.\n");
    }
    portDCB.BaudRate=CBR_4800;  /*������*/
    portDCB.ByteSize=8;          /*num of data bits*/
    portDCB.Parity=0;             /*0:none*/
    portDCB.XoffLim=nToRead;     /*����*/
    if (!SetCommState(hComm, &portDCB)==TRUE) /*���ô��ڲ���*/
    {
        printf("ERROR! ���ն˴��ڲ�������ʧ��.\n");
        return -4;
    }
    else
    {
        printf("OK! ���ն˴��ڲ������óɹ�.\n");
    }

    /*��������*/
    /*ѭ����������*/
    for(ii=0; ii<RECEIVING_BLOCK_NUM; ii++)
    {
        memset(ch,'\0',RECEIVING_BLOCK_SIZE+8);
        if (!ReadFile(hComm, ch, nToRead, &nRead, NULL)==TRUE)
        {
            printf("ERROR! ��������ʧ��.\n");
            return -5;
        }
        else
        {
            printf("OK! �������ݳɹ�.\n");
        }
        fprintf(fw,"%s\n",ch);
    }
    
    /*�رմ��ڣ��ͷ��ڴ棬�˳��߳�*/
    if (!CloseHandle(hComm)==TRUE)
    {
        printf("ERROR! ���ն˴��ڹر�ʧ��.\n");
        return -6;
    }
    else
    {
        printf("OK! ���ն˴��ڹرճɹ�.\n");
    }
    fclose(fw);
    if(ch) free(ch);
    return 1;
}
