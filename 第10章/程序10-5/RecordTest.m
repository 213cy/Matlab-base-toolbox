%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 10-5 RecordTest.m
function [] = RecordTest(mode)
% function [] = RecordTest(mode)
% mode��������Ϊ'compact'��'verbose'����ģʽ
%%
mode = 'compact'
echoudp('off');
echoudp('on',5001);           % ����udpЭ��echo server
net = udp('127.0.0.1',5001); % ��������
set(net,'RecordDetail',mode);
fopen(net);                     % ��������
record(net,'on');
data = [0.11 0.22 0.33];
fwrite(net,data(:),'float'); % д������
fread(net,3,'float')
record(net,'off');
fclose(net);
delete(net);
echoudp('off');
%%
end