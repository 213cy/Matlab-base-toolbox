%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%���� 11-6 Continuously_Acquire_Data.m
ai = analoginput('winsound');
addchannel(ai,1);
set(ai,'SamplesPerTrigger',Inf);%���ò�������Ϊ����
set(ai,'TimerPeriod',0.5);      %���ü�ʱ���ص�����ִ������
figure;                     % ����ʵʱ�źŵ�Ƶ��ͼ
P = plot(zeros(1000,1));
T = title(['ʵʱ�ź�FFT,�ص�����ִ�д���:', num2str(0)]);
xlabel('Ƶ��(Hz)')
ylabel('����')
grid on;
set(ai,'TimerFcn',{@demoai_continuous_timer_callback,P,T});
start(ai);
while(strcmpi(get(ai,'Running'),'On'))%����ִ��ֱ�����յ�Stop״̬
   pause(0.5);
end
allData = get(ai,'UserData');

% ���Ʋɼ�������������
figure;
plot(allData.time,allData.data);
xlabel('ʱ��(s)')
ylabel('�źŷ���(Volts)')
title('�ɼ�����');
grid on;

delete(ai);
clear all; % ����������豸����
