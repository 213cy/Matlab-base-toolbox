%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 7-1 genData.m
function genData(filename,in)
%function genData(filename,in)
if iscell(in)
else
    in = {in};
end
nlen = length(in(:));
fid = fopen(filename,'wb');
for kk = 1:nlen
    td = in{kk};
    fwrite(fid,td(:),class(in{kk}));
end
fclose(fid);
end
