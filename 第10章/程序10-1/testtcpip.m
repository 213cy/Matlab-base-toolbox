%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 10-1 testtcpip.m
function [] = testtcpip()
%����tcpip����
echotcpip('off');
echotcpip('on',5001);               % ����tcpipЭ��echo server
net = tcpip('127.0.0.1',5001); % ����tcpip����
fopen(net);                           % ����TCP/IP����
fwrite(net,[1 2 3 4 5 6],'int16');% д������
pause(0.1);
 
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
end