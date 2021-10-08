function R=light2plane(L,v)
% ������λ�úͷ��򣬸��������ڿ������ϵ����
%%
% f=@(y,z) (y.*y+z.*z)/4/c;
%%
x=15;y=L;z=0;
vx=v(1)-x;vy=v(2)-y;vz=v(3);
%%
k = (30*vx + (900*vx^2 - 60*vx*vy*y + 900*vy^2 - vz^2*y^2 + 900*vz^2)^(1/2) - vy*y)/(vy^2 + vz^2);
%%
x=x+k*vx;y=y+k*vy;z=z+k*vz;
%% �õ�ĵ�λ������
tmp=sqrt(3600+4*y*y+4*z*z);
nvx=60/tmp;
nvy=-2*y/tmp;
nvz=-2*z/tmp;

%% �����������
tmp_a=2*(vx*nvx+vy*nvy+vz*nvz);
vx=vx-tmp_a*nvx;
vy=vy-tmp_a*nvy;
vz=vz-tmp_a*nvz;
%%
m=(25015-x)/vx;
y=y+m*vy;z=z+m*vz;
R=[y,z];