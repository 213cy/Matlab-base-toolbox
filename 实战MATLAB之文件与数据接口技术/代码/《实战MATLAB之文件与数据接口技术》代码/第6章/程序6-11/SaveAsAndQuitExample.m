%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 6-11 SaveAsAndQuitExample.m
try     % ���Word�������Ѵ򿪣��򷵻ؾ��
    myWord = actxGetRunningServer('Word.Application');
catch   % ���򴴽�Word�������������ؾ��
    myWord = actxserver('Word.Application'); 
end
set(myWord,'Visible',1);      % ����Word�������ɼ�
myDoc = myWord.Document.Add;  % �½��հ��ĵ�
% Save Doc File
FilenameAndPath = [pwd '\mydoc1']; % �ĵ����·�����ļ���
myDoc.SaveAs(FilenameAndPath);      % ���Ϊ��ǰ�ĵ�
myDoc.Close;                           % �ر�Word�ĵ�
myWord.Quit;                           % �˳�Word������
