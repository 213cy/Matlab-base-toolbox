%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 9-4 Serial_testBytesAvailableFcn.m
function [] = Serial_testBytesAvailableFcn()
% ?ͨ�����ڴ��������������ź�
global s;
global r_data;
s=serial('COM1');
% set port properties
s.inputbuffersize = 8192;
s.BytesAvailableFcn = @myCallBack;
s.BytesAvailableFcnCount = 2048;
s.BytesAvailableFcnMode = 'byte';
% open the serial port
fopen(s);
% make signal
N=1024;
t=[0:N-1]/N*2*pi;
signal=16*sin(t);
%transmit the signal
for ii=1:N
    if isequal(s.TransferStatus,'write')
    else
        fwrite(s,round(signal(ii)),'int16');
    end
end
pause(1);
fclose(s);
delete(s);
clear s;
end %end of main function

function myCallBack(obj,event)
global s;
global r_data;
r_data = fread(s,1024,'int16');
plot(r_data);
title('Received data from serial port');
end %end of myCallBack function
%end of Serial_testBytesAvailableFcn.m
