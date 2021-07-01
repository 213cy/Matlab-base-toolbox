% ������ת���ּ��㷽�� CORDIC
% use the CORDIC approximation method to approximate the sine wave
% CORDIC = COordinate Rotation DIgital Computer
% = ������ת���ּ��㷽��
%%%%%%%%%%%%%%%%%%%%%%
% ��doc�в��� Calculate Fixed-Point Sine and Cosine
% ���߷��ʣ�
% http://www.mathworks.cn/cn/help/fixedpoint/ug/
% implement-a-fixed-point-algorithm.html?
% searchHighlight=Fixed-Point+Sine+and+Cosine+Calculation
%%%%%%%%%%%%%%%%%%%%
N=10;%��������
%% ����׼����һЩ���޸��ĳ�����
inpLUT=atan(2.^-(0:N-1));
An=prod(sqrt(1+2.^-(2*(0:N-1))));
%% ��ʼ�� ��ʼ����
theta=(0:.05:pi/2)';
z=theta;
x=1./An*ones(size(z));
y=zeros(size(z));
%%
% xtmp = x;
% ytmp = y;

for idx = 1:N
    xtmp = bitsra(x, idx-1);    %Fixed-Point toolbox function
    ytmp = bitsra(y, idx-1);    %Fixed-Point toolbox function
   
% %     % û�ж��㹤�����������д���
% %     xtmp = bitshift(round(1e5*x), 1-idx)*1e-5;
% %     ytmp = bitshift(round(1e5*y), 1-idx)*1e-5;
% %     % �����������д���
% %     xtmp = x*2^(1-idx);
% %     ytmp = y*2^(1-idx);
   
    x = x -sign(z+eps).*ytmp;
    y = y +sign(z+eps).*xtmp;
    z = z -sign(z+eps).*inpLUT(idx);
end
%% ��ͼ
[y2, x2] = cordicsincos(theta,N);%Fixed-Point toolbox function
yy=sin(theta);
xx=cos(theta);
subplot(221)
plot(theta,xx,'k',theta,x,'sb',theta,x2,'*c')
subplot(222)
plot(theta,yy,'k',theta,y,'sr',theta,y2,'*m')
subplot(223)
plot(theta,xx-x,'b',theta,xx-x2,'c')
subplot(224)
plot(theta,yy-y,'r',theta,yy-y2,'m')