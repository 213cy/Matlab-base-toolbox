% ������(�壬sudoku_r_2��sudoku_aux_2���ʹ�ã���������)
function [outM,m]=sudoku_r_2(M)%,rightflag
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

[T,comflag]=sudoku_aux_2(M);%��д���ü���Ϳ�����д����ֵ
switch comflag
    case -1
        return
    case 1
        outM={T};
        return
    case 0
        %% �ҵ�ĳ�������������ٵ�С�񣬽���������ֵ�λ�ñ�Ǽ�¼��entry
        Ttmp=reshape(T,81,9);
        tmp=sum(Ttmp,2);
        tmp(tmp<10)=100;
        [~,ind]=min(tmp(:));
        w=find(Ttmp(ind,:));
        entry=ind+81*(w-1);
       
        %% ����������ڸ��е�λ�ã�������̽
        for k=entry
            T(entry)=0;
            T(k)=10; % ���������õ��µ�������Ŀ
            % tmp=reshape(T,9,9,9);
            % drawSudoku(sum(reshape(T,9,9,9),3))
            M=sudoku_r_2(T); %���еݹ�
            outM=[outM,M]; %��¼���
        end
end
m=n;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



http://www.ilovematlab.cn/thread-294985-1-1.html

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [T,comflag,found_num]=sudoku_aux_2(T)
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ��������д����
tmpM=T>0 &T<10;
found_num=zeros(1,10);
found_ind=1;
found_num(found_ind)=sum(tmpM(:));

tmpT=T==10;
AT{1}=any(any(tmpT));
AT{2}=any(any(tmpT,3),4);
AT{3}=any(any(tmpT,5),6);
AT{4}=any(any(tmpT,1),3);

elim=[2 3;1 3;1 2];
ctinflag=1;
foundcont=0;
while foundcont || ctinflag
    foundcont=0;
    ctinflag=0;
   
    for a=1:3
        for b=1:3
            for c=1:3
                for d=1:3
                    %%% �й���
                    if AT{1}(1,1,a,b,c,d)
                        [m,n]=find(T(:,:,a,b,c,d)==10);
                       
                        if length(m)==1
                            T(m,n,:,:,c,d)=0;
                            T(m,n,a,b,:,:)=0;
                            T(:,n,:,b,c,d)=0;
                            T(m,n,a,b,c,d)=c+3*d-3;
                           
                            AT{1}(1,1,a,b,c,d)=0;
                            AT{2}(m,n,1,1,c,d)=0;
                            AT{3}(m,n,a,b,1,1)=0;
                            AT{4}(1,n,1,b,c,d)=0;
                            foundcont=foundcont+1;
                        elseif isempty(m)
                            comflag=-1;
                            return
                        elseif all(n==n(1)) && ...
                                any(find(T(:,n(1),elim(a,:),b,c,d)==10,1))
                            T(:,n(1),elim(a,:),b,c,d)=0;
                            ctinflag=1;
                        end
                    end
                    %%% �й���
                    if AT{2}(a,b,1,1,c,d)
                        [m,n]=find(reshape(T(a,b,:,:,c,d),3,3)==10);
                        if length(m)==1
                            T(:,:,m,n,c,d)=0;
                            T(a,b,m,n,:,:)=0;
                            T(:,b,:,n,c,d)=0;
                            T(a,b,m,n,c,d)=c+3*d-3;
                           
                            AT{1}(1,1,m,n,c,d)=0;
                            AT{2}(a,b,1,1,c,d)=0;
                            AT{3}(a,b,m,n,1,1)=0;
                            AT{4}(1,b,1,n,c,d)=0;
                            foundcont=foundcont+1;
                        elseif isempty(m)
                            comflag=-1;
                            return
                        elseif all(n==n(1)) && ...
                                any(find(T(elim(a,:),b,:,n(1),c,d)==10,1))
                            T(elim(a,:),b,:,n(1),c,d)=0;
                            ctinflag=1;
                        end
                    end
                    %%% �����
                    if AT{3}(a,b,c,d,1,1)
                        [m,n]=find(reshape(T(a,b,c,d,:,:),3,3)==10);
                        if length(m)==1
                            T(:,:,c,d,m,n)=0;
                            T(a,b,:,:,m,n)=0;
                            T(:,b,:,d,m,n)=0;
                            T(a,b,c,d,m,n)=m+3*n-3;
                           
                            AT{1}(1,1,c,d,m,n)=0;
                            AT{2}(a,b,1,1,m,n)=0;
                            AT{3}(a,b,c,d,1,1)=0;
                            AT{4}(1,b,1,d,m,n)=0;
                            foundcont=foundcont+1;
                        elseif isempty(m)
                            comflag=-1;
                            return
                        end
                    end
                    %%% �����
                    if AT{4}(1,a,1,b,c,d)
                        [m,n]=find(T(:,a,:,b,c,d)==10);
                        if length(m)==1
                            T(m,a,:,:,c,d)=0;
                            T(m,a,n,b,:,:)=0;
                            T(:,:,n,b,c,d)=0;
                            T(m,a,n,b,c,d)=c+3*d-3;
                           
                            AT{1}(1,1,n,b,c,d)=0;
                            AT{2}(m,a,1,1,c,d)=0;
                            AT{3}(m,a,n,b,1,1)=0;
                            AT{4}(1,a,1,b,c,d)=0;
                            foundcont=foundcont+1;
                        elseif isempty(m)
                            comflag=-1;
                            return
                        elseif all(m==m(1)) && ...
                                any(find(T(m(1),a,:,elim(b,:),c,d)==10,1))
                            T(m(1),a,:,elim(b,:),c,d)=0;
                            ctinflag=1;
                        elseif all(n==n(1)) && ...
                                any(find(T(:,elim(a,:),n(1),b,c,d)==10,1))
                            T(:,elim(a,:),n(1),b,c,d)=0;
                            ctinflag=1;
                        end
                    end
                end
            end
        end
    end
   
    found_ind=found_ind+1;
    found_num(found_ind)=foundcont;
end
if sum(found_num)==81;
    comflag=1;
else
    comflag=0;
end