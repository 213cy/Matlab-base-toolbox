%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 10-8 stopcallback.m
function stopcallback(obj,event)
hd = get(obj,'parent');
ud = get(hd,'UserData');
fclose(ud.u);
set(ud.u,'TimerFcn','');
fopen(ud.u);
end
