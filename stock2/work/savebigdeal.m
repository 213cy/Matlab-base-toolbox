function matf=savebigdeal
%�������ش�
%���ش��ļ���
%%%%%%%%%%%%%%%%%
%%ȷ��Ŀ���ļ���
t=clock;
if t(4)<9
    filename=datestr(addtodate(now, -1, 'day'),'yymmdd');
    matf=['bigdeal\',filename,'.mat'];
else
    filename=datestr(date,'yymmdd');
    matf=['bigdeal\',filename,'.mat'];
end
%%

%%ȷ���Ƿ񴴽��������ļ�����ʲôҲ����
if exist(matf,'file')
    a=load(matf,'t');
    if a.t(4)>15
        return%ʲôҲ����
    end
    %�����ļ�
else
    prompt = {'�������ļ����ļ���:'};
    dlg_title = '��Ҫ�������ļ���';
    num_lines = 1;
    def = {matf};
    answer = inputdlg(prompt,dlg_title,num_lines,def);
    %msgbox(['�ļ�',fil,'�����ɹ���'],'����mat�ļ�','help')
    if  isempty(answer)%�ж��Ƿ񴴽����ļ�
        return%������
    else
        matf=answer{1};%����
    end
end

%%
%%��ȡ���ݣ������ļ�
url='http://app.finance.ifeng.com/hq/all_stock_bill.php';
page='1';
by='hq_time';
order='asc';%'desc'
amount='1000';

str=urlread(url,'get',...
    {'page',page,'by',by,'order',order,'amount',amount});

%%
st=strfind(str,'��ϸ');
en=strfind(str, '�鿴');
[~,~,~,totp]=regexp(str,'(?<=��)\d*(?=ҳ)');
%%
%%%%%%%%%%%%%%%%%%%%%%%%%

S=regexp(str(st:en(end)),'(?<=>)[^\n%����<]*(?=%?<)','match');
s=reshape(S,9,[])';
for k=2:str2double(totp{1})
    s2=onepage(k);
    s=[s;s2];
    %     l=size(s,1);
    %     matObj.s(end+1:end+l,:) = s;%����һ��������һ��һ������ĸl
end

save(matf,'s','t','-v7.3')


% filename=datestr(date,'yymmdd');
% matf=['bigdeal\',filename,'.mat'];
%
% matObj = matfile(matf,'Writable',true);

%%



