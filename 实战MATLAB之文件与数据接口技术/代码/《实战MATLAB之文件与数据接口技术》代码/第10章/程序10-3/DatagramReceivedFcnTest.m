%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 10-3 DatagramReceivedFcnTest.m
function [] = DatagramReceivedFcnTest()
%function [] = DatagramReceivedFcnTest()
%DatagramReceivedFcn
echoudp('off');
echoudp('on',5001);            % ����tcpipЭ��echo server
net = udp('127.0.0.1',5001); % ����tcpip����
set(net,'DatagramReceivedFcn',@mycallback);
set(net,'UserData',0);
set(net,'DatagramTerminateMode','on');
fopen(net);                      % ����TCP/IP����
data = [0.11 0.22 0.33];
for kk = 1:length(data(:))
    fwrite(net,data(kk),'float');% д������
    pause(0.1);
end
fclose(net);
delete(net);
echoudp('off');
end
 
function mycallback(obj,event)
bytes = get(obj,'UserData');
BytesAvailable = get(obj,'BytesAvailable');
bytes = bytes + BytesAvailable;
data = fread(obj,BytesAvailable/4,'float');
fprintf(1,'�����յ�����Ϊ"%3.2f", ����ȡ�ֽ���:%d�����ζ�ȡ�ֽ���:%d\n',data,bytes,BytesAvailable);
set(obj,'UserData',bytes);
end
