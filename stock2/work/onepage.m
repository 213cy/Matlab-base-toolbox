function s=onepage(P)
%����󵥵�һҳ
%P��һ������
%���ص�s��һ�����д����ݵ�9�еİ����飬ÿһ����һ����
%�ú����ᱻsavetodaybigdeal����
url='http://app.finance.ifeng.com/hq/all_stock_bill.php';
page=num2str(P);
by='hq_time';
order='asc';%'desc'
amount='1000';

str=urlread(url,'get',...
    {'page',page,'by',by,'order',order,'amount',amount});

%%
st=strfind(str,'��ϸ');
en=strfind(str, '�鿴');

%%%%%%%%%%%%%
%%�����ǲ��Դ��룬������editor����ȷ��ʾ��ȡ����ҳƬ��
if false
    filename=['bigdeal\',datestr(date,'yymmdd')];
    lookstr(filename,str(st:en(end)));
end
%%���Դ������
%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%
S=regexp(str(st:en(end)),'(?<=>)[^\n%����<]*(?=%?<)','match');
s=reshape(S,9,[])';



