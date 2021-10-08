%dftool
isconn=0;
contconn=0;
tic;
while  ~isconn && contconn<10 && toc<200
    contconn=contconn+1;
    try
        Yahoo_conn = yahoo;
        isconn=isconnection(Yahoo_conn);
        disp(['�� ' num2str(contconn) ' �����ӳɹ���'])
    catch e
        disp(['�� ' num2str(contconn) ' �γ�������ʧ��'])
    end
end
if isconn
    %fprintf(2,'Congratulation: ���Խ��������ӳɹ���\n')
    warning('���Խ��������ӳɹ���')
else
    error('���Խ�������δ�������ӣ�')
end
%%
s_str='600000.ss';
todate   = floor(now);
fromdate = todate-60;
data=fetch(Yahoo_conn,s_str,fromdate,todate);

% ���ҹ����еļ����й��������еģ�google����֪��������Щ��������Ȼ��¼��Ʊ����
% �����յĳɽ���Ϊ�㣬������������޳���Щ�����еĹ�Ʊ�۸�
data(data(:,6)<1,:)=[];

%ClosePrices = fetch(Yahoo_conn,s_str,'Close',floor(now)-10,floor(now))
Dates       = data(:,1);
OpenPrices  = data(:,2);
HighPrices  = data(:,3);
LowPrices   = data(:,4);
ClosePrices = data(:,5); 
close(Yahoo_conn)
%%
candle(HighPrices, LowPrices, ClosePrices, OpenPrices,'r', Dates,'mm/dd')
%, Dateform='mm/dd'
child=findobj(gca);
set(child(2),'facecolor','g') %�µ���Ϊ����
hold on
%%
Len=size(Dates,1);
Time(1:3:3*Len)=Dates+2/3;
Time(2:3:3*Len)=Dates+1/3;
Time(3:3:3*Len)=Dates;

Price(1:3:3*Len)=ClosePrices;
Price(2:3:3*Len)=(HighPrices+LowPrices)/2;
Price(3:3:3*Len)=OpenPrices;

plot(Time,Price)
datetick('x','mm/dd')
%%
mag_Price = detrend(fliplr(Price),'constant');
subplot(211)
plot(mag_Price)
Nfft=2^nextpow2(3*Len);
Fp=fft(mag_Price,Nfft);
k=Nfft/2;
f=Nfft./[0.5,1:k];
subplot(212)
plot(f,abs(Fp(1:k+1)))

return
%%
s_cell = {'A','B'};
s_cell={s_str}
Universe = builduniverse(Yahoo_conn,s_cell,floor(now)-10,floor(now));
Universe = periodicreturns(Universe,'d')
%%
[prc,act,div] = trpdata(Yahoo_conn,s_str,floor(now)-10,floor(now),'d')
