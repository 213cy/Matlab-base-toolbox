% lyapunov function 01.jpg 02.jpg

clear
[x,y]=meshgrid(-10:.1:10);
z=(8*x.*x+4*x.*y+y.*y)/2;
contour(x,y,z,logspace(log10(.2),3,11))
colormap cool
% )];

axis([-12,12,-12,12])
 hold on
 x0y=[-10*ones(1,21);-10:10]';
 x0=[flipud(x0y);fliplr(x0y)];
 plot(x0(:,1),x0(:,2),'r.','LineWidth',5)
 
% set(gca,'colororder',cool(10));
for xx=x0'
[t,xt]=ode45(myode,[0,20],xx);%20 ���Ը��󣬵�xʼ������[0;0]
                                              %�������۳�ֵxxȡʲô��
                                              %��˵�����x=[0;0],�Ƿ��̵��ȶ��⡣
plot(xt(:,1),xt(:,2),'b')
pause(.5)
end

figure
% mesh(x,y,z)

 

syms xs ys
V=(8*xs.*xs+4*xs.*ys+ys.*ys)/2;
ezmesh(V)                                  %���Թ۲쵽V�����Ƕ����ġ�
hold on
f1=ys;
f2=-2*xs-3*ys;
dVdt=simplify(diff(V,xs)*f1+diff(V,ys)*f2) %���Կ���dVdtҲ�Ƕ�����
                                                           %������ȶ�
ezmesh(dVdt)

ezmesh('0*x+0*y')  
colormap cool