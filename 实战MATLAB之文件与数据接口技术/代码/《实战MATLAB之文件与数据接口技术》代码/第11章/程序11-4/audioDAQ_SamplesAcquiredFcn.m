%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 11-4 audioDAQ_SamplesAcquiredFcn.m
function audioDAQ_SamplesAcquiredFcn()
% ���� SamplesAcquiredFcn�ص�����
global ai;
global data;
global time;
ai = analoginput('winsound');
addchannel(ai,1);     %���ͨ��
set(ai,'SamplesPerTrigger',8000);
set(ai,'SamplesAcquiredFcnCount',4000);
set(ai,'SamplesAcquiredFcn',@myGetdata);
duration = ai.SamplesPerTrigger / ai.SampleRate; % duration
start(ai);
wait(ai,duration);
stop (ai);
delete(ai);
clear ai;
end  % end of function audioDAQ_SamplesAcquiredFcn()

function [] = myGetdata(obj,event)
global ai;
global data;
global time;
[data time] = getdata(ai,4000); % ��ò�������
figure;
plot(time,data);
xlabel('ʱ��(s)');
ylabel('����');
end % end of function myGetdata()

% end of audioDAQ_SamplesAcquiredFcn.m
