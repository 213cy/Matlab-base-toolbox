%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function TriggerRepeatPropertyEg()
% ˵��TriggerRepeat���Ե�ʵ��
ai = analoginput('winsound');
addchannel(ai,1);
set(ai,'TriggerRepeat',4);
set(ai,'TriggerFcn',@myCallBack);
start(ai);
pause(6);
disp(strcat('triggers executed : ',num2str(ai.TriggersExecuted)));
stop (ai);
delete(ai);
clear ai;

end

function myCallBack(obj,event)
disp('trigger occurs');
% !time /t
end
