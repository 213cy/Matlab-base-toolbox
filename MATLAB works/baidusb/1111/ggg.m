% matlab演奏音乐
%musicbox
Fs=44100;%设定采样频率

%% 求音阶对应的频率
 note=[-4,-2, 0, 1, 3, 5, 6, 8,10,12,13,15]; %diyin5daogaoyin2
%note=[G1,A1,B1, C, D, E, F, G, A, B, c, d]; %diyin5daogaoyin2

k=2^(1/12);%一个半音的频率增长系数
mnote=55*k.^(38+note);%人声的频率
%55 和 38 是我为了调整 C 的频率和人声接近而估计出来的两个整数
%若要仅保证音阶准确，频率只需要满足公比k，
%角频率和频率成正比，此项可以直接当成角频率。

mn=[mnote*2*pi/Fs,0];%各个音阶每一个采样点对应的相位跨度
                        %最后一位是休止符的相位跨度

%% 通过简谱求每个音阶的采样点所对应的相位跨度
numednote=[... %简谱
    -1,-1,3,3,       3,3 ,2,2,             3,3,3,3,              10,10,10,10,...
    2,2,2,2,         -2,-2,-1,0,           -1,-1,-1,-1,          10,10,10,10,...
    -1,-1,2,2,       2,2,1,1,              2,2,2,2,              10,10,10,10,...
    5,5,3,3,         2,2,5,5,              3,3,3,3,              10,10,10,10,...
    3,3,6,6,         6,6,5,5,              6,6,6,6,               6,6,5,5,...
    6,6,7,7,         2,2,5,5,              3,3,3,3,               -1,-1,1,1,...      //diyihang 96ge
    2,2,2,2,         2,2,2,3,              2,2,2,3,               1,1,0,0,...
    -1,-1,-1,-1,     10,10,10,10,       -1,-1,-1,-1,            10,10,10,10,... ///
    -1 ,-1,3,3,      3,3 ,2,2,            3,3,3,3,              10,10,10,10,...
    2,2,2,2,         -2,-2,0,0,           -1,-1,-1,-1,          10,10,10,10,...
    -1,-1,2,2,        2,2,1,1,              2,2,2,2,              10,10,10,10,...
    5,5,3,3,          2,2,5,5,              3,3,3,3,              10,10,10,10,...   //dierhang 192ge
    3,3,6,6,          6,6,5,5,              6,6,6,6,              6,6,5,5,...
    6,6,8,8,          2,2,5,5,              3,3,3,3,              -1,-1,1,1,...
    2,2,2,2,          2,2,3,3,              5,5,3,3,              9,9,8,8,...
    6,6,6,6,          10,10,10,10,          6,6,6,6,              10,10,10,10,...
    6,6,3,5,          6,6,6,6,              3,5,6,8,              6,6,6,6,...
    3,3,6,6,          6,8,6,6,              5,5,2,5,              3,3,3,3,...           //disanhang+1 288ge
    2,2,-1,1,         2,2,2,2,              1,2,3,5,               2,2,2,2,...
    -1,-1,2,2,        2,2,2,3,              1,-1,-2,1,            -1,-1,-1,-1];     %//288+32=320ge

mic=mn(numednote+3);%+3将简谱调整到索引
%mic=[mn,mn];

%%
F_c=[4/3,2,3];%频率比例系数，上限稍高于18，再高就欠采样用了
A_c=[0.04,0.08,0.85];%幅度比例系数，其和不应大于1

L=Fs/10;%一个音阶占有的采样点数，确定节拍
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 方法一

N=length(mic);
C=length(F_c);
S=[zeros(C,1),zeros(C,1)];

Y1=zeros(1,L*N);
for k=1:N
    if mic(k)~=0
        omega=mic(k)*kron(F_c',ones(1,L));
        delta=cumsum([S(:,1),omega],2);
        S(:,2)=mic(k);
    else
        omega=S(1,2)*kron(F_c',ones(1,L));
        delta=cumsum([S(:,1),omega],2);
        delta(delta>2*pi)=0;
        S(:,2)=0;
    end
    Y1(k*L-L+1:k*L)=A_c*sin(delta(:,2:end));
    S(:,1)=mod(delta(:,end),2*pi);
end

%%
W=0.9+0.1*sin((1:L*N)*2*pi*10/L);
Y1=Y1.*W;%乘个正弦修修波形
player1=audioplayer(Y1,Fs);
playblocking(player1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 方法二 %此种放法的注释很重要
% % %这个方法很好，很简单，但不是太完美
% % delta=F_c'*mic;%相位系数加权
% %                     %相位跨度系数的
% % phase=cumsum(kron(delta,ones(1,L)),2);%各个采样点的相位
% %                                        %Fs/n调整节拍
% % Y2=A_c*sin(phase);%幅度系数加权
% %
% % player2=audioplayer(Y2,Fs);
% % playblocking(player2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 加个衰减，做个八音盒效果
D_c=1/2;%衰减系数
Decay=logspace(0,log10(D_c),L+1);

PreviousNote=100;
N=length(mic);
BoxFrame=zeros(1,N);
for k=1:N;
    if mic(k)==PreviousNote || mic(k)==10;
        BoxFrame(k)=BoxFrame(k-1)*D_c;
    else
        BoxFrame(k)=1;
        PreviousNote=mic(k);
    end
end
Y3=Y1.*kron(BoxFrame,Decay(1:end-1));
player3=audioplayer(Y3,Fs);
playblocking(player3);