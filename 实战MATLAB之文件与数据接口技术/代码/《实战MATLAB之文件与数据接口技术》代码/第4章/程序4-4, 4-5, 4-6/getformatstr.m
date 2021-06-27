%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 4-4 getformatstr.m
function [outstr] = getformatstr(dataclass)
%function [outstr] = getformatstr(dataclass)
outstr = [];
formatstr = {'int', '%d'; 'single', '%g'; 'double', '%g'; 'char', '%s'};

for kk = 1:size(formatstr,1)
    str = formatstr{kk,1};
    if strfind(dataclass,str)
       outstr = formatstr{kk,2};
    end
end
if isempty(outstr)
    outstr = 'unknown';
end
