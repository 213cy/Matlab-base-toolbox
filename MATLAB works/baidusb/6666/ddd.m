% �����ط������
% 
% ָ�� ���� ˮƽ
% 
% ��ƫ��ƽ����(�ܱ��)=����ƽ����(���ƽ����)+���ƽ����(ЧӦƽ����)

a=randi([2,10],1,randi([2,6]));
b=arrayfun(@(x) randi(20,x,1),a,'Un', false);

alll=vertcat(b{:});
r=var(alll,1);
R=r*sum(a)

se=cellfun(@(x) var(x,1),b);
sa=(cellfun(@(x) mean(x),b)-mean(alll)).^2;
R0=(se+sa)*a'

 

k=cellfun(@(x) x(:),b,'un',false);
vertcat(k{:});