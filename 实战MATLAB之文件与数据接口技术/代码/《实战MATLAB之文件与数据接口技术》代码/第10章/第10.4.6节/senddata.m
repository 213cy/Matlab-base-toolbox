%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 10-11 senddata.m
function senddata(obj,event)
ud = get(obj,'UserData');
if isfield(ud,'data') && isfield(ud,'u')   
    fwrite(ud.u,ud.data,'int32');
    fprintf(1,'��������%d\r',ud.data);
    ud.data = ud.data + 1;    
end
set(obj,'UserData',ud);
end
