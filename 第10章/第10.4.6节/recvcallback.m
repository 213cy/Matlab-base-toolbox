%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 10-9 recvcallback.m
function recvcallback(obj,event)
ud = get(obj,'UserData');
BytesAvailable = get(obj,'BytesAvailable');
ud.bytes = ud.bytes + BytesAvailable;
data = fread(obj,BytesAvailable/4,'int32');
fprintf(1,'�����յ�����Ϊ"%3.2f", ����ȡ�ֽ���:%d�����ζ�ȡ�ֽ���:%d\n',data,ud.bytes,BytesAvailable);
set(obj,'UserData',ud);
end
