%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 6-6 testCopyAndPaste.m
try     % ���Word�������Ѵ򿪣��򷵻�����
    myWord = actxGetRunningServer('Word.Application');
catch   % ?���򴴽�Word�������������ؾ��
    myWord = actxserver('Word.Application'); 
end
set(myWord,'Visible',1);      % ����Word�������ɼ�
myDoc1 = myWord.Document.Add;  % ��ӿհ��ĵ�1
myDoc1.ActiveWindow.Selection.Text = 'This is an example of pasting the content.';
myDoc1.ActiveWindow.Selection.Copy;  % �����ĵ�1������
myDoc2 = myWord.Document.Add;  % ��ӿհ��ĵ�2
myDoc2.ActiveWindow.Selection.Paste; % ���ĵ�2��ճ��
