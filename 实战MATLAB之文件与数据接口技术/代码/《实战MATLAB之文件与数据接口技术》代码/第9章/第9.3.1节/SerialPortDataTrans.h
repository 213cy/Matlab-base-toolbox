/*************************************************/
/* ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���    */
/* ��  �ߣ������� ��ά                           */
/* �����磺�������պ����ѧ������                */
/*************************************************/

/* ���� 9-7 SerialPortDataTrans.h */
#ifndef _SERIAL_PORT_DATA_TRANS_H__
#define _SERIAL_PORT_DATA_TRANS_H__

/*���õ�ͷ�ļ�*/
#include "mex.h"
#include <math.h>
#include <windows.h>
#include <stdlib.h>
#include <stdio.h>
#include <process.h>

/*���Ͱ���С�����հ���С�Լ����ݴ洢�ļ�����*/
#define SIZE_SENDING 16             //���Ͱ���С
#define SIZE_RECEIVING 1024        //���հ���С
#define END_MARKER "$END"          //���ͽ�����ʶ��

/*ȫ�ֱ�������*/
char *g_file_name; //���������ļ�

/*�̺߳�������*/
DWORD WINAPI Thread_Sending(char *sendPort);  //�����߳�
DWORD WINAPI Thread_Receiving(char *receivePort);    //�����߳�

#endif
