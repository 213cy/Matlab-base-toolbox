%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 6-10 HeaderFooterExample.m
% HeaderFooter Object
try     % ���Word�������Ѵ򿪣��򷵻ؾ��
    myWord = actxGetRunningServer('Word.Application');
catch   % ���򴴽�Word�������������ؾ��
    myWord = actxserver('Word.Application'); 
end
set(myWord,'Visible',1);      % ����Word�������ɼ�
myDoc = myWord.Document.Add;  % �½��հ��ĵ�
mySection = myDoc.Sections.Item(1); % ���ص�һ�ڵ�Section����
myFooter = mySection.Footers(1).Item(1); % ����ҳ��
myFooter.Range.text = 'Footer Test'; % ����ҳ������
