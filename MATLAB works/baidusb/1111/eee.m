% �ͺ���(ֱ��������)�ĸ���Ҷ�任
% �ͺ�����Ƶ�ʱ仯�����Ҫ���Ǹ���������Ƶ�ʷ������������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A=1;
D=sqrt(2)/2;

W=A*cos((1:200)*2*pi/50);
figure(gcf)
subplot(211)
h(1)=plot(W,'YDataSource','W');
ylim([-1.5 1.5])
subplot(212)
F=fftshift(abs(fft(W)));
max(F)
h(2)=plot(F,'YDataSource','F(101-14:101+14)');
ylim([-10 150])
%%
for A=logspace(0,-2,100)
    W=A*cos((1:200)*2*pi/50)+D-A*D;
    F=fftshift(abs(fft(W)));
    refreshdata(h,'caller')
   
    drawnow
    pause(0.04)
end
max(F)%���Կ������Ƶ�ʷ����ķ���Լ��Ϊ��ԭ����1.414��
      %����û�иı�
%%

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%

%ʵ����
%��������Ƶ�ʵĲ�ͬ ��λ����� ���Ǻ�������������
t=0:0.1:1000;%2*pi;
pc=rand;
fa=rand;
fb=1;
a=cos(fa*t+pc*pi);%+pi/2
b=cos(fb*t);
c=cos(fa*t);
%%
subspace(a',b')
acos(a*b'/norm(a)/norm(b))
%%
subspace(a',c')
min(pc*pi,pi-pc*pi)

 