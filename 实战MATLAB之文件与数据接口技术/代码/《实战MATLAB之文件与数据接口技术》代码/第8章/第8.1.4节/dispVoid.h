/*************************************************/
/* 《实战MATLAB之文件与数据接口技术》附加程序    */
/* 作  者：江泽林 刘维                           */
/* 出版社：北京航空航天大学出版社                */
/*************************************************/

#ifndef _DISP_VOID_H
#define _DISP_VOID_H

#define DLLEXPORT  __declspec( dllexport )
#include "matrix.h"
DLLEXPORT char* dispVoid(void * pdata, char * type);

#endif
