%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 5-3 Movie2aviExample.m
nframe = 30;%�趨֡��
x1 = linspace(0,2.5*pi,nframe);

%����mov�ṹ
mov(1:nframe) = struct('cdata', [], 'colormap', []);
 
coef = 10*cos(x1);
hf =figure;
[x,y,z] = peaks;
for k=1:length(coef )
    % ����ͼ�����ݣ�������Ƶ�ļ�֡ͼ��
    h = surf(x,y,coef (k)*z);
    shading interp;axis off;
    colormap(hsv);
    axis([-3 3 -3 3 -80 80])
    axis off
    caxis([-90 90])
    % ��ȡ����֡����������֡ͼ����ӵ�AVI�ļ���
    mov(k) = getframe(hf);%   
end
close(hf);%�ر�MATLABͼ�δ��ھ��
movie2avi(mov,'peaks_mov.avi','compression','none');
