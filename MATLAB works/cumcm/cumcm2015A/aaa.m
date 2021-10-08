% ���ű�ͨ��������ѧ������չʾ���ͶӰ����ԭ��
syms t N n real
% ����������
pole=[cos(n) 0 sin(n)]';
% ����������(��������ϵ��)
sun=[cos(N)*cos(t) cos(N)*sin(t) sin(N)]';
% ����������
north=[-sin(n) 0 cos(n)]';
% ����������
east=[0 1 0]';
% Ӱ��������
shadow=pole-sun/(sun'*pole);
% x:
xt=east'*shadow;
pretty(simplify(xt));
yt=north'*shadow;
pretty(simplify(yt));
%%
X(t) = -cos(N)*sin(t)/(cos(n)*cos(N)*cos(t)+sin(n)*sin(N));
pretty(X(t))
Y(t)=(sin(n)*cos(N)*cos(t)-cos(n)*sin(N))/(cos(n)*cos(N)*cos(t)+sin(n)*sin(N));
pretty(Y(t))
%%
dY_X(t)=simplify(diff(Y)/diff(X));

pretty(dY_X(t))

ddY_X(t)=simplify(diff(dY_X(t)));
pretty(ddY_X(t))

% �� ddY_X(t) ������Կ���:
% һ������£�ͶӰ���������������͹��
% ��ȡ���ʵ�n(������γ��)����N(̫��ֱ���γ��)ʱ���ں��ʵ�ʱ��
% ͶӰ���ߵ�͹���Իᷢ���ı�
