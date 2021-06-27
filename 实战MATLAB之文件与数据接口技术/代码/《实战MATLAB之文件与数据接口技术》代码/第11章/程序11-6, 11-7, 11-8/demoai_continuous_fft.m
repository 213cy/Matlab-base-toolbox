%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 11-8 demoai_continuous_fft.m
function condition = demoai_continuous_fft(data,plotHandle)
lengthofData =length(data);
nPower2 = 2 ^ nextpow2(lengthofData);
                                % ��С�����ݳ��ȵ���С��2����������
fs =8000;                     % ������
yDFT = fft(data,nPower2);  % FFT
freqRange = (0:nPower2-1) * (fs / nPower2);  % Ƶ�ʷ�Χ
gfreq = freqRange(1:floor(nPower2 / 2));
                                % ʵ�ź�FFT���й���Գ��ԣ���ֻȡһ��
h = yDFT(1:floor(nPower2 / 2));
abs_h = abs(h);
threshold = 10;               % Ƶ�ʼ�����ֵ
set(plotHandle, 'ydata',abs_h,'xdata',gfreq); % ����Ƶ��ͼ������
drawnow;                       % ����Ƶ��ͼ
val = max(abs_h(gfreq > 2500 & gfreq < 3000));
                                 % ��ȡ2500~3000Ƶ�׷�Χ�е����ֵ
if (val > threshold)
    condition = 1;
else
    condition = 0;
end
end
