function makebankmatfile(filename)
%����һ���յ�mat�ļ�
%
if ~nargin
    filename='tactics01';
end
fil=[filename,'.mat'];
savebankfile
copyfile('tmp.mat',fil)

msgbox(['�ļ�',fil,'�����ɹ���'],'����mat�ļ�','help')