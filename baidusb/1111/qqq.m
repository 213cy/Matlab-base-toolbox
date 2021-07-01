% hough randon fanbeam
n=21;
a=imadd(eye(n),flip(eye(n),1));
a(ceil(n/2),:)=1;
%a(:,ceil(n/2))=1;
iptsetpref('ImshowAxesVisible','on')

subplot(341)
imshow(a)

%%
subplot(3,4,2:4)
[H,T,R] = hough(a,'RhoResolution',0.5,'Theta',-90:0.5:89.5);
imshow(imadjust(mat2gray(H)),'XData',T,'YData',R)%imadjust,�����͵�ӳ��
title('hough ͶӰƽ���y�Ὺʼ�����Ͻ�([0,0]��)��˳ʱ����ת180��')
%%
subplot(3,4,6:8)
theta = 0:180;
[R,xp] = radon(a,theta);
imshow(mat2gray(R),'Xdata',theta,'Ydata',xp)
title('randon ͶӰƽ���x�Ὺʼ��ͼ������˳ʱ����ת180��')
%%
subplot(3,4,10:12)
[F,Fpos,Fangles] = fanbeam(a,2*n);
imshow(mat2gray(F),'XData',Fangles,'YData',Fpos)
title(['fanbeam ͶӰƽ��ͺ͵��Դʼ�պ�ͼ�����ĶԳƣ�',...
    '����x�Ὺʼ��ͼ������˳ʱ����ת360��'])
%%
colormap(gca,'hot')