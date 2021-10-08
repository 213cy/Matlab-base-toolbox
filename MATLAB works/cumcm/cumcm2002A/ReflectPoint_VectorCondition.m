% ����������λ�����(�����Ӹ����� ����)
%%
clear,clc
c=15;
%
syms x y z l L real
%
L=2.6e3;
%
p_light=[c,l,0];
p_mirror=[(y*y+z*z)/60,y,z];
p_plane=[c+25e3,L,0];
%%
v_in=p_mirror-p_light;
v_out=p_mirror-p_plane;
%ƽ�й��
%v_out=[-25015,  - 2600, 0];
v_nor=[-30,y,z];
ve_nor=[-30,y,z]/sqrt(900+y*y+z*z);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% �������� (Ϊ���չ˼��������v_out(��һ������)���ڻ�)
%eqB_3=(v_in/sqrt(v_in*v_in.')+v_out/sqrt(v_out*v_out.') )==2*v_nor/sqrt(v_nor*v_nor.')*(v_out*v_nor')/sqrt(v_out*v_out.')/sqrt(v_nor*v_nor.');
%eqB_3=(v_in/sqrt(v_in*v_in.')+v_out/sqrt(v_out*v_out.') )==2*v_nor/(v_nor*v_nor.')*(v_out*v_nor')/sqrt(v_out*v_out.');
EQ=(v_in*sqrt(v_out*v_out.')/sqrt(v_in*v_in.')+v_out )==2*v_nor/(v_nor*v_nor.')*(v_out*v_nor');
%% 
cond=simplify(subs(EQ,z,0))
ezplot(cond(1),[-36 36])
hold on,
ezplot(cond(2),[-36 36])

