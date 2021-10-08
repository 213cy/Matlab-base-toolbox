% no title
%% I�����Сֵ��0�����ֵ��1

mat2gray(I)  = mat2gray(I,[min(I(:)),max(I(:))])

imshow(I,[]) = imshow(mat2gray(I))

%% I�������ͨ��1%�ı���ӳ�䵽0��1֮��

imadjust(I) = imadjust(I,stretchlim(I))    
% maps the intensity values in grayscale image I to new values in J such that 1% of data is saturated at low and high intensities of I.