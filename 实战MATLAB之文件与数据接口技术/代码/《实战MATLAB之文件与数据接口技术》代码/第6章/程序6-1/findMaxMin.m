%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 6-1 findMaxMin.m
function [Data] = findMaxMin(Data)
DataTemp = Data.Value;
Count=Data.Count;
Data.Value = cell(1,2);
Data.Value{1} = DataTemp{1};   %max value
Data.Value{2} = DataTemp{1};   %min value
for k=1:Count
    v = DataTemp{k};
    if v>Data.Value{1}
        Data.Value{1} = v;
    end
    if v<Data.Value{2}
        Data.Value{2} = v;
    end
end  %end of findMaxMin.m
