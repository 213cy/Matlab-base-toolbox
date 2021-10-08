% ָ������ ����ͼ���ƥ�� TSP ��С������
n=5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=randi([1,9],n);
a=A(:);
eq1=kron(eye(n),ones(1,n));
eq2=kron(ones(1,n),eye(n));
X=bintprog(a,[],[],[eq1;eq2],ones(2*n,1));%��ʱ�ĺ���
x=reshape(X,n,n)
sum(A(x==1));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% assignDetectionsToTracks
% ����ͱ�ǵ��ƥ��
[assignment, unassignedTracks, unassignedDetections] = assignDetectionsToTracks(A, 100);
x2=zeros(n);
x2(double(assignment)*[1;n]-n)=1

%%%%%%%%%%%%%%%%%%%%%%%%%%%

�������㷨 Hungarian algorithm

http://csclab.murraystate.edu/bob.pilgrim/445/munkres.html

http://www.docin.com/p-471669250.html

%%%%%%%%%%%%%%%%%%%%%%%%%%%

�������бߣ�ŷ����·

�������ж��㣬���ܶ�Ȧ

TSP

open travel