function [scod,tmp]=goodstockofbigdeal(matf)
%
%
if ~nargin
   suf=datestr(date,'yymmdd');
   filename=['bigdeal\',suf];
   matf=[filename,'.mat'];
end



%%%%%%%%%%%%
%%���������ֱ�Ӵ��ļ��������ݵķ���
% matObj = matfile(matf);
% n=matObj.s(:,1);
% bs=matObj.s(:,7);
%%�÷�������
%%%%%%%%%%%


load(matf)
%%
n=s(:,1);%��Ʊ����
bs=s(:,7);%��������

co=[strcmp('����',bs),strcmp('����',bs),strcmp('����',bs)];
tmp=sum(co);
disp('��ֹĿǰ')
disp(['���մ��򵥹���',num2str(tmp(1)),'��'])
disp(['���մ���������',num2str(tmp(2)),'��'])
disp(['���������󵥹���',num2str(tmp(3)),'��'])
%%
%[x,xid,y] = grp2idx(n);
k=tabulate(n);
[b,ix]=sort([k{:,2}],'descend');

ea=10;

scod=k(ix(1:ea),1);

aind=zeros(ea,size(n,1));
for m=1:ea
    aind(m,:)=strcmp(scod{m},n);
end
ta=aind*co;

tmp=[b(1:ea)',ta];

%markbuyday(scod);