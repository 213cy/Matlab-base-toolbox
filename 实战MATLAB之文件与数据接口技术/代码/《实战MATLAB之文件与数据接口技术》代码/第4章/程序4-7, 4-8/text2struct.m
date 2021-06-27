%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 4-8 text2struct.m
function [out,info] = text2struct(fid)
%function [out,info] = text2struct(fid)
isclose = 0;
if ischar(fid)
    fid = fopen(fid,'r');
end
 
out = [];
name = fscanf(fid,'%s',1);
cls = fscanf(fid,'%s',1);
nfields = fscanf(fid,'%d',1);
fm = cell(nfields,1);
for kk = 1:nfields
    fm{kk} = fscanf(fid,'%s',1);
end
 
out = struct;
for kk = 1:nfields
    tout = text2numberic(fid);    
    out.(fm{kk}) = tout.data;
end
 
info.name = name;
info.cls = cls;
info.nfields = nfields;

if isclose
    fclose(fid);
end
