%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 4-5 numberic2text.m
function [out] = numberic2text(fid,in,name)
isclose = 0;
if ischar(fid)
    fid = fopen(fid,'w');
end
if ~isnumeric(in)&&~ischar(in)
    out = 0;
    return;
end
formatstr = getformatstr(class(in));
sizein = size(in);
 
%����ı�����Ϣ���������ƣ����ͣ�ά������ά��С
if nargin==2
    %����û�û��ָ�����ƣ�����������Ĭ������
    name = strcat('data_', class(in), '_', num2str(ceil(rand(1)*10000000000)));
end
out = 0;
out = out + fprintf(fid,'%s %s\n',name,class(in));
out = out + fprintf(fid,'%d ',ndims(in),size(in));
out = out + fprintf(fid,'\n');
if ischar(in)%������ַ������ݽ��д���
    out = out + fprintf(fid,[formatstr],in(:));
else
    out = out + fprintf(fid,[formatstr ','],in(:));
end
fprintf(fid,'\n');

if isclose
    fclose(fid);
end
