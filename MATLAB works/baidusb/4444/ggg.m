% ����Ĺ�ģ��ͬ�������������Ҳ��ͬ
clc
n=1000;
m=400;
a=rand(n,m);
b=rand(n,1);
tic
a-b*ones(1,m);
toc
tic
a-b(:,ones(1,m));
toc
tic
bsxfun(@minus,a,b);
toc
tic
a-kron(b,ones(1,m));
toc
% tic
% [eye(n),-b]*[a;ones(1,m)];
% toc