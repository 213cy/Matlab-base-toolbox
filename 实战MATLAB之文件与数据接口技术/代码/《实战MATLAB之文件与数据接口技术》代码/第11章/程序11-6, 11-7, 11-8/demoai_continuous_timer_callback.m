%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 11-7 demoai_continuous_timer_callback.m
function demoai_continuous_timer_callback(obj,event,plotHandle,titleHandle)
persistent count;
persistent totalData;
if isempty(count)
     count =0;
end
count = count + 1;
[data,time] =getdata(obj,obj.SamplesAvailable);
% ��ȡ���ݣ��������ڱ���totalData��
if isempty(totalData)
    totalData.time = time;
    totalData.data =data;
else
    totalData.time = [totalData.time;time];
    totalData.data = [totalData.data;data];
end
% ����demoai_continuous_fft�����������Ƿ���������
if(demoai_continuous_fft(data,plotHandle))
    set(obj,'UserData',totalData);
    stop(obj); 
end
% ʵʱ�޸�ͼ�����ı���
set(titleHandle,'String',['ʵʱ�ź�FFT,�ص�����ִ�д���:', num2str(count)]);
end
