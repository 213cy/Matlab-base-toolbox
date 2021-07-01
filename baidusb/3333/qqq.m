% ���׼��gamut ? detection
%%% �����������������
[Y,FS] = wavread('me.wav');
Y=Y(:,1);
N=size(Y,1);
FL=2^nextpow2(2*FS/100);%framelen=���������������Ƶ�ɷֵ�����
% player = audioplayer(Y,FS);
% play(player)
%% ʱ���Ҫ
[S,F,T,P]=spectrogram(Y,FL,FL/8,2048,FS,'yaxis');
k=floor(length(F)*2e3/(FS/2));%�۲�2ǧ(2e3)Hz�ڵ�Ƶ��
P=10*log10(abs(P(1:k,:)));
F=F(1:k,:);
n=1:length(T);

subplot(211)
surf(n,F,P,'edgecolor','none');
axis tight;view(0,90);
xlabel('n of frame'); ylabel('frequence(Hz)');
%% ��ͨ�˲�������Ȩ˥����������ź�
% ��� fy
wn=round(FS/1e3);%���ƴ���
fy=filter(hamming(wn,'symmetric'),1,Y);

[S,F,T,P]=spectrogram(fy,FL,FL/8,2048,FS,'yaxis');
k=floor(length(F)*2e3/(FS/2));%�۲�2ǧ(2e3)Hz�ڵ�Ƶ��
P=10*log10(abs(P(1:k,:)));
F=F(1:k,:);
n=1:length(T);

subplot(212)
surf(n,F,P,'edgecolor','none');
axis tight;view(0,90);
xlabel('n of frame'); ylabel('frequence(Hz)');
%% Spectrogram Interactive Tool
%specgramdemo(decimate(fy,10),FS/10)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ��֡��ȡ��������
%��� C �� peakpoint
fyframe=buffer(fy,FL,FL/8);

mak=1;
loop=size(fyframe,2);
peakpoint=zeros(mak,loop);
C=zeros(FL,loop);
for k=1:loop
    c=xcorr(fyframe(:,k));
    C(:,k)=c(FL:end);
    %plot(C(:,125))
    [~,pp]=findpeaks(C(:,k),'s','descend','N',mak);
    peakpoint(1:length(pp),k)=sort(pp);
end

figure
subplot(211)
surf(bsxfun(@rdivide,C,C(1,:)),'edgecolor','none');
axis tight;view(0,90);
xlabel('n of frame'); ylabel('R(x)');
%% ͨ����������������ȡ��Ч�Ļ���Ƭ��
%��� note
subplot(413)
plot(peakpoint);% ԭʼ��ȡ�Ļ�������
axis tight;hold on

pp=peakpoint;
dpind=abs(diff(pp))>40;%plot(diff(peakpoint));
pp(dpind)=0;
dpind=abs(diff(pp))>40;%plot(diff(peakpoint));
pp([true,dpind])=0;
plot(pp,'g')% ������ȡ��Ч�Ļ���Ƭ��2-1
note = medfilt1(pp,11);
plot(note,'r')% ������ȡ��Ч�Ļ���Ƭ��2-2
%% ͨ�����ʷֲ��ָ�����������ڵĻ���Ƭ��
%��� notep
subplot(414);hold off
pow=C(1,:)/max(C(1,:))*2;
plot(pow);
axis tight;hold on
notep = sign(pow-0.1);
plot(notep,'g')
plot([313,313],[-1,2],'m')
notep(313)=-1;%�˹�����
notep = conv(notep,[1,1,1,1,1],'same')>4.9;
plot(notep,'r')
%% ����ͬ������Ƭ�����ݷ����ǩ
%���lab
pp=diff(notep);
pp(pp<0)=0;
lab=[0,cumsum(pp)];
lab(notep==0)=0;
lab(note<100)=0;

n=1:length(lab);
figure;
subplot(311)
plotyy(n,note,n,notep)
subplot(312)
plot(lab,'r','linewidth',2)
hold on
%% ���������������Ƭ�εĻ������ڣ������ݻ���Ƶ�����
not=accumarray(lab'+1,note,[],@(x)mean(x));
not=FS./not(2:end);
no=[1,3,5,6,8,10,12,13];
subplot(313)
plot(no,not,'o')

%k=2^(1/12);
st='a*2^(x/12)';
ft = fittype(st);
ftv = fit(no',not,ft, 'StartPoint', 107);
hold on
plot(ftv);
h=findobj(gcf,'Tag','legend');
set(h,'loca','NorthWest')

%% ����
subplot(312)
pd=bsxfun(@gt,C,max(C,[],1)/2);
Z = linkage(double(pd)','weighted','hamming');%
%dendrogram(Z)
TT = cluster(Z,'maxclust',20);
plot(TT,':y');axis tight

Z = linkage(C','average','cosine');%
%dendrogram(Z)
TT = cluster(Z,'maxclust',20);
plot(TT,':c');axis tight
%%%%%%%%%%%%%%%%%%%%