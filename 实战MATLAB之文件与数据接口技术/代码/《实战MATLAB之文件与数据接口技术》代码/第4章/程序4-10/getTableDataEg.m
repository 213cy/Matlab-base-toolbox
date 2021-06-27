%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 4-10 getTableDataEg.m
clear;
clc;
filename = 't20111026_402761639.htm';
[pathstr, name, ext] = fileparts(filename);
xlsfilename = fullfile(pathstr,strcat(name,'.xls'));

txt = fileread(filename);
tables = regexpi(txt, '<table.*?>(.*?)</table>', 'tokens');
for ii = 1:length(tables)
    table = tables{ii}{1};
    rows = regexpi(table, '<tr.*?>(.*?)</tr>', 'tokens');
    for jj = 1:length(rows)
        row = rows{jj}{1};
        row=regexprep(row, '&nbsp;',' ');
                                        %���html�����е�&nbsp;Ϊ�ո�
        headers = regexpi(row, '<th.*?>(.*?)</th>', 'tokens');
        if ~isempty(headers)  % �жϱ������Ƿ����
            for kk = 1:length(headers)
                header=regexprep(headers{kk}{1},'<.*?>','');  %ȥ����ǩ
                data{jj,kk} = header;
            end
            continue
        end
        columns = regexpi(row, '<td.*?>(.*?)</td>', 'tokens');
        for kk = 1:length(columns)
            column = regexprep(columns{kk}{1}, '<.*?>', '');   %ȥ����ǩ
            data{jj,kk} = column;
        end
    end
%     disp(data);
    xlswrite(xlsfilename,data,strcat('sheet',num2str(ii)));
    clear data;
end
