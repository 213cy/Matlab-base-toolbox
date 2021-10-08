% ������(����ǳ������)
function [T,cluecont,contflag]=solvesudoku_aux(T)
%% �����ü��裬������
% ���������֣�
% 1�������룬��������shuju.txt�е�����
% 2��9��9��������0:9���ɵ���������
% 3��3��3��3��3��3��3 ����0:10���ɵ���������
if nargin ==0 %���û������
    %% ��������
    T=dlmread('shuju.txt');
end
if size(T,1)==9 %���������9��9�ľ���
    %% ������������
    A=T;
    [r,c,v]=find(A);%�У��У�����(r,c,v)
    % drawSudoku([r,c,v])
    % S = sudokuEngine(T); % Solves the puzzle pictured at the start
    % drawSudoku(S)
    cluecont=length(r);
    [d1,d2]=ind2sub([3,3],r);
    [d3,d4]=ind2sub([3,3],c);
    [d5,d6]=ind2sub([3,3],v);
    %% ��ʼ����Ǿ���T
    T=10*ones(3,3,3,3,3,3);
    for k=1:cluecont
        T(:,:,d3(k),d4(k),d5(k),d6(k))=0;
        T(d1(k),d2(k),:,:,d5(k),d6(k))=0;
        T(d1(k),d2(k),d3(k),d4(k),:,:)=0;
        T(:,d2(k),:,d4(k),d5(k),d6(k))=0;
        T(d1(k),d2(k),d3(k),d4(k),d5(k),d6(k))=v(k);
    end
    %% ����ʼ�����Ƿ���ȷ
    rslt=sum(reshape(T,9,9,9),3);
    %drawSudoku(rslt)
    rslt(rslt>9)=0;
    if ~isequal(rslt,A)
        error('conflict value')
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ��������д����
contflag=zeros(1,10);
fn=1;
foundcont=1;
while foundcont~=0
    foundcont=0;
    for a=1:3
        for b=1:3
            for c=1:3
                for d=1:3
                    %%% �й���
                    [m,n]=find(T(:,:,a,b,c,d)==10);
                    if length(m)==1
                        T(m,n,:,:,c,d)=0;
                        T(m,n,a,b,:,:)=0;
                        T(:,n,:,b,c,d)=0;
                        T(m,n,a,b,c,d)=c+3*d-3;
                        foundcont=foundcont+1;
                    end
                    %%% �й���
                    [m,n]=find(reshape(T(a,b,:,:,c,d),3,3)==10);
                    if length(m)==1
                        T(:,:,m,n,c,d)=0;
                        T(a,b,m,n,:,:)=0;
                        T(:,b,:,n,c,d)=0;
                        T(a,b,m,n,c,d)=c+3*d-3;
                        foundcont=foundcont+1;
                    end
                    %%% �����
                    [m,n]=find(reshape(T(a,b,c,d,:,:),3,3)==10);
                    if length(m)==1
                        T(:,:,c,d,m,n)=0;
                        T(a,b,:,:,m,n)=0;
                        T(:,b,:,d,m,n)=0;
                        T(a,b,c,d,m,n)=m+3*n-3;
                        foundcont=foundcont+1;
                    end
                    %%% �����
                    [m,n]=find(T(:,a,:,b,c,d)==10);
                    if length(m)==1
                        T(m,a,:,:,c,d)=0;
                        T(m,a,n,b,:,:)=0;
                        T(:,:,n,b,c,d)=0;
                        T(m,a,n,b,c,d)=c+3*d-3;
                        foundcont=foundcont+1;
                    end
                end
            end
        end
    end
    contflag(fn)=foundcont;
    fn=fn+1;
   
end