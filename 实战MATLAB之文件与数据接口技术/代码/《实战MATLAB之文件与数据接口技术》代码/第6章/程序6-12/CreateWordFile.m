%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 6-12 CreateWordFile.m
% CreateWordFile.m
% ����MATLAB����Word�ĵ�
%%
try     % ���Word�������Ѵ򿪣��򷵻ؾ��
    myWord = actxGetRunningServer('Word.Application');
catch   % ���򴴽�Word�������������ؾ��
    myWord = actxserver('Word.Application'); 
end
set(myWord,'Visible',1);      % ����Word�������ɼ�
myDoc = myWord.Document.Add;  % �½��հ��ĵ�

%% Content�ӿڲ���
myContent = myDoc.Content;    % �����ĵ���Content�ӿڵľ��
myContent.Start = 0;          % �����ĵ�Content����ʼλ��
title = 'MATLAB ���';         % ����
myContent.text = title;       % д���ĵ�������
myContent.Font.Size = 20;     % �����ֺ�
myContent.ParagraphFormat.Alignment = 'wdAlignParagraphCenter';
                                   % ���ж���

%% Selection�ӿڲ���
mySelection = myWord.Selection; 
mySelection.Start = myContent.end;  % ����ѡ���������ʼλ��Ϊ�ĵ����ݵ�ĩβ
% ��ӽ�ע
FootnoteStr = 'ע������������Ҫ����ά���ٿơ�';
mySelection.Footnotes.Add (mySelection.Range, '',FootnoteStr);
mySelection.Start = myContent.end;  % ����ѡ���������ʼλ��Ϊ�ĵ����ݵ�ĩβ
mySelection.TypeParagraph;          % �س�������һ��
% ��ӵ�һ������
% ���ֵĸ�ʽ����
mySelection.Font.Name = '����';     % ��������
mySelection.Font.Size = 12;         % �����ֺ�
mySelection.Font.Bold = 0;          % ���岻�Ӵ�
mySelection.paragraphformat.Alignment = 'wdAlignParagraphLeft'; 
                                          % �������
mySelection.paragraphformat.LineSpacingRule = 'wdLineSpace1pt5'; 
                                          % �о�Ϊ1.5���о�
mySelection.paragraphformat.FirstLineIndent = 25;  % ������������
% ��Ӷ�������
myStr1 = ['MATLAB��Matrix Laboratory����д����һ����'...
    '����MathWorks��˾��Ʒ����ҵ��ѧ�����MATLAB��һ�������㷨������'...
    '���ݿ��ӻ������ݷ����Լ���ֵ����ĸ߼������������Ժͽ���ʽ����'...
    '���˾������㡢���ƺ���/����ͼ��ȳ��ù����⣬MATLAB��������������'...
    '�û����漰�����������ԣ�����C��C++��FORTRAN����д�ĳ���']; 
                                         % ��1��Ȼ�ε�����
mySelection.Text = myStr1;          % ��ѡ������������������
mySelection.Start = mySelection.end;
mySelection.TypeParagraph;          % �س�������һ��

% ���ͼƬ����˵��
% ����ͼƬ�ĸ�ʽ
mySelection.paragraphformat.Alignment = 'wdAlignParagraphCenter'; 
                                                          % ���ж���
mySelection.paragraphformat.FirstLineIndent = 0; % ������������
% ���ͼƬ MATLAB_logo.jpg
myImg1 = [pwd '\MATLAB_logo.jpg'];
mySelection.InlineShapes.AddPicture(myImg1);
mySelection.Start = mySelection.end;
mySelection.TypeParagraph;          % �س�
% ���ͼƬ��˵��
mySelection.Font.Size = 10;         % �����ֺ�
mySelection.Font.Name = '����';     % ��������
myFigStr1 = 'ͼ1 MATLAB logo�ı仯����';
mySelection.Text = myFigStr1;          % ��ѡ������������������
mySelection.Start = mySelection.end;
mySelection.TypeParagraph;          % �س�

% ��ӵڶ�������
% ���ֵĸ�ʽ����
mySelection.Font.Name = '����';     % ��������
mySelection.Font.Size = 12;         % �����ֺ�
mySelection.Font.Bold = 0;          % ���岻�Ӵ�
mySelection.paragraphformat.Alignment = 'wdAlignParagraphLeft'; 
                                                           % �������
mySelection.paragraphformat.LineSpacingRule = 'wdLineSpace1pt5'; 
                                                           % �о�Ϊ1.5���о�
mySelection.paragraphformat.FirstLineIndent = 25; % ������������
% ��Ӷ�������
myStr2 = ['����MATLAB��Ҫ������ֵ���㣬������Ϊ���ڶ�ĸ��ӹ�����'...
    '��Toolbox����Ҳ�ʺϲ�ͬ�����Ӧ�ã��������ϵͳ����������'...
    'ͼ�����źŴ�����ͨѶ�����ڽ�ģ�ͷ����ȡ����⻹��һ��'...
    '���������Simulink���ṩ��һ�����ӻ�����������������ϵͳģ�⡢'...
    '��̬/Ƕ��ʽϵͳ�����ȷ��档'];         % ��2��Ȼ�ε�����
mySelection.Text = myStr2;          % ��ѡ������������������
mySelection.Start = mySelection.end;
mySelection.TypeParagraph;          % �س�
% ��Ӷ�������
myStr3 = ['MATLAB�����ڰ汾���±���ʾ��'];         % ��2��Ȼ�ε�����
mySelection.Text = myStr3;          % ��ѡ������������������
mySelection.Start = mySelection.end;
mySelection.TypeParagraph;          % �س�
% ��ӱ��ı���
mySelection.paragraphformat.Alignment = 'wdAlignParagraphCenter'; 
                                          % ���뷽ʽ
mySelection.Font.Size = 10;         % �����ֺ�
mySelection.Font.Name = '����';     % ��������
myTableStr1 = '��1 MATLAB�İ汾';
mySelection.Text = myTableStr1;     % ��ѡ������������������
mySelection.Start = mySelection.end;
mySelection.TypeParagraph;          % �س�
% ������ָ�ʽ
mySelection.Font.Size = 12;         % �����ֺ�
mySelection.Font.Name = '����';     % ��������

%% Tables�ӿڣ����
nRow = 8;   % ����
nColumn = 3;% ����
myTable = mySelection.Tables.Add(mySelection.Range,nRow,nColumn);
myTable.Borders.InsideLineStyle = 'wdLineStyleSingle'; % �ڱ߿���ʽ
myTable.Borders.InsideLineWidth = 'wdLineWidth025pt'; % �ڱ߿���
myTable.Borders.OutsideLineStyle = 'wdLineStyleSingle'; % ��߿���ʽ
myTable.Borders.OutsideLineWidth = 'wdLineWidth150pt'; % ��߿���
myTable.Rows.Alignment = 'wdAlignRowCenter';% ���ñ���������
% ���ø���Ԫ��Ķ��뷽ʽ
for jj = 1:nColumn
    myTable.Cell(1,jj).Range.Paragraphs.Alignment = ...
           'wdAlignParagraphCenter';  % �����о��ж���
end
for ii = 2:nRow
    for jj = 1:nColumn
        myTable.Cell(ii,jj).Range.Paragraphs.Alignment = ...
           'wdAlignParagraphLeft'; % �����о������
    end
end
% ���õ�Ԫ����
myTable.Columns.Item(1).Width = 140;
for ii = 2 : myTable.Columns.Count
    myTable.Columns.Item(ii).Width = 120;
end
% �ϲ���Ԫ��
myTable.Cell(5,3).Merge(myTable.Cell(6,3));
myTable.Cell(7,3).Merge(myTable.Cell(8,3));
% �������
myTable.Cell(1,1).Range.Text = '�汾';
myTable.Cell(1,2).Range.Text = '�ͷű��';
myTable.Cell(1,3).Range.Text = '���';
myTable.Cell(2,1).Range.Text = 'MATLAB 1.0';
myTable.Cell(2,2).Range.Text = 'R?';
myTable.Cell(2,3).Range.Text = '1984';
myTable.Cell(3,1).Range.Text = 'MATLAB 2';
myTable.Cell(3,2).Range.Text = 'R?';
myTable.Cell(3,3).Range.Text = '1986';
myTable.Cell(4,1).Range.Text = '����';
myTable.Cell(4,2).Range.Text = '����';
myTable.Cell(4,3).Range.Text = '����';
myTable.Cell(5,1).Range.Text = 'MATLAB 7.8';
myTable.Cell(5,2).Range.Text = 'R2009a';
myTable.Cell(5,3).Range.Text = '2009';
myTable.Cell(6,1).Range.Text = 'MATLAB 7.9';
myTable.Cell(6,2).Range.Text = 'R2009b';
myTable.Cell(7,1).Range.Text = 'MATLAB 7.10';
myTable.Cell(7,2).Range.Text = 'R2010a';
myTable.Cell(7,3).Range.Text = '2010';
myTable.Cell(8,1).Range.Text = 'MATLAB 7.11';
myTable.Cell(8,2).Range.Text = 'R2010b';

%% Save Doc File
FilenameAndPath = [pwd '\mydoc1']; % �ĵ����·�����ļ���
myDoc.SaveAs(FilenameAndPath);     % ���Ϊ��ǰ�ĵ�
myDoc.Close;                       % �ر�Word�ĵ�
myWord.Quit;                       % �˳�Word������

%% end of code
