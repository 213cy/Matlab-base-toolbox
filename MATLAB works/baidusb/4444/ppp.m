% �����뷽λ��Orientation Centroid BoundingBox
img=imread('a.jpg');

subplot(2,2,1);imshow(img);
title('ԭʼͼ��');
huidu=rgb2gray(img);   %%�Ҷȱ任
subplot(2,2,2);imshow(huidu);
title('�Ҷ�ͼ��');

level=graythresh(huidu);   %%�Զ������һ�����ʵ���ֵ
[height,width]=size(huidu);
erzhi=im2bw(huidu,level);     %%����֮ǰ�õ�����ֵ��ͼ����ж�ֵ��
subplot(2,2,3);imshow(erzhi);
title('��ֵ��ͼ��');

BW = imfill(erzhi,'holes');
subplot(2,2,4);imshow(BW);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

STATS = regionprops(BW,'BoundingBox','Centroid','Orientation');

rectangle('Position',STATS(1).BoundingBox,'EdgeColor','y')
hold on
plot(STATS(1).Centroid(1),STATS(1).Centroid(2),'*r')

%text(400,300,['\color{blue}',num2str(STATS(1).Orientation),'^o'])
text(360,320,['\color{magenta}',num2str(STATS(1).Orientation),'\circ'])