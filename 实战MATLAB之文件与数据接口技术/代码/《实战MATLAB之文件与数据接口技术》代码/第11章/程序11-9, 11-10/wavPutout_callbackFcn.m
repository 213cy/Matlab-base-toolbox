%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%���� 11-10 wavPutout_callbackFcn.m
function wavPutout_callbackFcn(obj,event,plotHandle,y)
startindex = 1;
increment = 500;
while isrunning(obj) % ʵʱ������Ƶ����
    while (obj.SamplesOutput < startindex + increment -1), end
    try
        x = obj.SamplesOutput;
        set(plotHandle, 'ydata',y(x:x+increment-1));
        set(gca, 'YLim', [-0.8 0.8], 'XLim',[1 increment])
        drawnow;
        startindex =  startindex+increment;
    end
end
stop(obj);
delete(obj);
end
