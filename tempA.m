echotcpip('on',5001);               % ����tcpipЭ��echo server

%%
net = tcpip('122.10.10.10',5001)
net = tcpip('baidu.com',80)
net = tcpip('220.181.38.148',80)
net = tcpip('192.168.0.1',5001)
net = tcpip('192.168.0.10',5001)
net = tcpip('192.168.0.111',5001)
net = tcpip('127.0.0.111',5001)
net = tcpip('127.0.0.1',5001)

set(net,'BytesAvailableFcn',@bbbb);
set(net,'RecordDetail','verbose');  % ��������Ϊ'compact'��'verbose'����
record(net,'on');
%%
fopen(net)   % ����TCP/IP����
message = uint8(['GET / HTTP/1.1',char([13 10]),'Host: baidu.com',char([13 10]),char([13 10])]); 
%%
for k=1:2
fwrite(net,message)    % д������

 s0 = struct( 'RecordStatus', net.RecordStatus, ...
     'TransferStatus', net.TransferStatus, 'BytesAvailable', net.BytesAvailable, ...
     'ValuesReceived', net.ValuesReceived, 'ValuesSent', net.ValuesSent)
 
 pause(0.2);
 
 s2 = struct( 'RecordStatus', net.RecordStatus, ...
     'TransferStatus', net.TransferStatus, 'BytesAvailable', net.BytesAvailable, ...
     'ValuesReceived', net.ValuesReceived, 'ValuesSent', net.ValuesSent)
% data = fread(net,nBytes/2);
% char(data(1:10)')
% string(dec2hex(data(1:10)))'
end
%%
record(net,'off');
fclose(net);      % �ر�����
delete(net);      % ɾ��tcpip�����ͷ��豸��Դ
%%
echotcpip('off')
return
%%%
%�鿴���͵�Ԫ�ظ�����16λ���ͣ�����Ԫ�أ�
disp(strcat('����Ԫ�ظ���Ϊ',num2str(net.ValuesSent),'��'));
%�鿴���յ�����
nBytes = get(net,'BytesAvailable');
if nBytes>2
    data = fread(net,nBytes/2,'int16');
    data = reshape(data,1,length(data(:)));
    disp('���յ�������Ϊ:');
    disp(data); 
else
    disp('û���յ�����');
end
 
fclose(net);      % �ر�����
delete(net);      % ɾ��tcpip�����ͷ��豸��Դ
clear('net');     % ���MATLAB�������ı���
%%
