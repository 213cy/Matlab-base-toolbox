%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 2-17 testimage.m
%����Ϊtestimage.m�ļ�
out = load('trees');
img = out.X;
map = out.map;
clear out;
xdata = [0 30];
ydata = [0 10];
imagesc(img,'xdata',xdata,'ydata',ydata);
colormap(map);
xlabel('x��(��)');
ylabel('y��(��)');
