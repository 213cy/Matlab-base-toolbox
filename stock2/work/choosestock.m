function resu=choosestock(n)
%��ѡĿ���Ʊ
%����n����ָ�����ѡȡ�Ĺ�Ʊ�������ɵ�5�й̶�Ϊ3
%
n=3;
%%
fil=savebigdeal;

profileofbigdeal(fil);
[scod,tmp]=goodstockofbigdeal(fil);

%%
hold on
plot(tmp(:,1))%�ܵ�
plot(0.5*tmp(:,1))%1/2�ܵ�
plot(tmp(:,2),'r')%��
plot(tmp(:,3),'g')%����
plot(tmp(:,4),'c')%������
set(gca,'XTickLabel',scod)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

a=cell2mat(scod);
ind1=find(a(:,1)>'1');

a=tmp(:,2)-0.5*tmp(:,1);
[b,ix]=sort(a(ind1),'descend');

m=min(sum(b>1),n);
resu=cell(m,1);
for k=1:m
        resu{k,1}=scod{ind1(ix(k))};
end

