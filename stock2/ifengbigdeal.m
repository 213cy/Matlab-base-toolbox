%ʹ��ͬһ������ȡ���ɴ����ݵļ��ֲ�ͬ����
tic
url='http://app.finance.ifeng.com/hq/stock_bill.php?code=sh600663';
str=urlread(url);
toc
disp('--------------------------')
disp('--------------------------')
%%
sp=[sprintf('\r\n'),char(32*ones(1,13))];
[~,fi]=regexp(str, ['>�ǵ���</th>',sp,'</tr>',sp,char(60)]);
%double(sprintf('\r\n '))
%k = strfind(tr, ['>�ǵ���</th>',sprintf('\r\n'),char(32*ones(1,13)),char(60)]);
la = strfind(str, '<div class="tt02">˵��');
%%%%%%%%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%
%%
tic
dt='<td>%8s</td> ';%�ɽ�ʱ��
dp='<td>%f</td> ';%�ɽ��۸�
dq='<td>%f</td> ';%�ɽ���(��)
da='<td>%f</td> ';%�ɽ���(��)
sb='<td><span class= %*s >%4s</span></td> ';%������
ud='<td><span class= %*s >%f</span></td> ';%�ǵ��� 
udm='<td><span class= %*s >%f%% </span></td> ';%�ǵ��� �����ٷֺź�������пո�
fmat=['<tr> ',dt,dp,dq,da,sb,ud,udm, '</tr>'];    

C= textscan(str(fi:la),fmat,...
    'whitespace',' \n\r"',...
    'CollectOutput',1);
toc
%%%
tic
C2= textscan(str(fi:la-1),'%8s%f%f%f%4s%f%f%%',...
    'CommentStyle',{'<', '>'},...
    'whitespace',' \n\r\t',...
    'CollectOutput',1);
toc
%%%
tic
wsp=['a':'z','<A="/%> \n\r\t'];
C3= textscan(str(fi:la),'%8s%f%f%f%4s%f%f%%',...
    'whitespace',wsp,...
    'MultipleDelimsAsOne',true,...
    'CollectOutput',1);
toc
%%
%%%%%%%%%%%%%
disp('++++++++++++++++++++++')
%%%%%%%%%%%%%
tic
tim=datenum(C{1},'HH:MM:SS');

sb=ones(length(C{3}),1);
sb(cellfun(@(x) isequal(x,'����'),C{3}))=-1;
sb(cellfun(@(x) isequal(x,'����'),C{3}))=0;

pd=[C{2:2:4}];

toc

%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%
disp('--------------------------')
%%%%%%%%%%%%%%
%%
tic
S=regexp(str(fi:la),'[0-9.-]*','match');
S2=regexp(str(fi:la),'����|����|����','match');
s=reshape(S,8,[])';


%%


tim2=datenum(cell2mat(s(:,1:3)),'HHMMSS');
%p=cellfun(@eval,s(:,4:8)))
%p=cellfun(@str2num,s(:,4:8));

sb2=ones(length(S2),1);
sb2(cellfun(@(x) isequal(x,'����'),S2))=-1;
sb2(cellfun(@(x) isequal(x,'����'),S2))=0;

pd2=cellfun(@str2double,s(:,4:8));

toc



