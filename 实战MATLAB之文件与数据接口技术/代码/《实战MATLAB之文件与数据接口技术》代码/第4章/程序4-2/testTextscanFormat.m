%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 4-2 testTextscanFormat.m
fid = fopen('number.txt','w');
fprintf(fid,'9876.54321 abc');
fclose(fid);
clear fid;
fid = fopen('number.txt','r');
s1 = textscan(fid,'%6.3f',1);
s2 = textscan(fid,'%s',1);
fseek(fid,0,'bof');
s3 = textscan(fid,'%10.3f',1);
s4 = textscan(fid,'%s',1);
fseek(fid,0,'bof');
s5 = textscan(fid,'%20.20f',1);
s6 = textscan(fid,'%s',1);
fclose(fid);
