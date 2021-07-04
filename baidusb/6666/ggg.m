% ������ Construct quantizer object to quantize data
a=5.4;
b=4.5; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ����quantizerֱ�Ӻ��Ӳ�����С������
q=quantizer([b a]) % ��b=4λ����������ʾ��������С��λΪa=5λ
% �� �����һλ(���λ)�Ƿ���λ���ڶ�λ��2^-3λ��
% ����λ��2^-5λ
eps(q)==2^-floor(a)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[c,d]=range(q); 
(d-c)/eps(q)==2^floor(b)-1
q.roundmode
quantize(q,[c-rand,c,c+eps(q)/2,c+eps(q)])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
num2bin(quantizer([5,0]),-16:16) % �з����� -16:15 ��ԭ��
% ���룬�޷������Ĳ���: bitcmp