%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ����9-2 serial_testReadAsyncMode1.m
deltaTime = 0.2;
s=serial('COM1');
s.InputBufferSize=8192;
s.ReadAsyncMode='manual';
fopen(s);
for ii=1:5
    pause(deltaTime);
    bytesBeforeReadasync = s.BytesAvailable;
    disp(strcat('Before readasync():', num2str(bytesBeforeReadasync)));
end
for ii=1:5
    readasync(s);
    pause(deltaTime);
    bytesAfterReadasync = s.BytesAvailable;
    disp(strcat('After readasync():',num2str(bytesAfterReadasync)));
end
stopasync(s);
for ii=1:5
    pause(deltaTime);
    bytesAfterStopasync = s.BytesAvailable;
    disp(strcat('After stopasync():', num2str(bytesAfterStopasync)));
end
s.ReadAsyncMode='continuous';
for ii=1:5
    pause(deltaTime);
    bytesContinuous = s.BytesAvailable;
    disp(strcat('Mode is Continuous:', num2str(bytesContinuous) ));
end
fclose(s);
delete(s);
clear s; %end of code
