%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 11-2 PrintInitialTriggerTimeScript.m
ai = analoginput('winsound');
addchannel(ai,1);
start(ai);
abstime = ai.InitialTriggerTime;
t = fix(abstime);                   % ȡ��
sprintf('%d-%d-%d %d:%d:%d',t(1),t(2),t(3),t(4),t(5),t(6))
stop (ai);
delete(ai);
clear ai;
