% fsolve��fzero��������ӵ�����
Create options using the optimoptions function, or optimset for fminbnd, fminsearch, fzero, or lsqnonneg.

 

%{
��Ŀ�� ����A��֪, ��Գ��� P (P'=P)�����㣺
         A' * P+P * A = -I    (I ����λ��)
%}
%{
������n�׾�����Ԫ��n^2�������жԽ�����n��Ԫ�ء�
     �� tril(P,-1) ��(n^2-n)/2��Ԫ��,triu(P,0) ��(n^2+n)/2��Ԫ��
     1��P�ǶԳ��������P��Ԫ�أ���������(n^2-n)/2�������޹صķ���
     2�����ʽ A'*P+P*A ��P�ǶԳ���ʱҲ�ǶԳ���������һ���Գ���
        �����P��Ԫ�أ������������(n^2+n)/2�������޹صķ���
     ���ϣ����� P �� n^2 ��Ԫ������� n^2 ��Լ�������̶��н�
%}
n=4;
A=rand(n);
%%
F=@(P) [A'*P+P*A+eye(n);P-P'];
x0 =fsolve(F,rand(n))
options = optimoptions('fsolve',...
    'Display','off',...
    'Algorithm','levenberg-marquardt');%{'levenberg-marquardt',.005});
x1 =fsolve(F,rand(n),options)
%��֤1��A'*x+x*A
%��֤2��F(x)
%%
%A = sym(A);
p = sym('p',n);
assume(p==p');
digits(4);%���㾫�Ȳ�Ҫ̫�󣬲�Ȼ�㲻����
x_sym = solve(A'*p+p*A+eye(n));
x2 =reshape(structfun(@double,x_sym),n,n)
%%
%%%%%%%%%%%%%%%%%%%%%%%
% ����֪ P ����A
a=randn(4);P=a+a';
F=@(A) A'*P+P*A+eye(size(P));
x = fsolve(F,ones(size(P)));
F(x)