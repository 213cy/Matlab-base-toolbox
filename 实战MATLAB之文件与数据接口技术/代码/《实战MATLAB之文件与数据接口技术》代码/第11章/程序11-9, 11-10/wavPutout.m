%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%���� 11-9 wavPutout.m
function [] = wavPutout()
[y, Fs] = wavread([matlabroot ...
    '\toolbox\sl3d\vrealm\program\worlds\audio\tms.wav']);
ao = analogoutput('winsound', 0);
addchannel(ao, [1 2]);
set(ao, 'SampleRate', Fs);
data = [y y];
putdata(ao, data);
figure;
P = plot(zeros(500,1));
set(ao,'TimerPeriod',500/Fs);%ÿ500�����һ�β���
set(ao,'TimerFcn',{@wavPutout_callbackFcn,P,y});
start(ao);
end
