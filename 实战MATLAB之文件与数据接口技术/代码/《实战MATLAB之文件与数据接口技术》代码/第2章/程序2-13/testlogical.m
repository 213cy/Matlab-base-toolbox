%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 2-13 testlogical.m
%����Ϊtestlogical.m�ļ�
clear all;
theta = -pi:0.1:pi;
a = sin(3*theta);%���ɲ�������
%�����߼�����������flag��a��С��ͬ��
%���a(i)>0����flag(i) = true
%���a(i)<=0����flag(i) = false;
flag = a > 0;
%��ȡ����a������Ĳ���
a1(flag) = a(flag);
plot(theta/pi,a1, 'o','linewidth',2);
hold on;
plot(theta/pi,a,':','linewidth',2);
hold off;
xlabel('����(\pi)');
