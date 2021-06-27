%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 6-3 climateAnalysis.m
%climateAnalysis.m
exl = actxserver('excel.application');
exlWkbk = exl.Workbooks;
exlFile = exlWkbk.Open([pwd '\climate2007.xlsx']);
exlSheet1 = exlFile.Sheets.Item('Sheet1');
robj = exlSheet1.Columns.End(4);  % Find the end of the column
numrows = robj.row;                  % And determine what row it is
dat_range = ['A1:G' num2str(numrows)]; % Read to the last row
rngObj = exlSheet1.Range(dat_range);
exlData = rngObj.Value;
x = cell2mat(exlData(2:end,2)); % mean temperature
y = cell2mat(exlData(2:end,6)); % sunshine amount
figure; hold on;
plot(x,y,'ko');
xlabel('ƽ������(��)');
ylabel('ȫ��������(Сʱ)');
xdata = [ones(size(x, 1), 1), x]; 
b = regress(y, xdata);        % linear regression
yreg = xdata*b;
plot(x,yreg,'k');
exlWkbk.Close;
exl.Quit;
exl.delete;
