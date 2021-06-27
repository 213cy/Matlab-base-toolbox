%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 4-6 text2numberic.m
function [out] = text2numberic(fid)
%function [out] = text2numberic(fid)
isclose = 0;
if ischar(fid);
    fid = fopen(fid,'r');
    isclose = 1;
end
out = [];
%��ȡ�������ƺ�����
name = fscanf(fid,'%s',1);
cls = fscanf(fid,'%s',1);
dims = fscanf(fid,'%d',1);
sz = fscanf(fid,'%d',dims);sz = reshape(sz,1,length(sz(:)));
formatstr = getformatstr(cls);
if isequal(formatstr,'unknown')
    %����������ֵ����ͳһ���ø����ʹ���
    formatstr = '%f';
end
if ~isequal(cls,class('sss'))%������ַ������ݽ��д���
    formatstr = [formatstr ','];
end
data = fscanf(fid,formatstr,prod(sz));
if isclose
    fclose(fid);
end
out.name = name;
out.cls = cls;
out.data = reshape(data,int32(sz));
