/*************************************************/
/* ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���    */
/* ��  �ߣ������� ��ά                           */
/* �����磺�������պ����ѧ������                */
/*************************************************/

/*������ͷ�ļ�*/
#include <math.h>
#include <windows.h>
#include <stdlib.h>
#include <stdio.h>
#include <process.h>

#ifndef _SERIAL_DLL_U__
#define _SERIAL_DLL_U__
#define RECEIVING_BLOCK_SIZE 1024
#define RECEIVING_BLOCK_NUM 10
#define DLLEXPORT  __declspec( dllexport )

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */
	DLLEXPORT int ReadData(char* COMM);
#ifdef __cplusplus
};
#endif /* __cplusplus */
#endif
