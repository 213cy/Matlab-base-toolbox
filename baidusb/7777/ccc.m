% ���Ǵ���̳http://www.ilovematlab.cn/thread-101925-1-45.html���ص�m�ļ� ��
���Ǵ���̳http://www.ilovematlab.cn/thread-101925-1-45.html���ص�m�ļ� ��

% ct1
clear all,close all, clc;
    % ���峣��
    FL = 80;                % ֡��
    WL = 240;               % ����
    P = 10;                 % Ԥ��ϵ������
    [s,fs] = wavread('sunday_2.wav');             % ��������s
s = s/max(s); %��һ��
    L = length(s);          % ������������
    FN = floor(L/FL)-2;     % ����֡��
    
% Ԥ����ؽ��˲���
    exc = zeros(L,1);       % �����źţ�Ԥ����
    zi_pre = zeros(P,1);    % Ԥ���˲�����״̬
    s_rec = zeros(L,1);     % �ؽ�����
    zi_rec = zeros(P,1);
    
% �ϳ��˲���
    exc_syn = zeros(L,1);   % �ϳɵļ����źţ����崮��
    s_syn = zeros(L,1);     % �ϳ�����
last_syn = 0;   %�洢��һ�����������ε����һ��������±�
zi_syn = zeros(P,1);   % �ϳ��˲�����״̬
    
% ����������˲���
    exc_syn_t = zeros(L,1);   % �ϳɵļ����źţ����崮��
    s_syn_t = zeros(L,1);     % �ϳ�����
last_syn_t = 0;   %�洢��һ�����������ε����һ��������±�
zi_syn_t = zeros(P,1);   % �ϳ��˲�����״̬
    
% ���ٲ�����˲����������ٶȼ���һ����
v=.5;
    exc_syn_v = zeros(v\L,1);   % �ϳɵļ����źţ����崮��
    s_syn_v = zeros(v\L,1);     % �ϳ�����
last_syn_v = 0;   %�洢��һ�����������ε����һ��������±�
zi_syn_v = zeros(P,1);   % �ϳ��˲�����״̬

    hw = hamming(WL);       % ������
    
    % ���δ���ÿ֡����
    for n = 3:FN
        % ����Ԥ��ϵ��������Ҫ���գ�
        s_w = s(n*FL-WL+1:n*FL).*hw;    %��������Ȩ�������
        [A E] = lpc(s_w, P);            %������Ԥ�ⷨ����P��Ԥ��ϵ��
                                        % A��Ԥ��ϵ����E�ᱻ��������ϳɼ���������
        if n == 27
        % (3) �۲�Ԥ��ϵͳ���㼫��ͼ
            zplane(1,A);
        end
        
        s_f = s((n-1)*FL+1:n*FL);       % ��֡�����������Ҫ����������
        % (4) ��filter����s_f���㼤����ע�Ᵽ���˲���״̬
  [exc1,zi_pre] = filter(A,1,s_f,zi_pre);
        
        exc((n-1)*FL+1:n*FL) = exc1; %����õ��ļ���
        % (5) ��filter������exc�ؽ�������ע�Ᵽ���˲���״̬
  [s_rec1,zi_rec] = filter(1,A,exc1,zi_rec);
        
        s_rec((n-1)*FL+1:n*FL) = s_rec1; %����õ����ؽ�����
        % ע������ֻ���ڵõ�exc��Ż������ȷ
        s_Pitch = exc(n*FL-222:n*FL);
        PT = findpitch(s_Pitch);    % �����������PT����Ҫ�����գ�
        G = sqrt(E*PT);           % ����ϳɼ���������G����Ҫ�����գ�
          
  %����3�����μ���ֻ���޸ı��γ���
  tempn_syn = [1:n*FL-last_syn]';
  exc_syn1 = zeros(length(tempn_syn),1);
  exc_syn1(mod(tempn_syn,PT)==0) = G; %ĳһ�����������
  exc_syn1 = exc_syn1((n-1)*FL-last_syn+1:n*FL-last_syn);
  [s_syn1,zi_syn] = filter(1,A,exc_syn1,zi_syn);
  exc_syn((n-1)*FL+1:n*FL) =  exc_syn1;   %����õ��ĺϳɼ���
  s_syn((n-1)*FL+1:n*FL) = s_syn1;   %����õ��ĺϳ�����
  last_syn = last_syn+PT*floor((n*FL-last_syn)/PT);
   
        % (11) ���ı�������ں�Ԥ��ϵ�������ϳɼ����ĳ�������һ��������Ϊfilter
        % ������õ��µĺϳ���������һ���ǲ����ٶȱ����ˣ�������û�б䡣
  FL_v = floor(FL/v);
  tempn_syn_v = [1:n*FL_v-last_syn_v]';
  exc_syn1_v = zeros(length(tempn_syn_v),1);
  exc_syn1_v(mod(tempn_syn_v,PT)==0) = G; %ĳһ�����������
  exc_syn1_v = exc_syn1_v((n-1)*FL_v-last_syn_v+1:n*FL_v-last_syn_v);
  [s_syn1_v,zi_syn_v] = filter(1,A,exc_syn1_v,zi_syn_v);  
      last_syn_v = last_syn_v+PT*floor((n*FL_v-last_syn_v)/PT);   
        exc_syn_v((n-1)*FL_v+1:n*FL_v) =exc_syn1_v;  %����õ��ļӳ��ϳɼ���
        s_syn_v((n-1)*FL_v+1:n*FL_v) = s_syn1_v;   %����õ��ļӳ��ϳ�����
        
        % (13) ���������ڼ�Сһ�룬�������Ƶ������150Hz�����ºϳ�������������ɶ���ܡ�
  PT1 =floor(PT/2);   %��С��������
        poles = roots(A);
  deltaOMG = 150*2*pi/8000;
  for p=1:10   %���ӹ����Ƶ�ʣ�ʵ���Ϸ��ļ�����ʱ��ת���·�˳ʱ��ת
   if imag(poles(p))>0 poles(p) = poles(p)*exp(j*deltaOMG);
   elseif imag(poles(p))<0 poles(p) = poles(p)*exp(-j*deltaOMG);
   end
  end
  A1=poly(poles);
  if n==27
   figure;
   zplane(1,A1);
  end
  
  tempn_syn_t = [1:n*FL-last_syn_t]';
  exc_syn1_t = zeros(length(tempn_syn_t),1);
  exc_syn1_t(mod(tempn_syn_t,PT1)==0) = G; %ĳһ�����������
  exc_syn1_t = exc_syn1_t((n-1)*FL-last_syn_t+1:n*FL-last_syn_t);
  [s_syn1_t,zi_syn_t] = filter(1,A1,exc_syn1_t,zi_syn_t);
  exc_syn_t((n-1)*FL+1:n*FL) =  exc_syn1_t;   %����õ��ĺϳɼ���
  s_syn_t((n-1)*FL+1:n*FL) = s_syn1_t;   %����õ��ĺϳ�����
  last_syn_t = last_syn_t+PT1*floor((n*FL-last_syn_t)/PT1);
        
    end
    % (6)  s ��exc �� s_rec ������
figure;
subplot(3,1,1), plot(exc), xlabel('n (samples)'), ylabel('Amplitude'), title('�����ź�');
subplot(3,1,2), plot(s), xlabel('n (samples)'), ylabel('Amplitude'), title('ԭ�����ź�');
subplot(3,1,3), plot(s_rec), xlabel('n (samples)'), ylabel('Amplitude'), title('�ؽ������ź�');
figure;
subplot(3,1,1), plot(exc), xlabel('n (samples)'), ylabel('Amplitude'), title('�����ź�'), XLim([15*FL+1,16*FL]);
subplot(3,1,2), plot(s), xlabel('n (samples)'), ylabel('Amplitude'), title('ԭ�����ź�'), XLim([15*FL+1,16*FL]);
subplot(3,1,3), plot(s_rec), xlabel('n (samples)'), ylabel('Amplitude'), title('�ؽ������ź�'), XLim([15*FL+1,16*FL]);

sound(exc);
pause(2);
    sound(s);
    pause(2);
sound(s_rec);
pause(2);

  %ԭʼ������ϳ������Ĳ��
figure;
subplot(3,1,1), plot(exc_syn), xlabel('n (samples)'), ylabel('Amplitude'), title('�ϳɼ����ź�');
subplot(3,1,2), plot(s), xlabel('n (samples)'), ylabel('Amplitude'), title('ԭ�����ź�');
subplot(3,1,3), plot(s_syn), xlabel('n (samples)'), ylabel('Amplitude'), title('�ϳ������ź�');

sound(s);
    pause(2);
sound(s_syn);
pause(2);

%���ٲ����
figure;
subplot(3,1,1), plot(exc_syn_v), xlabel('n (samples)'), ylabel('Amplitude'), title('�ϳ����ټ����ź�') ,XLim([0,length(exc_syn_v)]);
subplot(3,1,2), plot(s), xlabel('n (samples)'), ylabel('Amplitude'), title('ԭ�����ź�'), XLim([0,length(s)]);
subplot(3,1,3), plot(s_syn_v), xlabel('n (samples)'), ylabel('Amplitude'), title('�ϳ����������ź�'), XLim([0,length(s_syn_v)]); 
sound(s);
    pause(2);
sound(s_syn_v);
pause(4);

   %���������
figure;
subplot(3,1,1), plot(exc_syn_t), xlabel('n (samples)'), ylabel('Amplitude'), title('�ϳɸߵ������ź�') ,XLim([0,length(exc_syn_t)]);
subplot(3,1,2), plot(s), xlabel('n (samples)'), ylabel('Amplitude'), title('ԭ�����ź�'), XLim([0,length(s)]);
subplot(3,1,3), plot(s_syn_t), xlabel('n (samples)'), ylabel('Amplitude'), title('�ϳɸߵ������ź�'), XLim([0,length(s_syn_t)]); 
sound(s);
    pause(2);
sound(s_syn_t);