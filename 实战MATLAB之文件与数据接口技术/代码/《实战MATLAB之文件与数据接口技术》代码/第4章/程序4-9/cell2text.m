%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 4-9 cell2text.m
function [] = cell2text(fid,data)
% ��������cell����д�뵽txt�ļ��У������cell������������Ҫ��
% 1. cell���и�Ԫ�����������Ϊ�������ͣ�������Ƕ�װ����ṹ���Ԫ��
% 2. cell����Ϊ2ά

if ischar(fid)
    fid = fopen(fid,'w');
end
if ~iscell(data)
    disp('���������ݲ���cell����');
    return;
end
if length(size(data))>2
    disp('������cell����ά������2.');
    return;
end
datainfo = whos('data');
for ii = 1:datainfo.size(1)
    for jj = 1:datainfo.size(2)
        datatemp = data{ii,jj};
        tempinfo = whos('datatemp');
        fprintf(fid,'cell{ %d,%d }\n',ii,jj);
        fprintf(fid,'class : %s ; size : %d %d\n',...
            tempinfo.class,tempinfo.size(1),tempinfo.size(2));
        if isnumeric(datatemp)
            datatemp = num2str(datatemp);
        end
        for kk = 1:size(datatemp,1)
            fprintf(fid,'%s\n',datatemp(kk,:));
        end
    end
end
end
