%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 4-7 struct2text.m
function [out] = struct2text(fid,in,name)
%function [out] = struct2text(fid,in,name)
isclose = 0;
if ischar(fid)
    fid = fopen(fid,'w');
end

out = 0;
if ~isstruct(in)
    return;
end
in = in(1);%ֻ�������ṹ��
%д��ṹ��һ����Ϣ��������
%���ƣ����ͣ����������������
names = fieldnames(in);
fprintf(fid,'%s %s %d\n',name,class(in),length(names(:)));
for kk = 1:length(names(:))
    fprintf(fid,'%s\n',names{kk});
end
%д��ṹ�����������Ϣ
for kk = 1:length(names(:))
    fd = in.(names{kk});
    numberic2text(fid,fd,names{kk});
end

if isclose
    fclose(fid);
end
