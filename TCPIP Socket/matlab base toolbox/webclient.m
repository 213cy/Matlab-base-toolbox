t = tcpclient('localhost', 80) % ����û������˿� ���Բ��ɹ�
% �����������鿴���ؿ�����Щ�˿�
!netstat -ap tcp 
%%
t = tcpclient('localhost', 49156) %��Ȼ����������ִ��,���ǲ���ͨ��
write(t, uint8(1:10))
t.BytesAvailable
clear t
%% ==============================================
%%    
%% ==============================================

%%
!nslookup www.baidu.com
ip = '110.242.68.4'; 
!nslookup baidu.com
%ip = '220.181.38.148';
%% HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH

%%
https = tcpclient(ip, 443)
write(https, uint8(1:10))
pause(0.1)
https.BytesAvailable
response =  read(https)
% TLSv1 Record Layer: Alert (Level: Fatal, Description: Unexpected Message)
% == 1503010002020a
string(dec2hex( response ))'

clear https

%% HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
%%                   
%%
http = tcpclient(ip, 80)
write(http, uint8(1:10))
pause(0.1)
http.BytesAvailable
response =  read(http)
char( response )

clear http

%% HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH

%%
http = tcpclient(ip, 80)
write(http, uint8(['GET / HTTP/1.1',char([13 10]),'Host: www.mathworks.com',char([13 10]),char([13 10])]) )
pause(0.1)

http.BytesAvailable
response =  read(http);
char( response )

clear http
%% HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH

%%
http = tcpclient(ip, 80)
write(http, uint8(['GET / HTTP/1.1',char([13 10]),char([13 10])]) )
% write(http, uint8(['GET / HTTP/1.1',char([13 10]),'Host: 110.242.68.4',char([13 10]),char([13 10])]) )

pause(0.1)

http.BytesAvailable
response =  read(http);
char( response )

clear http