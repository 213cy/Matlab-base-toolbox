%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 6-9 ShapeExample.m
try     % ���Word�������Ѵ򿪣��򷵻ؾ��
    myWord = actxGetRunningServer('Word.Application');
catch   % ���򴴽�Word�������������ؾ��
    myWord = actxserver('Word.Application'); 
end
set(myWord,'Visible',1);      % ����Word�������ɼ�
myDoc = myWord.Document.Add;  % �½��հ��ĵ�
type = 34;  % ����Ϊ���ͷ
left = 100; % �����Ե�ľ��루������
top = 100;  % ���ϱ�Ե�ľ��루������
width = 100; % ��ȣ�������
height = 50;% �߶ȣ�������
myShape = myDoc.Shapes.AddShape(type,left,top,width,height);
