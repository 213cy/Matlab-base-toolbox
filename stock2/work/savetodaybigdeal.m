function savetodaybigdeal
%�ѷ�����ʹ�ú���savebigdeal
msgbox('abandoned','abandoned','warn')
return
%
%
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

%%
%%%%%%%%%%%%%%%%%%%%%%%%%

S=regexp(str(st:en(end)),'(?<=>)[^\n%����<]*(?=%?<)','match');
s=reshape(S,9,[])';

filename=datestr(date,'yymmdd');
matf=['bigdeal\',filename,'.mat'];
save(matf,'s','-v7.3')
matObj = matfile(matf,'Writable',true);

%%
[~,~,~,totp]=regexp(str,'(?<=��)\d*(?=ҳ)');
for k=2:str2double(totp{1})

s=onepage(k);
l=size(s,1);
matObj.s(end+1:end+l,:) = s;%����һ��������һ��һ������ĸl

end

