% ���������⣨Traveling Saleman Problem��TSP��
Ѱ�Ҹ����ļ�Ȩͼ�ж�������·��

���������⣨Traveling Saleman Problem��TSP��

doc travel

open travel

travel



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  �ű�һ %%%%%%%%%%%%%%
%��ʼ��tsp����Ĳ���
%���ɳ���λ�� ������о���
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%temm=get(RandStream.getGlobalStream,'state');
%a=RandStream.getGlobalStream.State;
%set(RandStream.getGlobalStream,'State',a);
reset(RandStream.getGlobalStream)
%rng('default');
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('usborder.mat','x','y','xx','yy');

cities = 40;

locations = zeros(cities,2);
n = 1;
while (n <= cities)
    xp = rand*1.5;
    yp = rand;
    if inpolygon(xp,yp,xx,yy) % test if inside the border
        locations(n,1) = xp;
        locations(n,2) = yp;
        n = n+1;
    end
end
plot(x,y,'Color','red'); % draw the outside border
hold on
% Add the stops to the map
plot(locations(:,1),locations(:,2),'bo');
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% �������Ż��õ��Ĳ���
% cities
% locations

dist4prog=pdist(locations);%����������
dist4genet=squareform(dist4prog);%�������

idxs4prog = nchoosek(1:cities,2);%������ʼ����������len4prog�� 2�У�
len4prog = length(dist4prog);%�����������ĳ���
%%
tem1=get(RandStream.getGlobalStream,'state');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% �ű��� %%%%%%%%%%%%%%%%%%%%%%
% ʹ���Ŵ��㷨������ȫ���Ż�       %
% ---------------------------------%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%tem1 defined earlier
set(RandStream.getGlobalStream,'State',tem1)
%dist4genet defined earlier
FitnessFcn = @(x) traveling_salesman_fitness(x,dist4genet);
%locations defined earlier
my_plot = @(options,state,flag) traveling_salesman_plot(options, ...
    state,flag,locations);
%%
options = gaoptimset('PopulationType', 'custom',...
    'CreationFcn',@create_permutations, ...
    'CrossoverFcn',@crossover_permutation, ...
    'MutationFcn',@mutate_permutation, ...
    'PlotFcn', my_plot, ...
    'Generations',500,'PopulationSize',60, ...
    'StallGenLimit',200,'Vectorized','on');%,...
% 'Display','iter');
%%
%cities defined earlier
[x,fval,reason,output] = ...
    ga(FitnessFcn,cities,[],[],[],[],[],[],[],options);
x{1},fval

 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% �ű��� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ����ʹ��01�滮��ͨ���ֲ��Ż���ȫ�����Ž�     %
% ---------------------------------------------%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%tem1 defined earlier
set(RandStream.getGlobalStream,'State',tem1)
%%
Aeq = [spones(1:len4prog);spalloc(cities,len4prog,cities*(cities-1))]; % allocate a sparse matrix
for ii = 1:cities
    whichIdxs = (idxs4prog == ii); % find the trips that include stop ii
    whichIdxs = sparse(sum(whichIdxs,2)); % include trips where ii is at either end
    Aeq(ii+1,:) = whichIdxs'; % include in the constraint matrix
end
beq = [cities; 2*ones(cities,1)];

intcon = 1:len4prog;
lb = zeros(len4prog,1);
ub = ones(len4prog,1);

opts = optimoptions('intlinprog','Display','off');
[xopt,costopt,exitflag,output] = ...
    intlinprog(dist4prog,intcon,[],[],Aeq,beq,lb,ub,opts);
%%
hold on
%segments = find(xopt); % Get indices of lines on optimal path
lh = zeros(cities,1); % Use to store handles to lines on plot
lh = updateSalesmanPlot(lh,xopt,idxs4prog,locations(:,1),locations(:,2));
%%
tours = detectSubtours(xopt,idxs4prog);
numtours = length(tours); % number of subtours
fprintf('# of subtours: %d\n',numtours);

A = spalloc(0,len4prog,0); % Allocate a sparse linear inequality constraint matrix
b = [];
while numtours > 1 % repeat until there is just one subtour
    % Add the subtour constraints
    b = [b;zeros(numtours,1)]; % allocate b
    A = [A;spalloc(numtours,len4prog,cities)]; % a guess at how many nonzeros to allocate
    for ii = 1:numtours
        rowIdx = size(A,1)+1; % Counter for indexing
        subTourIdx = tours{ii}; % Extract the current subtour
        %         The next lines find all of the variables associated with the
        %         particular subtour, then add an inequality constraint to prohibit
        %         that subtour and all subtours that use those stops.
        variations = nchoosek(1:length(subTourIdx),2);
        for jj = 1:length(variations)
            whichVar = (sum(idxs4prog==subTourIdx(variations(jj,1)),2)) & ...
                (sum(idxs4prog==subTourIdx(variations(jj,2)),2));
            A(rowIdx,whichVar) = 1;
        end
        b(rowIdx) = length(subTourIdx)-1; % One less trip than subtour stops
    end
   
    % Try to optimize again
    [xopt,costopt,exitflag,output] = ...
        intlinprog(dist4prog,intcon,A,b,Aeq,beq,lb,ub,opts);
   
    % Visualize result
    lh = updateSalesmanPlot(lh,xopt,idxs4prog,locations(:,1),locations(:,2));
   
    % How many subtours this time?
    tours = detectSubtours(xopt,idxs4prog);
    numtours = length(tours); % number of subtours
    fprintf('# of subtours: %d\n',numtours);
end

tours{1},costopt