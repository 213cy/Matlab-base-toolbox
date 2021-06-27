%% candeleteall (no hesitate)
 conn = sqlite("C:\Users\Administrator\AppData\Local\Google\Chrome\User Data\Default\History")
%%
a = fetch(conn,'SELECT * FROM sqlite_master;');
tablename = fetch(conn,"SELECT name FROM sqlite_master WHERE type='table';");
tablesql = fetch(conn,"SELECT sql FROM sqlite_master WHERE type='table';");
%%
inf = strings(2,3);
k=2;
n = fetch(conn,['SELECT count(*) FROM ',tablename{k}]);
inf(1,:)=[string(tablename{k}),string(n),tablesql{k}];
k=4;
n = fetch(conn,['SELECT count(*) FROM ',tablename{k}]);
inf(2,:)=[string(tablename{k}),string(n),tablesql{k}]
%%
k=10;
[string(k),string(tablename{k})]
results = fetch(conn,['SELECT * FROM ',tablename{k}],40);
%% ---------------------------------------
results = fetch(conn,'SELECT * FROM urls ORDER BY url',40);
sqlquery = "SELECT * FROM urls WHERE url LIKE 'https://www.baidu%'ORDER BY url";
results = fetch(conn,sqlquery,40);
results(:,3)=cellfun(@(x) {native2unicode( unicode2native(x,'GBK') ,'UTF-8' )},results(:,3));
%%
sqlstatement = "DELETE FROM urls WHERE  url LIKE 'f%';";
exec(conn,sqlstatement)
sqlstatement = "DELETE FROM urls WHERE  url LIKE '%.baidu.%';";
exec(conn,sqlstatement)
sqlstatement = "DELETE FROM urls WHERE  url LIKE '%.douyu.%';";
exec(conn,sqlstatement)
sqlstatement = "DELETE FROM urls WHERE  url LIKE '%.bilibili.%';";
exec(conn,sqlstatement)
%% 
%% ---------------------------------------
results = fetch(conn,'SELECT * FROM visits ORDER BY visit_time DESC LIMIT 40 ;');
results = fetch(conn,'SELECT visit_time FROM visits ORDER BY visit_time LIMIT 1 OFFSET 40 ;');
sqlstatement = "DELETE FROM visits WHERE visit_time < "+...
    "(SELECT visit_time FROM visits ORDER BY visit_time LIMIT 1 OFFSET 40 ); ";
exec(conn,sqlstatement)
fetch(conn,'SELECT count(*) FROM visits ;')
%%
results = fetch(conn,'SELECT * FROM visits ORDER BY visit_time LIMIT 40 ;');
b= (now-584755-80)*24*60*60*1e7;
b =b / 10;
fetch(conn,['SELECT count(*) FROM visits WHERE visit_time <',num2str(b,20)])
sqlstatement = ['DELETE FROM visits WHERE visit_time < ',num2str(b,20)];
exec(conn,sqlstatement)
fetch(conn,'SELECT count(*) FROM visits ;')
%%
%% ---------------------------------------
exec(conn,'DELETE FROM visits WHERE url NOT in (SELECT id FROM urls);')
fetch(conn,'SELECT count(*) FROM visits ;')
%%
% ɾ�������Ŀ����ʹ���ݿ��ļ���С,ɾ����Ż�.
% �ƺ�����ͨ�� vacuum �ؽ����ڳ�ɾ����Ŀ��ռ�ռ����ʹ���ݿ��ļ���С
% ����ִ�г���
% exec(conn,"VACUUM")
%%
close(conn)
%% ----------------
%% https://www.sans.org/blog/google-chrome-forensics/
%% ----------------
conn2 = sqlite('testfile','create')
a2 = fetch(conn2,"SELECT * FROM sqlite_master");
% ����history �к������ʷ��¼��ص�������
% ��urls   �洢���ʵ�URL -----------------
sqlstatement = ['CREATE TABLE urls(id INTEGER PRIMARY KEY AUTOINCREMENT,'...
    'url LONGVARCHAR,'...
    'title LONGVARCHAR,'... 
    'visit_count INTEGER DEFAULT 0 NOT NULL,'... �û��������
    'typed_count INTEGER DEFAULT 0 NOT NULL,'... �û��ֶ��������
    'last_visit_time INTEGER NOT NULL,'... ������ʱ��
    'hidden INTEGER DEFAULT 0 NOT NULL);'...��֪��
    ] ;
exec(conn2,sqlstatement );
% ��visits �洢web������� -----------------
sqlstatement = ['CREATE TABLE visits(id INTEGER PRIMARY KEY,'...
    'url INTEGER NOT NULL,'... ��urls�е� id,
    'visit_time INTEGER NOT NULL,'...���ʱ��
    'from_visit INTEGER,'...
    'transition INTEGER DEFAULT 0 NOT NULL,'... ���ʷ�ʽ(��ת,ֱ��,�Ѳؼ�,�ֶ�������ַ��)
    'segment_id INTEGER,'...
    'visit_duration INTEGER DEFAULT 0 NOT NULL,'...
    'incremented_omnibox_typed_score BOOLEAN DEFAULT FALSE NOT NULL);'...
    ];
exec(conn2,sqlstatement );
close(conn2)

