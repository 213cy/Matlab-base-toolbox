%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 《实战MATLAB之文件与数据接口技术》附加程序
% 作  者：江泽林 刘维
% 出版社：北京航空航天大学出版社
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 程序 9-5 SerialObjectExample.m
s = serial('COM1');    %创建串口对象
set(s,'BaudRate',4800);%设置串口对象属性
fopen(s);              %打开串口设备
fprintf(s,'*IDN?')     %向串口设备写入数据
out = fscanf(s);       %从串口设备读入数据
fclose(s)              %关闭串口设备
delete(s)              %删除串口对象
clear s                %清除串口对象变量
