%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 4-3 myfprintf.m
function [str]=myfprintf(varargin)
%function [str]=myfprintf(varargin)

%����MATLAB fprintf����
filename = 'myfprintf.txt';

%���������ַ���
nn = length(varargin(:));
cmdstr = 'fprintf(fid,';
for kk = 1:nn
    cmdstr = strcat(cmdstr,'varargin{',num2str(kk),'},');
end
cmdstr(end) = ')';
cmdstr(end+1) = ';';

%ִ����������
fid = fopen(filename,'w');
eval(cmdstr);
fclose(fid);
 
%���ִ�н��
str = fileread(filename);
