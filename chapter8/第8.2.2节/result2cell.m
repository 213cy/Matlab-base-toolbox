%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [outc] = result2cell(r,schar)
%function [outc] = result2cell(r,schar)
%r��ʾ�ⲿ����ִ�н���ַ���
%schar��ʾ����õķָ����Ĭ�ϲ���ASCII�ַ�10�������з�
if nargin==1
    schar = 10;
end
ind = find(r==schar);
nn = length(ind(:));
outc = cell(nn,1);
ib = 1;
for kk = 1:nn
    ie = ind(kk);
    outc{kk} = r(ib:(ie-1));
    ib = ie+1;
end
