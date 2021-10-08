% ˫������λ�����
%%
clear,clc
c=15;
syms x y z l y_b_c real
%
y_b_c=2.6e3;
%y_b_c=1.3e3;
%%
p_light=[c,l,0];
p_mirror=[(y*y+z*z)/60,y,z];
p_mirror=[x,y,sqrt(60*x-y^2)];
p_plane=[c+25e3,y_b_c,0];
%%
v_in=p_mirror-p_light;
v_out=p_mirror-p_plane;
%ƽ�й��
%v_out=[-25015,  - 2600, 0];
v_nor=[-30,y,z];
v_nor=[-30,y,sqrt(60*x-y^2)];
%ve_nor=[-30,y,z]/sqrt(900+y*y+z*z);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ��������
%��ͨ�����p_light��������ߺ�ͨ�������p_plane�ķ������
%�Լ�����㷨�߹���ʱ,���·��̳���
simplify(det([v_nor;v_in;v_out])==0)
%�õ���������,����һ��z==0,��һ��Ϊ:
eqA1=24985*l + 2600*x + 39000 == l*x;
lexpA=solve(eqA1,l);
% L1 L2 ���Ա�֤x��[0 21.6]��������
L1=eval(subs(lexpA,x,0));
L2=eval(subs(lexpA,x,21.6));
%
eqA2=z==0
eqA2=y^2 == 60*x
%
% eqA=1499100*l + 2600*y^2 + 2600*z^2 - l*(y^2 + z^2) + 2340000
% ezmesh(solve(eqA,l))
%% ͶӰ�������(�����ͷ���ⶼ����������
eqB=simplify((v_in*v_nor.')*sqrt(v_out*v_out.')==(v_out*v_nor.')*sqrt(v_in*v_in.'))
%%
aaa=simplify(subs(eqB,x,solve(eqA1,x)))
ezplot(aaa,[-36 36])
yy=solve(aaa,y) %l��[0 30]֮ǰʱ��y��[0 36]֮��
xx=solve(eqA1,x)
% L1_z L2_z ���Ա�֤ z ��[0 36]��������
L_tmp=solve(60*xx-yy*yy==0)
L1_z=eval(L_tmp(2))
L_tmp=solve(60*xx-yy*yy==36*36)
L2_z=eval(L_tmp(2))
% y�ļ���λ��
eval(subs(yy,l,L2))
%%
bbb=simplify(subs(eqB,x,solve(eqA2,x)));
ezplot(bbb,[-36 36])
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %����eqB & eqA2
% % EQ1=subs(eqB,z,0);
% % ezplot(EQ1,[-36,36])
% % eval(solve(subs(EQ1,y,36),l))
% % F=(3600*(y - 2600)^2 + (y^2 - 1500900)^2)^(1/2)*(y^2/2 - l*y + 450) - (3600*(l - y)^2 + (y^2 - 900)^2)^(1/2)*(y^2/2 - 2600*y + 750450);
% % qqq=vpasolve(diff(F, y)/diff(F, l),F,[-1.5,0])
% % qqq.l,qqq.y
% %  eval(solve(subs(EQ1,l,-1.5540848632618440083870517938378-eps),y))
% % eval(solve(subs(EQ1,y,30),l))
% % eval(solve(subs(EQ1,y,-30),l))
% % eval(solve(subs(EQ1,y,-36),l))
% % %����eqB & eqA1 (�ڽӽ�z���һ��������)
% % EQ2=subs(eqB,l,lexpA);
% % EQ2=subs(eqB,z,lexpA);
% % ezplot(EQ2,[-36,36])
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% xy ƽ��ķ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
p_light=[c,l];
p_mirror=[y^2/60,y];
p_plane=[c+25e3,y_b_c];
%
%v_in=p_mirror-p_light;
v_out=p_mirror-p_plane;
%v_out=-p_plane;
v_nor=[30,-y];
%%
vin=simplify(v_out-2*v_nor*v_out.'/(v_nor*v_nor.')*v_nor);
ccc=simplify(y+(15-y^2/60)/vin(1)*vin(2));
ccc=(y^2 + 900)^2*(y - 2600)/( y^4 - 1498200*y^2 - 9360000*y + 1350810000);
ezplot(ccc==l,[-36 36])
%
assume(-36<y<36)
ly_max=eval(solve(diff(ccc)==0,'Real', true))
L2_xy=eval(subs(ccc,ly_max));
L1_xy=eval(subs(ccc,36))
%%
eval(solve(ccc==l,'real',true))


