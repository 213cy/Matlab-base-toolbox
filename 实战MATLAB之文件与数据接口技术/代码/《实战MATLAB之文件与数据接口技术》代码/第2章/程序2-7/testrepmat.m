%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 2-7 testrepmat.m
% ����Ϊtestrepmat.m�ļ�
% ����repmat����
% ����sin(x)*sin(y)����ά����ͼ

%�������workspace�ı���
clear all;
clc;
x = -pi:0.01:pi;
y = -pi:0.01:pi;
y = y';
x1 = repmat(x,length(x),1);
y1 = repmat(y,1,length(y));
z = sin(x1)+sin(y1);
mesh(x1,y1,z);
xlabel('x');
ylabel('y');
zlabel('z');
title('sin(x)+sin(y)');
