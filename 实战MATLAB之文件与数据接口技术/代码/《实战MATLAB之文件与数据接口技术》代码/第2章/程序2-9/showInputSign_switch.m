%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 2-9 showInputSign_switch.m
%switch����ʹ�÷������ԣ�����ΪshowInputSign_switch.m�ļ�
function [] = showInputSign_switch(input)
%�����������ݵ�������ͬ��������ͬ�����
nlen = length(input);
if ~isreal(input)
    display('��������Ϊ����!');
    return;
end
if nlen>1
        disp('��������ݲ���1x1����ֵ����!');   
else
    signinput = sign(input);
    switch signinput
        case 0
            disp('�������ݵ���0');
        case 1
            disp('�������ݴ���0');
        case -1
            disp('��������С��0');
        otherwise
            disp('������!!!!');
    end
end
end