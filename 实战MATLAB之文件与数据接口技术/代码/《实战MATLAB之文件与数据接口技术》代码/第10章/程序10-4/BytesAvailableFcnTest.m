%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ����10-4 BytesAvailableFcnTest.m
function [] = BytesAvailableFcnTest(mode)
%function [] = BytesAvailableFcnTest(mode)
echotcpip('off');
echotcpip('on',5001);             % ����tcpipЭ��echo server
net = tcpip('127.0.0.1',5001);   % ����tcpip����
set(net,'BytesAvailableFcn',@mycallback);
set(net,'BytesAvailableFcnCount',3);
set(net,'BytesAvailableFcnMode',mode);
set(net,'UserData',0);
fopen(net);                           % ����TCP/IP����
data = sprintf('%3.2f,\n',[0.11 0.22 0.33]);
for kk = 1:length(data(:))
    fwrite(net,data(kk),'char');   % д������
    pause(0.1);
end
fclose(net);
delete(net);
end

function mycallback(obj,event)
bytes = get(obj,'UserData');
BytesAvailable = get(obj,'BytesAvailable');
bytes = bytes + BytesAvailable;
str = fread(obj,BytesAvailable,'char');
fprintf(1,'�����յ�����Ϊ"%s", ����ȡ�ֽ���:%d�����ζ�ȡ�ֽ���:%d\n',str,bytes,BytesAvailable);
set(obj,'UserData',bytes);
end
