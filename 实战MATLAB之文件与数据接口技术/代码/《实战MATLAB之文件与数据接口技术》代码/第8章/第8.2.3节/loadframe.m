%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [framedata] = loadframe(filename)
framedata = load(filename);
framedata = framedata.framedata;
for kk = 1:length(framedata(:))
    framedata(kk).startv = dec2hex(framedata(kk).startv);
    framedata(kk).endv = dec2hex(framedata(kk).endv);
end