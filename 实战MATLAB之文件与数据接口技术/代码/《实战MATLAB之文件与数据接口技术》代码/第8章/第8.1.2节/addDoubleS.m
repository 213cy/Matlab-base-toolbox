%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 8-3 addDoubleS.m
function [out] = addDoubleS(in1,in2)
if ~libisloaded('dlladd')
    loadlibrary('dlladd');
end
out = calllib('dlladd','addDoubleS',in1,in2);
