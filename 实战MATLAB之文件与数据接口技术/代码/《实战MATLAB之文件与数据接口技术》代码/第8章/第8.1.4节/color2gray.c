/*************************************************/
/* 《实战MATLAB之文件与数据接口技术》附加程序    */
/* 作  者：江泽林 刘维                           */
/* 出版社：北京航空航天大学出版社                */
/*************************************************/

#include "color2gray.h"

DLLEXPORT double color2gray(doubleColor c)
{
	return (0.2989*c.r + 0.5870*c.g + 0.1140*c.b);
}
