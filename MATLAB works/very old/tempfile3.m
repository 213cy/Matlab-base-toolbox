%% pi!=pi
clear
sin(pi)%������ڲ�(˫���ȸ������������)�޷�׼ȷ��ʾpi
a=sym(pi); %
% ���ǽ�������洢��pi����ֵ ת��Ϊ���ű���a
% ����ת��������������(��ΪҪ����ʹ��������ʽ��ʾ)
% ���Եõ���׼ȷ��pi
% Floating-point numbers obtained by evaluating expressions of the form 
% p/q, p*pi/q, sqrt(p), 2^q, and 10^q for modest sized integers p and q 
% are converted to the corresponding symbolic form. 
% This effectively compensates for the round-off error 
% involved in the original evaluation, 
% but might not represent the floating-point value precisely.
sin(a)
clear
syms pi %�൱�� pi=sym(pi)
sin(pi)
%% ============================================
%% ���о�����matlab�������ǿ��ԶԽǻ���
A = [3 1 0; 0 3 1; 0 0 3];
[V,D] = eig(A)
rank(A-D)
% Since MATLAB performs the decomposition using floating-point computation
% matlab �����ҵ���������������
V*D-A*V
rank(V),cond(V)
%ʵ����matlab������V�����ȵ�,���Ǿ���̫��̬cond(V),rank�㲻����
% Ҫ׼ȷ�ֽ�Ҳֻ���÷�����ѧ������ĺ���
[V,J] = jordan(A)