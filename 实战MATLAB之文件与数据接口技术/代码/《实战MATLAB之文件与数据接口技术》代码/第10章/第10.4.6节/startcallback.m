%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 10-7 startcallback.m
function startcallback(obj,event)
hd = get(obj,'parent');
ud = get(hd,'UserData');
fclose(ud.u);
set(ud.u,'TimerFcn',@senddata,'TimerPeriod',1.0);
fopen(ud.u);
end
