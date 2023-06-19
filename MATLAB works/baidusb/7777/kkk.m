% musicbox
%musicbox
Fs=44100;
pt=0.1;
t0=linspace(0,pt,pt*Fs);


%-------------------------mn and mic-------------------------------------
note=[-4,-2,0,1,3,5,6,8,10,12,13,15]; %diyin5daogaoyin2

k=2^(1/12);
a=55;
mnote=a*k.^(38+note);
mn=[mnote,0];

numednote=[-1,-1,3,3,       3,3 ,2,2,            3,3,3,3,              10,10,10,10,...
    2,2,2,2,         -2,-2,-1,0,           -1,-1,-1,-1,          10,10,10,10,...
    -1,-1,2,2,       2,2,1,1,              2,2,2,2,              10,10,10,10,...
    5,5,3,3,         2,2,5,5,              3,3,3,3,              10,10,10,10,...
    3,3,6,6,         6,6,5,5,              6,6,6,6,               6,6,5,5,...
    6,6,7,7,         2,2,5,5,              3,3,3,3,               -1,-1,1,1,...      //diyihang 96ge
    2,2,2,2,         2,2,2,3,              2,2,2,3,               1,1,0,0,...
    -1,-1,-1,-1,     10,10,10,10,     -1,-1,-1,-1,           10,10,10,10,... ///
    -1 ,-1,3,3,       3,3 ,2,2,            3,3,3,3,              10,10,10,10,...
    2,2,2,2,          -2,-2,0,0,           -1,-1,-1,-1,          10,10,10,10,...
    -1,-1,2,2,        2,2,1,1,              2,2,2,2,              10,10,10,10,...
    5,5,3,3,          2,2,5,5,              3,3,3,3,              10,10,10,10,...   //dierhang 192ge
    3,3,6,6,          6,6,5,5,              6,6,6,6,              6,6,5,5,...
    6,6,8,8,          2,2,5,5,              3,3,3,3,              -1,-1,1,1,...
    2,2,2,2,          2,2,3,3,              5,5,3,3,              9,9,8,8,...
    6,6,6,6,         10,10,10,10,      6,6,6,6,              10,10,10,10,...
    6,6,3,5,          6,6,6,6,              3,5,6,8,              6,6,6,6,...
    3,3,6,6,          6,8,6,6,              5,5,2,5,              3,3,3,3,...           //disanhang+1 288ge
    2,2,-1,1,         2,2,2,2,             1,2,3,5,               2,2,2,2,...
    -1,-1,2,2,        2,2,2,3,              1,-1,-2,1,            -1,-1,-1,-1];     %//288+32=320ge

mic= numednote+3;
clear numednote note mnote a k
%--------------------------------mn and mic-----------------------------------------------


%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------------fc---------------------------------------

f=[83  89 97];
ma=[1 2 20];
tg=0:.001:2;

fc=real(ma*exp(1i*1.5*f'*tg));
fc=fc/max(abs(fc));

o=find(fc(1:(end-1))>0&diff(fc)>0,1,'first');
e=find(fc(1:(end-1))<0&diff(fc)>0,1,'last');

fc=fc(o:e);
clear f ma tg e o
%----------------------------fc------------------------------------

n=length(fc);
fc=fc(1:end-1);
T=n/Fs;

ff=@(t) fc(1+floor((n-1)*mod(t,T)/T));

gw=@(k,f) ff(f*((k-1)*pt+t0(2)+t0));
%%
clear T n ff
%-------------------gw---------------------------------------

%-------------------w---------------------------------------
wm=arrayfun(gw,1:320,mn(mic)/400,'UniformOutput',false);
w=cell2mat(wm);
clear wm

%-------------------w---------------------------------------
%%%%%%%%%%%%%%%
%-------------------cof---------------------------------------
k=[1,diff(mic)];
k(k~=0)=1;
a=1/2;
while any(k==0)
    k([0,diff(k)<0]&k==0)=a;
    a=a/2;
end
decay=logspace(0,log10(1/2),(pt*Fs)+1);
decay(end)=[];

cof=kron(k,decay);

clear decay k a
%-------------------cof---------------------------------------end
%%%%%%%%%%%
try
    [y, Fs]=wavread('mbox1.wav');
    wo=y(2000:4000,2);
    subplot(211)
    plot(wo)
    subplot(212)
    plot(w(1:2000))
catch
end


wavplay(cof.*w,Fs);%% sound(cof.*w,Fs)