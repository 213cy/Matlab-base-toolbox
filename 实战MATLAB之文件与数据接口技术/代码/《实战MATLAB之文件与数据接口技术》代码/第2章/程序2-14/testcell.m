%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 2-14 testcell.m
%����Ϊtestcell.m�ļ�
function []=testcell()
%function []=testcell()
%testcell.m
tcell = cell(2,3);
tcell{1,1} = [1 2 3;4 5 6;7 8 9;];
%... ��ʾ���з���
tcell{1,2} = struct('name','����',...
        'college','�����Ƽ���ѧ',...
        'phone','01063320501',...
        'specialties',{'ƽ�����', '��վ����'});
tcell{1,3}=[2+3*i 5+6*i;3+3*i 0.1+0.558*i;];
tempcell=cell(2,2);
tempcell{1,1}='string';
tempcell{1,2}=[2 4;6 8;];
tempcell{2,1}=[7 8 9];
tempcell{2,2}=32+i;
tcell{2,1}=tempcell;
tcell{2,2}='Hello World!';
tcell{2,3}=[9 8 6;5 4 3;2 1 7;];
 
%����{��}�����õ���ӦԪ������Ԫ��
for ii=1:2
    for jj=1:3
        disp(tcell{ii,jj})
    end
end
%ͨ��(��)�����õ�1x1����ӦԪ������
for ii=1:2
    for jj=1:3
        disp(tcell(ii,jj))
    end
end
