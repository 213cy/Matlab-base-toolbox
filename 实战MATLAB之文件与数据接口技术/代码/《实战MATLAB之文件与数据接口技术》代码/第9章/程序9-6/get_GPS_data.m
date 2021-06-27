%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 9-6 get_GPS_data.m
function get_GPS_data(comName)
if nargin<1 || nargin >1
    disp('���������������');
    return;
end
sCom = serial(comName);
sCom.BaudRate = 4800;           %������
sCom.InputBufferSize = 8192;  %���ջ����С����λ�ֽ�
sCom.Timeout = 5;               %�ȴ�ʱ�䣬������ֵ���������գ���λ��
% sCom.Parameters = Value;    %�����������ڲ���
% ...

try
    fopen(sCom);         %����ö˿ڲ����ڣ��򱨴�����catch���׽
catch
    disp('��������ʧ��');
    return;
end
disp('�������ڳɹ�');
 
gpsfilename= strcat('GPS_', datestr(now),'.txt'); 
                                                  %ʹ��ϵͳʱ�䶨���ļ���
gpsfilename(gpsfilename==':')='-';
fp = fopen(gpsfilename,'w');
if fp==-1
    disp('��д���ļ�������');
    return;
end
 
ii=1;
while ii<100
    dataR = [];
    [dataR,count,msg] = fgets(sCom);
    if isempty(msg)==0        %��msg��Ϊ�գ����ȡ����ʧ�ܣ�
                         %��ʾ��Timeout��ʱ���ڴ���δ�������ݣ�����ѭ��
        disp('��ȡ����ʧ��');
        break;
    end
    disp(dataR);
    fprintf(fp,dataR);
    ii=ii+1;
end

fclose(fp);                   %�ر����ݱ�����ļ�
fclose(sCom);                %�رմ���
delete(sCom);
clear sCom;
end                        % end of function file
