/*************************************************/
/* ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���    */
/* ��  �ߣ������� ��ά                           */
/* �����磺�������պ����ѧ������                */
/*************************************************/

#ifndef _ENUM_EXAMPLE_H
#define _ENUM_EXAMPLE_H

#define DLLEXPORT  __declspec( dllexport )

typedef enum
{
    red=1,green=2,blue=4
}cE;

DLLEXPORT char* readEnum(cE val);

#endif
