/*************************************************/
/* ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���    */
/* ��  �ߣ������� ��ά                           */
/* �����磺�������պ����ѧ������                */
/*************************************************/

/* ���� 9-9 Thread_Send.c */
#include "SerialPortDataTrans.h"
DWORD WINAPI Thread_Sending(char* sendPort)
{
    HANDLE hComm;
    DCB portDCB;
    DWORD nToWrite,nWritten,fileSize;
    char *ch = NULL;
    char *strBuffer = NULL;
    FILE *fp = NULL; 
    int nb,ne;
    int ii;
    printf("�߳�1�����ɹ�.\n");
    nToWrite = SIZE_SENDING;

/*�򿪴���*/
    hComm = CreateFile(sendPort, GENERIC_READ | GENERIC_WRITE, 
            0, NULL,OPEN_EXISTING, 0, NULL);
    if (hComm == INVALID_HANDLE_VALUE)
    {
        printf("ERROR! ���Ͷ˴��ڴ���ʧ��.\n");
        return 0;
    }
    else
    {
        printf("OK! ���Ͷ˴��ڴ����ɹ�.\n");
    }
    if(!PurgeComm(hComm,PURGE_TXCLEAR | PURGE_RXCLEAR)==TRUE)
    {
        printf("ERROR! ���Ͷ���ջ���ʧ��.\n");
        return 0;
    }
    else
    {
        printf("OK! ���Ͷ���ջ���ɹ�.\n");
    }
    
/*���ô��ڲ���*/
    if (!GetCommState(hComm,&portDCB)==TRUE)//��ȡ���ڲ���.
    {
        printf("ERROR! ���Ͷ˴��ڲ�����ȡʧ��.\n");
        return 0;
    }
    else
    {
        printf("OK! ���Ͷ˴��ڲ�����ȡ�ɹ�.\n");
    }
    portDCB.BaudRate = CBR_4800;             //�������ݵĲ�����
    portDCB.ByteSize = 8;                     //num of data bits
    portDCB.Parity = 0;                        //0:none
    portDCB.XoffLim = SIZE_SENDING;          //����
    if (!SetCommState(hComm, &portDCB)==TRUE) //���ô��ڲ���
    {
        printf("ERROR! ���Ͷ˴��ڲ�������ʧ��.\n");
        return 0;
    }
    else
    {
        printf("OK! ���Ͷ˴��ڲ������óɹ�.\n");
    }
    

/*��ȡ�����ļ��е�������strBuffer������ĩβ��ӡ�$END����־*/
    g_file_name = (char*)mxCalloc(255,sizeof(char));
    strcpy(g_file_name,"test.txt");
    fp = fopen(g_file_name,"rb");
    if (fp==NULL)
    {
        printf("�����͵��ļ�������.\n");
        return 0;
    }
    fseek(fp,0,SEEK_SET);
    nb = ftell(fp);
    fseek(fp,0,SEEK_END);
    ne = ftell(fp);
    fseek(fp,0,SEEK_SET);
    fileSize = ne-nb;
    strBuffer = (char*)malloc((fileSize+sizeof(END_MARKER))*sizeof(char));
    memset(strBuffer, 0x00, (fileSize+sizeof(END_MARKER))*sizeof(char));
    fread(strBuffer,sizeof(char),fileSize,fp);
    strncpy(strBuffer+fileSize,END_MARKER,sizeof(END_MARKER));

/*��ʼ�����ļ�*/
    //���ȷ���������
    if (!WriteFile(hComm,&fileSize,sizeof(DWORD), &nWritten, NULL)==TRUE)
    {
        printf("���ݰ�����ʧ��.\n");
        return 0;
    }
    //ѭ����������
    for(ii = 0; ii<(fileSize+sizeof(END_MARKER))/nToWrite;ii++ )
    {
        ch = strBuffer + ii*nToWrite;
        if (!WriteFile(hComm,ch,nToWrite, &nWritten, NULL)==TRUE)
        {
            printf("���ݰ�����ʧ��.\n");
            return 0;
        }
    }
    if( (ii = (fileSize+sizeof(END_MARKER)) % nToWrite) > 0)
    {
        printf("���Ͱ���С�����������ݰ�.\n");
        ch = strBuffer + (fileSize+sizeof(END_MARKER))-ii;
        if (!WriteFile(hComm,ch,ii, &nWritten, NULL)==TRUE)
        {
            printf("���ݰ�����ʧ��.\n");
            return 0;
        }
    }

/*������ϣ��رմ��ڣ��˳��߳�*/
    if (!CloseHandle(hComm)==TRUE) //�رմ���
    {
        printf("���Ͷ˴��ڹر�ʧ��.\n");
        return 0;
    }
    else
    {
        printf("���Ͷ˴��ڹرճɹ�.\n");
    }
    if(strBuffer) free(strBuffer);
    if(fp) fclose(fp);
    if(ch) free(ch);

    return 1;
}
