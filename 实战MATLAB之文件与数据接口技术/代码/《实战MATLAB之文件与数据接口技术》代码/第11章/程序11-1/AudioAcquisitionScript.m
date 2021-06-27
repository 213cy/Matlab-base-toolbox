%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 11-1 AudioAcquisitionScript.m
% �����źŲɼ�
ai = analoginput('winsound');
addchannel(ai,1);                  % ���ͨ��
set(ai,'timeout',5);               % ���峬ʱֵΪ5��
set(ai,'SamplesPerTrigger',32768); % ���ò�������Ϊ32768
start(ai);                         % �����豸����
fs = ai.SampleRate;              % ��ȡ����Ƶ��
[data time] = getdata(ai);      % ��ò�������
Ns = ai.SamplesPerTrigger;      % ��ȡ��������
t = [0:Ns-1]/fs;
stop (ai);                         % �ر��豸����
delete(ai);                        % ɾ���豸����
clear ai;
% ����ɼ��źŵĹ�����
data = data - mean(data(:));
h = spectrum.welch;
Hpsd = psd(h,data,'Fs',fs);
% ��ͼ
figure;
subplot(211)
plot(t,data);    % ����ԭʼ�ź�
xlabel('ʱ��(s)');ylabel('����');
subplot(212);
plot(Hpsd);      % ���ƹ�����
xlabel('Ƶ��(kHz)');ylabel('������(dB/Hz)');
title('');