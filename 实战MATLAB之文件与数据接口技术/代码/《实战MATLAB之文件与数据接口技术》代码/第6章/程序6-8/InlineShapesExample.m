%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 6-8 InlineShapesExample.m
% InlineShape�������ͼƬ
%
try     % ���Word�������Ѵ򿪣��򷵻ؾ��
    myWord = actxGetRunningServer('Word.Application');
catch   % ���򴴽�Word�������������ؾ��
    myWord = actxserver('Word.Application'); 
end
set(myWord,'Visible',1);      % ����Word�������ɼ�
myDoc = myWord.Document.Add;  % �½��հ��ĵ�
mySelection = myWord.Selection; 
mySelection.Start = 0;   % ����ѡ���������ʼλ��
filename = [matlabroot '\toolbox\images\imdemos\trees.tif'];
myInlineShape = mySelection.InlineShapes.AddPicture(filename);
mySelection.TypeParagraph;
mySelection.Text = 'Fig1 Trees';
