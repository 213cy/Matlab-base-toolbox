% graphshortestpath
graph theory        ͼ��

directed graph    ����ͼ

strongly or weakly connected  ǿ��ͨ����ͨ
omorphism ͬ��
directed acyclic graph �����޻�ͼ dag �����޻�ͼ

undirected graph  ����ͼ

weighted graph    ��Ȩͼ

shortest path   ���·��

Minimum spanning tree ��С������

connectivity (connected graph) ��ͨ�ԣ�ͼ��



ͼ���ܽ�(��ǿ��)

http://wenku.baidu.com/link?url=0dPOAppCV3R6pWZFBiKlwKZLDGGTC-eTxYKNgfdpW9N0IGvPhZE2V9KOnpM_S-C59x-RC6F8vtvy2tEXRxYokpJ3tsuXs9OpQw7Vr3qjice





%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 

%% graphshortestpath
% doc graphshortestpath

%% Finding the Shortest Path in a Directed Graph
% DESCRIPTIVE TEXT
a=randi(9,9)-1;
b=tril(triu(a,1),3);

bgh=biograph(b,'a':'i','ShowWeights','on');
h = view(bgh);
%isequal(bgh,h)

[dist,path,pred] = graphshortestpath(sparse(b),1,9);

set(h.Nodes(path),'Color',[1 0.4 0.4])
edges = getedgesbynodeid(h,get(h.Nodes(path),'ID'));
set(edges,'LineColor',[1 0 0])
set(edges,'LineWidth',1.5)
%% Finding the Shortest Path in an Undirected Graph
% DESCRIPTIVE TEXT
a=randi(9,9);
b=tril(triu(a,-4),-1);%����ͼ�Զ�����������
b(b>7)=0;

h = view(biograph(b,'1':'9','ShowArrows','off','ShowWeights','on'));

[dist,path,pred] = graphshortestpath(sparse(b),1,9,'directed',false);
%This results in the upper triangle of the sparse matrix being ignored
%doc graphshortestpath

set(h.Nodes(path),'Color',[1 0.4 0.4])
fowEdges = getedgesbynodeid(h,get(h.Nodes(path),'ID'));
revEdges = getedgesbynodeid(h,get(h.Nodes(fliplr(path)),'ID'));
edges = [fowEdges;revEdges];
set(edges,'LineColor',[1 0 0])
set(edges,'LineWidth',1.5)

 