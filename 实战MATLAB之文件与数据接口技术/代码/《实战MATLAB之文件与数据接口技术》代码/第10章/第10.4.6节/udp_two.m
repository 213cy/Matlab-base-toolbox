%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 10-6 udp_two.m
function [] = udp_two(flag)
%flag = 'send','recv'
echoudp('off');
hd = dialog('WindowStyle', 'normal', 'Name', 'UDP˫�ڵ�ͨ��');%�����Ի���
set(hd,'position',[199   377   247   135]);
if isequal(flag,'send')
    %�������Ͷˣ����ȴ���������ť	
    uicontrol(hd,'string','��ʼ����','position',[30 30 80 100],...
        'callback',@startcallback);
    uicontrol(hd,'string','��������','position',[130 30 80 100],...
        'callback',@stopcallback);
    %��ʼ��udp����
    u = udp('192.168.123.241', 'RemotePort', 4012, 'LocalPort', 4012);
    ud.u = u;
    ud.data = 0;
    %�����û�����
    set(u,'UserData',ud);
else
    %������flag��'send'ʱ���������ն�
    %����udp����
    u = udp('192.168.123.122', 'RemotePort', 4012, 'LocalPort', 4012);
    uicontrol(hd,'style','text','string','Recv Data...',...
        'position',[30 30 170 100]);
    set(u,'DatagramReceivedFcn',@recvcallback);
    %�����û�����
    ud.data = 0;
    ud.nsend = 10;
    ud.u = u;
    ud.bytes = 0;
    set(hd,'UserData',ud);
    set(u,'UserData',ud);
    set(u,'DatagramTerminateMode','on');
    %��udp����
    fopen(u);
end
set(hd,'UserData',ud,'CloseRequestFcn',@closefigure);
end