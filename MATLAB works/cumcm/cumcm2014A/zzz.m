%%
M=7.3477e22;%��������
G=6.674e-11;%������������������http://en.wikipedia.org/wiki/Gravitational_constant
m=2.4e3;%��½������
%%
r=1737.013e3;
perigeeHeight=15e3;
apogeeHeight=100e3;
A=r+perigeeHeight/2+apogeeHeight/2;
C=A-r-perigeeHeight;
B=sqrt(A^2-C^2);
H=r+perigeeHeight;
H2=r+apogeeHeight;
% A =1794513;
% B =1794009;
% C =42500;
% H =1752013;
% H2 =1837013;
%% 
%��Բ���(��½׼�����)���µ��Զ�µ���ٶ�
Vper=B*sqrt(G*M/A/(A-C)^2)%���µ��ٶ�1692.7
Vapo=B*sqrt(G*M/A/(A+C)^2)%Զ�µ��ٶ�1614.4
%%
%��½���ڽ��µ��Զ�µ�������Բ���˶�ʱ���ٶ�
V_con=sqrt(G*M/(r+perigeeHeight))%1673
sqrt(G*M/(r+apogeeHeight))
%%
%�Խ��µ��ٶ��ڽ��µ���������Բ���˶�ʱ
%�ɷ������ṩ�ĵ����ļ��ٶ�
a=Vper^2/H-G*M/H^2;
%�ɷ������ṩ������
F_add=a*m
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
H_1=r+3e3;
H_2=r+2.4e3;
H_3=r+100;
%��H_2����½���������������
G*M/H_2^2*m
G*M/H_3^2