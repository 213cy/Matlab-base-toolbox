% ��ȡ��ɫ���� ��ȡmatlab��ɫ����ɫ����
A = imread('syscolor', 'bmp');
image(A)
axis image 
[y,x] = ginput(1);
a=A(round(x),round(y),:);

['#',reshape(dec2hex(a)',1,[])]

 

imtool('syscolor.bmp')

c = uisetcolor;