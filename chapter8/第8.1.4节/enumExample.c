/*************************************************/
/* ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���    */
/* ��  �ߣ������� ��ά                           */
/* �����磺�������պ����ѧ������                */
/*************************************************/

#include "enumExample.h"

DLLEXPORT char* readEnum(cE val) 
{
	  switch (val) {
	    case 1 :return "����red";
	    case 2: return "����green";
	    case 4: return "���� blue";
	    default : return "����ѡ��δ����";
	  }
}
