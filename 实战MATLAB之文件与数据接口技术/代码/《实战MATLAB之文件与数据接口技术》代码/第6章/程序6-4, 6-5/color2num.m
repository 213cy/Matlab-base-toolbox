%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 6-5 color2num.m
function [out] = color2num(in)
r = in(3);g = in(2);b = in(1);
r = uint8(r*255);
g = uint8(g*255);
b = uint8(b*255);
r = dec2hex(r,2);
g = dec2hex(g,2);
b = dec2hex(b,2);
color = [r g b];
disp(color);
out = hex2dec(color);
end % end of color2num.m