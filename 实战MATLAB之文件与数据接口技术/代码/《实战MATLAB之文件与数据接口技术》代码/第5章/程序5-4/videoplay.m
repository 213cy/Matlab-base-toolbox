%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 5-4 videoplay.m
function videoplay(filename)
%function videoplay(filename)

% ����VideoReader����
vobj = VideoReader(filename);

% ��ȡ��Ƶ��Ϣ
nFrames = vobj.NumberOfFrames;
nHeight = vobj.Height;
nWidth = vobj.Width;
 
% ����mov�ṹ��
mov(1:nFrames) = ...
    struct('cdata', zeros(nHeight, nWidth, 3, 'uint8'),...
           'colormap', []);
 
% ����Ƶ�ļ��ж�ȡ��Ƶ֡
for k = 1 : nFrames
    mov(k).cdata = read(vobj, k);
end
 
% ��ͼ�δ��ڣ���������Ƶ�ļ��߶ȺͿ������ͼ�δ��ڳߴ�
hf = figure;
set(hf, 'position', [150 150 nWidth nHeight])
 
% ������Ƶ
movie(hf, mov, 1, vobj.FrameRate);
end
