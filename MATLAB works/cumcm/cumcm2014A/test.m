%test ode
m=2.4e3;%��½������
r=1737.013e3;
perigeeHeight=15e3;
%
V_con =1673;
%
Vper=1692.7;
F_add =90.806415519263169;
%%
pN=500;
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------��½׼�����-----------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Tend=7000;
tLine = linspace(0,Tend,pN); 
FN=linspace(0,0,pN);%1500~7500
k=8;
THETA=pi/4*(1-cos(logspace(-3,log10(k*pi/2),pN)));
fn = FN.*sin(THETA); % Generate f(t)
ft = FN.*cos(THETA); % Generate g(t)
%
Tspan = linspace(0,Tend,pN);
IC = [r+perigeeHeight;0;0;Vper/(r+perigeeHeight);m]; 
%
[T,Y] = ode45(@(t,y) motion_ode(t,y,tLine,fn,tLine,ft),Tspan,IC); % Solve ODE
myplotfcn(T,Y,tLine,FN,THETA,fn,ft)
%
%subplot(423)���Կ���Զ�µ��λ��
%subplot(4,2,5:6)���Կ���Զ�µ���ٶ�
%subplot(4,2,8)���Կ�����Բ���
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%------------���µ���V_con������Բ���˶�------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Tend=4000;
tLine = linspace(0,Tend,pN); 
FN=linspace(0,0,pN);%1500~7500
k=8;
THETA=pi/4*(1-cos(logspace(-3,log10(k*pi/2),pN)));
fn = FN.*sin(THETA); % Generate f(t)
ft = FN.*cos(THETA); % Generate g(t)
%
Tspan = linspace(0,Tend,pN);
IC = [r+perigeeHeight;0;0;V_con/(r+perigeeHeight);m]; 
%
[T,Y] = ode45(@(t,y) motion_ode(t,y,tLine,fn,tLine,ft),Tspan,IC); % Solve ODE
myplotfcn(T,Y,tLine,FN,THETA,fn,ft)
%
%subplot(423)���Կ����˶��켣Ϊһ����Բ
%subplot(4,2,5:6)���Կ������ٶȺ㶨
%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%------------���µ���ͼ��Vper������Բ���˶�---------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%F_add =90.806;
Tend=4000;
tLine = linspace(0,Tend,pN); 
FN=linspace(F_add,F_add,pN);%1500~7500
k=8;
THETA=-pi/2;
fn = FN.*sin(THETA); % Generate f(t)
ft = FN.*cos(THETA); % Generate g(t)
%
Tspan = linspace(0,Tend,pN);
IC = [r+perigeeHeight;0;0;Vper/(r+perigeeHeight);m]; 
%
[T,Y] = ode45(@(t,y) motion_ode(t,y,tLine,fn,tLine,ft),Tspan,IC); % Solve ODE
myplotfcn(T,Y,tLine,FN,THETA,fn,ft)
%
%subplot(423)���Կ����ʼ��½���߶Ȳ��䣬���߶ȳ����½�
%subplot(4,2,5:6)���Կ�����½��û��ά�ֶ�õ������˶����ٶȳ�������
%subplot(4,2,7)���Կ���ԭ������½�������������½�
%              ��ͨ������F_add����ʹ��½��ά������Բ���˶�






