% problem4.m
%%%%%%%%%%%%%%
%������ģ��
%%%%%%%%%%%%%%
Y=[redscore1g,redscore2g];
n=size(Y,1);
redtarget=[mainredwinetarget, mainredwinefrag];
X=[ones(n,1),redgrape',redtarget,];

[b,bint,r,rint,stats] = regress(sum(Y,2),X);
rcoplot(r,rint) 
stats
% C=X\Y;
% 
% e=Y-X*C;
% E=Y-kron(ones(n,1),mean(Y));
% 
% figure
% boxplot([E,e],['��һ��  ';'�ڶ���  ';'��ϵ�һ��';'��ϵڶ���'])
% 
% 
% var(e)
% var(Y)
% var(Y)./var(e)
%-------------------------------------------
Y=[whitescore1g,whitescore2g];
n=size(Y,1);
whitetarget=[mainwhitewinetarget, mainwhitewinefrag];
X=[whitegrape',whitetarget,ones(n,1)];

[b,bint,r,rint,stats] = regress(sum(Y,2),X);
figure
rcoplot(r,rint) 
stats


% C=X\Y;
% 
% e=Y-X*C;
% E=Y-kron(ones(n,1),mean(Y));
% 
% figure;
% boxplot([E,e],['��һ��  ';'�ڶ���  ';'��ϵ�һ��';'��ϵڶ���'])
% var(e)
% var(Y)
% var(Y)./var(e)