% �㷨ϵ�У�8ƪ����������ƪ ����˼�����ƪ ����˼��ڶ�ƪ �ݹ�˼��(matlab)
��ѭ������ ���������

��nλѡ�ֲμӱ���������Ҫ����n-1�죬ÿλѡ�ֶ�Ҫ������ÿһ��ѡ�ֱ���һ������ÿλѡ��ÿ�춼Ҫ����һ��������ݱ���Ҫ���ų�ѡ�ֵı����ճ̱�.

��n=2�����ɾ���
[1 2��
2 1]
��n=4���������ɾ���
[1 2 3 4��
2 1 4 3��
3 4 1 2��
4 3 2 1]
��n=6���������ɾ���
[1 2 3 4 5 6;
2 1 5 6 4 3;
3 4 1 5 6 2;
4 3 6 1 2 5;
5 6 2 3 1 4:
6 5 4 2 3 1]

 %%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%

����һ���ݹ�

function A=aaa

n=10;
% n=input('����һ��ż��:\n');
nk=nchoosek(1:n,2);
nk=nk';


A=zeros(n);
A(:,1)=1:n;
A(1:2:n,2)=2:2:n;
A(2:2:n,2)=1:2:n;

tp=cumsum([0,n-1:-1:2]')+1;
col2=tp(1:2:n);
al=nk;
al(:,col2)=[];
k=n/2;
for kk=3:n
    col=R(al,k);
    tmp=al(:,col);
    v=tmp([2,1],:);
    %     v=flipud(tmp);
    A(tmp(:),kk)=v(:);
    al(:,col)=[];
end

function col=R(al,k)

for t=find(al(1,:)==al(1))
   
    pal2=~any(al==al(1,t)|al==al(2,t));
   
    if sum(pal2)==0
        continue
    end
    if sum(pal2)==1
        if k==2
            col=pal2;
            col(t)=1;
            return
        else
            continue
        end
    end
   
    c=R(al(:,pal2),k-1);
   
    if isempty(c)
        continue
    else
        col=false(size(pal2));
        col(pal2)=c;
        col(t)=1;
        return
    end
   
end
col=[];

 

%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%

����������ʱ����ת����

clear
n=8;  
k=[2:2:n,3:2:n];  
m(k-1)=1:n-1;  
l=toeplitz([1,n-1:-1:2],1:n-1);  
p=k(l(m,:));  
p(logical(eye(n-1)))=1;        
A=[(1:n)',[2:n;p]]

��������

a=[1,2;2,1];  
n=8;  
for k=2.^(1:(log2(n)-1))  
    b=k+1:1:2*k;  
    c=b(a);  
    A=[a,c;c,a];  
    a=A;  
end  
A
 