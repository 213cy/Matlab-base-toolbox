%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 6-7 CreateTable.m
%%
try     % ���Word�������Ѵ򿪣��򷵻�����
    myWord = actxGetRunningServer('Word.Application');
catch   % ?���򴴽�Word�����������ؾ��
    myWord = actxserver('Word.Application'); 
end
set(myWord,'Visible',1);      % ����Word�������ɼ�
myDoc = myWord.Document.Add;  % ��ӿհ��ĵ�
%% Selection�ӿ�
mySelection = myWord.Selection; 
mySelection.Start = 0;              % ����������ʼλ��
% ��ӱ������
mySelection.Text = '��1 ��ƷA 2010�꼾��������';
mySelection.paragraphformat.Alignment = 'wdAlignParagraphCenter'; %����
mySelection.Start = mySelection.end;
mySelection.TypeParagraph;          % �س�
mySelection.ClearFormatting;        % �����ʽ
%% Tables�ӿ�
nRow = 5;   % ����
nColumn = 3;% ����
myTable=mySelection.Tables.Add(mySelection.Range,nRow,nColumn);
