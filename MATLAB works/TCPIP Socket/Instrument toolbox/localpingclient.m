%%
% matlab prompt �ǵ��̵߳�,�ٿ�һ��matlab ���з���������
% !matlab -nojvm -nosplash -r "localechoserver" &
% !matlab -nodisplay -nosplash -r "localechoserver" &
!matlab -nodesktop -nosplash -r "localechoserver" &
%%
% ���� ip ����վ ipadress
% https://www.ipaddress.com/
ip = '42.239.61.133';
%
ip = '127.0.0.1';
netClient = tcpip( ip ,5678);
%%
fclose(netClient);
fopen(netClient);   % ����TCP/IP����
%%
nBytes = netClient.BytesAvailable
message = 'ClientClientClientClient';
fwrite(netClient,message)
%%
while netClient.BytesAvailable == 0
    pause(0.01)
end
%%
nBytes = netClient.BytesAvailable

%     data = fread(netObj,nBytes/2,'int16');
data = fread(netClient,nBytes,'uchar')';
fprintf(1,'���յ�������: [%s]\n ',data)
% fprintf(1,'���յ�������: [%s]\n ',char(txt))


%%
fclose(netClient);      % �ر�����
delete(netClient);      % ɾ��tcpip�����ͷ��豸��Դ