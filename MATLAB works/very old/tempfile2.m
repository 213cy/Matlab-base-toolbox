%%������
%%=========================================
%% ��kΪ����ʱ exp(Z*k)=exp(Z)^k
Z=rand+10i*rand
log(exp(Z))
ki=randi(10);
%
exp(Z*ki),
exp(real(Z*ki))*(cos(imag(Z*ki))+i*sin(imag(Z*ki)))
%
exp(Z)^ki,% ��kΪ������ʱ,�������Ҫ����log(exp(Z))
exp(real(log(exp(Z))*ki))*(cos(imag(log(exp(Z))*ki))+i*sin(imag(log(exp(Z))*ki)))
exp(log(exp(Z))*ki),exp(log(exp(Z)))^ki
%%=========================================
%% ��k������,��imag(Z)��������[-pi pi]ʱ exp(Z*k)!=exp(Z)^k
Zb=rand+i*(10*rand+pi),
Zc=log(exp(Zb))%!=Zb
Zb-Zc,2*pi 
k=rand;
exp(Zb*k),exp(Zb)^k,%exp(Z*k)!=exp(Z)^k
%% ====================================
%% ����ȡ�������㷨
%%
exp(Zb),exp(real(Zb))*(cos(imag(Zb))+i*sin(imag(Zb)))
re=real(exp(Zb));
im=imag(exp(Zb));
M=hypot(re,im);
log(exp(Zb)),log(M) + 1i*atan2(im,re)
Zb
% For complex inputs z = x + 1i*y, exp calculates the complex exponential
% exp(x).*(cos(y) + 1i*sin(y)).
% For complex or negative inputs, log computes the complex logarithm
% log(abs(z)) + 1i*atan2(y,x).
% ��Ϊatan2(y,x)��ֵ������[-pi pi]֮��
% ����Zb�ķ��ǲ����������ʱ,log(exp(Zb))����ķ��ǽ���Zb���2*n*pi
% ����ǶȲ�,��k������ʱ����exp(Z)^k,exp(Z*k)��ֵ��û��Ӱ��
% ������kΪС��ʱ,����exp(Zb)ȡlog�����Zb2��Zb��ͬ,
% Zb2,Zb���Ƕ���k����ǲ���һ��(����Ҳ���2*n*pi)
% ����exp(Z*k),exp(Z)^k��ͬ
exp(Zb*k),exp(Zb)^k



