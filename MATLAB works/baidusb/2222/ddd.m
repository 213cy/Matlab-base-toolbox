% ������(�����ݹ������)
http://www.mathworks.cn/company/newsletters/articles/solving-sudoku-with-matlab.html

function [outM,m]=sudoku_r(M)%,rightflag
% �ݹ������ (��Ҫ����solvesudoku_aux)

%% ��n��¼�������ݹ���õĴ���
persistent n
%dbstack
if size(M,1)==9
    n=1;
else
    n=n+1;
end

%%-----------------------------------------------
%%
outM={};%��ʼ��(Ĭ��)���

T=solvesudoku_aux(M);%��д���ü���Ϳ�����д����ֵ

%% �ҵ�ĳ�������������ٵ�С�񣬽���������ֵ�λ�ñ�Ǽ�¼��entry
Ttmp=reshape(T,81,9);
tmp=sum(Ttmp,2);
tmp(tmp<10)=100;
[val,ind]=min(tmp(:));
if val==100 % ����޷�������д����
    if  sum(T(:))==405;%9*sum(1:9) %������еĿո񶼱�����
        outM={T};
    end
    return
end

w=find(Ttmp(ind,:));
entry=ind+81*(w-1);

%% ����������ڸ��е�λ�ã�������̽
for k=entry
    T(entry)=0;
    T(k)=10; % ���������õ��µ�������Ŀ
    % tmp=reshape(T,9,9,9);
    % drawSudoku(sum(reshape(T,9,9,9),3))
    M=sudoku_r(T); %���еݹ�
    outM=[outM,M]; %��¼���
end

m=n;
%%%%%%%%%%%%%%%%%%%%%%%%%%%