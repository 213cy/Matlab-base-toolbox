%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 2-12 teststring.m
%����Ϊteststring.m�ļ�
function []=teststring()
%function []=teststring()
%teststring.m
%MATLAB �ַ���������
%mat2str��������eval����ִ�е��ַ���
data = rand(3,3);
sdata = mat2str(data);
eval(sdata);

%��Ӳ�ҵ���Ϸ�����is��'1'��Ϊ���棬����Ϊ����
%�ַ����Ƚ�
%�ַ�������֮���ת��
str = '1';
is = num2str(round(rand));
if strcmp(str,is)
    disp('Ӳ�ҵ�����');
else
    disp('Ӳ�ҵķ���');
end

%���26����ĸ��ASCII��ֵ
strLetter = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
valLetter = double(strLetter);
disp(valLetter);
