% for k =1:10
% [A,Ind]= imread([matlabroot,'\bin\win64\matlab.ico'],'ico',k);
% size(A,1)
% end
%%
A = imread([matlabroot,'\bin\win64\matlab.ico'],'ico',8);
imshow(A)
imwrite(A,'bbb.ico','ico')
% imformats ����icoû��write����
gzip('bbb.ico')
%%
gzip('aaa.ico')


%%
% webread �õ���ֻ����������û������ͷ
data = webread('http://www.baidu.com');
data = webread('http://www.baidu.com/favicon.ico');
%%
%%
% matlab prompt �ǵ��̵߳�,�ٿ�һ��matlab ���з���������
% !matlab -nojvm -nosplash -r "localechoserver" &
% !matlab -nodisplay -nosplash -r "localechoserver" &
!matlab -nodesktop -nosplash -r "localechoserver" &
%%
% ���� ip ����վ ipadress
% https://www.ipaddress.com/
ip = '42.239.61.133';