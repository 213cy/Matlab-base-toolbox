%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 6-4 xlscolorwrite.m
function xlscolorwrite(file,data,range,fontcolor,bgcolor)
file = fullfile(pwd, file);
exl = actxserver('excel.application');
exlWkbk =exl.WorkBooks.Add();
ran = exl.Activesheet.get('Range',range);
ran.value = data;
if nargin>=4
ran.font.Color=color2num(fontcolor);
end
if nargin==5
ran.interior.Color=color2num(bgcolor);
end
exlWkbk.SaveAs(file);
exlWkbk.Close;
exl.Quit;
exl.delete;
end  % end of xlscolorwrite.m



