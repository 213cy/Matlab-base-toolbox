%% ģ��ķ����������ͼ��
clear,clc

L=10;
%L=5;L=20;% ���滭ͼ�Ĳ������ǰ�L=10���õ�,��L��ֵ��ʱ��Ҫ���µ���
N=1000000;
%N=100;
%%
% f=@(y,z) (y.*y+z.*z)/2/p;
p=36*36/21.6/2;
c=p/2;
%%

ind=1;
%Pxf=nan(N,1);
Py=nan(N/10,1);Pz=nan(N/10,1);Py0=nan(N/10,1);
for n=1:N
    %% ������
    y0=rand*2*L-L;
    x=c;y=y0;z=0;
    %% �������
    tmp_theta=2*pi*rand;
    vz=2*rand-1;
    vx=sqrt(1-vz^2)*cos(tmp_theta);vy=sqrt(1-vz^2)*sin(tmp_theta);
    %% ǰ������,(�ӹ��������ĵ�)
    k = (30*vx + (900*vx^2 - 60*vx*vy*y + 900*vy^2 - vz^2*y^2 + 900*vz^2)^(1/2) - vy*y)/(vy^2 + vz^2);
    %%
    %a=0;
    while x+k*vx<21.6
        %% �����ϵĵ�
        x=x+k*vx;y=y+k*vy;z=z+k*vz;
        %% �õ�ĵ�λ������
        nvx=-60/sqrt(3600+4*y*y+4*z*z);
        nvy=2*y/sqrt(3600+4*y*y+4*z*z);
        nvz=2*z/sqrt(3600+4*y*y+4*z*z);
        %% �����������
        tmp_a=2*(vx*nvx+vy*nvy+vz*nvz);
        vx=vx-tmp_a*nvx;
        vy=vy-tmp_a*nvy;
        vz=vz-tmp_a*nvz;
        %%
        k=(30*vx + (900*vx^2 - 60*vx*vy*y - 60*vx*vz*z - vy^2*z^2 + 60*x*vy^2 + 2*vy*vz*y*z - vz^2*y^2 + 60*x*vz^2)^(1/2) - vy*y - vz*z)/(vy^2 + vz^2);
        %a=a+1;
    end
    %Pxf(n)=a;
    m=(25000+c-x)/vx;
    y=abs(y+m*vy);z=abs(z+m*vz);
    if y<32000 && z<16000
        Py(ind) = y;
        Pz(ind) = z;
        Py0(ind) = abs(y0);
        ind=ind+1;
    end
end
Py(ind:end)=[];Pz(ind:end)=[];Py0(ind:end)=[];
%%
% ����
edges{1}=linspace(0,16000,161);
edges{2}=linspace(0,32000,321);
m=hist3([Pz Py],'Edges',edges);
Pic=[m(end:-1:1,end:-1:1),m(end:-1:1,:);m(:,end:-1:1),m];
subplot(221)
imshow(log(Pic),[])
title('��������+�����+������+������� 32m')
subplot(222)
imshow(Pic,[0 32])
title('��������+����� 32m')
%%
% 
edges{1}=linspace(0,8000,161);
edges{2}=linspace(0,16000,321);
m=hist3([Pz Py],'Edges',edges);
Pic=[m(end:-1:1,end:-1:1),m(end:-1:1,:);m(:,end:-1:1),m];
subplot(223)
imshow(Pic,[2,16])
title('�����+������ 16m')
%%
edges{1}=linspace(0,400,81);
edges{2}=linspace(0,1600,321);
m=hist3([Pz Py],'Edges',edges);
Pic=[m(end:-1:1,end:-1:1),m(end:-1:1,:);m(:,end:-1:1),m];
subplot(426)
imshow(Pic,[0,128])
title('������� 1.6m')

%%
edges{1}=linspace(0,75,76);
edges{2}=linspace(0,300,301);
m=hist3([Pz Py],'Edges',edges);
pattern=[m(end:-1:1,end:-1:1),m(end:-1:1,:);m(:,end:-1:1),m];
subplot(428)
imshow(pattern,[0 max(pattern(:))/2])
title('������� 0.3m')
%%
return
plot(m(1,:))






