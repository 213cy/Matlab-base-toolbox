% pcolor������shading flat
n = 30;
r = [0;1];
theta = pi*(-n:n)/n;
X = r*cos(theta);
Y = r*sin(theta);
%
c=1:2*n;

c(1:2:end)=1:n;
c(2:2:end)=n+1:n*2;%���Լ��ĻҶ�ֵ

C=ones(size(X));
C(1,1:2*n)=c;
%
colormap(gray(2*n))
pcolor(X,Y,C)
shading flat
axis equal tight