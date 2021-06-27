/*************************************************/
/* ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���    */
/* ��  �ߣ������� ��ά                           */
/* �����磺�������պ����ѧ������                */
/*************************************************/

/* ���� 9-10 Thread_Receive.c */
#include "SerialPortDataTrans.h"
DWORD WINAPI Thread_Receiving(char *receivePort)
{
    HANDLE hComm;
    DCB portDCB;
    char *ch;
    DWORD nRead,nToRead,dataSize;
    DWORD tTransmitExit;
    int ii;
    ch = (char*)malloc(sizeof(char)*(SIZE_RECEIVING+8));
    nToRead = SIZE_RECEIVING;

/*�򿪴���*/
    hComm = CreateFile(receivePort, GENERIC_READ | GENERIC_WRITE, 
            0, NULL, OPEN_EXISTING, 0, NULL);
    if (hComm == INVALID_HANDLE_VALUE)
    {
        printf("ERROR! ���ն˴��ڴ���ʧ��.\n");
        return 0;
    }
    else
    {
        printf("OK! ���ն˴��ڴ����ɹ�.\n");
    }
    if (!PurgeComm(hComm,PURGE_TXCLEAR |PURGE_RXCLEAR)==TRUE)
    {
        printf("ERROR! ���ն˴�����ջ���ʧ��.\n");
        return 0;
    }
    else
    {
        printf("OK! ���ն˴�����ջ���ɹ�.\n");
    }
    

/*���ô��ڲ���*/
    if (!GetCommState(hComm,&portDCB)==TRUE)//��ȡ���ڲ���.
    {
        printf("ERROR! ���ն˴��ڲ�����ȡʧ��.\n");
        return 0;
    }
    else
    {
        printf("OK! ���ն˴��ڲ�����ȡ�ɹ�.\n");
    }
    portDCB.BaudRate=CBR_4800;  //������
    portDCB.ByteSize=8;          //num of data bits
    portDCB.Parity=0;             //0:none
    portDCB.XoffLim=nToRead;     //����
    if (!SetCommState(hComm, &portDCB)==TRUE) //���ô��ڲ���
    {
        printf("ERROR! ���ն˴��ڲ�������ʧ��.\n");
        return 0;
    }
    else
    {
        printf("OK! ���ն˴��ڲ������óɹ�.\n");
    }
    

/*��������*/
    //���Ƚ�������������byteΪ��λ��
    if (!ReadFile(hComm, &dataSize, sizeof(DWORD), &nRead, NULL)==TRUE)
    {
        printf("ERROR! ��������ʧ��.\n");
        return 0;
    }
    printf("������Ϊ %d Bytes.\n",dataSize);
    //ѭ����������
    for(ii=0; ii<ceil(((float)dataSize+sizeof(END_MARKER))/nToRead); ii++)
    {
        memset(ch,'\0',SIZE_RECEIVING+8);
        if (!ReadFile(hComm, ch, nToRead, &nRead, NULL)==TRUE)
        {
            printf("ERROR! ��������ʧ��.\n");
            return 0;
        }
        else
        {
            printf("OK! �������ݳɹ�.\n");
        }
        printf("���յ�������Ϊ:\n%s\n",ch);
    }
    
/*�رմ��ڣ��ͷ��ڴ棬�˳��߳�*/
    if (!CloseHandle(hComm)==TRUE)
    {
        printf("ERROR! ���ն˴��ڹر�ʧ��.\n");
        return 0;
    }
    else
    {
        printf("OK! ���ն˴��ڹرճɹ�.\n");
    }
    if(ch) free(ch);
    return 1;
}
