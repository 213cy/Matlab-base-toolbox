%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 6-2 xlswriteExample.m
score={
'NAME','Math','Chinese','English','Physics','Sports','Music';
    'ZhangHua',85,78,86,92,90,85;
    'WangChao',87,69,95,93,90,90;
     'LiYue',76,85,87,96,80,86;
     'ZhaoPeng',92,87,86,91,80,80;
     'SunMing',84,89,79,95,90,90;
    };
xlswrite('FinalExamResult.xls',score,'mySheet1','A1');
xlswrite('FinalExamResult.xls',score,'mySheet2','B2');
xlswrite('FinalExamResult.xls',score,'mySheet3','A1:E4');
xlswrite('FinalExamResult.xls',score,'mySheet4','A1:I8');
