% Ϊʲô��������ţ�ٵ������� 99.jpg
k=8;
n=eye(k);
m=ones(1,k);
%%
A=kron(m,n);
spy(A)
b=ones(k,1);
%%
Aeq1=kron(n,m);
spy(Aeq1)
Aeq2=kron(1:k,n);
spy(Aeq2)
b2=b;
b2(1)=3;
%op = optimset('bintprog')
%options = optimset(op,'MaxRLPIter',999999)

%x = bintprog([],[],[],[A;Aeq2-Aeq1],[b;b],[],options);
x = bintprog([],[],[],[A;Aeq2-Aeq1],[b;b2]);
%%
r=ones(1,10);
r(2:9)=Aeq2*x
%%
%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%

 

% ��������һ���㷨�������㷨�ܼ򵥣���Ϊʲôѭ������������ȷ�𰸣�������ѭ���𵴣�

x=[0:9]';
for k=1:5
    for i=1:10
        x(i,2)=sum(x(:)==(i-1));
    end
end

x(:,2)