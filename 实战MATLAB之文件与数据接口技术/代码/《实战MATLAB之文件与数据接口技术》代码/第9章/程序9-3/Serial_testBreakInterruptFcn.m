%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 9-3 Serial_testBreakInterrupFcn.m
function Serial_testBreakInterruptFcn()
%% Serial_testBreakInterruptFcn.m
s = serial('COM1');
% s.BaudRate = 9600;
% s.DataBits = 8;
s.BreakInterruptFcn =@myCallback;
fopen(s);
disp('Send a string!');
fprintf(s,'hello');
disp('Receive the string!');
data=fgetl(s);
disp(strcat('The string is "',data,'"!'));
disp('Send a break!');
serialbreak(s);
pause(1); % wait a second to get the break
disp('Close the serial port.');
fclose(s);
end
%% myCallback function
function myCallback(obj,event)
   display('OK! Receive a break!');
end
