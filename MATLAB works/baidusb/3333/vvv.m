% Parseval's theorem in DFT
% �����������n����������matlab�и�����dftmxt���ֲ�����ɹ�޶�Ҫ����n



N=randi(8)
W=dftmtx(N);
%isequal(abs(W*W'),N*eye(N))
%��������ת��ʱ����Ԫ��Ҫȡ����
all(all(abs(W*W'-N*eye(N))<eps(N)))

%�������д�W�����ɽǶȣ�������ΪʲôW��W���ĶԽ���Ԫ���Ǹ�ʵ��N

%W*W'�е�ÿһ��Ԫ����ԭ����W��һ�У��У��������Լ������������ڻ�����أ�

%���ڸ�������ʵ�����������Һ������鲿�����ڸ������Һ�����V=cos(x)-i*sin(x),��x�Ǹ���������

%�����Һ��������������������ڻ�����������Ϊ0��

%��ʵ������Ϊ���Һ����ҵ�ƽ���ͣ���1����N��Ԫ�أ��ٳ���N��

 

%�����Ƴ���
%W���Գ���sqrt(N)���������
%�����Ϊʲô��ɢ�źŵ������߶�����Ҫ��N
WO=W/sqrt(N);
abs(sum(WO*WO'))

[V,~]=eig(W);
plot(abs(V));



 

aa=rand(128,1);
subplot(221)
plot(aa)
subplot(222)
plot(ifft(fft(aa)))
subplot(223)
plot(flipud(real(fft(fft(aa)))))
%����Ҷ�任�Գ��Եı��֣�����һ�����ܵ������
subplot(224)
mtx=dftmtx(128);
imtx=mtx';
plot(real(imtx*fft(aa)))
%%%%%%%%
mt=circshift(flipud(mtx),1);
isequal(mt,imtx)
all(all(abs(mt-imtx)<0.001))
all(all(abs(real(mt-imtx))<0.001))
all(all(abs(imag(mt-imtx))<0.001))