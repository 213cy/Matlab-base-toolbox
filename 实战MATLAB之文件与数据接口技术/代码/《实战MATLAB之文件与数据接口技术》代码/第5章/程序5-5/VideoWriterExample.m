%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 5-5 VideoWriterExample.m
nframe = 30;% �趨֡��
x1 = linspace(0,2.5*pi,nframe);
 
% ����VideoWriter����
vwObj = VideoWriter('peaks.avi');
open(vwObj);
 
coef = 10*cos(x1);
hf =figure;
[x,y,z] = peaks;
for k=1:length(coef )
    %����ͼ�����ݣ�����ʱƵ�ļ�֡ͼ��
    h = surf(x,y,coef (k)*z);
    shading interp;axis off;
    colormap(hsv);
    axis([-3 3 -3 3 -80 80])
    axis off
    caxis([-90 90])
    %��ȡ����֡����������֡ͼ����ӵ�AVI�ļ���
    frm= getframe(hf);%  
    vwObj.writeVideo(frm);
end
close(hf);%�ر�MATLABͼ�δ��ھ��
vwObj.close();
