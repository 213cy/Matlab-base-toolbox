%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 2-11 processgrayimage.m
%����Ϊprocessgrayimage.m�ļ�
function []=processgrayimage()
%function []=processgrayimage()
%processgrayimage.m
%˵��:
%     MATLAB��ȡ��λͼͼ��������8λ�޷�������
%     MATLAB��ʾ�ʹ洢ͼ���ʱ��Ҳ��Ҫ��8λ�޷�������
%     ���߽����е����ݹ�һ��[0 1]֮��
%     �������double��uint8�������ͺ�˫������֮���ת���ͱȽϷ���
[name,path] = uigetfile({'*.bmp', '��ѡ��һ��λͼ�ļ�(*.bmp)'},'���һ��λͼ�ļ�');
file = strcat(path,name);
[I,map]=imread(file);
if size(I,3)==3
    I = rgb2gray(I);    
end
%��ͼ������ת��Ϊdouble�������Է��㴦��
I = double(I);
I1 = I - 100;
signI1 = sign(I1);
coefI1 = (signI1 + abs(signI1))/2;
%����100��ͼ�񲿷�
I1 = I.*coefI1;
%С��100��ͼ�񲿷�
I2 = I.*(1-coefI1);
I1 = (I1/max(max(I1)))*255;
I2 = (I2/max(max(I2)))*255;
%������ת��Ϊunsigned int8�����ݣ��Է��������ʾ
I1 = uint8(I1);
I2 = uint8(I2);
figure;
h1=subplot(1,2,1);
subimage(I1);
h2=subplot(1,2,2);
subimage(I2);
truesize;
