cx = 256; cy = 210;
%%
% ��ȡ ��win32 api ����GetDIBits ��ȡ��ͼ������
fileID = fopen('C:\Users\Administrator\Documents\vscode\Capturing war3\image_original.bin');
fileID = fopen('image_original.bin');
A = fread(fileID,Inf,'*uint8');
fclose(fileID);

b = reshape(A,3,cx,cy) ;
c = permute(b,[3,2,1]) ;
imshow(flip(c, 3 ) )

%%
fileID = fopen('C:\Users\Administrator\Documents\vscode\Capturing war3\image_arranged.bin');
fileID = fopen('image_arranged.bin');
A = fread(fileID,Inf,'*uint8');
fclose(fileID);

imshow(reshape(A,cy,cx,3));

%%
fileID = fopen('image_primitive.bin');
A = fread(fileID,Inf,'*uint8');
fclose(fileID);

b = reshape(A,3,cx,cy) ;
c = permute(b,[3,2,1]) ;
d = flip(c, 3 ) ;
imshow(flip(d, 1 ) )

%% ʹ��memmapfile��ȡ�ļ�
% ���Ƚ�׼���õ�ͼƬ I д�� war3.dat 
% fileID = fopen('war3.dat','w');
% fwrite(fileID, uint8(A(:)),'uint8');
% fclose(fileID);

m = memmapfile('war3.dat',  'Writable',true);
m.Format=  {'uint8',[cy, cx ,3],'img' };% 'uint8', 1, 'x'},
imshow(m.data.img)

%%
load war3_template.mat
imshow(IMG);