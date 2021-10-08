% Change audio speed and pitch�������ٱ��
function ct2
% ���峣��
FL = 80;                % ֡��
WL = 240;               % ����
P = 10;                 % Ԥ��ϵ������
hw = hamming(WL);       % ������
%%%%%%
[s,Fs] = wavread('sunday_2.wav');             % ��������s
load('mtlb.mat');
s=mtlb;
s=buffer(s,FL);
[~,FN] = size(s);        % ����֡��

% Ԥ����ؽ��˲���
exc = zeros(FL,FN);       % �����źţ�Ԥ����
s_rec = exc;              % �ؽ�����
zi_pre = zeros(P,1);      % Ԥ���˲�����״̬
zi_rec = zeros(P,1);      % �ؽ��˲�����״̬

% �ϳ��˲���
exc_syn =exc;             % �ϳɵļ����źţ����崮��
s_syn = exc;              % �ϳ�����
last_syn = 0;             % �洢��һ��֡�����һ����������һ֡������λ��
zi_syn = zeros(P,1);      % �ϳ��˲�����״̬

% ���ٲ�����˲���
FL_v = 2*FL;              % �����ٶȼ���һ��
exc_syn_v = zeros(FL_v,FN);  % �ϳɵļ����ź�
s_syn_v = exc_syn_v;      % �ϳ�����
last_syn_v = 0;
zi_syn_v = zeros(P,1);    % �ϳ��˲�����״̬

% ����������˲���
exc_syn_t = zeros(FL,FN);
s_syn_t = exc_syn_t;
last_syn_t = 0;
zi_syn_t = zeros(P,1);

% ��¼�м����
A_c=zeros(P+1,FN);    %��¼ÿ֡��ȡ��Ԥ��ϵ��
PT_c=zeros(1,FN);     %��¼ÿ֡��ȡ�Ļ�������

% ���δ���ÿ֡����
for n = 2:FN-1
    % ����Ԥ��ϵ��������������ϵͳģ�ͣ�
    s_w = s(:,n-1:n+1);                    %��������Ȩ�������
    [A E] = lpc(s_w(:).*hw, P);            %������Ԥ�ⷨ����P��Ԥ��ϵ��
    E=E*WL/sum(hw);
    % A��Ԥ��ϵ����E�ᱻ��������ϳɼ���������
    A_c(:,n)=A;  % -----------------------
   
    % ��ȡ���������ü����ؽ�����
    [exc(:,n),zi_pre] = filter(A,1,s(:,n),zi_pre);% ���㼤��
    [s_rec(:,n),zi_rec] = filter(1,A,exc(:,n),zi_rec);% �ؽ�����
   
    % ��ȡ�������ڣ������˹��ϳɼ���
    %s_Pitch = exc(:,n-1:n+1);
    PT = findpitch(s_w(:))-1;    % �����������PT����Ҫ�����գ�
    PT_c(:,n)=PT; % -------------------------
    G = sqrt(E*PT);           % ����ϳɼ���������G����Ҫ�����գ�
   
    % �ϳ�����
    tmpind=last_syn+1:PT:FL;
    exc_syn(tmpind,n) = G;        % �˹����ɱ�֡����
    last_syn=mod(PT+tmpind(end)-FL,FL);
    [s_syn(:,n),zi_syn] = filter(1,A,exc_syn(:,n),zi_syn); %ͨ�����켤���ϳ�����
   
    % �ϳ��ٶ����������������������
    tmpind=last_syn_v+1:PT:FL_v;   % �����ı�������ں�Ԥ��ϵ�������ϳɼ����ĳ�������һ����
    exc_syn_v(tmpind,n) = G;       % �˹����ɱ�֡����
    last_syn_v=mod(PT+tmpind(end)-FL_v,FL_v);
    [s_syn_v(:,n),zi_syn_v] = filter(1,A,exc_syn_v(:,n),zi_syn_v);
   
    % �ϳɱ�������ٵ�����
    poles = roots(A);
    deltaOMG = 150*2*pi/8000; % �������Ƶ������150Hz
    A1=poly(poles.*exp(sign(imag(poles))*1j*deltaOMG)); %�����µ�����ģ��
   
    PT1 =floor(PT/2);   % ���������ڼ�Сһ��
    tmpind=last_syn_t+1:PT1:FL;
    exc_syn_t(tmpind,n) = G; % �˹����ɱ�֡����
    last_syn_t=mod(PT1+tmpind(end)-FL,FL);
    [s_syn_t(:,n),zi_syn_t] = filter(1,A1,exc_syn_t(:,n),zi_syn_t);
   
end

%return
xx=reshape(1:FL*FN,FL,FN);
splot(s,exc,s_rec,xx,'�ؽ�',Fs)
splot(s,exc_syn,s_syn,xx,'�ϳ�',Fs)
xx2=reshape(1:FL_v*FN,FL_v,FN);
splot(s,exc_syn_v,s_syn_v,xx2,'�ϳ�����',Fs)
splot(s,exc_syn_t,s_syn_t,xx,'�ϳɸߵ�',Fs)

function splot(s,ex,re,x,str,Fs)
figure;
ax(3)=subplot(3,1,1);
plot(s(:));  title('ԭ�����ź�')
ax(2)=subplot(3,1,2);
plot(x,ex);  title([str,'�����ź�'])
ax(1)=subplot(3,1,3);
plot(re(:));  title([str,'�����ź�'])
linkaxes(ax,'xy')

sound(s(:),Fs);
sound(ex(:),Fs);
sound(re(:),Fs);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



 

%%%%%%%%%%%%%%%%%%%%%

function ct3
% ���峣��
FL = 80;                % ֡��
WL = 240;               % ����
P = 10;                 % Ԥ��ϵ������
hw = hamming(WL);       % ������
%%%%%%
[sl,Fs] = wavread('sunday_2.wav');             % ��������s
% load('mtlb.mat');
% sl=mtlb;
s=buffer(sl,FL);
[~,FN] = size(s);        % ����֡��

% Ԥ����ؽ��˲���
exc = zeros(FL,FN);       % �����źţ�Ԥ����
s_rec = exc;              % �ؽ�����
zi_pre = zeros(P,1);      % Ԥ���˲�����״̬
zi_rec = zeros(P,1);      % �ؽ��˲�����״̬

% �ϳ��˲���
exc_syn =exc;             % �ϳɵļ����źţ����崮��
s_syn = exc;              % �ϳ�����
last_syn = [];             % �洢��һ��֡�����һ����������һ֡������λ��
zi_syn = zeros(P,1);      % �ϳ��˲�����״̬

% ���ٲ�����˲���
FL_v = 2*FL;              % �����ٶȼ���һ��
exc_syn_v = zeros(FL_v,FN);  % �ϳɵļ����ź�
s_syn_v = exc_syn_v;      % �ϳ�����
last_syn_v = [];
zi_syn_v = zeros(P,1);    % �ϳ��˲�����״̬

% ����������˲���
exc_syn_t = zeros(FL,FN);
s_syn_t = exc_syn_t;
last_syn_t = [];
zi_syn_t = zeros(P,1);

% ��¼�м����
A=zeros(P+1,FN);    %��¼ÿ֡��ȡ��Ԥ��ϵ��
E=zeros(1,FN);
PT_sf=zeros(1,FN);
PT_rf=zeros(1,FN);     %��¼ÿ֡��ȡ�Ļ�������

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[S,F,T,Psd]=spectrogram(sl,240,160,2048,1);
Pe=pow2db(abs(Psd));
figure;surf(T,F*2048,Pe,'edgecolor','none')
% figure;surf(T,F(1:200)*2048,Pe(1:200,:),'edgecolor','none')
axis tight;
view(0,90);
xlabel('Time'); ylabel('sample');

[w,ind]=max(bsxfun(@minus,Pe(1:200,:),1.03.^(1:200)'));
PT_sf=round(2048./ind);
pind=w<max(w)-25; %����˥��20�ֱ���֡
PT_sf(pind)=FL-1; %����������Ϊ֡��
figure;hold on;
plot(PT_sf,'r')

% ���δ���ÿ֡����
for n = 2:FN-1
    % ����Ԥ��ϵ��������������ϵͳģ�ͣ�
    s_f = s(:,n-1:n+1);                    %��������Ȩ�������
    [A(:,n) Et] = lpc(s_f(:).*hw, P);            %������Ԥ�ⷨ����P��Ԥ��ϵ��
    E(n)=Et*WL/sum(hw);
    % A��Ԥ��ϵ����E�ᱻ��������ϳɼ���������
   
    % ��ȡ���������ü����ؽ�����
    [exc(:,n),zi_pre] = filter(A(:,n),1,s(:,n),zi_pre);% ���㼤��
    [s_rec(:,n),zi_rec] = filter(1,A(:,n),exc(:,n),zi_rec);% �ؽ�����
end

for n = 2:FN-1
    ex_f=exc(:,n-1:n+1);
    ex_f=ex_f(:);
    % ��ȡ�������ڣ������˹��ϳɼ���
 
    R=xcorr(ex_f,1.5*FL);
    Rh=filter(hamming(16),1,R(1.5*FL+1:end));
    [~,PT]=findpeaks(Rh(9:end),'s','descend','n',1);
    PT_rf(:,n)=PT;
 
    G = sqrt(E(n)*PT);           % ����ϳɼ���������G����Ҫ�����գ�
   
    [~,m]=findpeaks(ex_f(81:160),'s','descend','n',1);
    if isempty(m),m=121;end
    m=80+m;
    a=ceil(PT/2)-1;
    b=floor(PT/2);
    excf=[ex_f(m-b:m+a)];
    excfh=excf(1+mod(b,2):2:end);
    % �ϳ�����
    %n
    kt=ceil((FL-length(last_syn))/PT);
    GG=[last_syn;repmat(excf,kt,1)];
    exc_syn(:,n) = GG(1:80);        % �˹����ɱ�֡����
   
    last_syn=GG(81:end);
    %if length(exc_syn)>80,n,end
    [s_syn(:,n),zi_syn] = filter(1,A(:,n),exc_syn(:,n),zi_syn); %ͨ�����켤���ϳ�����
   
    % �ϳ��ٶ����������������������
    kt=ceil((FL_v-length(last_syn_v))/PT);   % �����ı�������ں�Ԥ��ϵ�������ϳɼ����ĳ�������һ����
    GG=[last_syn_v;repmat(excf,kt,1)];
    exc_syn_v(:,n) = GG(1:160); % �˹����ɱ�֡����
    last_syn_v=GG(161:end);
    [s_syn_v(:,n),zi_syn_v] = filter(1,A(:,n),exc_syn_v(:,n),zi_syn_v);
   
    % �ϳɱ�������ٵ�����
    poles = roots(A(:,n));
    deltaOMG = 150*2*pi/8000; % �������Ƶ������150Hz
    A1=poly(poles.*exp(sign(imag(poles))*1j*deltaOMG)); %�����µ�����ģ��
   
    PT1 =length(excfh);   % ���������ڼ�Сһ��
    kt=ceil((FL-length(last_syn_t))/PT1);
    GG=[last_syn_t;repmat(excfh,kt,1)];
    exc_syn_t(:,n) = GG(1:80); % �˹����ɱ�֡����
    last_syn_t=GG(81:end);
    [s_syn_t(:,n),zi_syn_t] = filter(1,A1,exc_syn_t(:,n),zi_syn_t);
   
end

plot(PT_rf);title('��Ƶ��ֱ��ʵ�Ӱ�죬70��80֡�ľ��Ⱥܲ�')
xlabel('��߾��ȿ������Ӷ�ʱ����Ҷ�任��������Ŀ����ǰ��2048��')


%return
xx=reshape(1:FL*FN,FL,FN);
splot(s,exc,s_rec,xx,'�ؽ�',Fs)
splot(s,exc_syn,s_syn,xx,'�ϳ�',Fs)

xx2=reshape(1:FL_v*FN,FL_v,FN);
splot(s,exc_syn_v,s_syn_v,xx2,'�ϳ�����',Fs)
splot(s,exc_syn_t,s_syn_t,xx,'�ϳɸߵ�',Fs)

function splot(s,ex,re,x,str,Fs)
figure;
ax(3)=subplot(3,1,1);
plot(s(:));  title('ԭ�����ź�')
ax(2)=subplot(3,1,2);
plot(x,ex);  title([str,'�����ź�'])
ax(1)=subplot(3,1,3);
plot(re(:));  title([str,'�����ź�'])
linkaxes(ax,'xy')

sound(s(:),Fs);
sound(ex(:),Fs);
sound(re(:),Fs);