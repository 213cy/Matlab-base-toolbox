%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ����9-1 serial_testReadAsyncMode2.m
s=serial('COM2');
fopen(s);
tic
for ii=1:3000
    if(isequal(s.TransferStatus,'write'))
    else
        fprintf(s,'test');
    end
    pause(0.01);
end
toc;
fclose(s);
delete(s);
clear s; % end of code
