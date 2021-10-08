% Spectral estimation�׹���
b = fir1(1024, .5);%����һ���Ϻõ�Ƶ�����ߣ��н϶��������ķ�ֵ��
[d,p0] = lpc(b,7); %����Ƶ�����������źŷ����˲���

N=8192;
u = sqrt(p0)*randn(N,1);%���ɼ���
x = filter(1,d,u);         %��������

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
hold on
xf=abs(fft(x));           %ͨ�����ݼ���Ƶ��
xf=xf(1:N/2);
plot(linspace(1,512,N/2),pow2db(xf.^2/N)) %�����������ܶ�

[d1,p1] = aryule(x,7);     %�������ݵ�arģ��
[H1,w1]=freqz(sqrt(p1),d1);
plot(mag2db(abs(H1)),'r','linewidth',2)  %����ģ�������ݵ��������ܶ�
%���� plot(pow2db(abs(H1).^2),'r','linewidth',2)

%plot(mag2db(abs(H1)/2/pi),'g','linewidth',2)  %����ģ�������ݵĹ������ܶ�

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a1=impz(1,d1,8);           %�������ݵ�maģ��
fvtool(1,d1,a1,1,a1,d1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x2 = filter(a1,1,u);
s = spectrum.periodogram;       %�׹��ƶ���
%���� s = spectrum.periodogram('hamming');
figure
subplot(2,1,1)
psd(s,x)  %�������ܶ�
subplot(2,1,2)
psd(s,x2); %�������ܶ�