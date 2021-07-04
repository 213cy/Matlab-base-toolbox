% �ж��߶��Ƿ��������н���1
function aaa
%% plot
close all
hold on
l=rand(2);%ֱ���ϵ�����
plot(l(:,1),l(:,2),'-*r')
%%%%%%%%%%%%%%%%%%
s=rand(4,2);
TRI = delaunay(s);
tmp=[intersect(TRI(1,:),TRI(2,:));setxor(TRI(1,:),TRI(2,:))];
% K = convhull(xs,ys);
s=s(tmp(:),:);  %����ζ���
plot(s([1:end,1],1),s([1:end,1],2))


if lineandpolygon(l,s)
    disp('ֱ���н���1')
end
   
%%
ss=s([1:end,1],:);
for n=1:length(s)
    if twosegment2(l,ss(n:n+1,:))
        disp('�߶��н���2')
        break
    end
end
%%
%%%%%%%%%%%%%%%%%%%%%%
function isthrough=lineandpolygon(l,s) %�ж�����ȷ����ֱ���Ƿ�ͨ�������
zp=l(1,:);
lv=l(2,:)-zp;
nv=[lv(2),-lv(1)];
sv=bsxfun(@minus,s,zp);
d=sv*nv'>0;
isthrough=xor(any(d),all(d));

%%
function isintersect=twosegment(l,s)%�ж������߶��Ƿ��ཻ
s1=s(1,:);
s2=s(2,:);
l1=l(1,:);
l2=l(2,:);
ds=s2-s1;
dl=l2-l1;
dsl=s1-l1;
C=dsl/[dl;-ds];
isintersect=all(C<1)&&all(C>0);
%%
function isintersect = twosegment2(l,s)%�ж������߶��Ƿ��ཻ
twoc=(l-s)';
a=[1,-1];
b=[0 1;-1 0];
f1=prod(a*l*b*twoc)<0;
f2=prod(a*s*b*twoc)<0;
isintersect=all([f1,f2]);